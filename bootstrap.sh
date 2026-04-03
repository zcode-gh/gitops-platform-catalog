#!/bin/bash

# Bash safety flags:
# -e: exit on any error
# -u: treat unset variables as an error and exit
# -o pipefail: fail if any command in a pipeline fails
set -euo pipefail

WORKSPACE_DIR=$(git rev-parse --show-toplevel)
BOOTSTRAP_DIR="${WORKSPACE_DIR}/tools/bootstrap"

SKIP=${SKIP:-""}

if [[ "$SKIP" =~ "init_git_submodule" ]]; then
    echo "Skipping git submodule init.."
else
    bash "${BOOTSTRAP_DIR}"/init_git_submodule.sh
fi

if [[ "$SKIP" =~ "enable_pre_commit" ]]; then
    echo "Skipping pre-commit.."
else
    bash "${BOOTSTRAP_DIR}"/enable_pre_commit.sh
fi

if [[ "$SKIP" =~ "check_binary_files" ]]; then
    echo "Skipping check-binary-files.."
else
    bash "${BOOTSTRAP_DIR}"/check_binary_files.sh
fi

if [[ "$SKIP" =~ "enable_direnv" ]]; then
    echo "Skipping enable-direnv.."
else
    bash "${BOOTSTRAP_DIR}"/enable_direnv.sh
fi

if [[ "$SKIP" =~ "install_npm_dependencies" ]]; then
    echo "Skipping install-npm-dependencies.."
else
    bash "${BOOTSTRAP_DIR}"/install_npm_dependencies.sh
fi
