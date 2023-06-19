#!/bin/bash

# Adapted from a.sh by agzg.
# TODO:
# - Make this work with pacman as well.
# - Allow easy configuration and addition of applications.
# - Not all of these applications have their latest versions installed.

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
# Install Rust.
curl https://sh.rustup.rs --proto '=https' --tlsv1.2 -sSf | sh -s -- -y
source $HOME/.cargo/bin/

wget -qO $HOME/Downloads/visualstudiocode-latest.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt install $HOME/Downloads/visualstudiocode-latest.deb -y

# Install Python.
echo "Installing and configuring Python"
# Install pyenv to manage python.
echo "Installing pyenv"
curl https://pyenv.run | bash
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
echo "Installing Python for real this time!"
pyenv install 3:latest
# Install Poetry.
echo "Installing poetry"
curl -sSL https://install.python-poetry.org | python3 - -n

echo "Installing fish."
sudo apt install fish -y
echo "Installing Starship."
sudo apt install starship -y

# Install AppImageLauncher to manage Obsidian.
echo "Installing AppImageLauncher"
wget -qO $HOME/Downloads/appimagelauncher.deb https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo apt install $HOME/Downloads/appimagelauncher.deb -y

# Install Anki.
echo "Installing Anki"
sudo apt install anki -y

# Install Obsidian.
echo "Installing Obsidian"
wget -qO $HOME/Downloads/obsidian-latest.AppImage https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.5/Obsidian-1.3.5.AppImage
ail-cli integrate $HOME/Downloads/obsidian-latest.AppImage

# Install Stremio.
echo "Installing Stremio"
wget -qO $HOME/Downloads/stremio-latest.deb https://dl.strem.io/shell-linux/v4.4.160/stremio_4.4.160-1_amd64.deb
sudo apt install $HOME/Downloads/stremio-latest.deb -y

# Install Ulauncher.
echo "Installing Ulauncher"
wget -qO $HOME/Downloads/ulauncher.deb https://github.com/Ulauncher/Ulauncher/releases/download/5.15.2/ulauncher_5.15.2_all.deb
sudo apt install $HOME/Downloads/ulauncher.deb -y

# Install bucklespring.
echo "Installing bucklespring"
sudo apt install bucklespring

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

echo "Updating .bashrc."
wget -qO https://raw.githubusercontent.com/mbyx/recarmdra/main/.bashrc >> $HOME/.bashrc

sudo apt autoremove -y
sudo apt autoclean
echo "TODO (most likely):
1. Set up GitHub PAT token.
2. Sign in to Chrome.
3. Set up Steam, install games.
4. Add starship to fish path."