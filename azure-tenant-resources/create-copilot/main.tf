locals {
  namespace = var.kubernetes_tenant_namespace
  
  bot_name = "${var.kubernetes_tenant_namespace}-bot"
  bot_display_name = "${title(replace(var.kubernetes_tenant_namespace, "-", " "))} Bot"
  bot_site_name = "${var.kubernetes_tenant_namespace}-copilot-bot"
  openai_name = "${var.kubernetes_tenant_namespace}-openai"
  openai_custom_subdomain = "${var.kubernetes_tenant_namespace}-openai"
  search_service_name = "${var.kubernetes_tenant_namespace}-search"
  function_storage_name = replace("${var.kubernetes_tenant_namespace}copilotst", "-", "")
  function_plan_name = "${var.kubernetes_tenant_namespace}-copilot-plan"
  function_app_name = "${var.kubernetes_tenant_namespace}-copilot-func"
  webapp_plan_name = "${var.kubernetes_tenant_namespace}-copilot-webapp-plan"
  web_app_name = "${var.kubernetes_tenant_namespace}-copilot-webapp"
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
  endpoint            = var.bot_endpoint
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
resource "azurerm_search_service" "search_service" {
  name                = local.search_service_name
  location            = var.location
  resource_group_name = var.tenant_resource_group
  sku                 = var.search_sku
  replica_count       = var.search_replica_count
  partition_count     = var.search_partition_count
}

resource "azurerm_search_index" "ai_search_index" {
  name                = var.search_index_name
  resource_group_name = var.tenant_resource_group
  search_service_name = azurerm_search_service.search_service.name

  field {
    name        = "id"
    type        = "Edm.String"
    key         = true
    searchable  = false
    filterable  = true
    retrievable = true
    sortable    = false
    facetable   = false
  }

  field {
    name        = "title"
    type        = "Edm.String"
    searchable  = true
    filterable  = false
    retrievable = true
    sortable    = false
    facetable   = false
  }

  field {
    name        = "last_update"
    type        = "Edm.DateTimeOffset"
    searchable  = false
    filterable  = true
    retrievable = true
    sortable    = true
    facetable   = false
  }

  field {
    name        = "chunk_id"
    type        = "Edm.String"
    searchable  = false
    filterable  = true
    retrievable = true
    sortable    = false
    facetable   = false
  }

  field {
    name        = "chunk"
    type        = "Edm.String"
    searchable  = true
    filterable  = false
    retrievable = true
    sortable    = false
    facetable   = false
  }

  field {
    name        = "vector"
    type        = "Collection(Edm.Single)"
    searchable  = false
    filterable  = false
    retrievable = true
    sortable    = false
    facetable   = false
  }

  cors_options {
    allowed_origins = ["*"]
  }
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

resource "azurerm_linux_function_app" "function_app" {
  name                       = local.function_app_name
  location                   = var.location
  resource_group_name        = var.tenant_resource_group
  service_plan_id            = azurerm_app_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key

  site_config {
    application_stack {
      python_version = var.python_version
    }
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "python"
  }
}

############################
# 5. Azure Web App
############################
resource "azurerm_app_service_plan" "webapp_plan" {
  name                = local.webapp_plan_name
  location            = var.location
  resource_group_name = var.tenant_resource_group

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "web_app" {
  name                = local.web_app_name
  location            = var.location
  resource_group_name = var.tenant_resource_group
  app_service_plan_id = azurerm_app_service_plan.webapp_plan.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}

############################
# 6. Azure Blob Storage for Documents
############################
resource "azurerm_storage_container" "documents" {
  name                  = var.blob_container_name
  storage_account_id    = var.blob_storage_id
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
    "deploymentName": { "type": "string", "defaultValue": "${var.ada_deployment_name}" },
    "model": { "type": "string", "defaultValue": "${var.ada_model}" }
  },
  "resources": [
    {
      "type": "Microsoft.CognitiveServices/accounts/deployments",
      "apiVersion": "2022-12-01",
      "name": "[concat(parameters('accountName'), '/', parameters('deploymentName'))]",
      "properties": {
        "model": "[parameters('model')]",
        "scaleSettings": { "scaleType": "Standard", "capacity": 1 }
      }
    }
  ]
}
TEMPLATE

  parameters = <<PARAMETERS
{
  "accountName": { "value": "${azurerm_cognitive_account.openai.name}" },
  "deploymentName": { "value": "${var.ada_deployment_name}" },
  "model": { "value": "${var.ada_model}" }
}
PARAMETERS
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
    "deploymentName": { "type": "string", "defaultValue": "${var.gpt4_deployment_name}" },
    "model": { "type": "string", "defaultValue": "${var.gpt4_model}" }
  },
  "resources": [
    {
      "type": "Microsoft.CognitiveServices/accounts/deployments",
      "apiVersion": "2022-12-01",
      "name": "[concat(parameters('accountName'), '/', parameters('deploymentName'))]",
      "properties": {
        "model": "[parameters('model')]",
        "scaleSettings": { "scaleType": "Standard", "capacity": 1 }
      }
    }
  ]
}
TEMPLATE

  parameters = <<PARAMETERS
{
  "accountName": { "value": "${azurerm_cognitive_account.openai.name}" },
  "deploymentName": { "value": "${var.gpt4_deployment_name}" },
  "model": { "value": "${var.gpt4_model}" }
}
PARAMETERS
}