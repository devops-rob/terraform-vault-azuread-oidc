output "tenant_id" {
  value       = data.azuread_client_config.current.tenant_id
  sensitive   = true
  description = "Tenant ID of Azure subscription."
}

output "auth_method" {
  value       = vault_jwt_auth_backend.azure_oidc.path
  description = "Path that the auth method is mounted at."
}

output "mount_accessor" {
  value       = vault_jwt_auth_backend.azure_oidc.accessor
  description = "Mount accessor ID for auth method."
}