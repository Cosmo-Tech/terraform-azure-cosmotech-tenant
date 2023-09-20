<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.38.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.54.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.9.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 3.4.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.38.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.54.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure-tenant-prerequisites"></a> [azure-tenant-prerequisites](#module\_azure-tenant-prerequisites) | ./azure-tenant-prerequisites | n/a |
| <a name="module_azure-tenant-resources"></a> [azure-tenant-resources](#module\_azure-tenant-resources) | ./azure-tenant-resources | n/a |
| <a name="module_platform-tenant-resources"></a> [platform-tenant-resources](#module\_platform-tenant-resources) | ./platform-tenant-resources | n/a |

## Resources

| Name | Type |
|------|------|
| [azuread_service_principal.platform](https://registry.terraform.io/providers/hashicorp/azuread/2.38.0/docs/data-sources/service_principal) | data source |
| [azurerm_dns_a_record.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/dns_a_record) | data source |
| [azurerm_kubernetes_cluster.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |
| [azurerm_public_ip.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/public_ip) | data source |
| [azurerm_resource_group.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_virtual_network.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_owner_list"></a> [owner\_list](#input\_owner\_list) | List of mail addresses for App Registration owners | `list(string)` | n/a | yes |
| <a name="input_platform_resource_group"></a> [platform\_resource\_group](#input\_platform\_resource\_group) | Existing Resource group which contain common platform resources | `string` | n/a | yes |
| <a name="input_platform_sp_name"></a> [platform\_sp\_name](#input\_platform\_sp\_name) | n/a | `string` | n/a | yes |
| <a name="input_platform_vnet"></a> [platform\_vnet](#input\_platform\_vnet) | n/a | `any` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name | `any` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription id | `any` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The tenant id | `any` | n/a | yes |
| <a name="input_tenant_resource_group"></a> [tenant\_resource\_group](#input\_tenant\_resource\_group) | Resource group to create which will contain created Azure resources for this tenant | `string` | n/a | yes |
| <a name="input_api_version_path"></a> [api\_version\_path](#input\_api\_version\_path) | The API version path | `string` | `"/v2/"` | no |
| <a name="input_audience"></a> [audience](#input\_audience) | The App Registration audience type | `string` | `"AzureADMultipleOrgs"` | no |
| <a name="input_chart_package_version"></a> [chart\_package\_version](#input\_chart\_package\_version) | n/a | `string` | `"3.0.0-test"` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client id | `string` | `""` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `""` | no |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | n/a | `string` | `"NA"` | no |
| <a name="input_create_adx"></a> [create\_adx](#input\_create\_adx) | n/a | `bool` | `true` | no |
| <a name="input_create_babylon"></a> [create\_babylon](#input\_create\_babylon) | Create the Azure Active Directory Application for Babylon | `bool` | `true` | no |
| <a name="input_create_backup"></a> [create\_backup](#input\_create\_backup) | n/a | `bool` | `true` | no |
| <a name="input_create_cosmosdb"></a> [create\_cosmosdb](#input\_create\_cosmosdb) | n/a | `bool` | `false` | no |
| <a name="input_create_dnsrecord"></a> [create\_dnsrecord](#input\_create\_dnsrecord) | Create the DNS record | `bool` | `true` | no |
| <a name="input_create_powerbi"></a> [create\_powerbi](#input\_create\_powerbi) | Create the Azure Active Directory Application for PowerBI | `bool` | `true` | no |
| <a name="input_create_publicip"></a> [create\_publicip](#input\_create\_publicip) | Create the public IP for the platform | `bool` | `true` | no |
| <a name="input_create_restish"></a> [create\_restish](#input\_create\_restish) | Create the Azure Active Directory Application for Restish | `bool` | `true` | no |
| <a name="input_create_secrets"></a> [create\_secrets](#input\_create\_secrets) | n/a | `bool` | `true` | no |
| <a name="input_create_webapp"></a> [create\_webapp](#input\_create\_webapp) | Create the Azure Active Directory Application for WebApp | `bool` | `true` | no |
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | The customer name | `string` | `"cosmotech"` | no |
| <a name="input_disk_size_gb"></a> [disk\_size\_gb](#input\_disk\_size\_gb) | n/a | `string` | `"64"` | no |
| <a name="input_disk_sku"></a> [disk\_sku](#input\_disk\_sku) | n/a | `string` | `"Premium_LRS"` | no |
| <a name="input_disk_tier"></a> [disk\_tier](#input\_disk\_tier) | n/a | `string` | `"P6"` | no |
| <a name="input_dns_record"></a> [dns\_record](#input\_dns\_record) | The DNS zone name to create platform subdomain. Example: myplatform | `string` | `""` | no |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | The DNS zone name to create platform subdomain. Example: api.cosmotech.com | `string` | `"api.cosmotech.com"` | no |
| <a name="input_dns_zone_rg"></a> [dns\_zone\_rg](#input\_dns\_zone\_rg) | The DNS zone resource group | `string` | `"phoenix"` | no |
| <a name="input_identifier_uri"></a> [identifier\_uri](#input\_identifier\_uri) | The platform identifier uri | `string` | `""` | no |
| <a name="input_image_path"></a> [image\_path](#input\_image\_path) | n/a | `string` | `"./cosmotech.png"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `string` | `"1.25.6"` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location | `string` | `"West Europe"` | no |
| <a name="input_managed_disk_name"></a> [managed\_disk\_name](#input\_managed\_disk\_name) | n/a | `string` | `""` | no |
| <a name="input_monitoring_namespace"></a> [monitoring\_namespace](#input\_monitoring\_namespace) | n/a | `string` | `"cosmotech-monitoring"` | no |
| <a name="input_platform_url"></a> [platform\_url](#input\_platform\_url) | The platform url | `string` | `""` | no |
| <a name="input_project_stage"></a> [project\_stage](#input\_project\_stage) | The platform stage | `string` | `"Dev"` | no |
| <a name="input_tls_secret_name"></a> [tls\_secret\_name](#input\_tls\_secret\_name) | n/a | `string` | `"letsencrypt-prod"` | no |
| <a name="input_user_app_role"></a> [user\_app\_role](#input\_user\_app\_role) | App role for azuread\_application | <pre>list(object({<br>    description  = string<br>    display_name = string<br>    id           = string<br>    role_value   = string<br>  }))</pre> | <pre>[<br>  {<br>    "description": "Workspace Writer",<br>    "display_name": "Workspace Writer",<br>    "id": "3f7ba86c-9940-43c8-a54d-0bfb706da136",<br>    "role_value": "Workspace.Writer"<br>  },<br>  {<br>    "description": "Workspace Reader",<br>    "display_name": "Workspace Reader",<br>    "id": "73ce2073-d918-4fe1-bc24-a4e69db07db8",<br>    "role_value": "Workspace.Reader"<br>  },<br>  {<br>    "description": "Solution Writer",<br>    "display_name": "Solution Writer",<br>    "id": "4f6e62a3-7f0a-4396-9620-ab465cd6577b",<br>    "role_value": "Solution.Writer"<br>  },<br>  {<br>    "description": "Solution Reader",<br>    "display_name": "Solution Reader",<br>    "id": "cf1a8625-38d9-417b-a5b9-a27c0014e740",<br>    "role_value": "Solution.Reader"<br>  },<br>  {<br>    "description": "ScenarioRun Writer",<br>    "display_name": "ScenarioRun Writer",<br>    "id": "ca8a2a19-3e09-48cc-976b-85ec9de4f68a",<br>    "role_value": "ScenarioRun.Writer"<br>  },<br>  {<br>    "description": "ScenarioRun Reader",<br>    "display_name": "ScenarioRun Reader",<br>    "id": "bdc8fe2a-73a8-477d-9efa-d8a37a4eb0f7",<br>    "role_value": "ScenarioRun.Reader"<br>  },<br>  {<br>    "description": "Scenario Writer",<br>    "display_name": "Scenario Writer",<br>    "id": "8fb9d03e-c46d-4003-a2a6-34d8b506e4e7",<br>    "role_value": "Scenario.Writer"<br>  },<br>  {<br>    "description": "Scenario Reader",<br>    "display_name": "Scenario Reader",<br>    "id": "e07dab65-4200-4502-8e36-79ca687320d9",<br>    "role_value": "Scenario.Reader"<br>  },<br>  {<br>    "description": "Organization Writer",<br>    "display_name": "Organization Writer",<br>    "id": "89d74995-095c-442f-bfda-06a77d3dbaa4",<br>    "role_value": "Organization.Writer"<br>  },<br>  {<br>    "description": "Organization Reader",<br>    "display_name": "Organization Reader",<br>    "id": "96213509-202a-497c-9f60-53c5f85268ec",<br>    "role_value": "Organization.Reader"<br>  },<br>  {<br>    "description": "Dataset Writer",<br>    "display_name": "Dataset Writer",<br>    "id": "c6e5d483-ec2c-4710-bf0c-78b0fda611dc",<br>    "role_value": "Dataset.Writer"<br>  },<br>  {<br>    "description": "Dataset Reader",<br>    "display_name": "Dataset Reader",<br>    "id": "454dc3f5-3012-45b3-bad6-975dae94338c",<br>    "role_value": "Dataset.Reader"<br>  },<br>  {<br>    "description": "Ability to write connectors",<br>    "display_name": "Connector Writer",<br>    "id": "e150953f-4835-4502-b95e-81d9ce97f591",<br>    "role_value": "Connector.Writer"<br>  },<br>  {<br>    "description": "Organization Viewer",<br>    "display_name": "Organization Viewer",<br>    "id": "ec5fdd3c-4df0-4c2f-bdad-0495a49f6e90",<br>    "role_value": "Organization.Viewer"<br>  },<br>  {<br>    "description": "Organization User",<br>    "display_name": "Organization User",<br>    "id": "bb9ffb73-997e-4320-8625-cfe45469aa3c",<br>    "role_value": "Organization.User"<br>  },<br>  {<br>    "description": "Organization Modeler",<br>    "display_name": "Organization Modeler",<br>    "id": "adcdb0a1-1588-4d2b-8657-364e544ac7e1",<br>    "role_value": "Organization.Modeler"<br>  },<br>  {<br>    "description": "Organization Administrator",<br>    "display_name": "Organization Admin",<br>    "id": "04b96a76-d77e-4a9d-967f-c55c857c478c",<br>    "role_value": "Organization.Admin"<br>  },<br>  {<br>    "description": "Organization Collaborator",<br>    "display_name": "Organization Collaborator",<br>    "id": "6f5ec4e3-1f2d-4502-837e-5d9754ea8acb",<br>    "role_value": "Organization.Collaborator"<br>  },<br>  {<br>    "description": "Ability to develop connectors",<br>    "display_name": "Connector Developer",<br>    "id": "428ab58e-ab61-4621-907c-d7908be72df7",<br>    "role_value": "Connector.Developer"<br>  },<br>  {<br>    "description": "Ability to read connectors",<br>    "display_name": "Connector Reader",<br>    "id": "2cd74037-3ccd-4ab7-929d-4afce87be2e4",<br>    "role_value": "Connector.Reader"<br>  },<br>  {<br>    "description": "Platform Administrator",<br>    "display_name": "Platform Admin",<br>    "id": "bb49d61f-8b6a-4a19-b5bd-06a29d6b8e60",<br>    "role_value": "Platform.Admin"<br>  }<br>]</pre> | no |
| <a name="input_vnet_iprange"></a> [vnet\_iprange](#input\_vnet\_iprange) | The Virtual Network IP range. Minimum /26 NetMaskLength | `string` | `""` | no |
| <a name="input_webapp_url"></a> [webapp\_url](#input\_webapp\_url) | The Web Application URL | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_managed_disk_id"></a> [managed\_disk\_id](#output\_managed\_disk\_id) | n/a |
| <a name="output_out_acr_login_password"></a> [out\_acr\_login\_password](#output\_out\_acr\_login\_password) | n/a |
| <a name="output_out_acr_login_server"></a> [out\_acr\_login\_server](#output\_out\_acr\_login\_server) | n/a |
| <a name="output_out_acr_login_username"></a> [out\_acr\_login\_username](#output\_out\_acr\_login\_username) | n/a |
| <a name="output_out_adx_ingestion_uri"></a> [out\_adx\_ingestion\_uri](#output\_out\_adx\_ingestion\_uri) | n/a |
| <a name="output_out_adx_uri"></a> [out\_adx\_uri](#output\_out\_adx\_uri) | n/a |
| <a name="output_out_cosmos_key"></a> [out\_cosmos\_key](#output\_out\_cosmos\_key) | n/a |
| <a name="output_out_cosmos_uri"></a> [out\_cosmos\_uri](#output\_out\_cosmos\_uri) | n/a |
| <a name="output_out_eventbus_uri"></a> [out\_eventbus\_uri](#output\_out\_eventbus\_uri) | n/a |
| <a name="output_out_ip_resource_group"></a> [out\_ip\_resource\_group](#output\_out\_ip\_resource\_group) | n/a |
| <a name="output_out_network_adt_password"></a> [out\_network\_adt\_password](#output\_out\_network\_adt\_password) | n/a |
| <a name="output_out_networkadt_clientid"></a> [out\_networkadt\_clientid](#output\_out\_networkadt\_clientid) | n/a |
| <a name="output_out_platform_sp_client_id"></a> [out\_platform\_sp\_client\_id](#output\_out\_platform\_sp\_client\_id) | n/a |
| <a name="output_out_platform_sp_client_secret"></a> [out\_platform\_sp\_client\_secret](#output\_out\_platform\_sp\_client\_secret) | n/a |
| <a name="output_out_storage_account_key"></a> [out\_storage\_account\_key](#output\_out\_storage\_account\_key) | n/a |
| <a name="output_out_storage_account_name"></a> [out\_storage\_account\_name](#output\_out\_storage\_account\_name) | n/a |
| <a name="output_out_subnet_id"></a> [out\_subnet\_id](#output\_out\_subnet\_id) | n/a |
<!-- END_TF_DOCS -->