#!/bin/bash

set -eux -o pipefail

# Compile bgrep.
gcc -O2 -x c -o ./bin/bgrep ./lib/bgrep/bgrep.c

# Move it to the user's bin folder.
mv ./bin/bgrep ~/bin/bgrep
chmod +x ~/bin/bgrep
