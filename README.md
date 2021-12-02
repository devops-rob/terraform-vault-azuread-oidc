# Azure OIDC Auth Method for HashiCorp Vault

This terraform module enables and configures the OIDC auth method in HashiCorp Vault to use Azure Active Directory as an Identity Provider. In order to use this module, a Service Principal will need to be provisioned with `GroupMember.Read.All` API permissions in Microsoft Graph. Admin consent must be granted to the default directory for this permission.

The [Azure AD Application for Vault Terraform module]() is a great companion module as it provisions the application with the required permissions for OIDC to be correctly configured. If using the module, admin consent must still be granted for the default directory.

In order to map Azure AD groups to Vault groups that are tied to the OIDC auth method, the [Vault Azure AD Groups Module]() can also be used in conjunction with this module to complete the end-to-end configuration. The combination of these three modules allows organisations to use Azure AD as a central Identity provider to manage Identity and Access Management for Vault, which is a good step in the direction of Zero Trust.

## Example usage

```hcl
provider "vault" {
  address = "http://localhost:8200"
  token   = var.vault_token
}

provider "azuread" {}

variable "azure_client_id" {}
variable "azure_client_secret" {}
variable "azure_tenant_id" {}
variable "vault_token" {}

module "azure_auth_vault" {
  source        = "../"
  client_id     = var.azure_client_id
  client_secret = var.azure_client_secret
  tenant_id     = var.azure_tenant_id
}
```