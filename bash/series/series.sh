#!/usr/bin/env bash

main() {
    local sequence="${1}"
    local subsequence_length="${2}"

    [ "${subsequence_length}" -gt 0 ] || {
        [ "${subsequence_length}" -eq 0 ] && {
            echo "slice length cannot be zero" && exit 1;
        }
        [ "${subsequence_length}" -lt 0 ] && {
            echo "slice length cannot be negative" && exit 1;
        }
    }

    local sequence_length="${#sequence}"

    [ "${sequence_length}" -gt 0 ] || {
        [ "${sequence_length}" -eq 0 ] && { echo "series cannot be empty" && exit 1; }
    }

    [ "${sequence_length}" -ge "${subsequence_length}" ] || {
        echo "slice length cannot be greater than series length" && exit 1;
    }

    local nslices="$((sequence_length - subsequence_length + 1))"

    declare -a subsequences
    for (( idx=0; idx<nslices; idx++)); do
        subsequence="${sequence:idx:subsequence_length}"
        subsequences+=("${subsequence}")
    done
    echo "${subsequences[*]}"
}

main "$@"
