locals {
  user_namess = [
    "manuel.friedmacher@sap.com",
    "manuel.friedmacher@outlook.com"
  ]
}

module "sa_build" {
  source            = "git::https://github.com/Friedmacher/tf_modules.git//modules/sa_build?ref=v1.4.7"
  project_name      = var.project_name
  subaccount_region = var.subaccount_region
  stage             = var.stage
  parent_id         = var.parent_id
}

module "idp_trust" {
  source        = "git::https://github.com/Friedmacher/tf_modules.git//modules/idp_trust?ref=v1.4.7"
  subaccount_id = module.sa_build.subaccount_id
  btp_idp       = var.btp_idp
}

module "rc_assign" {
  source           = "git::https://github.com/Friedmacher/tf_modules.git//modules/rc_assign?ref=v1.4.7"
  subaccount_id    = module.sa_build.subaccount_id
  btp_platform_idp = var.btp_platform_idp
}

module "cf_enable" {
  source               = "git::https://github.com/Friedmacher/tf_modules.git//modules/cf_enable?ref=v1.4.7"
  subaccount_id        = module.sa_build.subaccount_id
  subaccount_subdomain = module.sa_build.subaccount_subdomain
  cf_region            = var.cf_region
}

module "cf_space_add" {
  source        = "git::https://github.com/Friedmacher/tf_modules.git//modules/cf_space_add?ref=v1.4.7"
  cf_space_name = lower(var.project_name)
  cf_org_id     = module.cf_enable.cf_org_id
}

module "cf_user_add" {
  source      = "git::https://github.com/Friedmacher/tf_modules.git//modules/cf_user_add?ref=v1.4.7"
  for_each    = toset(local.user_namess)
  user_name   = each.value
  idp_origin  = var.btp_platform_idp
  cf_org_id   = module.cf_enable.cf_org_id
  cf_space_id = module.cf_space_add.cf_space_id
}
