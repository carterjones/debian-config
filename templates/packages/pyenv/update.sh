#!/bin/bash
set -x

export PATH="${HOME}/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Refresh the local list of python versions.
pyenv update 1> /dev/null

# Identify the latest Python version.
latest_version=$(pyenv install --list | \
                       grep " 3." | \
                       grep -v [a-zA-Z] | \
                       tail -1 | \
                       sed "s/.* 3/3/")

# Install the latest Python version.
if [ $(uname) == Darwin ]; then
    if [ ! -f /usr/include/zlib.h ]; then
        sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
    fi
fi
pyenv install -s $latest_version | grep -v "python-build: use.*from homebrew"

# Set the latest Python version as the global default.
pyenv global $latest_version

# Upgrade pyenv-virtualenvwrapper.
pip3 install --upgrade virtualenvwrapper 1> /dev/null

# Upgrade pip.
pip3 install --upgrade pip 1> /dev/null