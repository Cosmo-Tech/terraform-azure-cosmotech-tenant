# Prerequisites
audience     = "AzureADMultipleOrgs"
platform_url = ""
dns_zone_rg  = "phoenix"
user_app_role = [{
  description  = "Workspace Writer",
  display_name = "Workspace Writer",
  id           = "3f7ba86c-9940-43c8-a54d-0bfb706da136",
  role_value   = "Workspace.Writer"
  }, {
  description  = "Workspace Reader",
  display_name = "Workspace Reader",
  id           = "73ce2073-d918-4fe1-bc24-a4e69db07db8",
  role_value   = "Workspace.Reader"
  }, {
  description  = "Solution Writer"
  display_name = "Solution Writer"
  id           = "4f6e62a3-7f0a-4396-9620-ab465cd6577b"
  role_value   = "Solution.Writer"
  }, {
  description  = "Solution Reader"
  display_name = "Solution Reader"
  id           = "cf1a8625-38d9-417b-a5b9-a27c0014e740"
  role_value   = "Solution.Reader"
  }, {
  description  = "ScenarioRun Writer"
  display_name = "ScenarioRun Writer"
  id           = "ca8a2a19-3e09-48cc-976b-85ec9de4f68a"
  role_value   = "ScenarioRun.Writer"
  }, {
  description  = "ScenarioRun Reader"
  display_name = "ScenarioRun Reader"
  id           = "bdc8fe2a-73a8-477d-9efa-d8a37a4eb0f7"
  role_value   = "ScenarioRun.Reader"
  }, {
  description  = "Scenario Writer"
  display_name = "Scenario Writer"
  id           = "8fb9d03e-c46d-4003-a2a6-34d8b506e4e7"
  role_value   = "Scenario.Writer"
  }, {
  description  = "Scenario Reader"
  display_name = "Scenario Reader"
  id           = "e07dab65-4200-4502-8e36-79ca687320d9"
  role_value   = "Scenario.Reader"
  }, {
  description  = "Organization Writer"
  display_name = "Organization Writer"
  id           = "89d74995-095c-442f-bfda-06a77d3dbaa4"
  role_value   = "Organization.Writer"
  }, {
  description  = "Organization Reader"
  display_name = "Organization Reader"
  id           = "96213509-202a-497c-9f60-53c5f85268ec"
  role_value   = "Organization.Reader"
  }, {
  description  = "Dataset Writer"
  display_name = "Dataset Writer"
  id           = "c6e5d483-ec2c-4710-bf0c-78b0fda611dc"
  role_value   = "Dataset.Writer"
  }, {
  description  = "Dataset Reader"
  display_name = "Dataset Reader"
  id           = "454dc3f5-3012-45b3-bad6-975dae94338c"
  role_value   = "Dataset.Reader"
  }, {
  description  = "Ability to write connectors"
  display_name = "Connector Writer"
  id           = "e150953f-4835-4502-b95e-81d9ce97f591"
  role_value   = "Connector.Writer"
  }, {
  description  = "Organization Viewer"
  display_name = "Organization Viewer"
  id           = "ec5fdd3c-4df0-4c2f-bdad-0495a49f6e90"
  role_value   = "Organization.Viewer"
  }, {
  description  = "Organization User"
  display_name = "Organization User"
  id           = "bb9ffb73-997e-4320-8625-cfe45469aa3c"
  role_value   = "Organization.User"
  }, {
  description  = "Organization Modeler"
  display_name = "Organization Modeler"
  id           = "adcdb0a1-1588-4d2b-8657-364e544ac7e1"
  role_value   = "Organization.Modeler"
  }, {
  description  = "Organization Administrator"
  display_name = "Organization Admin"
  id           = "04b96a76-d77e-4a9d-967f-c55c857c478c"
  role_value   = "Organization.Admin"
  }, {
  description  = "Organization Collaborator"
  display_name = "Organization Collaborator"
  id           = "6f5ec4e3-1f2d-4502-837e-5d9754ea8acb"
  role_value   = "Organization.Collaborator"
  }, {
  description  = "Ability to develop connectors"
  display_name = "Connector Developer"
  id           = "428ab58e-ab61-4621-907c-d7908be72df7"
  role_value   = "Connector.Developer"
  }, {
  description  = "Ability to read connectors"
  display_name = "Connector Reader"
  id           = "2cd74037-3ccd-4ab7-929d-4afce87be2e4"
  role_value   = "Connector.Reader"
  }, {
  description  = "Platform Administrator"
  display_name = "Platform Admin"
  id           = "bb49d61f-8b6a-4a19-b5bd-06a29d6b8e60"
  role_value   = "Platform.Admin"
  }
]
image_path      = "./cosmotech.png"
create_restish  = false
create_powerbi  = false
create_babylon  = false
create_webapp   = false
create_secrets  = false
create_platform = true

# Azure
deployment_type     = "Terraform"
client_id           = ""
client_secret       = ""
platform_object_id  = ""
identifier_uri      = ""
tenant_sp_name      = ""
tenant_sp_object_id = ""

# Container registry
container_admin_enabled                 = true
container_quarantine_policy_enabled     = false
container_data_endpoint_enabled         = false
container_public_network_access_enabled = true
container_zone_redundancy_enabled       = false
container_trust_policy                  = false
container_retention_policy              = 7

# Backend remote
tf_resource_group_name  = ""
tf_storage_account_name = ""
tf_container_name       = ""
tf_blob_name_tenant     = ""
# tf_access_key           = ""

# restish
restish_sp_client_id     = ""
restish_sp_client_secret = ""

swagger_sp_client_id = ""

# Network
network_client_secret                = ""
network_sp_object_id                 = ""
network_tenant_address_prefix        = "10.10.0.0/16"
network_tenant_subnet_address_prefix = "10.10.0.0/24"
network_subnet_name                  = "default"
network_dns_record_create            = false
blob_private_dns_zonename            = "privatelink.blob.core.windows.net"
queue_private_dns_zonename           = "privatelink.queue.core.windows.net"
table_private_dns_zonename           = "privatelink.table.core.windows.net"
eventhub_private_dns_zonename        = "privatelink.servicebus.windows.net"
adt_private_dns_zonename             = "privatelink.digitaltwins.azure.net"
network_dns_zone_name                = "api.cosmotech.com"
publicip_create                      = false
storage_csm_ip                       = ""

# Project
customer_name = "cosmotech"
customertag   = ""
project_stage = "Dev"
cost_center   = "NA"
tags          = {}

# Storage
storage_class_sku                       = "Standard_LRS"
storage_kind                            = "StorageV2"
storage_public_network_access_enabled   = false
storage_default_to_oauth_authentication = false
storage_min_tls_version                 = "TLS1_2"
storage_shared_access_key_enabled       = true
storage_enable_https_traffic_only       = true
storage_access_tier                     = "Hot"
storage_default_action                  = "Deny"

# Babylon
platform_name            = ""
babylon_sp_client_id     = ""
babylon_sp_object_id     = ""
babylon_sp_client_secret = ""

# Cosmotech API
servlet_context_path = ""

# Argo
argo_database = "argo_workflows"

# Backups
backup_repeating_time_intervals = ["R/2021-05-19T06:33:16+00:00/PT24H"]

# Cert-manager
cluster_issuer_name                = "letsencrypt-prod"
tls_certificate_type               = "let_s_encrypt"
tls_certificate_custom_certificate = ""
tls_certificate_custom_key         = ""

# Event Hub
create_eventhub                        = true
eventhub_capacity                      = 2
eventhub_public_network_access_enabled = true

# Monitoring
monitoring_namespace = "cosmotech-monitoring"
monitoring_enabled   = true

# Kusto
kusto_auto_stop                     = false
kusto_instance_type                 = "Standard_D12_v2"
kustonr_instances                   = 2
kusto_engine                        = "V2"
kusto_trusted_external_tenants      = ["*"]
kusto_disk_encryption_enabled       = false
kusto_streaming_ingestion_enabled   = true
kusto_purge_enabled                 = false
kusto_double_encryption_enabled     = false
kusto_public_network_access_enabled = true
kusto_privatedns_zonename           = "privatelink.kusto.core.windows.net"
kusto_deploy                        = true

# Postgres
cosmotech_api_reader_username = "cosmotech_api_reader"
cosmotech_api_writer_username = "cosmotech_api_writer"
cosmotech_api_admin_username  = "cosmotech_api_admin"
postgresql_initdb_secret_name = "postgres-initdb"
argo_postgresql_user          = "argo"
postgresql_secret_name        = "postgres-config"

# Rabbitmq
create_rabbitmq = false

# Redis
redis_managed_disk_name = ""
redis_port              = 6379

# Vault
vault_namespace      = "vault"
vault_token          = ""
vault_sops_deploy    = false
vault_create_entries = false

services_secrets_create = true

# Vault secrets operator
vault_secrets_operator_namespace     = "vault-secrets-operator"
vault_secrets_operator_vault_address = "http://vault.vault.svc.cluster.local:8200"

# admin user or not
kubernetes_cluster_admin_activate = true

first_tenant_in_cluster = false

# copilot-api
create_copilot          = false
copilot_bot_name                = ""
copilot_bot_location            = "global"
copilot_bot_sku                 = "S1"
copilot_bot_display_name        = ""
copilot_bot_endpoint            = ""
copilot_microsoft_app_id        = ""
copilot_bot_site_name           = ""
copilot_openai_name             = ""
copilot_openai_kind             = "OpenAI"
copilot_openai_sku              = "S0"
copilot_openai_custom_subdomain = ""
copilot_search_service_name     = ""
copilot_search_sku              = "basic"
copilot_search_replica_count    = 1
copilot_search_partition_count  = 1
copilot_search_index_name       = "supply-chain-index"
copilot_function_storage_name   = ""
copilot_function_plan_name      = ""
copilot_function_app_name       = ""
copilot_python_version          = "3.10"
copilot_webapp_plan_name        = ""
copilot_web_app_name            = ""
copilot_blob_container_name     = "documents"
copilot_ada_deployment_name     = "text-embedding-ada-002"
copilot_ada_model               = "text-embedding-ada-002"
copilot_gpt4_deployment_name    = "GPT-4-0613"
copilot_gpt4_model              = "GPT-4"
