#!/usr/bin/env bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install a package using the appropriate package manager
install_package() {
    PACKAGE=$1
    if command_exists apt-get; then
        sudo apt-get update && sudo apt-get install -y "$PACKAGE"
    elif command_exists dnf; then
        sudo dnf install -y "$PACKAGE"
    elif command_exists yum; then
        sudo yum install -y "$PACKAGE"
    elif command_exists pacman; then
        sudo pacman -Sy --noconfirm "$PACKAGE"
    else
        echo "Error: Package manager not found. Please install $PACKAGE manually."
        exit 1
    fi
}

# Check for required dependencies: jq and xclip
if ! command_exists jq; then
    echo "'jq' is not installed. Installing..."
    install_package jq
fi

if ! command_exists xclip; then
    echo "'xclip' is not installed. Installing..."
    install_package xclip
fi

# Download the file
URL="https://github.com/silgon/ems/raw/main/ems"
FILENAME=ems

curl -L -o "$FILENAME" "$URL"
if [ $? -ne 0 ]; then
    echo "Error downloading file. Please check the URL and try again."
    exit 1
fi

# Make the file executable
chmod +x "$FILENAME"

# Move the file to ~/bin (create it if it doesn't exist)
mkdir -p ~/bin
mv "$FILENAME" ~/bin/

# Add ~/bin to PATH if it's not already in PATH
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    export PATH="$HOME/bin:$PATH"
fi

