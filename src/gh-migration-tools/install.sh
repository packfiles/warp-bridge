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

# Install GEI
gh extension install github.com/github/gh-gei
cp -r /root/.local/share/gh/extensions/gh-gei $_REMOTE_USER_HOME/.local/share/gh/extensions

gh extension install github.com/github/gh-ado2gh
cp -r /root/.local/share/gh/extensions/gh-ado2gh $_REMOTE_USER_HOME/.local/share/gh/extensions

gh extension install github.com/github/gh-bbs2gh
cp -r /root/.local/share/gh/extensions/gh-bbs2gh $_REMOTE_USER_HOME/.local/share/gh/extensions

# Install GitHub Actions Importer
gh extension install github.com/github/gh-actions-importer
cp -r /root/.local/share/gh/extensions/gh-actions-importer $_REMOTE_USER_HOME/.local/share/gh/extensions

# GitHub Enterprise Server CLI
gh extension install github.com/github/gh-es
cp -r /root/.local/share/gh/extensions/gh-es $_REMOTE_USER_HOME/.local/share/gh/extensions

# GitHub Copilot CLI
gh extension install github.com/github/gh-copilot --force
cp -r /root/.local/share/gh/extensions/gh-es $_REMOTE_USER_HOME/.local/share/gh/extensions

chown -R $_REMOTE_USER:$_REMOTE_USER $_REMOTE_USER_HOME
