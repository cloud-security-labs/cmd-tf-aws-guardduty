provider "aws" {
  version                 = ">= 2.49.0"
  profile                 = local.workspace["aws_profile"]
  region                  = "ap-southeast-2"
  skip_metadata_api_check = true
}