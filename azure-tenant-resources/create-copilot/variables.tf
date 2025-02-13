variable "tenant_resource_group" {
  type        = string
  description = "Name of the resource group where all Azure resources will be created."
}

variable "location" {
  type        = string
  description = "Azure region for the resources (e.g., 'francecentral')."
}

# Azure Bot
variable "bot_name" {
  type        = string
  description = "Name of the Azure Bot."
}

variable "bot_location" {
  type        = string
  description = "Location for the bot. Must be 'global' since bot resources are deployed globally."
}

variable "bot_sku" {
  type        = string
  description = "SKU of the bot."
}

variable "bot_display_name" {
  type        = string
  description = "Display name for the bot."
}

variable "bot_endpoint" {
  type        = string
  description = "The endpoint URL for the bot."
}

variable "microsoft_app_id" {
  type        = string
  description = "Microsoft App ID associated with the bot."
}

variable "bot_site_name" {
  type        = string
  description = "Name of the site used for bot channels (e.g., DirectLine, WebChat)."
}

# Cognitive Services / Azure Open AI
variable "openai_name" {
  type        = string
  description = "Name of the Cognitive Services account for Azure Open AI."
}

variable "openai_kind" {
  type        = string
  description = "Type of the Cognitive Services account (must be 'OpenAI')."
}

variable "openai_sku" {
  type        = string
  description = "SKU for the Cognitive Services account."
}

variable "openai_custom_subdomain" {
  type        = string
  description = "Custom subdomain name for the Cognitive Services account."
}

# Azure Search
variable "search_service_name" {
  type        = string
  description = "Name of the Azure Search service."
}

variable "search_sku" {
  type        = string
  description = "SKU for the Azure Search service."
}

variable "search_replica_count" {
  type        = number
  description = "Number of replicas for Azure Search."
}

variable "search_partition_count" {
  type        = number
  description = "Number of partitions for Azure Search."
}

variable "search_index_name" {
  type        = string
  description = "Name of the Azure Search index."
}

# Azure Function App
variable "function_storage_name" {
  type        = string
  description = "Name of the Storage Account for the Function App."
}

variable "function_plan_name" {
  type        = string
  description = "Name of the App Service Plan for the Function App."
}

variable "function_app_name" {
  type        = string
  description = "Name of the Linux Function App."
}

variable "python_version" {
  type        = string
  description = "Python version used by the Function App."
}

# Azure Web App
variable "webapp_plan_name" {
  type        = string
  description = "Name of the App Service Plan for the Web App."
}

variable "web_app_name" {
  type        = string
  description = "Name of the Azure Web App."
}

# Azure Blob Storage for Documents
variable "blob_storage_id" {
  type        = string
  description = "ID of the Storage Account for Blob Storage."
}

variable "blob_container_name" {
  type        = string
  description = "Name of the container for storing documents."
}

# ARM Deployments for Azure Open AI Models
variable "ada_deployment_name" {
  type        = string
  description = "Deployment name for the Ada model."
}

variable "ada_model" {
  type        = string
  description = "Model to be used for the Ada deployment."
}

variable "gpt4_deployment_name" {
  type        = string
  description = "Deployment name for the GPT-4 model."
}

variable "gpt4_model" {
  type        = string
  description = "Model to be used for the GPT-4 deployment."
}
