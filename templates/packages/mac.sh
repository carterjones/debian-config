#!/bin/bash
set -euxo pipefail

# shellcheck source=./templates/packages/common.sh
source ./common.sh

# Install XCode before running brew commands.
install_pkg_for_env xcode mac

brew update
brew upgrade

brew install \
    fzf \
    git \
    go \
    jq \
    reattach-to-user-namespace \
    packer \
    pyenv \
    pyenv-virtualenvwrapper \
    ranger \
    the_silver_searcher \
    tmux \
    tree \
    vagrant-completion \
    wget \
    zsh

brew cask install \
    docker \
    emacs \
    vagrant \
    visual-studio-code

brew cleanup 1> /dev/null

# Install additional packages.
install_pkg_for_env docker mac
install_pkg_for_env hack-font mac
install_pkg_for_env vscode mac

# Hide all icons from the desktop.
defaults write com.apple.finder CreateDesktop -bool false
