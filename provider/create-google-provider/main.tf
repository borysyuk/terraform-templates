terraform {
    required_providers {
        scalr = {
            source = "registry.scalr.io/scalr/scalr"
            version= "3.2.0"
        }
    }
}

resource "scalr_provider_configuration" "using_service_account_impersonation" {
  name       = "google_main"
  account_id = "acc-svrcncgh453bi8g"
  export_shell_variables = true
  google {
    auth_type              = "oidc"
    project                = "my-project"
    service_account_email  = "user@example.com"
    workload_provider_name = "projects/123/locations/global/workloadIdentityPools/pool-name/providers/provider-name"
  }
}
