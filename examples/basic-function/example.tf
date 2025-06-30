provider "aws" {
  region = "us-east-1"
}

locals {
  name        = "lambda"
  environment = "test"
}

module "lambda" {
  source      = "../../"
  name        = local.name
  environment = local.environment
  filename    = "../../lambda_packages/lambda_code/index.zip"
  handler     = "lambda_function.handler"
  runtime     = "python3.12"
  variables = {
    foo = "bar"
  }
}
