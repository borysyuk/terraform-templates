terraform {
    required_providers {
        scalr = {
            source = "registry.scalr.io/scalr/scalr"
            version= "3.2.0"
        }
    }
}

variable "ws_count" {
  sensitive = false
}

variable "auto_apply" {
  type        = bool
}

variable "auto_queue_runs" {
  description = "never, always, skip_first"
}

data "scalr_environment" "test" {
  name = "tfenv1" 
}

data "scalr_vcs_provider" "example" {
  name = "ihor"
}

resource "scalr_workspace" "me" {
  name = "from_provider${count.index}"
  count = var.ws_count
  environment_id = data.scalr_environment.test.id
  vcs_repo {
    identifier = "borysyuk/terraform-templates"
    branch = "master"
  }
  working_directory = "test2"
  vcs_provider_id = data.scalr_vcs_provider.example.id
  auto_apply = var.auto_apply
  auto_queue_runs = var.auto_queue_runs
  deletion_protection_enabled = "false"
}
