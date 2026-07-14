terraform {
  required_version = ">= 1.5.0"
}

resource "terraform_data" "wiz_failed_policy" {
  input = "scalr-38721-real-failed-by-policy"
}
