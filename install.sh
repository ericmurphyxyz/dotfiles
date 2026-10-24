#!/bin/bash
# Bootstraps a fresh Arch install with all my stuff
# bash <(curl -fsSL https://raw.githubusercontent.com/ericmurphyxyz/dotfiles/niri/install.sh)
set -e

sudo pacman -Syu --needed --noconfirm git base-devel chezmoi

# Install paru, an AUR helper.
if ! command -v paru >/dev/null; then
  # Check if paru is in the repos (it is in CachyOS)
  if ! sudo pacman -S --needed --noconfirm paru 2>/dev/null; then
    # rustup with no default toolchain can't run cargo
    command -v rustup >/dev/null && rustup default stable
    git clone https://aur.archlinux.org/paru-git.git /tmp/paru-git
    (cd /tmp/paru-git && makepkg -sir --noconfirm)
  fi
fi

# Clone my dotfiles to ~/.local/share/chezmoi and applies to ~
# On reruns init won't pull new commits, so update instead
if [ -d ~/.local/share/chezmoi ]; then
  chezmoi update
else
  chezmoi init --apply --branch niri ericmurphyxyz
fi

src=~/.local/share/chezmoi
sudo pacman -S --needed --noconfirm --ask 4 - < "$src/private_dot_local/bin/data/packages.txt"
paru -S --needed --noconfirm --skipreview - < "$src/private_dot_local/bin/data/aur-packages.txt"

# Copy system config files to etc/ since chezmoi only manages ~
# Also let the wheel group use sudo without a password so I don't have to keep typing it in
sudo visudo -cf "$src/etc/sudoers.d/wheel"
sudo cp -r "$src/etc/." /etc/
sudo chmod 440 /etc/sudoers.d/wheel

# Start up various systemd services I use
sudo systemctl enable bluetooth keyd tlp avahi-daemon cronie docker.socket fstrim.timer paccache.timer
systemctl --user enable battery-alert.timer
sudo chsh -s /bin/zsh "$USER"
