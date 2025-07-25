provider "aws" {
  region = "ap-south-1"
}

module "lambda" {
  source      = "../../"
  name        = "lambda"
  environment = "test"
  filename    = "../../lambda_packages/index.zip"
  handler     = "lambda_function.handler"
  runtime     = "python3.13"
  variables = {
    foo = "bar"
  }
}
