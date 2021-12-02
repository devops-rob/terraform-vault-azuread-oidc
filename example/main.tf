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