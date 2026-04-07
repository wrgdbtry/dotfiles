#!/usr/bin/env bash
set -e

if command -v zypper >/dev/null 2>&1; then
    echo "Installing for openSUSE..."
    sudo zypper install -y hyprland waybar wofi kitty fish grim slurp wl-clipboard swww fastfetch pavucontrol

elif command -v pacman >/dev/null 2>&1; then
    echo "Installing for Arch..."
    sudo pacman -S --needed hyprland waybar wofi kitty fish grim slurp wl-clipboard swww fastfetch pavucontrol

elif command -v dnf >/dev/null 2>&1; then
    echo "Installing for Fedora..."
    sudo dnf install -y hyprland waybar wofi kitty fish grim slurp wl-clipboard swww fastfetch pavucontrol

else
    echo "Unsupported distro"
    exit 1
fi

mkdir -p ~/.config/hypr ~/.config/waybar ~/.config/wofi ~/.config/kitty ~/.config/fish

cp -f hypr/hyprland.conf ~/.config/hypr/
cp -f waybar/config.jsonc ~/.config/waybar/
cp -f waybar/style.css ~/.config/waybar/
cp -f wofi/config ~/.config/wofi/
cp -f wofi/style.css ~/.config/wofi/
cp -f kitty/kitty.conf ~/.config/kitty/
cp -f fish/config.fish ~/.config/fish/

echo "Done."
