locals {
  env = {
    master = {
      aws_profile = "cmdlabtf-master"
      region      = "ap-southeast-2"

    }
    sandpit = {
      aws_profile = "cmdlabtf-sandpit"
      region      = "ap-southeast-2"

    }

  }
  workspace = local.env[terraform.workspace]
}

locals {
  is_guardduty_master = data.aws_caller_identity.current.account_id == var.master_account_id ? true : false
  is_guardduty_member = data.aws_caller_identity.current.account_id == var.master_account_id ? false : true
}