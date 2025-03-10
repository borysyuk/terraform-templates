resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo test"
  }
}

variable "image_id" {
  type = string
}

variable "password" {
  type = string
  sensitive = true
}

resource "time_offset" "example" {
  offset_days = 13
}

resource "time_rotating" "example2" {
  rotation_days = 32
}

resource "null_resource" "previous" {}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "20s"
}

resource "time_static" "example23" {}

resource "random_pet" "cat" {
}

resource "random_pet" "horse" {
  count = 23
}

resource "random_bytes" "jwt_secret" {
  length = 64
}

resource "random_id" "server" {
  byte_length = 8
}

resource "random_integer" "priority" {
  min = 1
  max = 50000
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_shuffle" "az" {
  input        = ["us-west-1a", "us-west-1c", "us-west-1d", "us-west-1e"]
  result_count = 2
}

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

resource "random_uuid" "test" {
}

output "instance_ip_addr1" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}

output "instance_ip_addr2" {
  value       = "192.168.0.2"
  description = "The private IP2 address of the main server instance."
}
