module "create-argo" {
  source = "./create-argo"

  namespace             = var.kubernetes_tenant_namespace
  monitoring_namespace  = var.monitoring_namespace
  postgres_release_name = module.create-postgresql-db.out_postgres_release_name

  depends_on = [
    module.create-postgresql-db
  ]
}

module "cert-manager" {
  source = "./create-cert-manager"

  count               = var.tls_certificate_type == "let_s_encrypt" ? 1 : 0
  namespace           = var.kubernetes_tenant_namespace
  cluster_issuer_name = var.cluster_issuer_name
  tls_secret_name     = local.tls_secret_name
  api_dns_name        = var.api_dns_name
}

module "create-tls" {
  source = "./create-secret-tls"

  count = var.tls_certificate_type == "let_s_encrypt" ? 0 : 1

  namespace                          = var.kubernetes_tenant_namespace
  tls_secret_name                    = var.tls_secret_name
  tls_certificate_custom_certificate = var.tls_certificate_custom_certificate
  tls_certificate_custom_key         = var.tls_certificate_custom_key

  depends_on = [
    module.create-argo
  ]
}

module "create-cosmotech-api" {
  source = "./create-cosmotech-api"

  client_id                     = var.tenant_client_id
  client_secret                 = var.tenant_client_secret
  tenant_id                     = var.tenant_id
  network_client_id             = var.network_client_id
  network_client_secret         = var.network_client_secret
  namespace                     = var.kubernetes_tenant_namespace
  monitoring_enabled            = var.monitoring_enabled
  monitoring_namespace          = var.monitoring_namespace
  api_dns_name                  = var.api_dns_name
  api_replicas                  = var.api_replicas
  tls_secret_name               = local.tls_secret_name
  acr_login_password            = var.acr_login_password
  acr_login_server              = var.acr_login_server
  acr_login_username            = var.acr_login_username
  cosmos_key                    = var.cosmos_key
  cosmos_uri                    = var.cosmos_uri
  adx_uri                       = var.adx_uri
  adx_ingestion_uri             = var.adx_ingestion_uri
  eventbus_uri                  = var.eventbus_uri
  storage_account_key           = var.storage_account_key
  storage_account_name          = var.storage_account_name
  chart_package_version         = var.chart_package_version
  cosmotech_api_version         = var.cosmotech_api_version
  cosmotech_api_ingress_enabled = var.cosmotech_api_ingress_enabled
  redis_admin_password          = random_password.redis_admin_password.result
  redis_port                    = var.redis_port
  tenant_resource_group         = var.tenant_resource_group

  depends_on = [
    module.create-argo
  ]
}

module "create-minio" {
  source = "./create-minio"

  namespace                   = var.kubernetes_tenant_namespace
  monitoring_namespace        = var.monitoring_namespace
  argo_minio_access_key       = random_password.argo_minio_access_key.result
  argo_minio_secret_key       = random_password.argo_minio_secret_key.result
  argo_minio_persistence_size = var.argo_minio_persistence_size
  argo_minio_requests_memory  = var.argo_minio_requests_memory
}

module "create-postgresql-db" {
  source = "./create-postgresql-db"

  namespace                = var.kubernetes_tenant_namespace
  monitoring_namespace     = var.monitoring_namespace
  argo_postgresql_password = random_password.argo_postgresql_password.result
  depends_on               = [module.create-minio]
}

module "create-redis-stack" {
  source = "./create-redis-stack"

  redis_admin_password = random_password.redis_admin_password.result
  namespace            = var.kubernetes_tenant_namespace
  managed_disk_id      = var.managed_disk_id
  redis_disk_name      = var.redis_disk_name
  depends_on           = [module.create-postgresql-db]

}
