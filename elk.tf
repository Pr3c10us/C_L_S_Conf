
resource "aws_opensearch_domain" "central_logging_acadian" {
  domain_name           = "central-logging"
  engine_version = "OpenSearch_1.2"


  log_publishing_options {
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.central_logging_acadian_els.arn
    log_type                 = "INDEX_SLOW_LOGS"
  }

  cluster_config {
    instance_type = "c5.large.search"
  }

  ebs_options {
    ebs_enabled = true
    volume_type = "gp2"
    volume_size = 20
  }

  access_policies = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "es:*",
      "Principal": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/central-logging/*"
    }
  ]
}
POLICY

  tags = {
    Domain = "central_logging_cross_account"
  }
}

resource "aws_cloudwatch_log_group" "central_logging_acadian_els" {
  name = "central_logging_cross_account_els"
}

resource "aws_cloudwatch_log_resource_policy" "central_logging_acadian_els" {
  policy_name = "central_logging_acadian_els"

  policy_document = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "es.amazonaws.com"
      },
      "Action": [
        "logs:PutLogEvents",
        "logs:PutLogEventsBatch",
        "logs:CreateLogStream"
      ],
      "Resource": "arn:aws:logs:*"
    }   
 ]
}
CONFIG
}
