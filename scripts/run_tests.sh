#!/usr/bin/env bash

# Colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export NO_COLOR='\033[0m'

# DIR="$(dirname "$0")"
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

for test_file in $ROOT_DIR/system/macOS/tests/*; do
  # shellcheck disable=SC1090
  source "$test_file"
done
