output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "A map of public subnets created in the VPC."
  value       = aws_subnet.public
}

output "private_subnets" {
  description = "A map of private subnets created in the VPC."
  value       = aws_subnet.private
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = aws_nat_gateway.this.id
}

output "flow_log_id" {
  description = "The ID of the VPC Flow Log."
  value       = var.enable_flow_logs ? aws_flow_log.this[0].id : null
}

output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group."
  value       = var.enable_flow_logs ? aws_cloudwatch_log_group.this[0].name : null
}
