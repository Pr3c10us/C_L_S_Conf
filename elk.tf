# data "aws_vpc" "vpc-f80daf83" {
#   id = var.vpc
# }

# data "aws_subnet_ids" "vpc-f80daf83" {
#   vpc_id = var.subnet_ids

#   tags = {
#     Tier = "private"
#   }
# }

resource "aws_elasticsearch_domain" "central_logging_acadian" {
  domain_name           = "central-logging"
  elasticsearch_version = "6.7"


  log_publishing_options {
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.central_logging_acadian_els.arn
    log_type                 = "INDEX_SLOW_LOGS"
  }

  cluster_config {
    instance_type = "r5.large.elasticsearch"
  }

  ebs_options {
    ebs_enabled = true
    volume_type = "gp2"
    volume_size = 20
  }

  snapshot_options {
    automated_snapshot_start_hour = 23
  }


  # vpc_options {
  # subnet_ids = [
  #   data.aws_subnet_ids.vpc-f80daf83.ids
  # ]

  # security_group_ids = var.security_groups
  # }

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

  access_policies = ${data.aws_iam_policy_document.opensearch_destination_policy.json}
  data "aws_iam_policy_document" "opensearch_destination_policy" {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Action": [
                "es:ESHttps*"
                ],
              "Principal": {
                "AWS": "*"
                },
              "Effect": "Allow",
              "Condition": [
                {
                  "ArnEquals": {"aws:SourceArn": "arn:aws:firehose:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:deliverystream/${var.kinesis_firehose_name}"}
              },
              {"IpAddress": {"aws:SourceIp": ["0.0.0.0/0"
              ]
            }
            }
            ],
              "Resource": [
                "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/central-logging",
                "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/central-logging/*"
              ]
          },
          {
              "Action":[
                "es:ESHttps*"
                ],
              "Principal": {
                "AWS":"*"
                },
              "Effect": "Allow",
              "Condition": {
                  "ArnEquals": {"aws:SourceArn": "${aws_iam_role.central_logging_acadian.arn}"}
              },
              "Resource": [
                "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/central-logging",
                "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/central-logging/*"
              ]
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
