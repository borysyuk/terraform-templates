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

resource "random_pet" "cat" {
  count = 5
}

output "instance_ip_addr1" {
  value       = "192.168.0.44"
  description = "The private IP address of the main server instance."
}
