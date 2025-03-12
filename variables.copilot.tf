# Azure Bot
variable "create_copilot" {
  type        = bool
  description = "Deploy cosmotech copilot-api"
}

variable "copilot_bot_sku" {
  type        = string
  description = "SKU of the bot."
}

variable "copilot_bot_endpoint" {
  type        = string
  description = "The endpoint URL for the bot."
}

variable "copilot_microsoft_app_id" {
  type        = string
  description = "Microsoft App ID associated with the bot."
}

# Cognitive Services / Azure Open AI

variable "copilot_openai_kind" {
  type        = string
  description = "Type of the Cognitive Services account (must be 'OpenAI')."
}

variable "copilot_openai_sku" {
  type        = string
  description = "SKU for the Cognitive Services account."
}

# Azure Search

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

# Docker images for AZ function and webapp

variable "copilot_azure_function_docker_image" {
  type = string
}

variable "copilot_azure_function_docker_tag" {
  type = string
}

variable "copilot_azure_webapp_docker_image" {
  type = string
}

variable "copilot_azure_webapp_docker_tag" {
  type = string
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
