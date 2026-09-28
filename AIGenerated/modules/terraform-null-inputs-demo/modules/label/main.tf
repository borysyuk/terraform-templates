variable "name" {
  type        = string
  description = "Base name."
}

variable "environment" {
  type        = string
  description = "Environment suffix."
  default     = "development"
}

resource "terraform_data" "label" {
  input = "${var.name}-${var.environment}"
}

output "id" {
  value = terraform_data.label.output
}
