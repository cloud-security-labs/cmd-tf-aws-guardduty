
## Examples

#### GuardDuty Master

A GuardDuty instance configured as a Master that invites a list of members:

```tf
variable "member_account_id" {}
variable "member_email_id" {}

module "guardduty" {
  source = "github.com/cmdlabs/cmd-tf-aws-guardduty?ref=0.3.0"

  bucket_name = "s3-audit-someclient-guardduty"

  detector_enable     = true
  is_guardduty_master = true
  has_ipset           = true
  has_threatintelset  = true

  ipset_activate = true
  ipset_format   = "TXT"
  ipset_iplist = [
    "1.1.1.1",
    "2.2.2.2",
  ]

  threatintelset_activate = true
  threatintelset_format   = "TXT"
  threatintelset_iplist = [
    "3.3.3.3",
    "4.4.4.4",
  ]

  member_list = [{
    account_id   = var.member_account_id
    member_email = var.member_email_id
    invite       = true
  }]
}
```

To apply that:

```text
▶ TF_VAR_member_account_id=xxxxxxxxxxxx TF_VAR_member_email_id=alex@somedomain.com terraform apply
```

#### GuardDuty Member

Then a GuardDuty Member account can accept the invitation from the Master account using:

```tf
variable "master_account_id" {}

module "guardduty" {
  source = "github.com/cmdlabs/cmd-tf-aws-guardduty?ref=0.3.0"
  detector_enable     = true
  is_guardduty_member = true
  master_account_id   = var.master_account_id
}
```

To apply that:

```text
▶ TF_VAR_master_account_id=xxxxxxxxxxxx terraform apply
```