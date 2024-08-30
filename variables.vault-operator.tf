variable "vault_secrets_operator_namespace" {
  type    = string
  default = "vault-secrets-operator"
}

variable "vault_secrets_operator_vault_address" {
  type    = string
  default = "http://vault.vault.svc.cluster.local:8200"
}
