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

data "scalr_environment" "test" {
  name = "env-from-provider-${count.index}" 
  count = var.env_count
}

data "scalr_vcs_provider" "example" {
  name = "ihor"
}
