terraform {
  required_providers {
    restapi = {
      source  = "Mastercard/restapi"
      version = "1.20.0"
    }
  }
}

locals {
  namespace = var.kubernetes_tenant_namespace

  bot_name                = "${var.kubernetes_tenant_namespace}-bot"
  bot_display_name        = "${title(replace(var.kubernetes_tenant_namespace, "-", " "))} Bot"
  bot_site_name           = "${var.kubernetes_tenant_namespace}-copilot-bot"
  openai_name             = "${var.kubernetes_tenant_namespace}-openai"
  openai_custom_subdomain = "${var.kubernetes_tenant_namespace}-openai"
  search_service_name     = "${var.kubernetes_tenant_namespace}-search"
  function_storage_name   = replace("${var.kubernetes_tenant_namespace}copilotst", "-", "")
  function_plan_name      = "${var.kubernetes_tenant_namespace}-copilot-plan"
  function_app_name       = "${var.kubernetes_tenant_namespace}-copilot-func"
  webapp_plan_name        = "${var.kubernetes_tenant_namespace}-copilot-webapp-plan"
  web_app_name            = "${var.kubernetes_tenant_namespace}-copilot-webapp"

  azure_webapp_docker_image = "${var.azure_webapp_docker_image}:${var.azure_webapp_docker_tag}"
}

############################
# 1. Azure Bot
############################
resource "azurerm_bot_channels_registration" "bot" {
  name                = local.bot_name
  location            = "global"
  resource_group_name = var.tenant_resource_group
  sku                 = var.bot_sku
  display_name        = local.bot_display_name
  microsoft_app_id    = var.microsoft_app_id
}

resource "azurerm_bot_channel_directline" "directline" {
  bot_name            = azurerm_bot_channels_registration.bot.name
  location            = azurerm_bot_channels_registration.bot.location
  resource_group_name = var.tenant_resource_group

  site {
    name    = local.bot_site_name
    enabled = true
  }
}

resource "azurerm_bot_channel_webchat" "webchat" {
  bot_name            = azurerm_bot_channels_registration.bot.name
  location            = azurerm_bot_channels_registration.bot.location
  resource_group_name = var.tenant_resource_group

  site {
    name = local.bot_site_name
  }
}

############################
# 2. Cognitive Services for Azure Open AI
############################
resource "azurerm_cognitive_account" "openai" {
  name                          = local.openai_name
  location                      = var.location
  resource_group_name           = var.tenant_resource_group
  kind                          = var.openai_kind
  sku_name                      = var.openai_sku
  custom_subdomain_name         = local.openai_custom_subdomain
  public_network_access_enabled = true
}

############################
# 3. Azure AI Search & Index
############################
resource "restapi_object" "ai_search_index" {
  provider     = restapi
  path         = "/indexes"
  query_string = "api-version=2023-11-01"
  data = jsonencode({
    name = var.search_index_name
    fields = [
      {
        name        = "id"
        type        = "Edm.String"
        key         = true
        searchable  = false
        filterable  = true
        retrievable = true
        sortable    = false
        facetable   = false
      },
      {
        name        = "title"
        type        = "Edm.String"
        searchable  = true
        filterable  = false
        retrievable = true
        sortable    = false
        facetable   = false
      },
      {
        name        = "last_update"
        type        = "Edm.DateTimeOffset"
        searchable  = false
        filterable  = true
        retrievable = true
        sortable    = true
        facetable   = false
      },
      {
        name        = "chunk_id"
        type        = "Edm.String"
        searchable  = false
        filterable  = true
        retrievable = true
        sortable    = false
        facetable   = false
      },
      {
        name        = "chunk"
        type        = "Edm.String"
        searchable  = true
        filterable  = false
        retrievable = true
        sortable    = false
        facetable   = false
      },
      {
        name        = "vector"
        type        = "Collection(Edm.Single)"
        searchable  = false
        filterable  = false
        retrievable = true
        sortable    = false
        facetable   = false
      }
    ],
    corsOptions = {
      allowedOrigins = ["*"]
    }
  })
  id_attribute = "name"
}

############################
# 4. Azure Function App
############################
resource "azurerm_storage_account" "function_storage" {
  name                     = local.function_storage_name
  resource_group_name      = var.tenant_resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "function_plan" {
  name                = local.function_plan_name
  location            = var.location
  resource_group_name = var.tenant_resource_group
  kind                = "FunctionApp"
  reserved            = true

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_application_insights" "app_insights" {
  name                = "${local.function_app_name}-insights"
  location            = var.location
  resource_group_name = var.tenant_resource_group
  application_type    = "web"
}

resource "azurerm_linux_function_app" "function_app" {
  name                       = local.function_app_name
  location                   = var.location
  resource_group_name        = var.tenant_resource_group
  service_plan_id            = azurerm_app_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key

  site_config {
    container_registry_use_managed_identity = false

    application_stack {
      docker {
        registry_url      = var.acr_url
        image_name        = var.azure_function_docker_image
        image_tag         = var.azure_function_docker_tag
        registry_username = var.acr_username
        registry_password = var.acr_password
      }
    }
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"           = azurerm_application_insights.app_insights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"    = azurerm_application_insights.app_insights.connection_string
    "AzureWebJobsStorage"                      = azurerm_storage_account.function_storage.primary_connection_string
    "BUILD_FLAGS"                              = "UseExpressBuild"
    "DOCKER_ENABLE_CI"                         = "true"
    "DOCKER_REGISTRY_SERVER_PASSWORD"          = var.acr_password
    "DOCKER_REGISTRY_SERVER_URL"               = var.acr_url
    "DOCKER_REGISTRY_SERVER_USERNAME"          = var.acr_username
    "ENABLE_ORYX_BUILD"                        = "true"
    "FUNCTIONS_EXTENSION_VERSION"              = "~4"
    "FUNCTIONS_WORKER_RUNTIME"                 = "python"
    "SCM_DO_BUILD_DURING_DEPLOYMENT"           = "1"
    "WEBSITE_CONTENTAZUREFILECONNECTIONSTRING" = azurerm_storage_account.function_storage.primary_connection_string
    "WEBSITE_CONTENTSHARE"                     = local.function_app_name
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE"          = "true"
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"      = "false"
    "XDG_CACHE_HOME"                           = "/tmp/.cache"
  }
}

############################
# 5. Azure Web App
############################
resource "azurerm_service_plan" "webapp_plan" {
  name                = local.webapp_plan_name
  location            = var.location
  resource_group_name = var.tenant_resource_group
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "web_app" {
  name                = local.web_app_name
  location            = var.location
  resource_group_name = var.tenant_resource_group
  service_plan_id     = azurerm_service_plan.webapp_plan.id

  site_config {
    container_registry_use_managed_identity = false

    application_stack {
      docker_image_name        = local.azure_webapp_docker_image
      docker_registry_url      = var.acr_url
      docker_registry_username = var.acr_username
      docker_registry_password = var.acr_password
    }
  }

  app_settings = {
    "DOCKER_ENABLE_CI"                    = "true"
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = var.acr_password
    "DOCKER_REGISTRY_SERVER_URL"          = var.acr_url
    "DOCKER_REGISTRY_SERVER_USERNAME"     = var.acr_username
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}

############################
# 6. Azure Blob Storage for Documents
############################
resource "azurerm_storage_container" "documents" {
  name                  = var.blob_container_name
  storage_account_id    = azurerm_storage_account.function_storage.id
  container_access_type = "private"
}

#############################
# 7. ARM Deployments for Azure Open AI (Ada & GPT‑4)
#############################
resource "azurerm_template_deployment" "ada_deployment" {
  name                = "ada-deployment"
  resource_group_name = var.tenant_resource_group
  deployment_mode     = "Incremental"

  template_body = <<TEMPLATE
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "accountName": { "type": "string" },
    "deploymentName": { "type": "string" },
    "modelName": { "type": "string" },
    "modelVersion": { "type": "string" }
  },
  "resources": [
    {
      "type": "Microsoft.CognitiveServices/accounts/deployments",
      "apiVersion": "2024-10-01",
      "name": "[concat(parameters('accountName'), '/', parameters('deploymentName'))]",
      "sku": {
        "name": "Standard",
        "capacity": 120
      },
      "properties": {
        "model": {
          "format": "OpenAI",
          "name": "[parameters('modelName')]",
          "version": "[parameters('modelVersion')]"
        },
        "versionUpgradeOption": "OnceNewDefaultVersionAvailable",
        "raiPolicyName": "Microsoft.Default"
      }
    }
  ]
}
TEMPLATE

  parameters = <<PARAMETERS
{
  "accountName": { "value": "${azurerm_cognitive_account.openai.name}" },
  "deploymentName": { "value": "${var.ada_deployment_name}" },
  "modelName": { "value": "${var.ada_model_name}" },
  "modelVersion": { "value": "${var.ada_model_version}" }
}
PARAMETERS

  depends_on = [azurerm_cognitive_account.openai]
}

resource "azurerm_template_deployment" "gpt4_deployment" {
  name                = "gpt4-deployment"
  resource_group_name = var.tenant_resource_group
  deployment_mode     = "Incremental"

  template_body = <<TEMPLATE
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "accountName": { "type": "string" },
    "deploymentName": { "type": "string" },
    "modelName": { "type": "string" },
    "modelVersion": { "type": "string" }
  },
  "resources": [
    {
      "type": "Microsoft.CognitiveServices/accounts/deployments",
      "apiVersion": "2024-10-01",
      "name": "[concat(parameters('accountName'), '/', parameters('deploymentName'))]",
      "sku": {
        "name": "Standard",
        "capacity": 19
      },
      "properties": {
        "model": {
          "format": "OpenAI",
          "name": "[parameters('modelName')]",
          "version": "[parameters('modelVersion')]"
        },
        "versionUpgradeOption": "OnceCurrentVersionExpired",
        "raiPolicyName": "Microsoft.Default"
      }
    }
  ]
}
TEMPLATE

  parameters = <<PARAMETERS
{
  "accountName": { "value": "${azurerm_cognitive_account.openai.name}" },
  "deploymentName": { "value": "${var.gpt4_deployment_name}" },
  "modelName": { "value": "${var.gpt4_model_name}" },
  "modelVersion": { "value": "${var.gpt4_model_version}" }
}
PARAMETERS

  depends_on = [azurerm_cognitive_account.openai]
}

# RAI policies deployment
resource "azurerm_template_deployment" "rai_policy_default" {
  name                = "rai-policy-default"
  resource_group_name = var.tenant_resource_group
  deployment_mode     = "Incremental"

  template_body = <<TEMPLATE
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "accountName": { "type": "string" }
  },
  "resources": [
    {
      "type": "Microsoft.CognitiveServices/accounts/raiPolicies",
      "apiVersion": "2024-10-01",
      "name": "[concat(parameters('accountName'), '/Microsoft.Default')]",
      "properties": {
        "mode": "Blocking",
        "contentFilters": [
          {
            "name": "Hate",
            "severityThreshold": "Medium",
            "blocking": true,
            "enabled": true,
            "source": "Prompt"
          },
          {
            "name": "Hate",
            "severityThreshold": "Medium",
            "blocking": true,
            "enabled": true,
            "source": "Completion"
          },
          {
            "name": "Sexual",
            "severityThreshold": "Medium",
            "blocking": true,
            "enabled": true,
            "source": "Prompt"
          },
          {
            "name": "Sexual",
            "severityThreshold": "Medium",
            "blocking": true,
            "enabled": true,
            "source": "Completion"
          },
          {
            "name": "Violence",
            "severityThreshold": "Medium",
            "blocking": true,
            "enabled": true,
            "source": "Prompt"
          },
          {
            "name": "Violence",
            "severityThreshold": "Medium",
            "blocking": true,
            "enabled": true,
            "source": "Completion"
          },
          {
            "name": "Selfharm",
            "severityThreshold": "Medium",
            "blocking": true,
            "enabled": true,
            "source": "Prompt"
          },
          {
            "name": "Selfharm",
            "severityThreshold": "Medium",
            "blocking": true,
            "enabled": true,
            "source": "Completion"
          }
        ]
      }
    }
  ]
}
TEMPLATE

  parameters = <<PARAMETERS
{
  "accountName": { "value": "${azurerm_cognitive_account.openai.name}" }
}
PARAMETERS

  depends_on = [azurerm_cognitive_account.openai]
}
