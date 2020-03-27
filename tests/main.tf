module "guardduty" {
  source = "../"

  master_account_id = var.master_account_id

  bucket_name             = "cmdlabtf-master-guardduty-storage"
  is_guardduty_master     = local.is_guardduty_master
  is_guardduty_member     = local.is_guardduty_member
  force_destroy           = true
  detector_enable         = true
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

}

output "detector_id" {
  description = "The ID of the GuardDuty detector"
  value       = module.guardduty.detector_id
}

# --- values from gitlab variables
variable "master_account_id" {
  type    = string
  default = ""
}

variable "member_account_id" {
  type    = string
  default = ""
}

variable "member_email_id" {
  type    = string
  default = ""
}