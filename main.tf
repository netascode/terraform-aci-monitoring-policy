resource "aci_rest" "snmpSrc" {
  for_each   = toset(var.snmp_trap_policies)
  dn         = "uni/fabric/moncommon/snmpsrc-${each.value}"
  class_name = "snmpSrc"
  content = {
    name = each.value
  }
}

resource "aci_rest" "snmpRsDestGroup" {
  for_each   = toset(var.snmp_trap_policies)
  dn         = "${aci_rest.snmpSrc[each.value].dn}/rsdestGroup"
  class_name = "snmpRsDestGroup"
  content = {
    tDn = "uni/fabric/snmpgroup-${each.value}"
  }
}

resource "aci_rest" "syslogSrc" {
  for_each   = toset(var.syslog_policies)
  dn         = "uni/fabric/moncommon/slsrc-${each.value}"
  class_name = "syslogSrc"
  content = {
    name = each.value
    incl = "audit,events,faults"
  }
}

resource "aci_rest" "syslogRsDestGroup" {
  for_each   = toset(var.syslog_policies)
  dn         = "${aci_rest.syslogSrc[each.value].dn}/rsdestGroup"
  class_name = "syslogRsDestGroup"
  content = {
    tDn = "uni/fabric/slgroup-${each.value}"
  }
}
