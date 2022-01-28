module "aci_monitoring_policy" {
  source  = "netascode/monitoring-policy/aci"
  version = ">= 0.1.0"

  snmp_trap_policies = ["SNMP1"]
  syslog_policies    = ["SYSLOG1"]
}
