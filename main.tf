locals {
  git_url        = "git::https://github.com/Friedmacher/tf_modules.git//modules/"
  module_version = "v1.5.18"
  user_namess = [
    "manuel.friedmacher@sap.com"
  ]
}

module "sa_build" {
  source            = "${local.git_url}sa_build?ref=${local.module_version}"
  project_name      = var.project_name
  subaccount_region = var.subaccount_region
  stage             = var.stage
  parent_id         = var.parent_id
}

module "idp_trust" {
  source        = "${local.git_url}idp_trust?ref=${local.module_version}"
  subaccount_id = module.sa_build.subaccount_id
  btp_idp       = var.btp_idp
}

module "rc_assign" {
  source           = "${local.git_url}rc_assign?ref=${local.module_version}"
  subaccount_id    = module.sa_build.subaccount_id
  btp_platform_idp = var.btp_platform_idp
}

module "cf_enable" {
  source               = "${local.git_url}cf_enable?ref=${local.module_version}"
  subaccount_id        = module.sa_build.subaccount_id
  subaccount_subdomain = module.sa_build.subaccount_subdomain
  cf_region            = var.cf_region
}

module "cf_space_add" {
  source        = "${local.git_url}cf_space_add?ref=${local.module_version}"
  cf_space_name = lower(var.project_name)
  cf_org_id     = module.cf_enable.cf_org_id
}

module "cf_user_add" {
  source      = "${local.git_url}cf_user_add?ref=${local.module_version}"
  for_each    = toset(local.user_namess)
  user_name   = each.value
  idp_origin  = var.btp_platform_idp
  cf_org_id   = module.cf_enable.cf_org_id
  cf_space_id = module.cf_space_add.cf_space_id
}

module "abap_add" {
  source                      = "${local.git_url}abap_add?ref=${local.module_version}"
  subaccount_id               = module.sa_build.subaccount_id
  cf_space_id                 = module.cf_space_add.cf_space_id
  cf_region                   = var.cf_region
  abap_sid                    = var.abap_sid
  abap_admin_email            = var.abap_admin_email
  abap_is_development_allowed = var.abap_is_development_allowed
}
