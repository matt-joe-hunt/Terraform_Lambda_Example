variable "region-master" {
  type    = string
}

variable "environment" {
  type    = string
}

variable "project" {
  type    = string
}

variable "runtime" {
  type    = string
  default = "nodejs12.x"
}

variable "accountId" {
  type    = string
}

variable "aws_api_gateway_rest_api_id" {
  type = string
}

variable "aws_api_gateway_method_http_method" {
  type = string
}

variable "aws_api_gateway_resource_path" {
  type = string
}