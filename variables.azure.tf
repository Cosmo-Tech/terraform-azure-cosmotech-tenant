variable "deployment_type" {
  description = "Represents the kind of deployment. Currently two modes: ARM or Terraform"
  type        = string
  default     = "Terraform"
  validation {
    condition = contains([
      "ARM",
      "Terraform"
    ], var.deployment_type)
    error_message = "Stage must be either: ARM or Terraform."
  }
}

variable "subscription_id" {
  description = "The subscription id"
}

variable "project_name" {
  description = "The project name"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "customer_name" {
  description = "The customer name"
  default     = "cosmotech"
}

variable "customertag" {
  type    = string
  default = ""
}

variable "common_platform_object_id" {
  type = string
}

variable "common_resource_group" {
  description = "Existing Resource group which contain common platform resources"
  type        = string
}

variable "identifier_uri" {
  description = "The platform identifier uri"
  default     = ""
}

variable "project_stage" {
  description = "The platform stage"
  default     = "Dev"
  validation {
    condition = contains([
      "OnBoarding",
      "Dev",
      "QA",
      "IA",
      "EA",
      "Demo",
      "Prod"
    ], var.project_stage)
    error_message = "Stage must be either: OnBoarding, Dev, QA, IA, EA, Demo, Prod."
  }
}

variable "webapp_url" {
  description = "The Web Application URL"
  default     = ""
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {}
}

variable "create_adx" {
  description = "Whether to create Azure digital explorer"
  type        = bool
  default     = true
}

variable "create_eventhub" {
  description = "Whether to create Azure Event Hub resources"
  type        = bool
  default     = true
}

variable "eventhub_capacity" {
  type    = number
  default = 2
}

variable "eventhub_public_network_access_enabled" {
  type    = bool
  default = true
}

variable "create_rabbitmq" {
  description = "Whether to create RabbitMQ resources"
  type        = bool
  default     = false
}

variable "cost_center" {
  description = "The value associated to a resource (tag)"
  type        = string
  default     = "NA"
}