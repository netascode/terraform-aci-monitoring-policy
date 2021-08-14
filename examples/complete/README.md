<!-- BEGIN_TF_DOCS -->
# Monitoring Policy Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

```hcl
module "aci_monitoring_policy" {
  source = "netascode/monitoring-policy/aci"

  snmp_policy_name   = "SNMP1"
  syslog_policy_name = "SYSLOG1"
}

```
<!-- END_TF_DOCS -->