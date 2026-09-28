variable "network_id" {
  type = string
}

resource "terraform_data" "app" {
  input = "app on ${var.network_id}"
}
