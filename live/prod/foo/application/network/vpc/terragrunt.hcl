# --------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform
# and OpenTofu that helps keep your code DRY and maintainable:
# https://github.com/gruntwork-io/terragrunt
# --------------------------------------------------------------------------

# Include the root `terragrunt.hcl` configuration. The root configuration contains settings that are common across all components and environments, such as how to configure remote state.
include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Include the aws provider configuration.
include "aws" {
  path = find_in_parent_folders("aws.hcl")

  # To reference the variables from the included config.
  expose = true
}

# Configure the module to use in this environment.
terraform {
  source = "${get_repo_root()}/modules/vpc"
}

# Include the app global variables.
locals {
  # Load the environment global variables.
  app_vars         = read_terragrunt_config(find_in_parent_folders("app.hcl"))
  application_name = local.app_vars.locals.vars.application_name
  tags = merge(
    include.aws.locals.tags,
    local.app_vars.locals.vars
  )
}

# Load the JSON file containing the inputs for the module and merge tags at runtime.
inputs = merge(
  {
    # Iterate over the rendered and parsed JSON from the templatefile.
    for key, value in jsondecode(templatefile("${get_terragrunt_dir()}/data.json", {
      environment_alias = include.aws.locals.environment_alias
      aws_region        = include.aws.locals.aws_region
      application_name  = local.application_name
    })) :
    key => (
      # For any top-level key that ends with "tags", merge shared/common tags with the original value.
      endswith(key, "tags") ? merge(local.tags, value) :

      # For the "private_subnets" list, merge shared tags into each subnet's tags block.
      key == "private_subnets" ? [
        for subnet in value : merge(subnet, {
          tags = merge(local.tags, subnet.tags)
        })
      ] :

      # For the "public_subnets" list, merge shared tags into each subnet's tags block.
      key == "public_subnets" ? [
        for subnet in value : merge(subnet, {
          tags = merge(local.tags, subnet.tags)
        })
      ] :

      # Default case: leave the value as-is.
      value
    )
  },
  # Extra manual tag-injected keys not present in the JSON
  {
    iam_role_tags   = local.tags,
    iam_policy_tags = local.tags
  }
)
