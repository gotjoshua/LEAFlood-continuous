#!/usr/bin/env sh
export LD_LIBRARY_PATH="/nix/store/ks2yg1w4b3qaxqvs2bgg1b1qy0zhczqc-zlib-1.3.1/lib:$LD_LIBRARY_PATH"
exec .devenv/state/venv/bin/python LEAFlood.py "$@"
