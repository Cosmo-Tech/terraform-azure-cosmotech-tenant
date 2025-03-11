output "out_copilot_bot_name" {
  description = "The name of the Azure Bot."
  value       = azurerm_bot_channels_registration.bot.name
}

output "out_copilot_bot_endpoint" {
  description = "The endpoint URL of the Azure Bot."
  value       = azurerm_bot_channels_registration.bot.endpoint
}

output "out_copilot_microsoft_app_id" {
  description = "The Microsoft App ID associated with the Azure Bot."
  value       = azurerm_bot_channels_registration.bot.microsoft_app_id
}

output "out_copilot_openai_endpoint" {
  description = "The endpoint URL for Azure Open AI, constructed from the custom subdomain."
  value       = "https://${azurerm_cognitive_account.openai.custom_subdomain_name}.openai.azure.com/"
}

output "out_copilot_search_endpoint" {
  description = "The endpoint URL for the Azure Search service."
  value       = "https://${azurerm_search_service.search_service.name}.search.windows.net"
}

output "out_copilot_search_index_name" {
  description = "The name of the Azure Search index."
  value       = azurerm_search_index.ai_search_index.name
}

output "out_copilot_function_app_url" {
  description = "The URL of the Azure Function App, which processes the documents."
  value       = "https://${azurerm_linux_function_app.function_app.default_site_hostname}"
}

output "out_copilot_web_app_url" {
  description = "The URL of the Azure Web App hosting the chatbot."
  value       = var.deploy_test_web_app ? "https://${azurerm_linux_web_app.web_app[0].default_host_name}" : "Test Web App not deployed"
}

output "out_copilot_ada_deployment_name" {
  description = "The name of the ARM deployment for the Ada model."
  value       = azurerm_template_deployment.ada_deployment.name
}

output "out_copilot_gpt4_deployment_name" {
  description = "The name of the ARM deployment for the GPT-4 model."
  value       = azurerm_template_deployment.gpt4_deployment.name
}

output "out_copilot_bot_directline_secret" {
  description = "The DirectLine secret for the Azure Bot."
  value       = azurerm_bot_channel_directline.directline.site[0].key
  sensitive   = true
}

output "out_copilot_openai_api_key" {
  description = "The API key for Azure OpenAI."
  value       = azurerm_cognitive_account.openai.primary_access_key
  sensitive   = true
}

output "out_copilot_search_api_key" {
  description = "The API key for Azure Search service."
  value       = azurerm_search_service.search_service.primary_key
  sensitive   = true
}
