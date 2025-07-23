terraform {
    required_providers {
        scalr = {
            source = "registry.scalr.io/scalr/scalr"
            version= "3.2.0"
        }
    }
}

variable "env_count" {
  sensitive = false
}

resource "scalr_environment" "test" {
  name = "weenv-from-provider-${count.index}" 
  count = var.env_count
}

resource "scalr_environment" "test1" {
  name = "env-from-provider-${count.index}" 
  count = var.env_count
}

resource "scalr_environment" "test2" {
  name = "denv2-from-provider-${count.index}" 
  count = var.env_count
}

data "scalr_vcs_provider" "example" {
  name = "ihor"
}
