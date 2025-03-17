variable "platform_url" {
  description = "The platform url"
}

variable "owner_list" {
  description = "List of mail addresses for App Registration owners"
  type        = list(string)
}

variable "audience" {
  description = "The App Registration audience type"
  validation {
    condition = contains([
      "AzureADMyOrg",
      "AzureADMultipleOrgs"
    ], var.audience)
    error_message = "Only AzureADMyOrg and AzureADMultipleOrgs are supported for audience."
  }
}

variable "location" {
  description = "The Azure location"
  type        = string
}

variable "dns_zone_rg" {
  description = "The DNS zone resource group"
  type        = string
}

variable "user_app_role" {
  description = "App role for azuread_application"
  type = list(object({
    description  = string
    display_name = string
    id           = string
    role_value   = string
  }))
}

variable "image_path" {
  type = string
}

variable "create_restish" {
  description = "Create the Azure Active Directory Application for Restish"
  type        = bool
}

variable "create_powerbi" {
  description = "Create the Azure Active Directory Application for PowerBI"
  type        = bool
}

variable "create_babylon" {
  description = "Create the Azure Active Directory Application for Babylon"
  type        = bool
}

variable "create_webapp" {
  description = "Create the Azure Active Directory Application for WebApp"
  type        = bool
}

variable "create_secrets" {
  description = "Create secrets for newly created app registrations"
  type        = bool
}

variable "create_platform" {
  type = string
}
