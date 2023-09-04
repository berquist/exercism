#!/usr/bin/env bash

main() {
    local input="${1}"
    input_seconds="$(date --date="${input}" --utc +%s)"
    output_seconds="$(( input_seconds + 1000000000 ))"
    date --date="@${output_seconds}" --utc +%Y-%m-%dT%T
}

main "$@"
