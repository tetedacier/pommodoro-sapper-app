#!/usr/bin/env bash

release_level=${1:-}
allowed_level=("patch" "minor" "major");
check_release_level () {
    tested_level=${1:-}
    for level in ${allowed_level[@]}; do
        if [[ "${level}" == "${tested_level}" ]]; then
            return 0
        fi
    done
    return 1
}

usage() {
    reason=${1:-}
    if [[ ! -z "${reason}" ]]; then
        echo "${reason}"
        echo
    fi
    cat << USAGE
Usage:
- ./task/realease.sh <release_level>
- ./task/realease.sh -h
- ./task/realease.sh --help

Where <release_level> is one of:
    ${allowed_level[@]}

See https://semver.org/ for those level meaning

Increment \`package.json\` and \`package-lock.json\` version according to the given level.
USAGE
}

if [[ "${release_level}" == '--help' ]] || [[ "${release_level}" == '-h' ]]; then
    usage
    exit 0
fi

if [[ -z "${release_level}" ]]; then
    usage "You must provide a release level (see below for allowed increase level)"
    exit 1
fi

check_release_level "${release_level}"
if [[ "$?" == "1" ]]; then
    usage "Given level \`${release_level}\` is not in the allowed range (see below for allowed increase level)"
    exit 1
fi

new_release_version="$(./node_modules/.bin/semver  -i ${release_level} $(jq -r '.version' < package.json))"

# write new version in package's files

echo "$(jq '.version = "'${new_release_version}'"' < package.json)">package.json
echo "$(jq '.version = "'${new_release_version}'"' < package-lock.json)">package-lock.json

