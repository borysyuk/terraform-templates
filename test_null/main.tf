resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo test"
  }
}

variable "image_id" {
  default = "string"
}

resource "random_pet" "horse" {
  count = 9
}

output "instance_ip_addr1" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}

output "instance_ip_addr2" {
  value       = "192.168.0.2"
  description = "The private IP2 address of the main server instance."
}

module "module2" {
	source  = "mainiacp.ihor-24516.testenv.scalr.dev/acc-svrcncgh453bi8g/module2/git"
	version = "1.0.2"
}
