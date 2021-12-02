variable "tenant_id" {
  type        = string
  description = "The tenant id for the Azure Active Directory organization."
}

variable "client_id" {
  type        = string
  description = "The client id for credentials to query the Azure APIs. Currently read permissions to query compute resources are required."
}

variable "client_secret" {
  type        = string
  description = "The client secret for credentials to query the Azure APIs."
}


variable "azure_role_name" {
  type        = string
  description = "The name of the role."
  default     = "default"
}

variable "allowed_redirect_uris" {
  type = list(string)
  default = [
    "http://localhost:8200/oidc/callback",
    "http://localhost:8250/ui/vault/auth/oidc/oidc/callback"
  ]
}

variable "vault_ui_redirect_address" {
  type        = string
  default     = "http://localhost:8200"
  description = "DNS hostname or IP address of Vault's UI."
}

variable "vault_cli_redirect_address" {
  type        = string
  default     = "http://localhost:8250"
  description = "DNS hostname or IP address of Vault's CLI."
}

variable "oidc_scopes" {
  type = list(string)
  default = [
    "https://graph.microsoft.com/.default"
  ]
}

variable "app_owners" {
  type        = list(string)
  default     = null
  description = "A set of object IDs of principals that will be granted ownership of the application."
}