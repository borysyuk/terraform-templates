terraform {
  required_providers {
    scalr = {
      source  = "registry.scalr.io/scalr/scalr"
      version = "2.4.0"
    }
  }
}

provider scalr {
  hostname = "mainiacp.ihor-master.testenv.scalr.dev"
  token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzY2Fscjp1c2VyIiwianRpIjoiYXQtdjBvbTc1b3Y5NmJoNDRnc2gifQ.vpM1u4f48X2Gr9FeOCu7hMW7PAwrXRiRvjTLO5Ncayg"
}

resource "scalr_workspace" "ws1" {
    name              = "aa2a"
    environment_id    = "env-svrcnchebt61e30"
}

resource "scalr_workspace" "ws2" {
    name              = "bb2b"
    environment_id    = "env-svrcnchebt61e30"
}

resource "scalr_workspace" "ccc" {
    name              = "cc2c"
    environment_id    = "env-svrcnchebt61e30"
}

resource "scalr_role" "writer" {
  name        = "Writer"
  account_id  = "acc-svrcncgh453bi8g"
  description = "Write access to all resources."

  permissions = [
    "*:update",
    "*:delete",
    "*:create"
  ]
}

resource "scalr_tag" "example" {
  name       = "tag-name2"
  account_id = "acc-svrcncgh453bi8g"
}

resource "scalr_environment" "test" {
  name                            = "test-env2"
  account_id                      = "acc-svrcncgh453bi8g"
}

resource "scalr_iam_team" "example" {
  name        = "dev2"
  description = "Developers"
  account_id  = "acc-svrcncgh453bi8g"
}

resource "scalr_run_schedule_rule" "example" {
  schedule      = "0 5 * * *"
  schedule_mode = "apply"
  workspace_id  = "ws-v0om7692t1es2dtsc"
}

resource "scalr_variable" "example1" {
  key          = "my_key_name"
  value        = "my_value_name"
  category     = "terraform"
  description  = "variable description"
  workspace_id = "ws-v0om7692t1es2dtsc"
}
