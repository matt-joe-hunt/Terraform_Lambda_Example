provider "aws" {
  region = var.region-master
}

module "API_Gateway" {
  source            = "./API_Gateway"
  environment       = var.environment
  API_name          = var.API_name
  resource_path     = var.resource_path
  lambda_invoke_arn = module.Lambda.lambda_invoke_arn
}

module "Lambda" {
  source                             = "./Lambda"
  region-master                      = var.region-master
  project                            = var.project
  environment                        = var.environment
  accountID                          = var.accountID
  aws_api_gateway_rest_api_id        = module.API_Gateway.aws_api_gateway_rest_api_id
  aws_api_gateway_method_http_method = module.API_Gateway.aws_api_gateway_method_http_method
  aws_api_gateway_resource_path      = module.API_Gateway.aws_api_gateway_resource_path
}