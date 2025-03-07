module "services-secrets" {
  source = "./create-services-secrets"

  count = var.services_secrets_create ? 1 : 0

  argo_database                 = var.argo_database
  postgresql_initdb_secret_name = var.postgresql_initdb_secret_name
  postgresql_secret_name        = var.postgresql_secret_name
  argo_postgresql_user          = var.argo_postgresql_user
  cosmotech_api_admin_username  = var.cosmotech_api_admin_username
  cosmotech_api_reader_username = var.cosmotech_api_reader_username
  cosmotech_api_writer_username = var.cosmotech_api_writer_username
  monitoring_namespace          = var.monitoring_namespace
  kubernetes_namespace          = var.kubernetes_tenant_namespace
  first_tenant_in_cluster       = var.first_tenant_in_cluster
  argo_workflows_s3_username    = var.argo_workflows_s3_username
  rabbitmq_listener_username    = var.rabbitmq_listener_username
  rabbitmq_sender_username      = var.rabbitmq_sender_username
  seaweedfs_database            = var.seaweedfs_database
  seaweedfs_username            = var.seaweedfs_username
}