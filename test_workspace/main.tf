terraform {
  required_providers {
    scalr = {
      source  = "registry.scalr.io/scalr/scalr"
      version = "1.1.0"
    }
  }
}

provider scalr {
  hostname = "mainiacp.ihor-20203.testenv.scalr.dev"
  token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ1c2VyIiwianRpIjoiYXQtdGsyNGhqY2U5cHRtN3VnIn0.U176hkJfV-Is4ZJNppwcObnemoogqxasu0RSMO4zj4o"
}

resource "scalr_workspace" "ws1" {
    name              = "aaa"
    environment_id    = "env-svrcnchebt61e30"
}

resource "scalr_workspace" "ws2" {
    name              = "bbb"
    environment_id    = "env-svrcnchebt61e30"
}

resource "scalr_workspace" "ccc" {
    name              = "ccc"
    environment_id    = "env-svrcnchebt61e30"
}
