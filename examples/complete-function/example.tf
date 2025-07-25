provider "aws" {
  region = "ap-south-1"
}

module "lambda" {
  source                            = "../../"
  name                              = "lambda"
  environment                       = "dev"
  filename                          = "../../lambda_packages/index.zip"
  handler                           = "lambda_function.handler"
  runtime                           = "python3.13"
  compatible_architectures          = ["x86_64"]
  timeout                           = 60
  cloudwatch_logs_retention_in_days = 7

  # -- ARNs of Triggers
  source_arns = [""]

  # -- Lambda-Function IAMRole permission
  iam_actions = [
    "s3:PutObject",
    "s3:ListBucket",
    "s3:GetObject",
    "s3:PutObjectAcl",
    "ec2:CreateNetworkInterface",
    "ec2:DescribeNetworkInterfaces",
    "ec2:DeleteNetworkInterface",
    "ec2:AssignPrivateIpAddresses",
    "ec2:UnassignPrivateIpAddresses"
  ]

  # -- Lambda Layer
  create_layers   = true
  layer_names     = ["python_layer"]
  layer_filenames = ["../../lambda_packages/lambda_code/layer.zip"]
  compatible_runtimes = [
    ["python3.12", "python3.11"],
  ]

  # -- Resource-based policy statements
  statement_ids = ["AllowExecutionFromCloudWatch"]
  actions       = ["lambda:InvokeFunction"]
  principals    = ["events.amazonaws.com"]

  # -- Environment Variables
  variables = {
    foo = "bar"
  }
}
