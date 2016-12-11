#!/bin/bash

set -eux -o pipefail

# Set up apt repository for the latest version of tmux.
sudo add-apt-repository -y ppa:pi-rho/dev

# Set up apt repository for the latest version of emacs.
sudo add-apt-repository -y ppa:ubuntu-elisp

# Update before any packages are installed.
sudo apt-get update

# Base packages.
PACKAGES="build-essential"

# Useful utilities.
PACKAGES="${PACKAGES}
    ack-grep
    emacs-snapshot
    git
    meld
    tmux
    whois"

# Install the packages.
sudo apt-get install -y ${PACKAGES}

# Remove unneeded packages.
sudo apt-get autoremove -y
