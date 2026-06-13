terraform {
  backend "s3" {
    bucket = "hcp-f78f6c24-a5d6-4752-a30c-5a4ba6978bdb"
    region = "eu-central-1"
    key    = "moris/sbx/terraform.tfstate"
  }
}
