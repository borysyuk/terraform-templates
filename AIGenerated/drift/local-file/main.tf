# Drift fixture: a workspace that reports drift on every drift-detection check.
#
# `local_file` writes into the run's working directory. Scalr runs each run in a fresh
# container, so the file is gone by the next run and a refresh-only drift check reports
# `local_file.marker` as deleted outside of Terraform -> drift report `awaiting_manual_action`.

terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "marker" {
  filename = "${path.module}/drift-marker.txt"
  content  = "Created by the AIGenerated drift fixture."
}

# A resource that never drifts, so the workspace always has state beyond the marker.
resource "terraform_data" "stable" {
  input = "stable"
}

output "marker_path" {
  value = local_file.marker.filename
}
