#!/bin/bash
# Created by Jacob Strieb

# Global variables
RES_DIR=resources
SITE_DIR=jstrieb.github.io
SRC_DIR=md

# Exit immediately if anything fails
set -e

# If pandoc isn't installed, abort
if [ ! $(which pandoc) ]; then
  echo \
"Pandoc must be installed to use this script. To install it on a Debian-based
Linux computer (e.g., Ubuntu), do:   sudo apt install pandoc"
  exit
fi
