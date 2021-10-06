<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-aci-monitoring-policy/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-aci-monitoring-policy/actions/workflows/test.yml)

# Terraform ACI Monitoring Policy Module

Manages ACI Monitoring Policy

Location in GUI:
`Fabric` » `Fabric Policies` » `Policies` » `Monitoring` » `Common Policy`

## Examples

```hcl
module "aci_monitoring_policy" {
  source  = "netascode/monitoring-policy/aci"
  version = ">= 0.0.3"

  snmp_trap_policies = ["SNMP1"]
  syslog_policies    = ["SYSLOG1"]
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >= 0.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | >= 0.2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_snmp_trap_policies"></a> [snmp\_trap\_policies](#input\_snmp\_trap\_policies) | List of SNMP trap policy names. | `list(string)` | `[]` | no |
| <a name="input_syslog_policies"></a> [syslog\_policies](#input\_syslog\_policies) | List of syslog policy names. | `list(string)` | `[]` | no |

## Outputs

No outputs.

## Resources

| Name | Type |
|------|------|
| [aci_rest.snmpRsDestGroup](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.snmpSrc](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.syslogRsDestGroup](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.syslogSrc](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
<!-- END_TF_DOCS -->