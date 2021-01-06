data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "./Lambda/sample.js"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "lambda" {
  filename         = "lambda_function.zip"
  function_name    = "${var.environment}-${var.project}"
  role             = aws_iam_role.lambda_role.arn
  handler          = "sample.handler"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
  runtime          = var.runtime
}

resource "aws_iam_role" "lambda_role" {
  name               = "${var.environment}_${var.project}"
  assume_role_policy = "${file("./Lambda/policy.json")}"
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:${var.region-master}:${var.accountId}:${var.aws_api_gateway_rest_api_id}/*/${var.aws_api_gateway_method_http_method}${var.aws_api_gateway_resource_path}"
}