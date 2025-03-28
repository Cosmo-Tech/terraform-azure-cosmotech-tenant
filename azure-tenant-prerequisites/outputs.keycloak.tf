output "out_keycloak_name" {
  value = var.create_keycloak ? azuread_application.keycloak_app.0.display_name : ""
}

output "out_keycloak_sp_client_id" {
  value = var.create_keycloak ? azuread_application.keycloak_app.0.client_id : ""
}

output "out_keycloak_sp_client_secret" {
  value = var.create_keycloak ? azuread_application_password.keycloak_sapp_password.value : ""
}