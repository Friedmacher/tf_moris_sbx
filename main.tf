module "subaccount_build" {
  source            = "git::https://github.com/Friedmacher/tf_modules.git//modules/subaccount_build?ref=v1.1.6"
  project_name      = var.project_name
  subaccount_region = var.subaccount_region
  stage             = var.stage
  parent_id         = var.parent_id
}

module "trust_idp" {
  source        = "git::https://github.com/Friedmacher/tf_modules.git//modules/trust_idp?ref=v1.1.6"
  subaccount_id = module.subaccount_build.subaccount_id
  btp_idp       = var.btp_idp
}

