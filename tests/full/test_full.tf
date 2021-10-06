terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  snmp_trap_policies = ["SNMP1"]
  syslog_policies    = ["SYSLOG1"]
}

data "aci_rest" "snmpSrc" {
  dn = "uni/fabric/moncommon/snmpsrc-SNMP1"

  depends_on = [module.main]
}

resource "test_assertions" "snmpSrc" {
  component = "snmpSrc"

  equal "name" {
    description = "name"
    got         = data.aci_rest.snmpSrc.content.name
    want        = "SNMP1"
  }
}

data "aci_rest" "snmpRsDestGroup" {
  dn = "${data.aci_rest.snmpSrc.id}/rsdestGroup"

  depends_on = [module.main]
}

resource "test_assertions" "snmpRsDestGroup" {
  component = "snmpRsDestGroup"

  equal "tDn" {
    description = "tDn"
    got         = data.aci_rest.snmpRsDestGroup.content.tDn
    want        = "uni/fabric/snmpgroup-SNMP1"
  }
}

data "aci_rest" "syslogSrc" {
  dn = "uni/fabric/moncommon/slsrc-SYSLOG1"

  depends_on = [module.main]
}

resource "test_assertions" "syslogSrc" {
  component = "syslogSrc"

  equal "name" {
    description = "name"
    got         = data.aci_rest.syslogSrc.content.name
    want        = "SYSLOG1"
  }

  equal "incl" {
    description = "incl"
    got         = data.aci_rest.syslogSrc.content.incl
    want        = "audit,events,faults"
  }
}

data "aci_rest" "syslogRsDestGroup" {
  dn = "${data.aci_rest.syslogSrc.id}/rsdestGroup"

  depends_on = [module.main]
}

resource "test_assertions" "syslogRsDestGroup" {
  component = "syslogRsDestGroup"

  equal "tDn" {
    description = "tDn"
    got         = data.aci_rest.syslogRsDestGroup.content.tDn
    want        = "uni/fabric/slgroup-SYSLOG1"
  }
}
