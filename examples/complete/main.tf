module "aci_monitoring_policy" {
  source = "netascode/monitoring-policy/aci"

  snmp_policy_name   = "SNMP1"
  syslog_policy_name = "SYSLOG1"
}
