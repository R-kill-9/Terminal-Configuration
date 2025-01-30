#!/bin/bash

# Variables
ZSHRC_CONFIG_FILE="$(dirname "$0")/zshrc_config"  # zshrc_config file in the same directory as the script
AGNOSTER_CONFIG_FILE="$(dirname "$0")/agnoster_config"  # agnoster_config file in the same directory as the script

ZSHRC_LOCAL="$HOME/.zshrc"
AGNOSTER_CONFIG_LOCAL="$HOME/.oh-my-zsh/themes/agnoster.zsh-theme"  # Original agnoster theme path

# Check if Zsh is installed
if ! command -v zsh &> /dev/null; then
    echo "Zsh is not installed. Installing..."
    sudo apt update && sudo apt install -y zsh
else
    echo "Zsh is already installed."
fi

# Change the default shell to Zsh
if [[ "$SHELL" != "/bin/zsh" ]]; then
    echo "Changing default shell to Zsh..."
    chsh -s $(which zsh)
else
    echo "Zsh is already the default shell."
fi

# Install Oh My Zsh if it is not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# Replace the .zshrc file with the custom zshrc_config file
if [ -f "$ZSHRC_CONFIG_FILE" ]; then
    echo "Replacing .zshrc with custom configuration..."
    cp "$ZSHRC_CONFIG_FILE" "$ZSHRC_LOCAL"
else
    echo "Custom zshrc_config file not found in the script directory."
fi

# Replace the agnoster theme with the custom agnoster_config file
if [ -f "$AGNOSTER_CONFIG_FILE" ]; then
    echo "Replacing agnoster theme with custom configuration..."
    cp "$AGNOSTER_CONFIG_FILE" "$AGNOSTER_CONFIG_LOCAL"
else
    echo "Custom agnoster_config file not found in the script directory."
fi

# Configure terminal color scheme (Dark Pastel in GNOME Terminal)
PROFILE_NAME="Dark Pastel"
PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')

if [ -n "$PROFILE_ID" ]; then
    echo "Applying Dark Pastel color scheme..."
    gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/" palette "['#000000', '#CC6666', '#B5BD68', '#F0C674', '#81A2BE', '#B294BB', '#8ABEB7', '#FFFFFF', '#666666', '#FF3334', '#9EC400', '#E7C547', '#7AA6DA', '#C397D8', '#70C0B1', '#1D1F21']"
fi

echo "Installation complete. Please close and reopen the terminal."
