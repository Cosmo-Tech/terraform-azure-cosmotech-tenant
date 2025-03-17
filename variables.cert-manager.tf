variable "cluster_issuer_name" {
  type = string
}

variable "tls_certificate_type" {
  type = string
  validation {
    condition = contains([
      "let_s_encrypt",
      "custom",
      "none"
    ], var.tls_certificate_type)
    error_message = "Only let_s_encrypt and none are supported for tls_certificate_type."
  }
}

variable "tls_certificate_custom_certificate" {
  type = string
}

variable "tls_certificate_custom_key" {
  type = string
}
