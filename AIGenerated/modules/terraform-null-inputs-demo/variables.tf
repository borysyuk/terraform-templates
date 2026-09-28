# Required inputs (no default) and optional inputs (with a default) for the module
# registry "Inputs" tab, which splits the two by whether a default is set.

variable "name" {
  type        = string
  description = "Name prefix for every created resource."
}

variable "instance_count" {
  type        = number
  description = "How many `null_resource.instance` resources to create."
}

variable "environment" {
  type        = string
  description = "Environment label added to triggers."
  default     = "development"
}

variable "tags" {
  type        = map(string)
  description = "Extra tags merged into the triggers."
  default     = {}
}

variable "enabled" {
  type        = bool
  description = "Set to false to create nothing."
  default     = true
}

variable "api_token" {
  type        = string
  description = "Example of a sensitive optional input."
  default     = "not-a-real-token"
  sensitive   = true
}
