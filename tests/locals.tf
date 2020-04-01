locals {
  env = {
    master = {
      aws_profile             = "cmdlabtf-master"
      region                  = "ap-southeast-2"
      bucket_name             = "cmdlabtf-master-guardduty-storage"
      force_destroy           = true
      detector_enable         = true
      is_guardduty_master     = true
      has_ipset               = true
      has_threatintelset      = true
      ipset_activate          = true
      ipset_format            = "TXT"
      ipset_iplist            = ["1.1.1.1", "2.2.2.2", ]
      threatintelset_activate = true
      threatintelset_format   = "TXT"
      threatintelset_iplist   = ["3.3.3.3", "4.4.4.4", ]
      member_list = [{
        account_id   = var.member_account_id
        member_email = var.member_email_id
        invite       = true
      }]
    },
    sandpit = {
      aws_profile         = "cmdlabtf-sandpit"
      region              = "ap-southeast-2"
      detector_enable     = true
      is_guardduty_member = true
    }
  }
  workspace = local.env[terraform.workspace]
}