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
  environments = ["env-v0ord4r0sthdi9es5", "env-v0pad8o7cte8roqak", "env-v0pad8o7ej4afdvbd"]
}


variable "count_number" {
  sensitive = false
}

variable "github_vcs_token" {
  sensitive = true
}
