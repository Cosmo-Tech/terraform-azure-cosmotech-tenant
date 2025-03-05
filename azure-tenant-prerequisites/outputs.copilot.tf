output "out_bot_application_id" {
  description = "The Application ID (Client ID) of the Bot App Registration"
  value       = var.create_copilot ? azuread_application.bot[0].client_id : null
  sensitive   = false
}

output "out_bot_application_object_id" {
  description = "The object ID of the Bot App Registration"
  value       = var.create_copilot ? azuread_application.bot[0].object_id : null
  sensitive   = false
}

output "out_bot_service_principal_id" {
  description = "The service principal ID of the Bot App Registration"
  value       = var.create_copilot ? azuread_service_principal.bot[0].id : null
  sensitive   = false
}

output "out_bot_service_principal_object_id" {
  description = "The object ID of the Bot service principal"
  value       = var.create_copilot ? azuread_service_principal.bot[0].object_id : null
  sensitive   = false
}

output "out_bot_client_secret" {
  description = "The client secret for the Bot App Registration"
  value       = var.create_copilot ? azuread_application_password.bot_password[0].value : null
  sensitive   = true
}

output "out_bot_app_credentials" {
  description = "Combined credentials for the Bot App Registration (client_id and client_secret)"
  value = var.create_copilot ? {
    client_id     = azuread_application.bot[0].client_id
    client_secret = azuread_application_password.bot_password[0].value
  } : {
    client_id     = null
    client_secret = null
  }
  sensitive = true
}