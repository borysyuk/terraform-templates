terraform {
  required_providers {
    scalr = {
      source  = "registry.scalr.io/scalr/scalr"
      version = "1.1.0"
    }
  }
}

provider scalr {
  hostname = "mainiacp.ihor-master.testenv.scalr.dev"
  token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzY2Fscjp1c2VyIiwianRpIjoiYXQtdjBvbTc1b3Y5NmJoNDRnc2gifQ.vpM1u4f48X2Gr9FeOCu7hMW7PAwrXRiRvjTLO5Ncayg"
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
  name       = "tag-name"
  account_id = "acc-svrcncgh453bi8g"
}

resource "scalr_environment" "test" {
  name                            = "test-env"
  account_id                      = "acc-svrcncgh453bi8g"
}

resource "scalr_iam_team" "example" {
  name        = "dev"
  description = "Developers"
  account_id  = "acc-svrcncgh453bi8g"
}

resource "scalr_webhook" "example1" {
  name         = "my-webhook-1"
  enabled      = false
  url          = "https://example.com"
  secret_key   = "my-secret-key1my-Secret-key2my-secret-Key3my-secret-key4My-secret-key5"
  timeout      = 15
  max_attempts = 3
  events       = ["run:completed", "run:errored"]
  environments = ["env-svrcnchebt61e30"]
}
