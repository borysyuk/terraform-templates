terraform {
    required_providers {
        scalr = {
            source = "registry.scalr.io/scalr/scalr"
            version= "3.16.4"
        }
    }
}
/*
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
*/

resource "scalr_provider_configuration" "google" {
  name       = "google_main_2"
  account_id = "acc-svrcncgh453bi8g" #"acc-v0p9vf4vtp33j9mse" #"acc-v0p9u5ub1pjef6f2l"
export_shell_variables = true
  google {
    auth_type              = "oidc"
    project                = "my_project"
    service_account_email  = "scalr-service-account@development-156220.iam.gserviceaccount.com"
    workload_provider_name = "projects/269908363239/locations/global/workloadIdentityPools/vmotso/providers/vmotso-provider"
  }
}
