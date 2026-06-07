terraform {
  backend "s3" {
    bucket = "hcp-389b240f-de83-43b8-9716-51ac59f6ec63"
    region = "eu-central-1"
    key    = "moris/sbx/terraform.tfstate"
  }
}
