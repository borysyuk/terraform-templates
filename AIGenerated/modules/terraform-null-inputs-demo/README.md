# terraform-null-inputs-demo

Demo module for the Scalr module registry UI. It needs no cloud credentials.

- Required inputs: `name`, `instance_count`.
- Optional inputs: `environment`, `tags`, `enabled`, `api_token` (sensitive).
- Resources: `null_resource.instance` (repeated `count` times) and `terraform_data.summary`.
- Submodule: `modules/label`.

```hcl
module "demo" {
  source = "<registry>/inputs-demo/null"

  name           = "demo"
  instance_count = 2
}
```
