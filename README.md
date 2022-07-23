<<<<<<< HEAD:modules/centralized-logging-CM126/README.md
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_destination.cloudwatch_kinesis_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination) | resource |
| [aws_cloudwatch_log_destination_policy.central_logging_acadian_destination_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination_policy) | resource |
| [aws_cloudwatch_log_group.central_logging_acadian_els](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.firehose_central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.central_logging_acadian_els](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_elasticsearch_domain.central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticsearch_domain) | resource |
| [aws_elasticsearch_domain_policy.central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticsearch_domain_policy) | resource |
| [aws_iam_role.central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.cloudwatch_kinesis_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.central_logging_acadian_policy_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_kinesis_firehose_delivery_stream.central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kinesis_stream.central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream) | resource |
| [aws_s3_bucket.logging-acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.logging_bucket_acadian_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_policy.logging_bucket_acadian_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_central_logging_acadian_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.central_logging_acadian_destination_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.policy_central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.policy_central_logging_acadian_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Kinesis_stream_retention_period"></a> [Kinesis\_stream\_retention\_period](#input\_Kinesis\_stream\_retention\_period) | n/a | `number` | `48` | no |
| <a name="input_advanced_options"></a> [advanced\_options](#input\_advanced\_options) | Key-value string pairs to specify advanced configuration options | `map(string)` | `{}` | no |
| <a name="input_advanced_security_options_enabled"></a> [advanced\_security\_options\_enabled](#input\_advanced\_security\_options\_enabled) | AWS Elasticsearch Kibana enchanced security plugin enabling (forces new resource) | `bool` | `false` | no |
| <a name="input_advanced_security_options_internal_user_database_enabled"></a> [advanced\_security\_options\_internal\_user\_database\_enabled](#input\_advanced\_security\_options\_internal\_user\_database\_enabled) | Whether to enable or not internal Kibana user database for ELK OpenDistro security plugin | `bool` | `false` | no |
| <a name="input_advanced_security_options_master_user_arn"></a> [advanced\_security\_options\_master\_user\_arn](#input\_advanced\_security\_options\_master\_user\_arn) | ARN of IAM user who is to be mapped to be Kibana master user (applicable if advanced\_security\_options\_internal\_user\_database\_enabled set to false) | `string` | `""` | no |
| <a name="input_advanced_security_options_master_user_name"></a> [advanced\_security\_options\_master\_user\_name](#input\_advanced\_security\_options\_master\_user\_name) | Master user username (applicable if advanced\_security\_options\_internal\_user\_database\_enabled set to true) | `string` | `""` | no |
| <a name="input_advanced_security_options_master_user_password"></a> [advanced\_security\_options\_master\_user\_password](#input\_advanced\_security\_options\_master\_user\_password) | Master user password (applicable if advanced\_security\_options\_internal\_user\_database\_enabled set to true) | `string` | `""` | no |
| <a name="input_allowed_cidr_blocks"></a> [allowed\_cidr\_blocks](#input\_allowed\_cidr\_blocks) | List of CIDR blocks to be allowed to connect to the cluster | `list(string)` | `[]` | no |
| <a name="input_automated_snapshot_start_hour"></a> [automated\_snapshot\_start\_hour](#input\_automated\_snapshot\_start\_hour) | Hour at which automated snapshots are taken, in UTC | `number` | `0` | no |
| <a name="input_availability_zone_count"></a> [availability\_zone\_count](#input\_availability\_zone\_count) | Number of Availability Zones for the domain to use. | `number` | `2` | no |
| <a name="input_aws_ec2_service_name"></a> [aws\_ec2\_service\_name](#input\_aws\_ec2\_service\_name) | AWS EC2 Service Name | `list(string)` | <pre>[<br>  "ec2.amazonaws.com"<br>]</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_cognito_authentication_enabled"></a> [cognito\_authentication\_enabled](#input\_cognito\_authentication\_enabled) | Whether to enable Amazon Cognito authentication with Kibana | `bool` | `false` | no |
| <a name="input_cognito_iam_role_arn"></a> [cognito\_iam\_role\_arn](#input\_cognito\_iam\_role\_arn) | ARN of the IAM role that has the AmazonESCognitoAccess policy attached | `string` | `""` | no |
| <a name="input_cognito_identity_pool_id"></a> [cognito\_identity\_pool\_id](#input\_cognito\_identity\_pool\_id) | The ID of the Cognito Identity Pool to use | `string` | `""` | no |
| <a name="input_cognito_user_pool_id"></a> [cognito\_user\_pool\_id](#input\_cognito\_user\_pool\_id) | The ID of the Cognito User Pool to use | `string` | `""` | no |
| <a name="input_create_iam_service_linked_role"></a> [create\_iam\_service\_linked\_role](#input\_create\_iam\_service\_linked\_role) | Whether to create `AWSServiceRoleForAmazonElasticsearchService` service-linked role. Set it to `false` if you already have an ElasticSearch cluster created in the AWS account and AWSServiceRoleForAmazonElasticsearchService already exists. See https://github.com/terraform-providers/terraform-provider-aws/issues/5218 for more info | `bool` | `true` | no |
| <a name="input_custom_endpoint"></a> [custom\_endpoint](#input\_custom\_endpoint) | Fully qualified domain for custom endpoint. | `string` | `""` | no |
| <a name="input_custom_endpoint_certificate_arn"></a> [custom\_endpoint\_certificate\_arn](#input\_custom\_endpoint\_certificate\_arn) | ACM certificate ARN for custom endpoint. | `string` | `""` | no |
| <a name="input_custom_endpoint_enabled"></a> [custom\_endpoint\_enabled](#input\_custom\_endpoint\_enabled) | Whether to enable custom endpoint for the Elasticsearch domain. | `bool` | `false` | no |
| <a name="input_dedicated_master_count"></a> [dedicated\_master\_count](#input\_dedicated\_master\_count) | Number of dedicated master nodes in the cluster | `number` | `0` | no |
| <a name="input_dedicated_master_enabled"></a> [dedicated\_master\_enabled](#input\_dedicated\_master\_enabled) | Indicates whether dedicated master nodes are enabled for the cluster | `bool` | `false` | no |
| <a name="input_dedicated_master_type"></a> [dedicated\_master\_type](#input\_dedicated\_master\_type) | Instance type of the dedicated master nodes in the cluster | `string` | `"t2.small.elasticsearch"` | no |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | Route53 DNS Zone ID to add hostname records for Elasticsearch domain and Kibana | `string` | `""` | no |
| <a name="input_domain_endpoint_options_enforce_https"></a> [domain\_endpoint\_options\_enforce\_https](#input\_domain\_endpoint\_options\_enforce\_https) | Whether or not to require HTTPS | `bool` | `true` | no |
| <a name="input_domain_endpoint_options_tls_security_policy"></a> [domain\_endpoint\_options\_tls\_security\_policy](#input\_domain\_endpoint\_options\_tls\_security\_policy) | The name of the TLS security policy that needs to be applied to the HTTPS endpoint | `string` | `"Policy-Min-TLS-1-0-2019-07"` | no |
| <a name="input_domain_hostname_enabled"></a> [domain\_hostname\_enabled](#input\_domain\_hostname\_enabled) | Explicit flag to enable creating a DNS hostname for ES. If `true`, then `var.dns_zone_id` is required. | `bool` | `false` | no |
| <a name="input_ebs_iops"></a> [ebs\_iops](#input\_ebs\_iops) | The baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type | `number` | `0` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | EBS volumes for data storage in GB | `number` | `0` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | Storage type of EBS volumes | `string` | `"gp2"` | no |
| <a name="input_elasticsearch_subdomain_name"></a> [elasticsearch\_subdomain\_name](#input\_elasticsearch\_subdomain\_name) | The name of the subdomain for Elasticsearch in the DNS zone (\_e.g.\_ `elasticsearch`, `ui`, `ui-es`, `search-ui`) | `string` | `""` | no |
| <a name="input_elasticsearch_version"></a> [elasticsearch\_version](#input\_elasticsearch\_version) | Version of Elasticsearch to deploy (\_e.g.\_ `7.4`, `7.1`, `6.8`, `6.7`, `6.5`, `6.4`, `6.3`, `6.2`, `6.0`, `5.6`, `5.5`, `5.3`, `5.1`, `2.3`, `1.5` | `string` | `"7.4"` | no |
| <a name="input_encrypt_at_rest_enabled"></a> [encrypt\_at\_rest\_enabled](#input\_encrypt\_at\_rest\_enabled) | Whether to enable encryption at rest | `bool` | `true` | no |
| <a name="input_encrypt_at_rest_kms_key_id"></a> [encrypt\_at\_rest\_kms\_key\_id](#input\_encrypt\_at\_rest\_kms\_key\_id) | The KMS key ID to encrypt the Elasticsearch domain with. If not specified, then it defaults to using the AWS/Elasticsearch service KMS key | `string` | `""` | no |
| <a name="input_iam_actions"></a> [iam\_actions](#input\_iam\_actions) | List of actions to allow for the IAM roles, _e.g._ `es:ESHttpGet`, `es:ESHttpPut`, `es:ESHttpPost` | `list(string)` | `[]` | no |
| <a name="input_iam_authorizing_role_arns"></a> [iam\_authorizing\_role\_arns](#input\_iam\_authorizing\_role\_arns) | List of IAM role ARNs to permit to assume the Elasticsearch user role | `list(string)` | `[]` | no |
| <a name="input_iam_role_arns"></a> [iam\_role\_arns](#input\_iam\_role\_arns) | List of IAM role ARNs to permit access to the Elasticsearch domain | `list(string)` | `[]` | no |
| <a name="input_iam_role_max_session_duration"></a> [iam\_role\_max\_session\_duration](#input\_iam\_role\_max\_session\_duration) | The maximum session duration (in seconds) for the user role. Can have a value from 1 hour to 12 hours | `number` | `3600` | no |
| <a name="input_iam_role_permissions_boundary"></a> [iam\_role\_permissions\_boundary](#input\_iam\_role\_permissions\_boundary) | The ARN of the permissions boundary policy which will be attached to the Elasticsearch user role | `string` | `null` | no |
| <a name="input_ingress_port_range_end"></a> [ingress\_port\_range\_end](#input\_ingress\_port\_range\_end) | End number for allowed port range. (e.g. `443`) | `number` | `65535` | no |
| <a name="input_ingress_port_range_start"></a> [ingress\_port\_range\_start](#input\_ingress\_port\_range\_start) | Start number for allowed port range. (e.g. `443`) | `number` | `0` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of data nodes in the cluster | `number` | `4` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Elasticsearch instance type for data nodes in the cluster | `string` | `"t2.small.elasticsearch"` | no |
| <a name="input_kibana_hostname_enabled"></a> [kibana\_hostname\_enabled](#input\_kibana\_hostname\_enabled) | Explicit flag to enable creating a DNS hostname for Kibana. If `true`, then `var.dns_zone_id` is required. | `bool` | `false` | no |
| <a name="input_kibana_subdomain_name"></a> [kibana\_subdomain\_name](#input\_kibana\_subdomain\_name) | The name of the subdomain for Kibana in the DNS zone (\_e.g.\_ `kibana`, `ui`, `ui-es`, `search-ui`, `kibana.elasticsearch`) | `string` | `""` | no |
| <a name="input_kinesis_firehose_name"></a> [kinesis\_firehose\_name](#input\_kinesis\_firehose\_name) | n/a | `string` | `"kinesis_fireshose_acadian"` | no |
| <a name="input_kinesis_stream_name"></a> [kinesis\_stream\_name](#input\_kinesis\_stream\_name) | n/a | `string` | `"kinesis_stream_acadian"` | no |
| <a name="input_log_publishing_application_cloudwatch_log_group_arn"></a> [log\_publishing\_application\_cloudwatch\_log\_group\_arn](#input\_log\_publishing\_application\_cloudwatch\_log\_group\_arn) | ARN of the CloudWatch log group to which log for ES\_APPLICATION\_LOGS needs to be published | `string` | `""` | no |
| <a name="input_log_publishing_application_enabled"></a> [log\_publishing\_application\_enabled](#input\_log\_publishing\_application\_enabled) | Specifies whether log publishing option for ES\_APPLICATION\_LOGS is enabled or not | `bool` | `false` | no |
| <a name="input_log_publishing_audit_cloudwatch_log_group_arn"></a> [log\_publishing\_audit\_cloudwatch\_log\_group\_arn](#input\_log\_publishing\_audit\_cloudwatch\_log\_group\_arn) | ARN of the CloudWatch log group to which log for AUDIT\_LOGS needs to be published | `string` | `""` | no |
| <a name="input_log_publishing_audit_enabled"></a> [log\_publishing\_audit\_enabled](#input\_log\_publishing\_audit\_enabled) | Specifies whether log publishing option for AUDIT\_LOGS is enabled or not | `bool` | `false` | no |
| <a name="input_log_publishing_index_cloudwatch_log_group_arn"></a> [log\_publishing\_index\_cloudwatch\_log\_group\_arn](#input\_log\_publishing\_index\_cloudwatch\_log\_group\_arn) | ARN of the CloudWatch log group to which log for INDEX\_SLOW\_LOGS needs to be published | `string` | `""` | no |
| <a name="input_log_publishing_index_enabled"></a> [log\_publishing\_index\_enabled](#input\_log\_publishing\_index\_enabled) | Specifies whether log publishing option for INDEX\_SLOW\_LOGS is enabled or not | `bool` | `false` | no |
| <a name="input_log_publishing_search_cloudwatch_log_group_arn"></a> [log\_publishing\_search\_cloudwatch\_log\_group\_arn](#input\_log\_publishing\_search\_cloudwatch\_log\_group\_arn) | ARN of the CloudWatch log group to which log for SEARCH\_SLOW\_LOGS needs to be published | `string` | `""` | no |
| <a name="input_log_publishing_search_enabled"></a> [log\_publishing\_search\_enabled](#input\_log\_publishing\_search\_enabled) | Specifies whether log publishing option for SEARCH\_SLOW\_LOGS is enabled or not | `bool` | `false` | no |
| <a name="input_node_to_node_encryption_enabled"></a> [node\_to\_node\_encryption\_enabled](#input\_node\_to\_node\_encryption\_enabled) | Whether to enable node-to-node encryption | `bool` | `false` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security group IDs to be allowed to connect to the cluster | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | VPC Subnet IDs | `string` | `"subnet-3840f872"` | no |
| <a name="input_ui_bucket_name"></a> [ui\_bucket\_name](#input\_ui\_bucket\_name) | n/a | `string` | `"log_bucket"` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | n/a | `string` | `"acadian"` | no |
| <a name="input_user_password"></a> [user\_password](#input\_user\_password) | n/a | `string` | `"Test1234$$"` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | `string` | `"vpc-f80daf83"` | no |
| <a name="input_vpc_enabled"></a> [vpc\_enabled](#input\_vpc\_enabled) | Set to false if ES should be deployed outside of VPC. | `bool` | `true` | no |
| <a name="input_warm_count"></a> [warm\_count](#input\_warm\_count) | Number of UltraWarm nodes | `number` | `2` | no |
| <a name="input_warm_enabled"></a> [warm\_enabled](#input\_warm\_enabled) | Whether AWS UltraWarm is enabled | `bool` | `false` | no |
| <a name="input_warm_type"></a> [warm\_type](#input\_warm\_type) | Type of UltraWarm nodes | `string` | `"ultrawarm1.medium.elasticsearch"` | no |
| <a name="input_zone_awareness_enabled"></a> [zone\_awareness\_enabled](#input\_zone\_awareness\_enabled) | Enable zone awareness for Elasticsearch cluster | `bool` | `true` | no |

## Outputs

No outputs.
=======
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_destination.cloudwatch_kinesis_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination) | resource |
| [aws_cloudwatch_log_destination_policy.central_logging_acadian_destination_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination_policy) | resource |
| [aws_cloudwatch_log_group.central_logging_acadian_els](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.firehose_central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.central_logging_acadian_els](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_iam_role.central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.cloudwatch_kinesis_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.central_logging_acadian_policy_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_kinesis_firehose_delivery_stream.central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kinesis_stream.central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream) | resource |
| [aws_opensearch_domain.central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain) | resource |
| [aws_s3_bucket.logging-acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.logging_bucket_acadian_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_policy.logging_bucket_acadian_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_central_logging_acadian_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.central_logging_acadian_destination_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.policy_central_logging_acadian](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.policy_central_logging_acadian_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Kinesis_stream_retention_period"></a> [Kinesis\_stream\_retention\_period](#input\_Kinesis\_stream\_retention\_period) | n/a | `number` | `48` | no |
| <a name="input_advanced_options"></a> [advanced\_options](#input\_advanced\_options) | Key-value string pairs to specify advanced configuration options | `map(string)` | `{}` | no |
| <a name="input_advanced_security_options_enabled"></a> [advanced\_security\_options\_enabled](#input\_advanced\_security\_options\_enabled) | AWS Opensearch Kibana enchanced security plugin enabling (forces new resource) | `bool` | `false` | no |
| <a name="input_advanced_security_options_internal_user_database_enabled"></a> [advanced\_security\_options\_internal\_user\_database\_enabled](#input\_advanced\_security\_options\_internal\_user\_database\_enabled) | Whether to enable or not internal Kibana user database for ELK OpenDistro security plugin | `bool` | `false` | no |
| <a name="input_advanced_security_options_master_user_arn"></a> [advanced\_security\_options\_master\_user\_arn](#input\_advanced\_security\_options\_master\_user\_arn) | ARN of IAM user who is to be mapped to be Kibana master user (applicable if advanced\_security\_options\_internal\_user\_database\_enabled set to false) | `string` | `""` | no |
| <a name="input_advanced_security_options_master_user_name"></a> [advanced\_security\_options\_master\_user\_name](#input\_advanced\_security\_options\_master\_user\_name) | Master user username (applicable if advanced\_security\_options\_internal\_user\_database\_enabled set to true) | `string` | `""` | no |
| <a name="input_advanced_security_options_master_user_password"></a> [advanced\_security\_options\_master\_user\_password](#input\_advanced\_security\_options\_master\_user\_password) | Master user password (applicable if advanced\_security\_options\_internal\_user\_database\_enabled set to true) | `string` | `""` | no |
| <a name="input_allowed_cidr_blocks"></a> [allowed\_cidr\_blocks](#input\_allowed\_cidr\_blocks) | List of CIDR blocks to be allowed to connect to the cluster | `list(string)` | `[]` | no |
| <a name="input_automated_snapshot_start_hour"></a> [automated\_snapshot\_start\_hour](#input\_automated\_snapshot\_start\_hour) | Hour at which automated snapshots are taken, in UTC | `number` | `0` | no |
| <a name="input_availability_zone_count"></a> [availability\_zone\_count](#input\_availability\_zone\_count) | Number of Availability Zones for the domain to use. | `number` | `2` | no |
| <a name="input_aws_ec2_service_name"></a> [aws\_ec2\_service\_name](#input\_aws\_ec2\_service\_name) | AWS EC2 Service Name | `list(string)` | <pre>[<br>  "ec2.amazonaws.com"<br>]</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_cognito_authentication_enabled"></a> [cognito\_authentication\_enabled](#input\_cognito\_authentication\_enabled) | Whether to enable Amazon Cognito authentication with Kibana | `bool` | `false` | no |
| <a name="input_cognito_iam_role_arn"></a> [cognito\_iam\_role\_arn](#input\_cognito\_iam\_role\_arn) | ARN of the IAM role that has the AmazonESCognitoAccess policy attached | `string` | `""` | no |
| <a name="input_cognito_identity_pool_id"></a> [cognito\_identity\_pool\_id](#input\_cognito\_identity\_pool\_id) | The ID of the Cognito Identity Pool to use | `string` | `""` | no |
| <a name="input_cognito_user_pool_id"></a> [cognito\_user\_pool\_id](#input\_cognito\_user\_pool\_id) | The ID of the Cognito User Pool to use | `string` | `""` | no |
| <a name="input_create_iam_service_linked_role"></a> [create\_iam\_service\_linked\_role](#input\_create\_iam\_service\_linked\_role) | Whether to create `AWSServiceRoleForAmazonOpensearchService` service-linked role. Set it to `false` if you already have an Opensearch cluster created in the AWS account and AWSServiceRoleForAmazonOpensearchService already exists. See https://github.com/terraform-providers/terraform-provider-aws/issues/5218 for more info | `bool` | `true` | no |
| <a name="input_custom_endpoint"></a> [custom\_endpoint](#input\_custom\_endpoint) | Fully qualified domain for custom endpoint. | `string` | `""` | no |
| <a name="input_custom_endpoint_certificate_arn"></a> [custom\_endpoint\_certificate\_arn](#input\_custom\_endpoint\_certificate\_arn) | ACM certificate ARN for custom endpoint. | `string` | `""` | no |
| <a name="input_custom_endpoint_enabled"></a> [custom\_endpoint\_enabled](#input\_custom\_endpoint\_enabled) | Whether to enable custom endpoint for the Opensearch domain. | `bool` | `false` | no |
| <a name="input_dedicated_master_count"></a> [dedicated\_master\_count](#input\_dedicated\_master\_count) | Number of dedicated master nodes in the cluster | `number` | `0` | no |
| <a name="input_dedicated_master_enabled"></a> [dedicated\_master\_enabled](#input\_dedicated\_master\_enabled) | Indicates whether dedicated master nodes are enabled for the cluster | `bool` | `false` | no |
| <a name="input_dedicated_master_type"></a> [dedicated\_master\_type](#input\_dedicated\_master\_type) | Instance type of the dedicated master nodes in the cluster | `string` | `"t2.small.opensearch"` | no |
| <a name="input_dns_zone_id"></a> [dns\_zone\_id](#input\_dns\_zone\_id) | Route53 DNS Zone ID to add hostname records for Opensearch domain and Kibana | `string` | `""` | no |
| <a name="input_domain_endpoint_options_enforce_https"></a> [domain\_endpoint\_options\_enforce\_https](#input\_domain\_endpoint\_options\_enforce\_https) | Whether or not to require HTTPS | `bool` | `true` | no |
| <a name="input_domain_endpoint_options_tls_security_policy"></a> [domain\_endpoint\_options\_tls\_security\_policy](#input\_domain\_endpoint\_options\_tls\_security\_policy) | The name of the TLS security policy that needs to be applied to the HTTPS endpoint | `string` | `"Policy-Min-TLS-1-0-2019-07"` | no |
| <a name="input_domain_hostname_enabled"></a> [domain\_hostname\_enabled](#input\_domain\_hostname\_enabled) | Explicit flag to enable creating a DNS hostname for ES. If `true`, then `var.dns_zone_id` is required. | `bool` | `false` | no |
| <a name="input_ebs_iops"></a> [ebs\_iops](#input\_ebs\_iops) | The baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type | `number` | `0` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | EBS volumes for data storage in GB | `number` | `0` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | Storage type of EBS volumes | `string` | `"gp2"` | no |
| <a name="input_encrypt_at_rest_enabled"></a> [encrypt\_at\_rest\_enabled](#input\_encrypt\_at\_rest\_enabled) | Whether to enable encryption at rest | `bool` | `true` | no |
| <a name="input_encrypt_at_rest_kms_key_id"></a> [encrypt\_at\_rest\_kms\_key\_id](#input\_encrypt\_at\_rest\_kms\_key\_id) | The KMS key ID to encrypt the Opensearch domain with. If not specified, then it defaults to using the AWS/Opensearch service KMS key | `string` | `"41bf02c7-c97d-4cdc-af9a-5ac611efc497"` | no |
| <a name="input_iam_actions"></a> [iam\_actions](#input\_iam\_actions) | List of actions to allow for the IAM roles, _e.g._ `es:ESHttpGet`, `es:ESHttpPut`, `es:ESHttpPost` | `list(string)` | `[]` | no |
| <a name="input_iam_authorizing_role_arns"></a> [iam\_authorizing\_role\_arns](#input\_iam\_authorizing\_role\_arns) | List of IAM role ARNs to permit to assume the Opensearch user role | `list(string)` | `[]` | no |
| <a name="input_iam_role_arns"></a> [iam\_role\_arns](#input\_iam\_role\_arns) | List of IAM role ARNs to permit access to the Opensearch domain | `list(string)` | `[]` | no |
| <a name="input_iam_role_max_session_duration"></a> [iam\_role\_max\_session\_duration](#input\_iam\_role\_max\_session\_duration) | The maximum session duration (in seconds) for the user role. Can have a value from 1 hour to 12 hours | `number` | `3600` | no |
| <a name="input_iam_role_permissions_boundary"></a> [iam\_role\_permissions\_boundary](#input\_iam\_role\_permissions\_boundary) | The ARN of the permissions boundary policy which will be attached to the Opensearch user role | `string` | `null` | no |
| <a name="input_ingress_port_range_end"></a> [ingress\_port\_range\_end](#input\_ingress\_port\_range\_end) | End number for allowed port range. (e.g. `443`) | `number` | `65535` | no |
| <a name="input_ingress_port_range_start"></a> [ingress\_port\_range\_start](#input\_ingress\_port\_range\_start) | Start number for allowed port range. (e.g. `443`) | `number` | `0` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of data nodes in the cluster | `number` | `4` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Opensearch instance type for data nodes in the cluster | `string` | `"t2.small.opensearch"` | no |
| <a name="input_kibana_hostname_enabled"></a> [kibana\_hostname\_enabled](#input\_kibana\_hostname\_enabled) | Explicit flag to enable creating a DNS hostname for Kibana. If `true`, then `var.dns_zone_id` is required. | `bool` | `false` | no |
| <a name="input_kibana_subdomain_name"></a> [kibana\_subdomain\_name](#input\_kibana\_subdomain\_name) | The name of the subdomain for Kibana in the DNS zone (\_e.g.\_ `kibana`, `ui`, `ui-es`, `search-ui`, `kibana.opensearch`) | `string` | `""` | no |
| <a name="input_kinesis_firehose_name"></a> [kinesis\_firehose\_name](#input\_kinesis\_firehose\_name) | n/a | `string` | `"kinesis_fireshose_acadian"` | no |
| <a name="input_kinesis_stream_name"></a> [kinesis\_stream\_name](#input\_kinesis\_stream\_name) | n/a | `string` | `"kinesis_stream_acadian"` | no |
| <a name="input_log_publishing_application_cloudwatch_log_group_arn"></a> [log\_publishing\_application\_cloudwatch\_log\_group\_arn](#input\_log\_publishing\_application\_cloudwatch\_log\_group\_arn) | ARN of the CloudWatch log group to which log for ES\_APPLICATION\_LOGS needs to be published | `string` | `""` | no |
| <a name="input_log_publishing_application_enabled"></a> [log\_publishing\_application\_enabled](#input\_log\_publishing\_application\_enabled) | Specifies whether log publishing option for ES\_APPLICATION\_LOGS is enabled or not | `bool` | `false` | no |
| <a name="input_log_publishing_audit_cloudwatch_log_group_arn"></a> [log\_publishing\_audit\_cloudwatch\_log\_group\_arn](#input\_log\_publishing\_audit\_cloudwatch\_log\_group\_arn) | ARN of the CloudWatch log group to which log for AUDIT\_LOGS needs to be published | `string` | `""` | no |
| <a name="input_log_publishing_audit_enabled"></a> [log\_publishing\_audit\_enabled](#input\_log\_publishing\_audit\_enabled) | Specifies whether log publishing option for AUDIT\_LOGS is enabled or not | `bool` | `false` | no |
| <a name="input_log_publishing_index_cloudwatch_log_group_arn"></a> [log\_publishing\_index\_cloudwatch\_log\_group\_arn](#input\_log\_publishing\_index\_cloudwatch\_log\_group\_arn) | ARN of the CloudWatch log group to which log for INDEX\_SLOW\_LOGS needs to be published | `string` | `""` | no |
| <a name="input_log_publishing_index_enabled"></a> [log\_publishing\_index\_enabled](#input\_log\_publishing\_index\_enabled) | Specifies whether log publishing option for INDEX\_SLOW\_LOGS is enabled or not | `bool` | `false` | no |
| <a name="input_log_publishing_search_cloudwatch_log_group_arn"></a> [log\_publishing\_search\_cloudwatch\_log\_group\_arn](#input\_log\_publishing\_search\_cloudwatch\_log\_group\_arn) | ARN of the CloudWatch log group to which log for SEARCH\_SLOW\_LOGS needs to be published | `string` | `""` | no |
| <a name="input_log_publishing_search_enabled"></a> [log\_publishing\_search\_enabled](#input\_log\_publishing\_search\_enabled) | Specifies whether log publishing option for SEARCH\_SLOW\_LOGS is enabled or not | `bool` | `false` | no |
| <a name="input_node_to_node_encryption_enabled"></a> [node\_to\_node\_encryption\_enabled](#input\_node\_to\_node\_encryption\_enabled) | Whether to enable node-to-node encryption | `bool` | `false` | no |
| <a name="input_opensearch_subdomain_name"></a> [opensearch\_subdomain\_name](#input\_opensearch\_subdomain\_name) | The name of the subdomain for Opensearch in the DNS zone (\_e.g.\_ `opensearch`, `ui`, `ui-es`, `search-ui`) | `string` | `""` | no |
| <a name="input_opensearch_version"></a> [opensearch\_version](#input\_opensearch\_version) | Version of Opensearch to deploy (\_e.g.\_ `7.4`, `7.1`, `6.8`, `6.7`, `6.5`, `6.4`, `6.3`, `6.2`, `6.0`, `5.6`, `5.5`, `5.3`, `5.1`, `2.3`, `1.5` | `string` | `"7.4"` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security group IDs to be allowed to connect to the cluster | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | VPC Subnet IDs | `string` | `"subnet-3840f872"` | no |
| <a name="input_ui_bucket_name"></a> [ui\_bucket\_name](#input\_ui\_bucket\_name) | n/a | `string` | `"log_bucket"` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | n/a | `string` | `"acadian"` | no |
| <a name="input_user_password"></a> [user\_password](#input\_user\_password) | n/a | `string` | `"Test1234$$"` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | `string` | `"vpc-f80daf83"` | no |
| <a name="input_vpc_enabled"></a> [vpc\_enabled](#input\_vpc\_enabled) | Set to false if ES should be deployed outside of VPC. | `bool` | `true` | no |
| <a name="input_warm_count"></a> [warm\_count](#input\_warm\_count) | Number of UltraWarm nodes | `number` | `2` | no |
| <a name="input_warm_enabled"></a> [warm\_enabled](#input\_warm\_enabled) | Whether AWS UltraWarm is enabled | `bool` | `false` | no |
| <a name="input_warm_type"></a> [warm\_type](#input\_warm\_type) | Type of UltraWarm nodes | `string` | `"ultrawarm1.medium.opensearch"` | no |
| <a name="input_zone_awareness_enabled"></a> [zone\_awareness\_enabled](#input\_zone\_awareness\_enabled) | Enable zone awareness for Opensearch cluster | `bool` | `true` | no |

## Outputs

No outputs.
>>>>>>> cef6a1b209bdb34ab328e2249c68d18e95bf2d55:modules/centralized-logging-CM146/README.md
<!-- END_TF_DOCS -->