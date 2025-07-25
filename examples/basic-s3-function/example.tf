provider "aws" {
  region = "ap-south-1"
}

module "lambda" {
  source         = "../../"
  name           = "lambda"
  environment    = "test"
  use_s3         = true
  s3_bucket_name = "lambda-test123345"
  s3_object_key  = "index.zip"
  s3_object_acl  = "private"
  handler        = "lambda_function.handler"
  runtime        = "python3.13"
  variables = {
    foo = "bar"
  }
}