variable "vault_addr" {
  description = "The address of the Vault to save current platform configuration values"
  type        = string
  default     = ""
}

variable "vault_token" {
  description = "The token of the Vault to save current platform configuration values"
  type        = string
  default     = ""
}

variable "organization_name" {
  type    = string
  default = ""
}

variable "create_vault_entries" {
  description = "Custom module used to automatically retrieve Cosmo Tech Platform values and fill Vault in order to be used by Babylon"
  type        = bool
  default     = false
}