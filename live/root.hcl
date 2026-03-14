# --------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform/OpenTofu that provides extra
# tools for working with multiple modules,
# remote state and locking: https://github.com/gruntwork-io/terragrunt
# --------------------------------------------------------------------------
# Configure Terragrunt to automatically store tfstate files.

remote_state {
  backend = "local"
  config  = {}
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
