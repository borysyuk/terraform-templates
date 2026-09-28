output "instance_ids" {
  description = "IDs of the created null resources."
  value       = null_resource.instance[*].id
}

output "label" {
  description = "Label produced by the submodule."
  value       = module.label.id
}
