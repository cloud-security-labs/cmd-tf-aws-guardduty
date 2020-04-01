module "guardduty" {
  source              = "github.com/cmdlabs/cmd-tf-aws-guardduty?ref=0.3.0"
  detector_enable     = true
  is_guardduty_member = true
  master_account_id   = 234567890121
}