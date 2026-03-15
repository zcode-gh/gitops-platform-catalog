variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
}

variable "vpc_enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
}

variable "vpc_tags" {
  description = "The tags for the VPC"
  type        = map(string)
}

variable "igw_tags" {
  description = "Tags for the Internet Gateway"
  type        = map(string)
}

variable "nat_gateway_tags" {
  description = "Tags for the NAT Gateway"
  type        = map(string)
}

variable "eip_private_ip" {
  description = "The private IP address to associate with the EIP"
  type        = string
}

variable "eip_tags" {
  description = "Tags for the EIP"
  type        = map(string)
}

variable "public_route_cidr_block" {
  description = "CIDR block for the public route"
  type        = string
}

variable "public_route_table_tags" {
  description = "Tags for the public route table"
  type        = map(string)
}

variable "private_route_cidr_block" {
  description = "CIDR block for the private route"
  type        = string
}

variable "private_route_table_tags" {
  description = "Tags for the private route table"
  type        = map(string)
}

variable "public_subnets" {
  description = "List of public subnets with their settings"
  type = list(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    tags                    = map(string)
  }))
}

variable "private_subnets" {
  description = "List of private subnets with their settings"
  type = list(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    tags                    = map(string)
  }))
}

variable "flow_log_tags" {
  description = "Tags for the VPC Flow Logs"
  type        = map(string)
  default     = {}
}

variable "cloudwatch_log_group_tags" {
  description = "Tags for the CloudWatch Log Group"
  type        = map(string)
  default     = {}
}

variable "flow_log_role_name" {
  description = "The name of the IAM role for VPC Flow Logs"
  type        = string
  default     = null
}

variable "iam_role_tags" {
  description = "Tags for the IAM role"
  type        = map(string)
  default     = {}
}

variable "assume_role_policy_document" {
  description = "JSON of the policy document that grants an entity permission to assume the role"
  type        = any
  default = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
      }
    ]
  }
}

variable "iam_policy_tags" {
  description = "Tags for the IAM policy"
  type        = map(string)
  default     = {}
}

variable "policy_document" {
  description = "JSON of the policy document"
  type        = any
  default = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  }
}

variable "flow_log_policy_name" {
  description = "The name of the IAM policy for VPC Flow Logs"
  type        = string
  default     = null
}

variable "traffic_type" {
  description = "The type of traffic to log. Valid values are ACCEPT, REJECT, or ALL."
  type        = string
  default     = "ALL"
}

variable "log_destination_type" {
  description = "The type of destination for the flow log. Valid values are cloud-watch-logs or s3."
  type        = string
  default     = "cloud-watch-logs"
}

variable "cloudwatch_log_group_retention_in_days" {
  description = "The retention period for the CloudWatch Log Group in days"
  type        = number
  default     = 0
}

variable "enable_flow_logs" {
  description = "Enable VPC Flow Logs."
  type        = bool
  default     = false
}

variable "public_nacl_rules" {
  description = "List of rules for the public network ACL"
  type = list(object({
    rule_number = number
    egress      = bool
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
  default = []
}

variable "private_nacl_rules" {
  description = "List of rules for the private network ACL"
  type = list(object({
    rule_number = number
    egress      = bool
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
  default = []
}

variable "public_network_acl_tags" {
  description = "Tags for the public network ACL"
  type        = map(string)
  default     = {}
}

variable "private_network_acl_tags" {
  description = "Tags for the private network ACL"
  type        = map(string)
  default     = {}
}
