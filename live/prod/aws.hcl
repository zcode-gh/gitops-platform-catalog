# --------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform/OpenTofu that provides extra
# tools for working with multiple modules,
# remote state and locking: https://github.com/gruntwork-io/terragrunt
# --------------------------------------------------------------------------

# Global variables for all AWS terraform modules.
locals {
  # Load the environment global variables.
  env_vars          = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  environment_name  = local.env_vars.locals.vars.environment_name
  environment_alias = local.env_vars.locals.vars.environment_alias


  # Load AWS variables from the aws.json file.
  aws_vars = jsondecode(templatefile("./_env/aws.json", {
    environment_name = local.environment_name
  }))
  aws_region = local.aws_vars.region
  tags       = local.aws_vars.tags
}

# Generate an AWS provider block.
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  access_key = "foo"
  secret_key = "bar"

  endpoints {
    ec2        = "http://localhost:4566" // for vpc deployment
    cloudwatch = "http://localhost:4566" // for cloudwatch deployment
    logs       = "http://localhost:4566" // for logs deployment
    iam        = "http://localhost:4566" // for iam deployment
  }
}
EOF
}
