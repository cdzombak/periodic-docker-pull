#!/usr/bin/env bash
set -euo pipefail

__PULLSH_VERSION__="<dev>"

if [ $# -eq 1 ]; then
  if [ "$1" = "-v" ] || [ "$1" = "--version" ] || [ "$1" = "version" ]; then
    echo "$__PULLSH_VERSION__"
    exit 0
  else
    echo "unsupported option '$1'"
    exit 1
  fi
elif [ $# -ne 0 ]; then
  echo "unsupported option '$1'"
  exit 1
fi

if [ ! -f "$HOME/.config/periodic-docker-pull.txt" ]; then
  echo "[!] Place a list of images to be pulled at $HOME/.config/periodic-docker-pull.txt"
  exit 1
fi

while read -r IMAGENAME; do
  if [ -z "$IMAGENAME" ]; then
  	continue
  fi
  docker pull "$IMAGENAME"
done < "$HOME/.config/periodic-docker-pull.txt"

if [ ! -f "$HOME/.config/periodic-docker-pull-no-prune" ]; then
  docker image prune -f
fi
