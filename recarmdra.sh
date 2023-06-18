#!/bin/bash

# Adapted from a.sh by agzg.

echo "Recarmdra has been activated."

# Check whether the distro is debian based.
which apt >/dev/null 2>&1
if [ $? -eq 0 ]
then
    echo "Using package manager: apt"
fi

sudo apt update
sudo apt upgrade -y

# Install curl.
echo "Installing curl"
sudo apt install curl -y

# Install Google Chrome.
echo "Installing Google Chrome"
wget -qO $HOME/Downloads/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install $HOME/Downloads/google-chrome.deb -y
sudo apt remove firefox* -y
sudo snap remove firefox

# Install Steam.
wget -qO $HOME/Downloads/steam-latest.deb http://repo.steampowered.com/steam/archive/stable/steam_latest.deb
sudo apt install $HOME/Downloads/steam-latest.deb -y

# Install git.
echo "Installing and configuring git"
sudo apt install git -y
git config --global user.name mbyx
git config --global user.email mbyx.dev@gmail.com

echo "Installing compilers, editors, etc."
# TODO: Check if this works.
yes | curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
wget -qO $HOME/Downloads/visualstudiocode-latest.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt install $HOME/Downloads/visualstudiocode-latest.deb -y

# Install Python.
echo "Installing and configuring Python"
# Install pyenv to manage python.
yes | curl https://pyenv.run | bash
pyenv install latest
pyenv global latest
# Install Poetry.
curl -sSL https://install.python-poetry.org | python3 -

sudo apt install fish -y
sudo apt install starship -y
# TODO: Install Anki, Obsidian, Stremio, and configure stuff to be on path and configure fish and starship

echo "Installing Sublime Text 4"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text -y

# Install Zoom client.
echo "Installing Zoom..."
wget -qO $HOME/Downloads/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install $HOME/Downloads/zoom.deb -y


echo "Installing VLC Media Player..."
sudo apt install vlc -y

sudo apt autoremove -y
sudo apt autoclean
echo "TODO (most likely):
1. Set up GitHub PAT token.
2. Sign in to Chrome.
4. Set up Steam, install games."