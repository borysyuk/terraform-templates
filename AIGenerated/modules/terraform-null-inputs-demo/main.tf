terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

locals {
  count = var.enabled ? var.instance_count : 0
}

# The number of instances depends on `count`, which the registry "Resources" tab explains.
resource "null_resource" "instance" {
  count = local.count

  triggers = merge(var.tags, {
    name        = "${var.name}-${count.index}"
    environment = var.environment
  })
}

resource "terraform_data" "summary" {
  input = {
    name      = var.name
    instances = local.count
  }
}

module "label" {
  source = "./modules/label"

  name        = var.name
  environment = var.environment
}
