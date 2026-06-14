variable "global_account" {
  description = "Global account where the subaccount shall be created in."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{1,40}$", var.global_account))
    error_message = "The global account must be 1–40 characters and contain only letters, digits or hyphens."
  }
}

variable "btp_idp" {
  description = "Host of the Identity Provider (IdP) to be trusted."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9.-]+$", var.btp_idp))
    error_message = "btp_idp must be a valid hostname."
  }
}

variable "btp_platform_idp" {
  description = "FQDN of the Platform Identity Provider."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9.-]+$", var.btp_platform_idp))
    error_message = "btp_platform_idp must be a valid FQDN."
  }
}

variable "project_name" {
  description = "Name of the project the subaccount belongs to."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9 _-]{1,40}$", var.project_name))
    error_message = "project_name must be 1–40 characters and contain only letters, digits, spaces, hyphens, or underscores."
  }
}

variable "stage" {
  description = "Stage of the subaccount to be created."
  type        = string
  validation {
    condition     = contains(["SBX", "DEV", "QAS", "PRD"], var.stage)
    error_message = "Stage must be one of SBX, DEV, QAS or PRD."
  }
}

variable "subaccount_region" {
  description = "Region where the subaccount shall be created in."
  type        = string
  validation {
    condition     = contains(["eu10", "eu11", "eu20", "eu22", "eu30", "eu31"], var.subaccount_region)
    error_message = "The region of the subaccount must be one of: eu10, eu11, eu20, eu22, eu30, eu31."
  }
}

variable "subaccount_subdomain" {
  description = "Subdomain of the subaccount to be trusted."
  type        = string
  validation {
    condition     = can(regex("^[a-zA-Z0-9.-]+$", var.subaccount_subdomain))
    error_message = "subaccount_subdomain must be a valid subdomain name."
  }
}

variable "parent_id" {
  description = "Parent ID for the subaccount."
  type        = string
  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.parent_id))
    error_message = "The parent ID must be a valid UUID."
  }
}

variable "cf_region" {
  description = "Region where the cloud foundry instance shall be created in."
  type        = string
  validation {
    condition     = contains(["cf-eu10-005"], var.cf_region)
    error_message = "The region of the subaccount must be one of: eu10-005."
  }
}
