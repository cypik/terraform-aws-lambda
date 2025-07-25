provider "aws" {
  region = "ap-south-1"
}

module "app_lambda" {
  source                            = "../../"
  name                              = "my-app-function"
  environment                       = "prod"
  handler                           = "lambda_function.handler"
  runtime                           = "python3.13"
  filename                          = "../../lambda_packages/index.zip"
  publish                           = true
  enable_provisioned_concurrency    = true
  reserved_concurrent_executions    = 5
  provisioned_concurrent_executions = 3
  timeout                           = 60

  iam_actions = [
    "logs:CreateLogGroup",
    "logs:CreateLogStream",
    "logs:PutLogEvents"
  ]
}