servlet_context_path                           = ""
argo_version                                   = "3.3.8"
deployment_type                                = "Terraform"
client_id                                      = ""
client_secret                                  = ""
platform_object_id                             = ""
identifier_uri                                 = ""
tenant_sp_name                                 = ""
tenant_sp_object_id                            = ""
platform_name                                  = ""
babylon_sp_client_id                           = ""
babylon_sp_object_id                           = ""
babylon_sp_client_secret                       = ""
tf_resource_group_name                         = ""
tf_storage_account_name                        = ""
tf_container_name                              = ""
tf_blob_name_tenant                            = ""
tf_access_key                                  = ""
backup_repeating_time_intervals                = ["R/2021-05-19T06:33:16+00:00/PT24H"]
cluster_issuer_name                            = "letsencrypt-prod"
tls_certificate_type                           = "let_s_encrypt"
tls_certificate_custom_certificate             = ""
tls_certificate_custom_key                     = ""
container_admin_enabled                        = "true"
container_quarantine_policy_enabled            = "false"
container_data_endpoint_enabled                = "false"
container_public_network_access_enabled        = "true"
container_zone_redundancy_enabled              = "false"
container_trust_policy                         = "false"
container_retention_policy                     = "7"
create_cosmosdb                                = "false"
cosmosdb_failover_priority                     = "0"
cosmosdb_public_network_access_enabled         = "true"
cosmosdb_is_virtual_network_filter_enabled     = "false"
cosmosdb_access_key_metadata_writes_enabled    = "true"
cosmosdb_analytical_storage_enabled            = "false"
cosmosdb_network_acl_bypass_for_azure_services = "false"
cosmosdb_consistency_level                     = "Session"
cosmosdb_consistency_interval_in_minutes       = "5"
cosmosdb_consistency_max_staleness_prefix      = "100"
cosmosdb_backup_type                           = "Periodic"
cosmosdb_backup_interval_in_minutes            = "240"
cosmosdb_backup_retention_in_hours             = "8"
cosmosdb_backup_storage_redundancy             = "Geo"
create_eventhub                                = "true"
eventhub_capacity                              = "2"
eventhub_public_network_access_enabled         = "true"
monitoring_namespace                           = "cosmotech-monitoring"
monitoring_enabled                             = "true"
kusto_auto_stop                                = "false"
kusto_instance_type                            = "Standard_D12_v2"
kustonr_instances                              = "2"
kusto_engine                                   = "V2"
kusto_trusted_external_tenants                 = ["*"]
kusto_disk_encryption_enabled                  = "false"
kusto_streaming_ingestion_enabled              = "true"
kusto_purge_enabled                            = "false"
kusto_double_encryption_enabled                = "false"
kusto_public_network_access_enabled            = "true"
kusto_privatedns_zonename                      = "privatelink.kusto.core.windows.net"
kusto_deploy                                   = "true"
network_client_secret                          = ""
network_sp_object_id                           = ""
network_tenant_address_prefix                  = "10.40.0.0/16"
network_tenant_subnet_address_prefix           = "10.40.0.0/24"
network_subnet_name                            = "default"
network_dns_record_create                      = "false"
blob_private_dns_zonename                      = "privatelink.blob.core.windows.net"
queue_private_dns_zonename                     = "privatelink.queue.core.windows.net"
table_private_dns_zonename                     = "privatelink.table.core.windows.net"
eventhub_private_dns_zonename                  = "privatelink.servicebus.windows.net"
adt_private_dns_zonename                       = "privatelink.digitaltwins.azure.net"
network_dns_zone_name                          = "api.cosmotech.com"
cosmotech_api_reader_username                  = "cosmotech_api_reader"
cosmotech_api_writer_username                  = "cosmotech_api_writer"
cosmotech_api_admin_username                   = "cosmotech_api_admin"
postgresql_initdb_secret_name                  = "postgres-initdb"
argo_database                                  = "argo_workflows"
argo_postgresql_secret_name                    = "postgres-config"
argo_postgresql_user                           = "argo"
postgresql_secret_name                         = "postgres-config"
platform_url                                   = ""
dns_zone_rg                                    = "phoenix"
image_path                                     = "./cosmotech.png"
create_restish                                 = "false"
create_powerbi                                 = "false"
create_babylon                                 = "false"
create_webapp                                  = "false"
create_secrets                                 = "false"
create_platform                                = "true"
customer_name                                  = "cosmotech"
customertag                                    = ""
project_stage                                  = "Dev"
cost_center                                    = "NA"
tags                                           = {}
publicip_create                                = "false"
create_rabbitmq                                = "false"
redis_managed_disk_name                        = ""
redis_port                                     = "6379"
storage_class_sku                              = "Standard_LRS"
storage_kind                                   = "StorageV2"
storage_public_network_access_enabled          = "false"
storage_default_to_oauth_authentication        = "false"
storage_min_tls_version                        = "TLS1_2"
storage_shared_access_key_enabled              = "true"
storage_enable_https_traffic_only              = "true"
storage_access_tier                            = "Hot"
vault_secrets_operator_namespace               = "vault-secrets-operator"
vault_secrets_operator_vault_address           = "http://vault.vault.svc.cluster.local:8200"
vault_namespace                                = "vault"
vault_token                                    = ""
