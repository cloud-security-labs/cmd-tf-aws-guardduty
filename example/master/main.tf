module "guardduty" {
  source = "github.com/cmdlabs/cmd-tf-aws-guardduty?ref=0.3.0"

  bucket_name = "s3-audit-example-user-guardduty"

  detector_enable     = true
  is_guardduty_master = true

  ipset_format = "TXT"
  ipset_iplist = [
    "1.1.1.1",
    "2.2.2.2",
  ]

  threatintelset_format = "TXT"
  threatintelset_iplist = [
    "3.3.3.3",
    "4.4.4.4",
  ]

  member_list = [{
    account_id   = 123456789012
    member_email = "joe.blogs@example.com"
    invite       = true
  }]
}