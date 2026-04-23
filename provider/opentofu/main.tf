terraform {
  required_providers {
    scalr = {
      source = "scalr/scalr"
    }
  }
}

variable "name" {
  type = string
}

data "scalr_environment" "playground" {
  name = var.name
}

resource "scalr_workspace" "development" {
  name = "development-moved"
  environment_id = data.scalr_environment.playground.id
}

resource "scalr_workspace" "forget" {
  name = "to-forget"
  environment_id = data.scalr_environment.playground.id
}

resource "scalr_workspace" "import" {
  environment_id = data.scalr_environment.playground.id
  name = "test-20"
}

moved {
  from = scalr_workspace.dev
  to   = scalr_workspace.development
}

import {
  id = "ws-v0p6f6158qicie1t6"
  to = scalr_workspace.import
}

removed {
  from = scalr_workspace.forget
  lifecycle {
    destroy = false
  }
}
