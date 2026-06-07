module "subaccount_build" {
  source            = "git::https://github.com/Friedmacher/tf_modules.git//modules/subaccount_build?ref=v1.0.0"
  project_name      = var.project_name
  subaccount_region = var.subaccount_region
  stage             = var.stage
  parent_id         = var.parent_id
}
