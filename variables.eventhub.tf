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
