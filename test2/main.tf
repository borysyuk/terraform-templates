resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo test"
  }
}

resource "random_pet" "cat" {
}

resource "random_pet" "dog" {
}

resource "random_pet" "cheetah2" {
}

resource "random_pet" "horse" {
  count = 300
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
output "instance_ip_addr3" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}

output "instance_ip_addr4" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}
output "instance_ip_addr5" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}

output "instance_ip_addr6" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}
output "instance_ip_addr7" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}
output "instance_ip_addr8" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}
output "instance_ip_addr9" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}
output "instance_ip_addr10" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}
output "instance_ip_addr11" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}
output "instance_ip_addr12" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}
output "instance_ip_addr13" {
  value       = "192.168.0.1"
  description = "The private IP address of the main server instance."
}
