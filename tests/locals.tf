locals {
  env = {
    master = {
      aws_profile             = "cmdlabtf-master"
      region                  = "ap-southeast-2"
      bucket_name             = "cmdlabtf-master-guardduty-storage"
      force_destroy           = true
      detector_enable         = true
      is_guardduty_master     = true
      is_guardduty_member     = false
      ipset_format            = "TXT"
      ipset_iplist            = ["1.1.1.1", "2.2.2.2", ]
      threatintelset_format   = "TXT"
      threatintelset_iplist   = ["3.3.3.3", "4.4.4.4", ]
      member_list = [{
        account_id   = var.member_account_id
        member_email = var.member_email_id
        invite       = true
      }]
    },
    sandpit = {
      aws_profile             = "cmdlabtf-sandpit"
      region                  = "ap-southeast-2"
      bucket_name             = ""
      force_destroy           = true
      detector_enable         = true
      is_guardduty_master     = false
      is_guardduty_member     = true
      ipset_format            = ""
      ipset_iplist            = []
      threatintelset_format   = ""
      threatintelset_iplist   = []
      member_list             = []
    }
  }
  workspace = local.env[terraform.workspace]
}