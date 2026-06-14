module "sa_build" {
  source            = "git::https://github.com/Friedmacher/tf_modules.git//modules/sa_build?ref=v1.4.3"
  project_name      = var.project_name
  subaccount_region = var.subaccount_region
  stage             = var.stage
  parent_id         = var.parent_id
}

module "idp_trust" {
  source        = "git::https://github.com/Friedmacher/tf_modules.git//modules/idp_trust?ref=v1.4.3"
  subaccount_id = module.sa_build.subaccount_id
  btp_idp       = var.btp_idp
}

module "rc_assign" {
  source           = "git::https://github.com/Friedmacher/tf_modules.git//modules/rc_assign?ref=v1.4.3"
  subaccount_id    = module.sa_build.subaccount_id
  btp_platform_idp = var.btp_platform_idp
}

module "cf_enable" {
  source               = "git::https://github.com/Friedmacher/tf_modules.git//modules/cf_enable?ref=v1.4.3"
  subaccount_id        = module.sa_build.subaccount_id
  subaccount_subdomain = module.sa_build.subaccount_subdomain
  cf_region            = var.cf_region
}