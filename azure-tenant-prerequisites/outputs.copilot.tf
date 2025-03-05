output "out_bot_application_id" {
  description = "The Application ID (Client ID) of the Bot App Registration"
  value       = azuread_application.bot.client_id
  sensitive   = false
}

output "out_bot_application_object_id" {
  description = "The object ID of the Bot App Registration"
  value       = azuread_application.bot.object_id
  sensitive   = false
}

output "out_bot_service_principal_id" {
  description = "The service principal ID of the Bot App Registration"
  value       = azuread_service_principal.bot.id
  sensitive   = false
}

output "out_bot_service_principal_object_id" {
  description = "The object ID of the Bot service principal"
  value       = azuread_service_principal.bot.object_id
  sensitive   = false
}

output "out_bot_client_secret" {
  description = "The client secret for the Bot App Registration"
  value       = azuread_application_password.bot_password.value
  sensitive   = true
}

output "out_bot_app_credentials" {
  description = "Combined credentials for the Bot App Registration (client_id and client_secret)"
  value = {
    client_id     = azuread_application.bot.client_id
    client_secret = azuread_application_password.bot_password.value
  }
  sensitive = true
}