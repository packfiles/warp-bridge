#!/bin/bash
set -e

source dev-container-features-test-lib

check "execute command" bash -c "gh pack -v"

check "execute command" bash -c "gh actions-importer version"

check "execute command" bash -c "gh gei --version"
check "execute command" bash -c "gh ado2gh --version"
check "execute command" bash -c "gh bbs2gh --version"

check "execute command" bash -c "gh es"

check "execute command" bash -c "gh copilot --version"

reportResults
