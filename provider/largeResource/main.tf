# Minimal repro for the Resource changes view rendering a large single-attribute diff.
#
# One resource, one plain attribute, whose value changes completely between runs. No providers
# and no secrets, so nothing but the diff itself is in play.

terraform {
  required_version = ">= 1.4"
}

locals {
  # range() caps at 1024, so the chunks are generated as a nested loop.
  chunks = ceil(var.payload_kb * 1024 / 88)
  outer  = ceil(local.chunks / 1000)
  inner  = ceil(local.chunks / local.outer)

  payloads = [
    for i in range(var.resource_count) :
    join("", [
      for b in range(local.outer) :
      join("", [for c in range(local.inner) : base64sha512("${var.revision}-${i}-${b}-${c}")])
    ])
  ]
}

# No triggers_replace: changing input is an in-place update, so the plan carries both the old
# and the new value and the view has to render a real diff.
resource "terraform_data" "payload" {
  count = var.resource_count

  input = {
    public = local.payloads[count.index]
  }
}
