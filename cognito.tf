resource "aws_cognito_user_pool" "pool" {
  name = "central-logging-testing-opensearch"
}

resource "aws_cognito_user_pool_domain" "user_pool_domain" {
  domain = "central-logging-testing-opensearch-opensearch-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
  user_pool_id = aws_cognito_user_pool.pool.id
}
resource "aws_cognito_user_pool_client" "user_pool_client" {
  name = "${var.aos_domain_name}-opensearch"
  user_pool_id = aws_cognito_user_pool.pool.id
}
resource "aws_cognito_identity_pool" "aos_pool" {
  identity_pool_name = "central-logging-testing-opensearch-id"
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id = aws_cognito_user_pool_client.user_pool_client.id
    provider_name = aws_cognito_user_pool.pool.endpoint
  }
}

resource "aws_iam_role" "cognito" {
  name = "central-logging-testing-cognito"
  assume_role_policy = data.aws_iam_policy_document.cognito_policy_document.json

}

data "aws_iam_policy_document" "cognito_policy_document" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["es.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "cognito" {
  role = aws_iam_role.cognito.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonESCognitoAccess"
}