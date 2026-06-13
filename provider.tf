locals {
  idp_url = "${var.btp_idp}.accounts.ondemand.com"
}

terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "1.22.0"
    }
  }
}

# Configure the BTP Provider
provider "btp" {
  globalaccount = var.global_account
  idp           = local.idp_url
}
