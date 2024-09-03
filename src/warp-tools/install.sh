#!/bin/sh
set -e

: "${_REMOTE_USER_HOME:=/home/$_REMOTE_USER}"

if ! id "$_REMOTE_USER" >/dev/null 2>&1; then
    useradd -m -s /bin/bash "$_REMOTE_USER"
fi

mkdir -p $_REMOTE_USER_HOME/.local/share/gh/extensions

# Exporting this environment variable is necessary to skip the 
# GitHub CLI's built-in authorization check. The host doesn't
# matter.
export GH_HOST=skip-gh-cli-auth-check.github.com

# Install gh pack
gh extension install github.com/packfiles/gh-pack
cp -r /root/.local/share/gh/extensions/gh-pack $_REMOTE_USER_HOME/.local/share/gh/extensions

chown -R $_REMOTE_USER:$_REMOTE_USER $_REMOTE_USER_HOME
