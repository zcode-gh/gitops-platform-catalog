#!/bin/bash

# Bash safety flags:
# -e: exit on any error
# -u: treat unset variables as an error and exit
# -o pipefail: fail if any command in a pipeline fails
set -euo pipefail

# Set the Github repository directory
GIT_ROOT_DIR=$(git rev-parse --show-toplevel)

# Set the Github runner os-type
RUNNER_OSTYPE=linux-gnu

# ---------------------------------------------
# List for AMD64 machines
# ---------------------------------------------
# TERRAFORM from https://releases.hashicorp.com/terraform
# TERRAFORM_VERSION=1.10.5

# for Linux local machine
# curl -L "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -o "${GIT_ROOT_DIR}/bin/terraform_${TERRAFORM_VERSION}_${OSTYPE}.zip"

# for Windows local machine
# curl -L "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_windows_amd64.zip" -o "${GIT_ROOT_DIR}/bin/terraform_${TERRAFORM_VERSION}_${OSTYPE}.zip"

# for MacOS local machine
# curl -L "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_darwin_amd64.zip" -o "${GIT_ROOT_DIR}/bin/terraform_${TERRAFORM_VERSION}_${OSTYPE}.zip"

# For Github runner pipeline
# curl -L "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -o "${GIT_ROOT_DIR}/bin/terraform_${TERRAFORM_VERSION}_${RUNNER_OSTYPE}.zip"

# ---------------------------------------------
# TFLINT from https://github.com/terraform-linters/tflint/tags
# ---------------------------------------------
# TFLINT_VERSION=0.55.1

# for Linux local machine
# curl -L https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip" -o "${GIT_ROOT_DIR}/bin/tflint_${TFLINT_VERSION}_${OSTYPE}.zip"

# for Windows local machine
# curl -L "https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_windows_amd64.zip" -o "${GIT_ROOT_DIR}/bin/tflint_${TFLINT_VERSION}_${OSTYPE}.zip"

# for MacOS local machine
# curl -L "https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_darwin_amd64.zip" -o "${GIT_ROOT_DIR}/bin/tflint_${TFLINT_VERSION}_${OSTYPE}.zip"

# For Github runner pipeline
# curl -L "https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip" -o "${GIT_ROOT_DIR}/bin/tflint_${TFLINT_VERSION}_${RUNNER_OSTYPE}.zip"

# ---------------------------------------------
# TRIVY from https://github.com/aquasecurity/trivy/tags
# ---------------------------------------------
# TRIVY_VERSION=0.69.3

# for Linux local machine
# curl -L "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz" -o "${GIT_ROOT_DIR}/bin/trivy_${TRIVY_VERSION}_${OSTYPE}.tar.gz"

# for Windows local machine
# curl -L "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_windows-64bit.zip" -o "${GIT_ROOT_DIR}/bin/trivy_${TRIVY_VERSION}_${OSTYPE}.zip"

# for MacOS local machine
# curl -L "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_macOS-64bit.tar.gz" -o "${GIT_ROOT_DIR}/bin/trivy_${TRIVY_VERSION}_${OSTYPE}.tar.gz"

# For Github runner pipeline
# curl -L "https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz" -o "${GIT_ROOT_DIR}/bin/trivy_${TRIVY_VERSION}_${RUNNER_OSTYPE}.tar.gz"

# ---------------------------------------------
# TERRAFORM-DOCS from https://github.com/terraform-docs/terraform-docs/tags
# TERRAFORM_DOCS_VERSION=0.20.0

# for Linux local machine
# curl -L "https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz" -o "${GIT_ROOT_DIR}/bin/terraform-docs-v${TERRAFORM_DOCS_VERSION}-${OSTYPE}.tar.gz"

# for Windows local machine
# curl -L "https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-windows-amd64.zip" -o "${GIT_ROOT_DIR}/bin/terraform-docs-v${TERRAFORM_DOCS_VERSION}-${OSTYPE}.zip"

# for MacOS local machine
# curl -L "https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-darwin-amd64.tar.gz" -o "${GIT_ROOT_DIR}/bin/terraform-docs-v${TERRAFORM_DOCS_VERSION}-${OSTYPE}.tar.gz"

# For Github runner pipeline
# curl -L "https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz" -o "${GIT_ROOT_DIR}/bin/terraform-docs-v${TERRAFORM_DOCS_VERSION}-${RUNNER_OSTYPE}.tar.gz"

# ---------------------------------------------
# TERRAGRUNT from https://github.com/gruntwork-io/terragrunt/tags
# TERRAGRUNT_VERSION=0.77.17

# for Linux local machine
# curl -L "https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64" -o "${GIT_ROOT_DIR}/bin/terragrunt"

# for Windows local machine
# curl -L "https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_windows_amd64.exe" -o "${GIT_ROOT_DIR}/bin/terragrunt.exe"

# for MacOS local machine
# curl -L "https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_darwin_amd64" -o "${GIT_ROOT_DIR}/bin/terragrunt"

# For Github runner pipeline
# curl -L "https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64" -o "${GIT_ROOT_DIR}/bin/terragrunt_${RUNNER_OSTYPE}"

# ---------------------------------------------
# INFRACOST from https://github.com/infracost/infracost/tags
INFRACOST_VERSION=0.10.42

# for Linux local machine
# curl -L "https://github.com/infracost/infracost/releases/download/v${INFRACOST_VERSION}/infracost-linux-amd64.tar.gz" -o "${GIT_ROOT_DIR}/bin/infracost-${INFRACOST_VERSION}-${OSTYPE}.tar.gz"

# for Windows local machine
curl -L "https://github.com/infracost/infracost/releases/download/v${INFRACOST_VERSION}/infracost-windows-amd64.zip" -o "${GIT_ROOT_DIR}/bin/infracost-${INFRACOST_VERSION}-${OSTYPE}.zip"

# for MacOS local machine
# curl -L "https://github.com/infracost/infracost/releases/download/v${INFRACOST_VERSION}/infracost-darwin-amd64.tar.gz" -o "${GIT_ROOT_DIR}/bin/infracost-${INFRACOST_VERSION}-${OSTYPE}.tar.gz"

# For Github runner pipeline
curl -L "https://github.com/infracost/infracost/releases/download/v${INFRACOST_VERSION}/infracost-linux-amd64.tar.gz" -o "${GIT_ROOT_DIR}/bin/infracost-${INFRACOST_VERSION}-${RUNNER_OSTYPE}.tar.gz"
