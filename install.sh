#!/bin/bash
# Bootstrap a fresh Arch install:
#   bash <(curl -fsSL https://raw.githubusercontent.com/ericmurphyxyz/dotfiles/niri/install.sh)
set -e

sudo pacman -Syu --needed --noconfirm git base-devel chezmoi

if ! command -v paru >/dev/null; then
  git clone https://aur.archlinux.org/paru-bin.git /tmp/paru-bin
  (cd /tmp/paru-bin && makepkg -si --noconfirm)
fi

chezmoi init --apply --branch niri ericmurphyxyz

data=~/.local/bin/data
sudo pacman -S --needed --noconfirm - < "$data/packages.txt"
paru -S --needed --noconfirm - < "$data/aur-packages.txt"

systemctl --user enable battery-alert.timer
chsh -s /bin/zsh
