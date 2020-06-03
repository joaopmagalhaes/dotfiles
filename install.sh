#!/bin/sh

# Add Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Add Terminator
sudo add-apt-repository ppa:gnome-terminator

# Add GIMP
sudo add-apt-repository ppa:otto-kesselgulasch/gimp

# Update
sudo apt update

## Install all packages
sudo apt install build-essential slack openvpn network-manager-openvpn network-manager-openvpn-gnome gconf2 gimp google-chrome-stable file fonts-powerline git htop iftop mysql-workbench npm python-setuptools terminator unrar zsh parcellite --assume-yes

# Install deb dependencies
sudo apt install -f --assume-yes

# Install oh-my-zshell
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

## DEVELOPMENT DEPENDENCIES
# Create development and dotfiles dirs
mkdir -p ~/kununu
mkdir -p ~/kununu/core
mkdir -p ~/kununu/dotfiles

# Clone dotfiles projects
git clone https://github.com/joaopmagalhaes/dotfiles.git ~/kununu/dotfiles

# Create symlinks
rm -f ~/.zshrc
ln -s ~/kununu/dotfiles/zshrc ~/.zshrc
ln -s ~/kununu/dotfiles/gitconfig ~/.gitconfig
ln -s ~/kununu/dotfiles/gitignore ~/.gitignore
