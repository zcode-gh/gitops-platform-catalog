<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.10.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.89.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.89.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_flow_log.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_network_acl.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_network_acl.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_network_acl_rule.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_policy_document"></a> [assume\_role\_policy\_document](#input\_assume\_role\_policy\_document) | JSON of the policy document that grants an entity permission to assume the role | `any` | <pre>{<br/>  "Statement": [<br/>    {<br/>      "Action": "sts:AssumeRole",<br/>      "Effect": "Allow",<br/>      "Principal": {<br/>        "Service": "vpc-flow-logs.amazonaws.com"<br/>      }<br/>    }<br/>  ],<br/>  "Version": "2012-10-17"<br/>}</pre> | no |
| <a name="input_cloudwatch_log_group_retention_in_days"></a> [cloudwatch\_log\_group\_retention\_in\_days](#input\_cloudwatch\_log\_group\_retention\_in\_days) | The retention period for the CloudWatch Log Group in days | `number` | `0` | no |
| <a name="input_cloudwatch_log_group_tags"></a> [cloudwatch\_log\_group\_tags](#input\_cloudwatch\_log\_group\_tags) | Tags for the CloudWatch Log Group | `map(string)` | `{}` | no |
| <a name="input_eip_private_ip"></a> [eip\_private\_ip](#input\_eip\_private\_ip) | The private IP address to associate with the EIP | `string` | n/a | yes |
| <a name="input_eip_tags"></a> [eip\_tags](#input\_eip\_tags) | Tags for the EIP | `map(string)` | n/a | yes |
| <a name="input_enable_flow_logs"></a> [enable\_flow\_logs](#input\_enable\_flow\_logs) | Enable VPC Flow Logs. | `bool` | `false` | no |
| <a name="input_flow_log_policy_name"></a> [flow\_log\_policy\_name](#input\_flow\_log\_policy\_name) | The name of the IAM policy for VPC Flow Logs | `string` | `null` | no |
| <a name="input_flow_log_role_name"></a> [flow\_log\_role\_name](#input\_flow\_log\_role\_name) | The name of the IAM role for VPC Flow Logs | `string` | `null` | no |
| <a name="input_flow_log_tags"></a> [flow\_log\_tags](#input\_flow\_log\_tags) | Tags for the VPC Flow Logs | `map(string)` | `{}` | no |
| <a name="input_iam_policy_tags"></a> [iam\_policy\_tags](#input\_iam\_policy\_tags) | Tags for the IAM policy | `map(string)` | `{}` | no |
| <a name="input_iam_role_tags"></a> [iam\_role\_tags](#input\_iam\_role\_tags) | Tags for the IAM role | `map(string)` | `{}` | no |
| <a name="input_igw_tags"></a> [igw\_tags](#input\_igw\_tags) | Tags for the Internet Gateway | `map(string)` | n/a | yes |
| <a name="input_log_destination_type"></a> [log\_destination\_type](#input\_log\_destination\_type) | The type of destination for the flow log. Valid values are cloud-watch-logs or s3. | `string` | `"cloud-watch-logs"` | no |
| <a name="input_nat_gateway_tags"></a> [nat\_gateway\_tags](#input\_nat\_gateway\_tags) | Tags for the NAT Gateway | `map(string)` | n/a | yes |
| <a name="input_policy_document"></a> [policy\_document](#input\_policy\_document) | JSON of the policy document | `any` | <pre>{<br/>  "Statement": [<br/>    {<br/>      "Action": [<br/>        "logs:CreateLogGroup",<br/>        "logs:CreateLogStream",<br/>        "logs:PutLogEvents",<br/>        "logs:DescribeLogGroups",<br/>        "logs:DescribeLogStreams"<br/>      ],<br/>      "Effect": "Allow",<br/>      "Resource": "*"<br/>    }<br/>  ],<br/>  "Version": "2012-10-17"<br/>}</pre> | no |
| <a name="input_private_nacl_rules"></a> [private\_nacl\_rules](#input\_private\_nacl\_rules) | List of rules for the private network ACL | <pre>list(object({<br/>    rule_number = number<br/>    egress      = bool<br/>    protocol    = string<br/>    rule_action = string<br/>    cidr_block  = string<br/>    from_port   = number<br/>    to_port     = number<br/>  }))</pre> | `[]` | no |
| <a name="input_private_network_acl_tags"></a> [private\_network\_acl\_tags](#input\_private\_network\_acl\_tags) | Tags for the private network ACL | `map(string)` | `{}` | no |
| <a name="input_private_route_cidr_block"></a> [private\_route\_cidr\_block](#input\_private\_route\_cidr\_block) | CIDR block for the private route | `string` | n/a | yes |
| <a name="input_private_route_table_tags"></a> [private\_route\_table\_tags](#input\_private\_route\_table\_tags) | Tags for the private route table | `map(string)` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnets with their settings | <pre>list(object({<br/>    cidr_block              = string<br/>    availability_zone       = string<br/>    map_public_ip_on_launch = bool<br/>    tags                    = map(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_public_nacl_rules"></a> [public\_nacl\_rules](#input\_public\_nacl\_rules) | List of rules for the public network ACL | <pre>list(object({<br/>    rule_number = number<br/>    egress      = bool<br/>    protocol    = string<br/>    rule_action = string<br/>    cidr_block  = string<br/>    from_port   = number<br/>    to_port     = number<br/>  }))</pre> | `[]` | no |
| <a name="input_public_network_acl_tags"></a> [public\_network\_acl\_tags](#input\_public\_network\_acl\_tags) | Tags for the public network ACL | `map(string)` | `{}` | no |
| <a name="input_public_route_cidr_block"></a> [public\_route\_cidr\_block](#input\_public\_route\_cidr\_block) | CIDR block for the public route | `string` | n/a | yes |
| <a name="input_public_route_table_tags"></a> [public\_route\_table\_tags](#input\_public\_route\_table\_tags) | Tags for the public route table | `map(string)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of public subnets with their settings | <pre>list(object({<br/>    cidr_block              = string<br/>    availability_zone       = string<br/>    map_public_ip_on_launch = bool<br/>    tags                    = map(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_traffic_type"></a> [traffic\_type](#input\_traffic\_type) | The type of traffic to log. Valid values are ACCEPT, REJECT, or ALL. | `string` | `"ALL"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_vpc_enable_dns_hostnames"></a> [vpc\_enable\_dns\_hostnames](#input\_vpc\_enable\_dns\_hostnames) | A boolean flag to enable/disable DNS hostnames in the VPC | `bool` | n/a | yes |
| <a name="input_vpc_enable_dns_support"></a> [vpc\_enable\_dns\_support](#input\_vpc\_enable\_dns\_support) | A boolean flag to enable/disable DNS support in the VPC | `bool` | n/a | yes |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | The tags for the VPC | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_log_group_name"></a> [cloudwatch\_log\_group\_name](#output\_cloudwatch\_log\_group\_name) | The name of the CloudWatch Log Group. |
| <a name="output_flow_log_id"></a> [flow\_log\_id](#output\_flow\_log\_id) | The ID of the VPC Flow Log. |
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | The ID of the Internet Gateway. |
| <a name="output_nat_gateway_id"></a> [nat\_gateway\_id](#output\_nat\_gateway\_id) | The ID of the NAT Gateway. |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | A map of private subnets created in the VPC. |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | A map of public subnets created in the VPC. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the created VPC. |
<!-- END_TF_DOCS -->
