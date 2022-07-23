
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

  snapshot_options {
    automated_snapshot_start_hour = 23
  }


  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  advanced_security_options {
    enabled                        = false
    internal_user_database_enabled = true
    master_user_options {
      master_user_name     = var.user_name
      master_user_password = var.user_password
    }
  }

  node_to_node_encryption {
    enabled = true
  }

  encrypt_at_rest {
    enabled = true
  }

  domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  access_policies = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "es:*",
      "Principal": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.domain}/*",
      "Condition": {
        "IpAddress": {"aws:SourceIp": ["66.193.100.22/32"]}
      }
    }
  ]
}
POLICY

  tags = {
    Domain = "central_logging_acadian"
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
