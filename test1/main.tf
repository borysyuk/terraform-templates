resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo test"
  }
}

resource "random_pet" "cat" {
}

resource "random_pet" "dog" {
}

resource "random_pet" "cheetah" {
}

resource "random_pet" "horse" {
}

resource "random_pet" "zebra" {
}

output "instance_ip_addr1" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}

output "instance_ip_addr2" {
  value       = "192.168.0.2"
  description = "The private IP2 address of the main server instance."
}
