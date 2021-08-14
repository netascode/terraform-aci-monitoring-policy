resource "aci_rest" "snmpSrc" {
  count      = var.snmp_policy_name != "" ? 1 : 0
  dn         = "uni/fabric/moncommon/snmpsrc-${var.snmp_policy_name}"
  class_name = "snmpSrc"
  content = {
    name = var.snmp_policy_name
  }
}

resource "aci_rest" "snmpRsDestGroup" {
  count      = var.snmp_policy_name != "" ? 1 : 0
  dn         = "${aci_rest.snmpSrc[0].id}/rsdestGroup"
  class_name = "snmpRsDestGroup"
  content = {
    tDn = "uni/fabric/snmpgroup-${var.snmp_policy_name}"
  }
}

resource "aci_rest" "syslogSrc" {
  count      = var.syslog_policy_name != "" ? 1 : 0
  dn         = "uni/fabric/moncommon/slsrc-${var.syslog_policy_name}"
  class_name = "syslogSrc"
  content = {
    name = var.syslog_policy_name
    incl = "audit,events,faults"
  }
}

resource "aci_rest" "syslogRsDestGroup" {
  count      = var.syslog_policy_name != "" ? 1 : 0
  dn         = "${aci_rest.syslogSrc[0].id}/rsdestGroup"
  class_name = "syslogRsDestGroup"
  content = {
    tDn = "uni/fabric/slgroup-${var.syslog_policy_name}"
  }
}
