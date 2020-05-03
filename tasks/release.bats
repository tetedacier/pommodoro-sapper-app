#!/usr/bin/env bats

@test "running release task without level should fails and show the reason of error" {
  run ./tasks/release.sh
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "You must provide a release level (see below for allowed release level)" ]
}

wrong_release_level="p"

@test "running release task with a wrong level should fails and show the reason of error" {
  run ./tasks/release.sh ${wrong_release_level}
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Given level \`${wrong_release_level}\` is not in the allowed range (see below for allowed increase level)" ]
}
