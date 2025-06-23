provider "aws" {
  region = "us-east-1"
}

locals {
  name        = "lambdag"
  environment = "test"
}

# Lambda function configuration
module "lambda" {
  source                         = "../../"
  use_s3                         = true
  name                           = local.name
  environment                    = local.environment
  reserved_concurrent_executions = -1
  s3_bucket_name                 = "testtwadwdnk38ndi3qwe"
  s3_object_key                  = "index.zip"
  s3_object_acl                  = "private"
  handler                        = "lambda_function.handler"
  runtime                        = "python3.12"
  variables = {
    foo = "bar"
  }
}