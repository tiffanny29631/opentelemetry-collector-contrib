#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")"/../.. && pwd)"
BUILD_DIR="$REPO_ROOT/configsync/build"
COMPONENT="otelcontribcol"

echo "Building docker image..."

docker build -f "${BUILD_DIR}/Dockerfile" -t "${COMPONENT}" "${REPO_ROOT}"

echo "Build and Docker steps complete."
