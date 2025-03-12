variable "tenant_resource_group" {
  type        = string
  description = "Name of the resource group where all Azure resources will be created."
}

variable "location" {
  type        = string
  description = "Azure region for the resources (e.g., 'francecentral')."
}

variable "kubernetes_tenant_namespace" {
  type = string
}

# ACR

variable "acr_url" {
  type = string
}

variable "acr_username" {
  type = string
}

variable "acr_password" {
  type = string
}

variable "azure_function_docker_image" {
  type = string
}

variable "azure_function_docker_tag" {
  type = string
}

variable "azure_webapp_docker_image" {
  type = string
}

variable "azure_webapp_docker_tag" {
  type = string
}

# Azure Bot

variable "bot_sku" {
  type        = string
  description = "SKU of the bot."
}

variable "bot_endpoint" {
  type        = string
  description = "The endpoint URL for the bot."
}

variable "microsoft_app_id" {
  type        = string
  description = "Microsoft App ID associated with the bot."
}

# Cognitive Services / Azure Open AI

variable "openai_kind" {
  type        = string
  description = "Type of the Cognitive Services account (must be 'OpenAI')."
}

variable "openai_sku" {
  type        = string
  description = "SKU for the Cognitive Services account."
}

# Azure Search

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

# Azure Blob Storage for Documents
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
