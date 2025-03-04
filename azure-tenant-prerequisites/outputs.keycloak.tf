output "out_keycloak_name" {
  value = azuread_application.keycloak_app.display_name
}

output "out_keycloak_sp_client_id" {
  value = azuread_application.keycloak_app.client_id
}