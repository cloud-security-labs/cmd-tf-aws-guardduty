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

module "guardduty" {
  source = "../"

  master_account_id = var.master_account_id

  bucket_name             = local.workspace["bucket_name"]
  force_destroy           = local.workspace["force_destroy"]
  detector_enable         = local.workspace["detector_enable"]
  is_guardduty_master     = local.workspace["is_guardduty_master"]
  is_guardduty_member     = local.workspace["is_guardduty_member"]
  has_ipset               = local.workspace["has_ipset"]
  has_threatintelset      = local.workspace["has_threatintelset"]
  ipset_activate          = local.workspace["ipset_activate"]
  ipset_format            = local.workspace["ipset_format"]
  ipset_iplist            = local.workspace["ipset_iplist"]
  threatintelset_activate = local.workspace["threatintelset_activate"]
  threatintelset_format   = local.workspace["threatintelset_format"]
  threatintelset_iplist   = local.workspace["threatintelset_iplist"]
  member_list             = local.workspace["member_list"]

}

output "detector_id" {
  description = "The ID of the GuardDuty detector"
  value       = module.guardduty.detector_id
}
