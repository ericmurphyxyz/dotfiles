#!/bin/bash
# Bootstraps a fresh Arch install with all my stuff
# bash <(curl -fsSL https://raw.githubusercontent.com/ericmurphyxyz/dotfiles/niri/install.sh)
set -e

sudo pacman -Syu --needed --noconfirm git base-devel chezmoi

# Install yay, an AUR helper (paru has had no release supporting pacman 7.1 / libalpm 16)
if ! command -v yay >/dev/null; then
  git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
  (cd /tmp/yay-bin && makepkg -si --noconfirm)
fi

# Clone my dotfiles to ~/.local/share/chezmoi and applies to ~
chezmoi init --apply --branch niri ericmurphyxyz

src=~/.local/share/chezmoi
sudo pacman -S --needed --noconfirm --ask 4 - < "$src/private_dot_local/bin/data/packages.txt"
yay -S --needed - < "$src/private_dot_local/bin/data/aur-packages.txt"

# Copy system config files to etc/ since chezmoi only manages ~
sudo cp -r "$src/etc/." /etc/

# Start up various systemd services I use
sudo systemctl enable bluetooth keyd tlp avahi-daemon cronie docker.socket fstrim.timer paccache.timer
systemctl --user enable battery-alert.timer
chsh -s /bin/zsh
