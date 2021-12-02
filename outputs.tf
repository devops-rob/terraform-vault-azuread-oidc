output "tenant_id" {
  value     = data.azuread_client_config.current.tenant_id
  sensitive = true
}

output "auth_method" {
  value = vault_jwt_auth_backend.azure_oidc.path
}

output "mount_accessor" {
  value = vault_jwt_auth_backend.azure_oidc.accessor
}