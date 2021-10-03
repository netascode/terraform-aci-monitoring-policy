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
  source  = "netascode/monitoring-policy/aci"
  version = ">= 0.0.2"

  snmp_trap_policy = "SNMP1"
  syslog_policy    = "SYSLOG1"
}

```
<!-- END_TF_DOCS -->