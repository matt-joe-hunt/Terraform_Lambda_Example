output "aws_api_gateway_rest_api_id" {
    value = aws_api_gateway_rest_api.api.id
}

output "aws_api_gateway_method_http_method" {
    value = aws_api_gateway_method.method.http_method
}

output "aws_api_gateway_resource_path" {
    value = aws_api_gateway_resource.resource.path
}

output "url" {
  value = "${aws_api_gateway_deployment.deployment.invoke_url}${aws_api_gateway_resource.resource.path}"
}