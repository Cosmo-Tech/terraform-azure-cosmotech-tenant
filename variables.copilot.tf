# Azure Bot
variable "create_copilot" {
  type        = bool
  description = "Deploy cosmotech copilot-api"
}

variable "copilot_bot_name" {
  type        = string
  description = "Name of the Azure Bot."
}

variable "copilot_bot_location" {
  type        = string
  description = "Location for the bot. Must be 'global' since bot resources are deployed globally."
}

variable "copilot_bot_sku" {
  type        = string
  description = "SKU of the bot."
}

variable "copilot_bot_display_name" {
  type        = string
  description = "Display name for the bot."
}

variable "copilot_bot_endpoint" {
  type        = string
  description = "The endpoint URL for the bot."
}

variable "copilot_microsoft_app_id" {
  type        = string
  description = "Microsoft App ID associated with the bot."
}

variable "copilot_bot_site_name" {
  type        = string
  description = "Name of the site used for bot channels (e.g., DirectLine, WebChat)."
}

# Cognitive Services / Azure Open AI
variable "copilot_openai_name" {
  type        = string
  description = "Name of the Cognitive Services account for Azure Open AI."
}

variable "copilot_openai_kind" {
  type        = string
  description = "Type of the Cognitive Services account (must be 'OpenAI')."
}

variable "copilot_openai_sku" {
  type        = string
  description = "SKU for the Cognitive Services account."
}

variable "copilot_openai_custom_subdomain" {
  type        = string
  description = "Custom subdomain name for the Cognitive Services account."
}

# Azure Search
variable "copilot_search_service_name" {
  type        = string
  description = "Name of the Azure Search service."
}

variable "copilot_search_sku" {
  type        = string
  description = "SKU for the Azure Search service."
}

variable "copilot_search_replica_count" {
  type        = number
  description = "Number of replicas for Azure Search."
}

variable "copilot_search_partition_count" {
  type        = number
  description = "Number of partitions for Azure Search."
}

variable "copilot_search_index_name" {
  type        = string
  description = "Name of the Azure Search index."
}

# Azure Function App
variable "copilot_function_storage_name" {
  type        = string
  description = "Name of the Storage Account for the Function App."
}

variable "copilot_function_plan_name" {
  type        = string
  description = "Name of the App Service Plan for the Function App."
}

variable "copilot_function_app_name" {
  type        = string
  description = "Name of the Linux Function App."
}

variable "copilot_python_version" {
  type        = string
  description = "Python version used by the Function App."
}

# Azure Web App
variable "copilot_webapp_plan_name" {
  type        = string
  description = "Name of the App Service Plan for the Web App."
}

variable "copilot_web_app_name" {
  type        = string
  description = "Name of the Azure Web App."
}

# Azure Blob Storage for Documents
variable "copilot_blob_container_name" {
  type        = string
  description = "Name of the container for storing documents."
}

# ARM Deployments for Azure Open AI Models
variable "copilot_ada_deployment_name" {
  type        = string
  description = "Deployment name for the Ada model."
}

variable "copilot_ada_model" {
  type        = string
  description = "Model to be used for the Ada deployment."
}

variable "copilot_gpt4_deployment_name" {
  type        = string
  description = "Deployment name for the GPT-4 model."
}

variable "copilot_gpt4_model" {
  type        = string
  description = "Model to be used for the GPT-4 deployment."
}
