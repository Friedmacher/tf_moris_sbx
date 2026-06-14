terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "1.22.0"
    }
    cloudfoundry = {
      source  = "cloudfoundry/cloudfoundry"
      version = "1.15.0"
    }
  }
}

# Configure the BTP Provider
provider "btp" {
  globalaccount = var.global_account
  idp           = var.btp_idp
}

# Configure the Cloud Foundry Provider
provider "cloudfoundry" {
  api_url = var.cf.api_url
}
