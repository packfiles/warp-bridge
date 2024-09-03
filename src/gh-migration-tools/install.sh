#!/bin/sh
set -e

su $_REMOTE_USER

# Install GEI
gh extension install github/gh-gei
gh extension install github/gh-ado2gh
gh extension install github/gh-bbs2gh

# Install GitHub Actions Importer
gh extension install github/gh-actions-importer

# GitHub Enterprise Server CLI
gh extension install github.com/github/gh-es

# GitHub Copilot CLI
gh extension install github/gh-copilot --force
