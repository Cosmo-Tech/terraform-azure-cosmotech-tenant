variable "subscription_id" {
  type = string
}

variable "location" {
  type = string
}

variable "tenant_virtual_network_address_prefix" {
  type = string
}

variable "tenant_virtual_subnet_network_address_prefix" {
  type = string
}

variable "managed_disk_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "project_stage" {
  description = "The Project stage"
  type = string
}

variable "project_name" {
  description = "The project name"
  type        = string
}

variable "customer_name" {
  description = "The customer name"
  type        = string
}

variable "cost_center" {
  type = string
}

variable "network_sp_object_id" {
  type = string
}

variable "storage_kind" {
  type = string
}

variable "vnet_resource_group" {
  type = string
}

variable "create_backup" {
  type = bool
}

variable "create_eventhub" {
  type    = bool
}

variable "eventhub_capacity" {
  type = number
}

variable "eventhub_public_network_access_enabled" {
  type = bool
}

variable "create_adx" {
  description = "If false, adx_ingestion_uri and adx_uri must be set manually in create-platform module"
  type        = bool
}

variable "blob_privatedns_zonename" {
  type = string
}

variable "queue_privatedns_zonename" {
  type = string
}

variable "table_privatedns_zonename" {
  type = string
}

variable "eventhub_privatedns_zonename" {
  type = string
}

variable "adt_privatedns_zonename" {
  type = string
}

variable "redis_disk_sku" {
  type = string
}

variable "redis_disk_size_gb" {
  type = number
}

variable "redis_disk_tier" {
  type = string
}

variable "kusto_instance_type" {
  type = string
}

variable "kustonr_instances" {
  type = number
}

variable "kusto_engine" {
  type = string
}

variable "kusto_trusted_external_tenants" {
  type = list(string)
}

variable "kusto_disk_encryption_enabled" {
  type = bool
}

variable "kusto_streaming_ingestion_enabled" {
  type = bool
}

variable "kusto_purge_enabled" {
  type = bool
}

variable "kusto_double_encryption_enabled" {
  type = bool
}

variable "kusto_public_network_access_enabled" {
  type = bool
}

variable "storage_tier" {
  type = string
}

variable "storage_replication_type" {
  type = string
}

variable "storage_public_network_access_enabled" {
  type = bool
}

variable "storage_default_to_oauth_authentication" {
  type = bool
}

variable "storage_min_tls_version" {
  type = string
}

variable "storage_shared_access_key_enabled" {
  type = bool
}

variable "storage_enable_https_traffic_only" {
  type = bool
}

variable "storage_access_tier" {
  type = string
}

variable "tenant_sp_object_id" {
  type = string
}

variable "tenant_resource_group" {
  type = object({
    id   = string
    name = string
  })
}

variable "common_resource_group" {
  type = object({
    id   = string
    name = string
  })
}

variable "vnet" {
  type = object({
    id   = string
    name = string
  })
}

variable "tags" {
  type = object({
    vendor      = string
    stage       = string
    customer    = string
    project     = string
    cost_center = string
  })
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "deployment_type" {
  type = string
}

variable "auto_stop_kusto" {
  type = bool
}

variable "container_admin_enabled" {
  type = bool
}

variable "container_quarantine_policy_enabled" {
  type = bool
}

variable "container_data_endpoint_enabled" {
  type = bool
}

variable "container_public_network_access_enabled" {
  type = bool
}

variable "container_zone_redundancy_enabled" {
  type = bool
}

variable "container_trust_policy" {
  type = bool
}

variable "container_retention_policy" {
  type = number
}

variable "backup_repeating_time_intervals" {
  type = list(string)
}

variable "kubernetes_tenant_namespace" {
  type = string
}

variable "cosmotech_api_reader_username" {
  type = string
}

variable "cosmotech_api_writer_username" {
  type = string
}

variable "cosmotech_api_admin_username" {
  type = string
}

variable "postgresql_initdb_secret_name" {
  type = string
}

variable "argo_postgresql_user" {
  type = string
}

variable "postgresql_secret_name" {
  type = string
}

variable "argo_database" {
  type = string
}

variable "monitoring_namespace" {
  type = string
}

variable "create_platform_config" {
  type = bool
}

variable "allowed_namespace" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "vault_address" {
  type = string
}

variable "vault_namespace" {
  type = string
}

variable "vault_sops_namespace" {
  type = string
}

variable "engine_secret" {
  type = string
}

variable "services_secrets_create" {
  type = bool
}

variable "storage_default_action" {
  type = string
}

variable "storage_csm_ip" {
  type = string
}

variable "first_tenant_in_cluster" {
  type = bool
}

variable "create_copilot" {
  type = bool
}

variable "copilot_bot_name" {
  type = string
}

variable "copilot_bot_location" {
  type = string
}

variable "copilot_bot_sku" {
  type = string
}

variable "copilot_bot_display_name" {
  type = string
}

variable "copilot_bot_endpoint" {
  type = string
}

variable "copilot_microsoft_app_id" {
  type = string
}

variable "copilot_bot_site_name" {
  type = string
}

variable "copilot_openai_name" {
  type = string
}

variable "copilot_openai_kind" {
  type = string
}

variable "copilot_openai_sku" {
  type = string
}

variable "copilot_openai_custom_subdomain" {
  type = string
}

variable "copilot_search_service_name" {
  type = string
}

variable "copilot_search_sku" {
  type = string
}

variable "copilot_search_replica_count" {
  type = number
}

variable "copilot_search_partition_count" {
  type = number
}

variable "copilot_search_index_name" {
  type = string
}

variable "copilot_function_storage_name" {
  type = string
}

variable "copilot_function_plan_name" {
  type = string
}

variable "copilot_function_app_name" {
  type = string
}

variable "copilot_python_version" {
  type = string
}

variable "copilot_webapp_plan_name" {
  type = string
}

variable "copilot_web_app_name" {
  type = string
}

variable "copilot_blob_container_name" {
  type = string
}

variable "copilot_ada_deployment_name" {
  type = string
}

variable "copilot_ada_model" {
  type = string
}

variable "copilot_gpt4_deployment_name" {
  type = string
}

variable "copilot_gpt4_model" {
  type = string
}