#!/bin/bash

if [[ "$SKIP" == "enable_pre_commit" ]]; then
    echo "Skipping pre-commit.."
else
    bash tools/enable_pre_commit.sh
fi

if [[ "$SKIP" == "check_binary_files" ]]; then
    echo "Skipping check-binary-files.."
else
    bash tools/check_binary_files.sh
fi

if [[ "$SKIP" == "enable_direnv" ]]; then
    echo "Skipping enable-direnv.."
else
    bash tools/enable_direnv.sh
fi

if [[ "$SKIP" == "install_npm_dependencies" ]]; then
    echo "Skipping install-npm-dependencies.."
else
    bash tools/install_npm_dependencies.sh
fi
