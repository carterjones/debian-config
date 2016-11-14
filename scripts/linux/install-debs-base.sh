#!/bin/bash

set -eux -o pipefail

# Set up apt repository for the latest version of tmux.
sudo add-apt-repository -y ppa:pi-rho/dev

# Update before any packages are installed.
sudo apt-get update

# Base packages.
PACKAGES="build-essential"

# Useful utilities.
PACKAGES="${PACKAGES}
	ack-grep
	tmux
	whois"

# golang packages.
PACKAGES="${PACKAGES}
	golang"

# Install the packages.
sudo apt-get install -y ${PACKAGES}
