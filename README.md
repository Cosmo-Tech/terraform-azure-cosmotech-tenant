<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.53.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>4.1.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.15.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 3.4.4 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 2.0.4 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>4.1.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.32.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure-tenant-prerequisites"></a> [azure-tenant-prerequisites](#module\_azure-tenant-prerequisites) | ./azure-tenant-prerequisites | n/a |
| <a name="module_azure-tenant-resources"></a> [azure-tenant-resources](#module\_azure-tenant-resources) | ./azure-tenant-resources | n/a |
| <a name="module_create-vault-entries"></a> [create-vault-entries](#module\_create-vault-entries) | ./create-vault-entries | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.tenant_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [kubernetes_namespace.main_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/2.32.0/docs/resources/namespace) | resource |
| [azurerm_kubernetes_cluster.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |
| [azurerm_resource_group.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.tenant_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_virtual_network.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_adt_private_dns_zonename"></a> [adt\_private\_dns\_zonename](#input\_adt\_private\_dns\_zonename) | n/a | `string` | n/a | yes |
| <a name="input_allowed_namespace"></a> [allowed\_namespace](#input\_allowed\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_api_dns_name"></a> [api\_dns\_name](#input\_api\_dns\_name) | n/a | `string` | n/a | yes |
| <a name="input_argo_archive_ttl"></a> [argo\_archive\_ttl](#input\_argo\_archive\_ttl) | n/a | `string` | n/a | yes |
| <a name="input_argo_bucket_name"></a> [argo\_bucket\_name](#input\_argo\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_argo_database"></a> [argo\_database](#input\_argo\_database) | n/a | `string` | n/a | yes |
| <a name="input_argo_helm_chart"></a> [argo\_helm\_chart](#input\_argo\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_argo_helm_repo_url"></a> [argo\_helm\_repo\_url](#input\_argo\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_argo_minio_persistence_size"></a> [argo\_minio\_persistence\_size](#input\_argo\_minio\_persistence\_size) | n/a | `string` | n/a | yes |
| <a name="input_argo_minio_requests_memory"></a> [argo\_minio\_requests\_memory](#input\_argo\_minio\_requests\_memory) | n/a | `string` | n/a | yes |
| <a name="input_argo_postgresql_secret_name"></a> [argo\_postgresql\_secret\_name](#input\_argo\_postgresql\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_argo_postgresql_user"></a> [argo\_postgresql\_user](#input\_argo\_postgresql\_user) | n/a | `string` | n/a | yes |
| <a name="input_argo_requeue_time"></a> [argo\_requeue\_time](#input\_argo\_requeue\_time) | n/a | `string` | n/a | yes |
| <a name="input_argo_service_account"></a> [argo\_service\_account](#input\_argo\_service\_account) | n/a | `string` | n/a | yes |
| <a name="input_argo_version"></a> [argo\_version](#input\_argo\_version) | n/a | `string` | n/a | yes |
| <a name="input_audience"></a> [audience](#input\_audience) | The App Registration audience type | `any` | n/a | yes |
| <a name="input_babylon_sp_client_id"></a> [babylon\_sp\_client\_id](#input\_babylon\_sp\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_babylon_sp_client_secret"></a> [babylon\_sp\_client\_secret](#input\_babylon\_sp\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_babylon_sp_object_id"></a> [babylon\_sp\_object\_id](#input\_babylon\_sp\_object\_id) | n/a | `string` | n/a | yes |
| <a name="input_backup_create"></a> [backup\_create](#input\_backup\_create) | n/a | `bool` | n/a | yes |
| <a name="input_backup_repeating_time_intervals"></a> [backup\_repeating\_time\_intervals](#input\_backup\_repeating\_time\_intervals) | n/a | `list(string)` | n/a | yes |
| <a name="input_blob_private_dns_zonename"></a> [blob\_private\_dns\_zonename](#input\_blob\_private\_dns\_zonename) | n/a | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client id | `any` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret | `any` | n/a | yes |
| <a name="input_cluster_issuer_name"></a> [cluster\_issuer\_name](#input\_cluster\_issuer\_name) | n/a | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_container_admin_enabled"></a> [container\_admin\_enabled](#input\_container\_admin\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_container_data_endpoint_enabled"></a> [container\_data\_endpoint\_enabled](#input\_container\_data\_endpoint\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_container_public_network_access_enabled"></a> [container\_public\_network\_access\_enabled](#input\_container\_public\_network\_access\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_container_quarantine_policy_enabled"></a> [container\_quarantine\_policy\_enabled](#input\_container\_quarantine\_policy\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_container_retention_policy"></a> [container\_retention\_policy](#input\_container\_retention\_policy) | n/a | `number` | n/a | yes |
| <a name="input_container_tag"></a> [container\_tag](#input\_container\_tag) | n/a | `string` | n/a | yes |
| <a name="input_container_trust_policy"></a> [container\_trust\_policy](#input\_container\_trust\_policy) | n/a | `bool` | n/a | yes |
| <a name="input_container_zone_redundancy_enabled"></a> [container\_zone\_redundancy\_enabled](#input\_container\_zone\_redundancy\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_cosmotech_api_admin_username"></a> [cosmotech\_api\_admin\_username](#input\_cosmotech\_api\_admin\_username) | n/a | `string` | n/a | yes |
| <a name="input_cosmotech_api_chart_package_version"></a> [cosmotech\_api\_chart\_package\_version](#input\_cosmotech\_api\_chart\_package\_version) | The version of the Cosmo Tech API chart to deploy | `string` | n/a | yes |
| <a name="input_cosmotech_api_reader_username"></a> [cosmotech\_api\_reader\_username](#input\_cosmotech\_api\_reader\_username) | n/a | `string` | n/a | yes |
| <a name="input_cosmotech_api_version"></a> [cosmotech\_api\_version](#input\_cosmotech\_api\_version) | n/a | `string` | n/a | yes |
| <a name="input_cosmotech_api_version_path"></a> [cosmotech\_api\_version\_path](#input\_cosmotech\_api\_version\_path) | The API version path | `string` | n/a | yes |
| <a name="input_cosmotech_api_writer_username"></a> [cosmotech\_api\_writer\_username](#input\_cosmotech\_api\_writer\_username) | n/a | `string` | n/a | yes |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | The value associated to a resource (tag) | `string` | n/a | yes |
| <a name="input_create_babylon"></a> [create\_babylon](#input\_create\_babylon) | Create the Azure Active Directory Application for Babylon | `bool` | n/a | yes |
| <a name="input_create_eventhub"></a> [create\_eventhub](#input\_create\_eventhub) | Whether to create Azure Event Hub resources | `bool` | n/a | yes |
| <a name="input_create_platform"></a> [create\_platform](#input\_create\_platform) | n/a | `string` | n/a | yes |
| <a name="input_create_platform_config"></a> [create\_platform\_config](#input\_create\_platform\_config) | n/a | `bool` | n/a | yes |
| <a name="input_create_powerbi"></a> [create\_powerbi](#input\_create\_powerbi) | Create the Azure Active Directory Application for PowerBI | `bool` | n/a | yes |
| <a name="input_create_rabbitmq"></a> [create\_rabbitmq](#input\_create\_rabbitmq) | Whether to create RabbitMQ resources | `bool` | n/a | yes |
| <a name="input_create_restish"></a> [create\_restish](#input\_create\_restish) | Create the Azure Active Directory Application for Restish | `bool` | n/a | yes |
| <a name="input_create_secrets"></a> [create\_secrets](#input\_create\_secrets) | Create secrets for newly created app registrations | `bool` | n/a | yes |
| <a name="input_create_webapp"></a> [create\_webapp](#input\_create\_webapp) | Create the Azure Active Directory Application for WebApp | `bool` | n/a | yes |
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | The customer name | `any` | n/a | yes |
| <a name="input_customertag"></a> [customertag](#input\_customertag) | n/a | `string` | n/a | yes |
| <a name="input_deployment_type"></a> [deployment\_type](#input\_deployment\_type) | Represents the kind of deployment. Currently two modes: ARM or Terraform | `string` | n/a | yes |
| <a name="input_dns_zone_rg"></a> [dns\_zone\_rg](#input\_dns\_zone\_rg) | The DNS zone resource group | `string` | n/a | yes |
| <a name="input_engine_secret"></a> [engine\_secret](#input\_engine\_secret) | n/a | `string` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | n/a | `string` | n/a | yes |
| <a name="input_eventhub_capacity"></a> [eventhub\_capacity](#input\_eventhub\_capacity) | n/a | `number` | n/a | yes |
| <a name="input_eventhub_private_dns_zonename"></a> [eventhub\_private\_dns\_zonename](#input\_eventhub\_private\_dns\_zonename) | n/a | `string` | n/a | yes |
| <a name="input_eventhub_public_network_access_enabled"></a> [eventhub\_public\_network\_access\_enabled](#input\_eventhub\_public\_network\_access\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_identifier_uri"></a> [identifier\_uri](#input\_identifier\_uri) | The platform identifier uri | `any` | n/a | yes |
| <a name="input_image_path"></a> [image\_path](#input\_image\_path) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_resource_group"></a> [kubernetes\_resource\_group](#input\_kubernetes\_resource\_group) | Existing Resource group which contain common platform resources | `string` | n/a | yes |
| <a name="input_kubernetes_tenant_namespace"></a> [kubernetes\_tenant\_namespace](#input\_kubernetes\_tenant\_namespace) | The kubernetes namespace to create | `string` | n/a | yes |
| <a name="input_kusto_auto_stop"></a> [kusto\_auto\_stop](#input\_kusto\_auto\_stop) | Specifies if the cluster could be automatically stopped | `bool` | n/a | yes |
| <a name="input_kusto_deploy"></a> [kusto\_deploy](#input\_kusto\_deploy) | Whether to create Azure digital explorer | `bool` | n/a | yes |
| <a name="input_kusto_disk_encryption_enabled"></a> [kusto\_disk\_encryption\_enabled](#input\_kusto\_disk\_encryption\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_kusto_double_encryption_enabled"></a> [kusto\_double\_encryption\_enabled](#input\_kusto\_double\_encryption\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_kusto_engine"></a> [kusto\_engine](#input\_kusto\_engine) | n/a | `string` | n/a | yes |
| <a name="input_kusto_instance_type"></a> [kusto\_instance\_type](#input\_kusto\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_kusto_privatedns_zonename"></a> [kusto\_privatedns\_zonename](#input\_kusto\_privatedns\_zonename) | n/a | `string` | n/a | yes |
| <a name="input_kusto_public_network_access_enabled"></a> [kusto\_public\_network\_access\_enabled](#input\_kusto\_public\_network\_access\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_kusto_purge_enabled"></a> [kusto\_purge\_enabled](#input\_kusto\_purge\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_kusto_streaming_ingestion_enabled"></a> [kusto\_streaming\_ingestion\_enabled](#input\_kusto\_streaming\_ingestion\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_kusto_trusted_external_tenants"></a> [kusto\_trusted\_external\_tenants](#input\_kusto\_trusted\_external\_tenants) | n/a | `list(string)` | n/a | yes |
| <a name="input_kustonr_instances"></a> [kustonr\_instances](#input\_kustonr\_instances) | n/a | `number` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location | `string` | n/a | yes |
| <a name="input_monitoring_enabled"></a> [monitoring\_enabled](#input\_monitoring\_enabled) | n/a | `string` | n/a | yes |
| <a name="input_monitoring_namespace"></a> [monitoring\_namespace](#input\_monitoring\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_network_client_secret"></a> [network\_client\_secret](#input\_network\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_network_dns_record"></a> [network\_dns\_record](#input\_network\_dns\_record) | The DNS zone name to create platform subdomain. Example: myplatform | `string` | n/a | yes |
| <a name="input_network_dns_record_create"></a> [network\_dns\_record\_create](#input\_network\_dns\_record\_create) | Create the DNS record | `bool` | n/a | yes |
| <a name="input_network_dns_zone_name"></a> [network\_dns\_zone\_name](#input\_network\_dns\_zone\_name) | The DNS zone name to create platform subdomain. Example: api.cosmotech.com | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The virtual network of the platform common resources | `string` | n/a | yes |
| <a name="input_network_resource_group"></a> [network\_resource\_group](#input\_network\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_network_sp_client_id"></a> [network\_sp\_client\_id](#input\_network\_sp\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_network_sp_object_id"></a> [network\_sp\_object\_id](#input\_network\_sp\_object\_id) | The object id of the network service principal | `string` | n/a | yes |
| <a name="input_network_subnet_name"></a> [network\_subnet\_name](#input\_network\_subnet\_name) | Name of the subnet | `string` | n/a | yes |
| <a name="input_network_tenant_address_prefix"></a> [network\_tenant\_address\_prefix](#input\_network\_tenant\_address\_prefix) | The Virtual Network IP range. Minimum /26 NetMaskLength | `string` | n/a | yes |
| <a name="input_network_tenant_subnet_address_prefix"></a> [network\_tenant\_subnet\_address\_prefix](#input\_network\_tenant\_subnet\_address\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | n/a | `string` | n/a | yes |
| <a name="input_owner_list"></a> [owner\_list](#input\_owner\_list) | List of mail addresses for App Registration owners | `list(string)` | n/a | yes |
| <a name="input_platform_id"></a> [platform\_id](#input\_platform\_id) | n/a | `string` | n/a | yes |
| <a name="input_platform_name"></a> [platform\_name](#input\_platform\_name) | The platform id for babylon v4 | `string` | n/a | yes |
| <a name="input_platform_object_id"></a> [platform\_object\_id](#input\_platform\_object\_id) | n/a | `string` | n/a | yes |
| <a name="input_platform_url"></a> [platform\_url](#input\_platform\_url) | The platform url | `any` | n/a | yes |
| <a name="input_postgresql_initdb_secret_name"></a> [postgresql\_initdb\_secret\_name](#input\_postgresql\_initdb\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_secret_name"></a> [postgresql\_secret\_name](#input\_postgresql\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name | `any` | n/a | yes |
| <a name="input_project_stage"></a> [project\_stage](#input\_project\_stage) | The Project stage | `string` | n/a | yes |
| <a name="input_queue_private_dns_zonename"></a> [queue\_private\_dns\_zonename](#input\_queue\_private\_dns\_zonename) | n/a | `string` | n/a | yes |
| <a name="input_redis_disk_size_gb"></a> [redis\_disk\_size\_gb](#input\_redis\_disk\_size\_gb) | n/a | `number` | n/a | yes |
| <a name="input_redis_disk_sku"></a> [redis\_disk\_sku](#input\_redis\_disk\_sku) | n/a | `string` | n/a | yes |
| <a name="input_redis_disk_tier"></a> [redis\_disk\_tier](#input\_redis\_disk\_tier) | n/a | `string` | n/a | yes |
| <a name="input_redis_managed_disk_name"></a> [redis\_managed\_disk\_name](#input\_redis\_managed\_disk\_name) | n/a | `string` | n/a | yes |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | n/a | `number` | n/a | yes |
| <a name="input_restish_sp_client_id"></a> [restish\_sp\_client\_id](#input\_restish\_sp\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_restish_sp_client_secret"></a> [restish\_sp\_client\_secret](#input\_restish\_sp\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_services_secrets_create"></a> [services\_secrets\_create](#input\_services\_secrets\_create) | n/a | `bool` | n/a | yes |
| <a name="input_servlet_context_path"></a> [servlet\_context\_path](#input\_servlet\_context\_path) | ex: /cosmotech-api | `string` | n/a | yes |
| <a name="input_storage_access_tier"></a> [storage\_access\_tier](#input\_storage\_access\_tier) | n/a | `string` | n/a | yes |
| <a name="input_storage_class_sku"></a> [storage\_class\_sku](#input\_storage\_class\_sku) | n/a | `string` | n/a | yes |
| <a name="input_storage_csm_ip"></a> [storage\_csm\_ip](#input\_storage\_csm\_ip) | n/a | `string` | n/a | yes |
| <a name="input_storage_default_action"></a> [storage\_default\_action](#input\_storage\_default\_action) | n/a | `string` | n/a | yes |
| <a name="input_storage_default_to_oauth_authentication"></a> [storage\_default\_to\_oauth\_authentication](#input\_storage\_default\_to\_oauth\_authentication) | n/a | `bool` | n/a | yes |
| <a name="input_storage_enable_https_traffic_only"></a> [storage\_enable\_https\_traffic\_only](#input\_storage\_enable\_https\_traffic\_only) | n/a | `bool` | n/a | yes |
| <a name="input_storage_kind"></a> [storage\_kind](#input\_storage\_kind) | n/a | `string` | n/a | yes |
| <a name="input_storage_min_tls_version"></a> [storage\_min\_tls\_version](#input\_storage\_min\_tls\_version) | n/a | `string` | n/a | yes |
| <a name="input_storage_public_network_access_enabled"></a> [storage\_public\_network\_access\_enabled](#input\_storage\_public\_network\_access\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_storage_shared_access_key_enabled"></a> [storage\_shared\_access\_key\_enabled](#input\_storage\_shared\_access\_key\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription id | `any` | n/a | yes |
| <a name="input_swagger_sp_client_id"></a> [swagger\_sp\_client\_id](#input\_swagger\_sp\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_table_private_dns_zonename"></a> [table\_private\_dns\_zonename](#input\_table\_private\_dns\_zonename) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to the resources | `map(string)` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The tenant id | `any` | n/a | yes |
| <a name="input_tenant_resource_group"></a> [tenant\_resource\_group](#input\_tenant\_resource\_group) | Resource group to create which will contain created Azure resources for this tenant | `string` | n/a | yes |
| <a name="input_tenant_sp_name"></a> [tenant\_sp\_name](#input\_tenant\_sp\_name) | The name of the platform on which we deploy the tenant | `string` | n/a | yes |
| <a name="input_tenant_sp_object_id"></a> [tenant\_sp\_object\_id](#input\_tenant\_sp\_object\_id) | The object id of the platform service principal | `string` | n/a | yes |
| <a name="input_tf_access_key"></a> [tf\_access\_key](#input\_tf\_access\_key) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_access\_key="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | n/a | yes |
| <a name="input_tf_blob_name_tenant"></a> [tf\_blob\_name\_tenant](#input\_tf\_blob\_name\_tenant) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_blob\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | n/a | yes |
| <a name="input_tf_container_name"></a> [tf\_container\_name](#input\_tf\_container\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_container\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | n/a | yes |
| <a name="input_tf_resource_group_name"></a> [tf\_resource\_group\_name](#input\_tf\_resource\_group\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_resource\_group\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | n/a | yes |
| <a name="input_tf_storage_account_name"></a> [tf\_storage\_account\_name](#input\_tf\_storage\_account\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_storage\_account\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | n/a | yes |
| <a name="input_tls_certificate_custom_certificate"></a> [tls\_certificate\_custom\_certificate](#input\_tls\_certificate\_custom\_certificate) | n/a | `string` | n/a | yes |
| <a name="input_tls_certificate_custom_key"></a> [tls\_certificate\_custom\_key](#input\_tls\_certificate\_custom\_key) | n/a | `string` | n/a | yes |
| <a name="input_tls_certificate_type"></a> [tls\_certificate\_type](#input\_tls\_certificate\_type) | n/a | `string` | n/a | yes |
| <a name="input_user_app_role"></a> [user\_app\_role](#input\_user\_app\_role) | App role for azuread\_application | <pre>list(object({<br>    description  = string<br>    display_name = string<br>    id           = string<br>    role_value   = string<br>  }))</pre> | n/a | yes |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | n/a | `string` | n/a | yes |
| <a name="input_vault_create_entries"></a> [vault\_create\_entries](#input\_vault\_create\_entries) | n/a | `bool` | n/a | yes |
| <a name="input_vault_namespace"></a> [vault\_namespace](#input\_vault\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_vault_secrets_operator_namespace"></a> [vault\_secrets\_operator\_namespace](#input\_vault\_secrets\_operator\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_vault_secrets_operator_vault_address"></a> [vault\_secrets\_operator\_vault\_address](#input\_vault\_secrets\_operator\_vault\_address) | n/a | `string` | n/a | yes |
| <a name="input_vault_sops_deploy"></a> [vault\_sops\_deploy](#input\_vault\_sops\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_vault_sops_namespace"></a> [vault\_sops\_namespace](#input\_vault\_sops\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_vault_token"></a> [vault\_token](#input\_vault\_token) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_out_acr_login_password"></a> [out\_acr\_login\_password](#output\_out\_acr\_login\_password) | n/a |
| <a name="output_out_acr_login_server"></a> [out\_acr\_login\_server](#output\_out\_acr\_login\_server) | n/a |
| <a name="output_out_acr_login_server_url"></a> [out\_acr\_login\_server\_url](#output\_out\_acr\_login\_server\_url) | n/a |
| <a name="output_out_acr_login_username"></a> [out\_acr\_login\_username](#output\_out\_acr\_login\_username) | n/a |
| <a name="output_out_adx_cluster_name"></a> [out\_adx\_cluster\_name](#output\_out\_adx\_cluster\_name) | n/a |
| <a name="output_out_adx_cluster_principal_id"></a> [out\_adx\_cluster\_principal\_id](#output\_out\_adx\_cluster\_principal\_id) | n/a |
| <a name="output_out_adx_cluster_uri"></a> [out\_adx\_cluster\_uri](#output\_out\_adx\_cluster\_uri) | n/a |
| <a name="output_out_api_cosmo_scope"></a> [out\_api\_cosmo\_scope](#output\_out\_api\_cosmo\_scope) | n/a |
| <a name="output_out_api_cosmo_url"></a> [out\_api\_cosmo\_url](#output\_out\_api\_cosmo\_url) | n/a |
| <a name="output_out_api_cosmo_version_path"></a> [out\_api\_cosmo\_version\_path](#output\_out\_api\_cosmo\_version\_path) | n/a |
| <a name="output_out_azure_resource_location"></a> [out\_azure\_resource\_location](#output\_out\_azure\_resource\_location) | n/a |
| <a name="output_out_azure_storage_account_key"></a> [out\_azure\_storage\_account\_key](#output\_out\_azure\_storage\_account\_key) | n/a |
| <a name="output_out_azure_storage_account_name"></a> [out\_azure\_storage\_account\_name](#output\_out\_azure\_storage\_account\_name) | n/a |
| <a name="output_out_babylon_sp_client_id"></a> [out\_babylon\_sp\_client\_id](#output\_out\_babylon\_sp\_client\_id) | n/a |
| <a name="output_out_babylon_sp_client_secret"></a> [out\_babylon\_sp\_client\_secret](#output\_out\_babylon\_sp\_client\_secret) | n/a |
| <a name="output_out_babylon_sp_name"></a> [out\_babylon\_sp\_name](#output\_out\_babylon\_sp\_name) | n/a |
| <a name="output_out_babylon_sp_object_id"></a> [out\_babylon\_sp\_object\_id](#output\_out\_babylon\_sp\_object\_id) | n/a |
| <a name="output_out_identifier_uri"></a> [out\_identifier\_uri](#output\_out\_identifier\_uri) | n/a |
| <a name="output_out_monitoring_namespace"></a> [out\_monitoring\_namespace](#output\_out\_monitoring\_namespace) | n/a |
| <a name="output_out_platform_sp_name"></a> [out\_platform\_sp\_name](#output\_out\_platform\_sp\_name) | n/a |
| <a name="output_out_restish_sp_client_id"></a> [out\_restish\_sp\_client\_id](#output\_out\_restish\_sp\_client\_id) | n/a |
| <a name="output_out_restish_sp_client_secret"></a> [out\_restish\_sp\_client\_secret](#output\_out\_restish\_sp\_client\_secret) | n/a |
| <a name="output_out_subscription_id"></a> [out\_subscription\_id](#output\_out\_subscription\_id) | n/a |
| <a name="output_out_swagger_sp_client_id"></a> [out\_swagger\_sp\_client\_id](#output\_out\_swagger\_sp\_client\_id) | n/a |
| <a name="output_out_swagger_sp_name"></a> [out\_swagger\_sp\_name](#output\_out\_swagger\_sp\_name) | n/a |
| <a name="output_out_tenant_resource_group"></a> [out\_tenant\_resource\_group](#output\_out\_tenant\_resource\_group) | n/a |
| <a name="output_out_tenant_sp_client_id"></a> [out\_tenant\_sp\_client\_id](#output\_out\_tenant\_sp\_client\_id) | n/a |
| <a name="output_out_tenant_sp_object_id"></a> [out\_tenant\_sp\_object\_id](#output\_out\_tenant\_sp\_object\_id) | n/a |
<!-- END_TF_DOCS -->