output "name" {
  value       = join("", aws_lambda_function.default[*].function_name)
  description = "The name of the Lambda Function"
}

output "arn" {
  value       = join("", aws_lambda_function.default[*].arn)
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function."
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}

output "lambda_log_group_name" {
  value       = !var.existing_cloudwatch_log_group ? aws_cloudwatch_log_group.lambda[0].name : 0
  description = "A mapping of tags to assign to the resource."
}

output "invoke_arn" {
  value       = join("", aws_lambda_function.default[*].invoke_arn)
  description = "Invoke ARN"
}