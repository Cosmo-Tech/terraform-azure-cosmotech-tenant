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

variable "client_id" {
  description = "The client id"
  default     = ""
}

variable "client_secret" {
  description = "The client secret"
  default     = ""
}

variable "subscription_id" {
  description = "The subscription id"
}

variable "project_name" {
  description = "The project name"
}

variable "customer_name" {
  description = "The customer name"
  default     = "cosmotech"
}

variable "customertag" {
  type    = string
  default = ""
}

variable "platform_object_id" {
  type    = string
  default = ""
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

variable "tenant_id" {
  description = "The tenant id"
}

variable "tenant_resource_group" {
  description = "Resource group to create which will contain created Azure resources for this tenant"
  type        = string
}

variable "tenant_sp_name" {
  description = "The name of the platform on which we deploy the tenant"
  type        = string
  default     = ""
}

variable "tenant_sp_object_id" {
  description = "The object id of the platform service principal"
  type        = string
  default     = ""
}

variable "tenant_client_id" {
  type    = string
  default = ""
}

variable "tenant_client_secret" {
  type    = string
  default = ""
}