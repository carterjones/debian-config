#!/bin/bash
set -euxo pipefail

while read -r in; do
    code --install-extension "$in"
done < ./vscode/extensions.txt