#!/bin/sh
set -e

su $_REMOTE_USER

# Install gh pack
gh extension install packfiles/gh-pack
