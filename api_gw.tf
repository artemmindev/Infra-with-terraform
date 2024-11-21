resource "aws_apigatewayv2_api" "api-gw" {
  name          = "api-gw"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "stage" {
  api_id = aws_apigatewayv2_api.api-gw.id
  name        = "stage"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "http_proxy" {
  api_id = aws_apigatewayv2_api.api-gw.id
  integration_type   = "HTTP_PROXY"
  integration_uri    = "http://${aws_instance.my-app.public_ip}:8000/{proxy+}"
  integration_method = "ANY"
  connection_type    = "INTERNET"
}

resource "aws_apigatewayv2_route" "proxy_route" {
  api_id = aws_apigatewayv2_api.api-gw.id
  route_key = "ANY /{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.http_proxy.id}"
}

output "api_gw_health_url" {
  value = "${aws_apigatewayv2_stage.stage.invoke_url}/health"
}
