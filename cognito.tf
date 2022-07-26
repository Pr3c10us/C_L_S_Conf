resource "aws_cognito_user_pool" "pool" {
  name = "central-logging-testing-opensearch"
}

resource "aws_cognito_user_pool_domain" "user_pool_domain" {
  domain = "central-logging-testing-opensearch-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
  user_pool_id = aws_cognito_user_pool.pool.id
}
resource "aws_cognito_user_pool_client" "user_pool_client" {
  name = "central-logging-testing-opensearch"
  user_pool_id = aws_cognito_user_pool.pool.id
}
resource "aws_cognito_identity_pool" "pool" {
  identity_pool_name = "central-logging-testing-opensearch-id"
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id = aws_cognito_user_pool_client.user_pool_client.id
    provider_name = aws_cognito_user_pool.pool.endpoint
  }
}


resource "aws_cognito_identity_pool_roles_attachment" "pool_roles" {
  identity_pool_id = aws_cognito_identity_pool.pool.id
  roles = {
    "authenticated" = aws_iam_role.cognito_authenticated.arn
  }
}

resource "aws_iam_role" "cognito_authenticated" {
  name = "central-logging-testing-cognito-authenticated"
  assume_role_policy = data.aws_iam_policy_document.cognito_authenticated_policy_document.json


}

data "aws_iam_policy_document" "cognito_authenticated_policy_document" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type = "Federated"
      identifiers = ["cognito-identity.amazonaws.com"]
    }
    condition {
      test = "StringEquals"
      variable = "cognito-identity.amazonaws.com:aud"
      values = [aws_cognito_identity_pool.pool.id]
    }
    condition {
      test = "ForAnyValue:StringLike"
      variable = "cognito-identity.amazonaws.com:amr"
      values = ["authenticated"]
    }
  }
}

resource "aws_iam_role_policy" "cognito_authenticated" {
  name = "central-logging-testing-cognito-authenticated"
  role = aws_iam_role.cognito_authenticated.id

  policy = data.aws_iam_policy_document.cognito_authenticated.json
}

data "aws_iam_policy_document" "cognito_authenticated" {
  statement {
    effect = "Allow"
    actions = [
      "mobileanalytics:PutEvents"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "cognito-sync:*"
    ]
    resources = [
      "arn:aws:cognito-sync:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:identitypool/${aws_cognito_identity_pool.pool.id}"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "cognito-identity:ListIdentityPools"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "cognito-identity:*"
    ]
    resources = [
      "arn:aws:cognito-identity:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:identitypool/${aws_cognito_identity_pool.pool.id}"
    ]
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
