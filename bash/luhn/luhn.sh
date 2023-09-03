#!/usr/bin/env bash

# Don't use -e since we handle errors via falsey output.
set -uo pipefail

_make_below_ten() {
    local num="${1}"
    (( num > 9 )) && { echo "$(( num - 9 ))" && return; }
    echo "${num}"
}

# https://unix.stackexchange.com/a/412919/
reverse() {
    # first argument is the array to reverse
    # second is the output array
    declare -n arr="$1" rev="$2"
    for i in "${arr[@]}"
    do
        rev=("$i" "${rev[@]}")
    done
}

_scale_every_enth() {
    # shellcheck disable=SC2034
    local -n result="${1}"
    # shellcheck disable=SC2155
    local digits="${2}"
    local scale="${3}"
    local enth="${4}"
    declare result_unrev
    local len="${#digits}"
    local idx=0
    local rev_digits=""
    # https://stackoverflow.com/a/34668251/
    while (( idx<len )); do rev_digits="${digits:idx++:1}${rev_digits}"; done
    # Translation from Python:
    # reversed(
    #     [
    #         num * ((scale * (not (idx - 1) % enth)) or 1)
    #         for idx, num in enumerate(reversed(nums))
    #     ]
    # )
    for (( idx=0; idx<len; idx++ )); do
        digit="${rev_digits:${idx}:1}"
        mod="$(( (idx - 1) % enth ))"
        not="$(( mod == 0 ))"
        scaled="$(( scale * not ))"
        scaled="$(( scaled == 0 ? 1 : scaled ))"
        scaled="$(( digit * scaled ))"
        result_unrev+=("${scaled}")
    done
    reverse result_unrev result
}

main() {
    local digits="${1// /}"
    # Guidance on operator precedence: https://unix.stackexchange.com/a/88851/
    [[ "${digits}" =~ ^[0-9]{2,}$ ]] || { echo "false" && return; }
    local scaled_digits
    _scale_every_enth scaled_digits "${digits}" 2 2
    declare -a reduced_digits
    # shellcheck disable=SC2068
    for scaled_digit in ${scaled_digits[@]}; do
        reduced_digits+=("$(_make_below_ten "${scaled_digit}")")
    done
    # https://stackoverflow.com/a/13635566/
    sum=$(IFS=+; echo "$((${reduced_digits[*]}))")
    (( (sum % 10) == 0 )) && echo "true" || echo "false"
}

main "$@"
