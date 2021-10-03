module "aci_monitoring_policy" {
  source  = "netascode/monitoring-policy/aci"
  version = ">= 0.0.2"

  snmp_trap_policy = "SNMP1"
  syslog_policy    = "SYSLOG1"
}
