resource "kubernetes_secret" "custom-tls" { 
  metadata {
    name      = var.tls_secret_name
    namespace = var.namespace
  }

  data = {
    "tls.crt" = var.path_fullchain_pem
    "tls.key" = var.path_privatekey_pem
  }

  type = "kubernetes.io/tls"
}
