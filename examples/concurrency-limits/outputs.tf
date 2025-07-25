output "arn" {
  value       = module.app_lambda[*].arn
  description = "The ID of the Hostzone."
}

output "tags" {
  value       = module.app_lambda.tags
  description = "A mapping of tags to assign to the resource."
}
