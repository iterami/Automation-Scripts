#!/bin/sh
set -eu

# No args.
# Example usage: sh install.sh

# Install gdebi-core.
sudo apt-get install gdebi-core

# Download latest Minecraft.deb.
rm -f ~/Downloads/Minecraft.deb
wget -P ~/Downloads https://launcher.mojang.com/download/Minecraft.deb

# Install Minecraft.
sudo gdebi ~/Downloads/Minecraft.deb
