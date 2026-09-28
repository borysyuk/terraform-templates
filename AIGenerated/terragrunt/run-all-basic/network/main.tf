resource "terraform_data" "network" {
  input = "network"
}

output "network_id" {
  value = terraform_data.network.id
}
