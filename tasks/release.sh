#!/usr/bin/env bash

# TODO:
# - write change log extraction from commit history => hint a npm exists to allow this
release_level=${1:-}
allowed_level=("patch" "minor" "major");
check_release_level () {
    tested_level=${1:-}
    for level in "${allowed_level[@]}"; do
        if [[ "${level}" == "${tested_level}" ]]; then
            return 0
        fi
    done
    return 1
}
update_package () {
    package_path="${1:-}"
    package_version="${2:-}"
    package_content="$(jq '.version = "'"${package_version}"'"' < "${package_path}")"
    echo "${package_content}"> "${package_path}"
}
usage() {
    reason=${1:-}
    if [[ -n "${reason}" ]]; then
        echo "${reason}"
        echo
    fi

    cat << USAGE
Increment \`package.json\` and \`package-lock.json\` version according to the given level.

Usage:
- ./task/realease.sh <release_level>
- ./task/realease.sh -h
- ./task/realease.sh --help

Where <release_level> is one of:
$(for level in "${allowed_level[@]}"; do
    echo "- ${level}";
done )

See https://semver.org/ for those level meaning
USAGE
}

if [[ "${release_level}" == '--help' ]] || [[ "${release_level}" == '-h' ]]; then
    usage
    exit 0
fi

if [[ -z "${release_level}" ]]; then
    usage "You must provide a release level (see below for allowed release level)"
    exit 1
fi

check_release_level "${release_level}"
if [[ "$?" == "1" ]]; then
    usage "Given level \`${release_level}\` is not in the allowed range (see below for allowed increase level)"
    exit 1
fi

new_release_version="$(./node_modules/.bin/semver  -i "${release_level}" "$(jq -r '.version' < package.json)")"

update_package "package.json" "${new_release_version}"
update_package "package-lock.json" "${new_release_version}"

