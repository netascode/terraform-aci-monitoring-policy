resource "aci_rest" "snmpSrc" {
  count      = var.snmp_trap_policy != "" ? 1 : 0
  dn         = "uni/fabric/moncommon/snmpsrc-${var.snmp_trap_policy}"
  class_name = "snmpSrc"
  content = {
    name = var.snmp_trap_policy
  }
}

resource "aci_rest" "snmpRsDestGroup" {
  count      = var.snmp_trap_policy != "" ? 1 : 0
  dn         = "${aci_rest.snmpSrc[0].id}/rsdestGroup"
  class_name = "snmpRsDestGroup"
  content = {
    tDn = "uni/fabric/snmpgroup-${var.snmp_trap_policy}"
  }
}

resource "aci_rest" "syslogSrc" {
  count      = var.syslog_policy != "" ? 1 : 0
  dn         = "uni/fabric/moncommon/slsrc-${var.syslog_policy}"
  class_name = "syslogSrc"
  content = {
    name = var.syslog_policy
    incl = "audit,events,faults"
  }
}

resource "aci_rest" "syslogRsDestGroup" {
  count      = var.syslog_policy != "" ? 1 : 0
  dn         = "${aci_rest.syslogSrc[0].id}/rsdestGroup"
  class_name = "syslogRsDestGroup"
  content = {
    tDn = "uni/fabric/slgroup-${var.syslog_policy}"
  }
}
