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
  name                           = local.name
  environment                    = local.environment
  reserved_concurrent_executions = -1
  s3_bucket_name                 = "testtwaeguqwe"
  s3_object_key                  = "index.zip"
  s3_object_acl                  = "private"
  handler                        = "index.handler"
  runtime                        = "nodejs18.x"
  variables = {
    foo = "bar"
  }
}