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
