#!/bin/bash

set -e

check_dependency() {
  local DEPENDANCY="${1}"
  command -v "${DEPENDANCY}" >/dev/null 2>&1 || err "${DEPENDANCY} is required but not installed.  Aborting."
}

err() {
  echo -e "[ERR] ${1}"
  exit 1
}

log() {
  echo -e "[LOG] ${1}"
}

main () {
  check_dependency docker
  export APP="k8s-jenkins-pipeline-tester"
  export REPO="microdc"
  export VERSION="${VERSION-latest}"
  log "creating local build"
  docker build --rm -t "${REPO}/${APP}:${VERSION}" -t "${REPO}/${APP}:latest" .
  log "done!"
}

main "$@"
