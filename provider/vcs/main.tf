terraform {
  required_providers {
    scalr = {
      source  = "registry.scalr.io/scalr/scalr"
      version = "3.11.0"
    }
  }
}

resource "scalr_vcs_provider" "vcs" {
count = var.count_number
  name     = "vcs_provider-${count.index}"
  vcs_type = "github"
  token    = var.github_vcs_token
  environments = ["env-v0ord4r0sthdi9es5", "env-v0p6tjbgki1rp051c", "env-v0p6tjbg7a770ga9m", "env-v0p6tjbg65e6pfpm6", "env-v0p6tjbg6f0ne65dm", "env-v0p6tjbg6qnfsisdo"]
}


variable "count_number" {
  sensitive = false
}

variable "github_vcs_token" {
  sensitive = true
}
