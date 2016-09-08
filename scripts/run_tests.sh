#!/usr/bin/env bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

errors=()
test_suits_runned=0
tests_runned=0

push_error() {
  errors+=("$1")
}

has_errors() {
  [[ ${#errors[@]} -gt 0 ]]
}

increment_test_suits_runned() {
  ((test_suits_runned++))
}

increment_tests_runned() {
  ((tests_runned++))
}

print_title() {
  printf "\n%s:\n" "$1"
}

print_success() {
  printf "${GREEN}%s${NO_COLOR}" "."
}

print_error() {
  printf "${RED}%s${NO_COLOR}" "F"
}

print_status() {
  color=$1
  printf "${color}%d suits, %d tests, %d failures${NO_COLOR}\n" "$test_suits_runned" "$tests_runned" "${#errors[@]}"
}

print_failures() {
  printf "\n"
  for index in "${!errors[@]}"; do
    printf "${RED}\t%2d) %s${NO_COLOR}\n\n" "$((index + 1))" "${errors[$index]}"
  done
}

print_summary() {
  if has_errors; then
    print_status "$RED"
    print_title "Failures"
    print_failures
  else
    print_status "$GREEN"
  fi
}

main() {
  START_TIME=$(date +%s)

  # Run all test suits
  for test_file in $ROOT_DIR/system/macOS/tests/*; do
    increment_test_suits_runned
    # shellcheck disable=SC1090
    source "$test_file"
  done

  END_TIME=$(date +%s)
  printf "\nFinished in %f seconds\n" "$((END_TIME - START_TIME))"

  print_summary
}

main "$@"
