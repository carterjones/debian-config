#!/bin/bash
set -eux -o pipefail

source ./common.sh
install_pkg_for_env hack-font linux
install_pkg_for_env ipv6 linux
install_pkg_for_env vscode linux
