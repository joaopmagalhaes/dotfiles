#!/bin/sh

# Move to downloads
cd ~/Downloads

# Add Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Add Terminator
sudo add-apt-repository ppa:gnome-terminator

# Add GIMP
sudo add-apt-repository ppa:otto-kesselgulasch/gimp

# Add Sublime Text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Update
sudo apt update

## Install all packages
sudo apt install build-essential curl gimp google-chrome-stable file fonts-powerline git htop iftop mysql-workbench npm python-setuptools sublime-text terminator unrar zsh --assume-yes

# Install Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.0.5-amd64.deb
sudo dpkg -i slack-desktop-3.0.5-amd64.deb

# Install WebStorm
wget https://download.jetbrains.com/webstorm/WebStorm-2017.3.4.tar.gz
sudo tar xfz WebStorm-2017.3.4.tar.gz -C /opt/

# Install Franz
wget https://github.com/meetfranz/franz/releases/download/v5.0.0-beta.15/franz_5.0.0-beta.15_amd64.deb
sudo dpkg -i franz_5.0.0-beta.15_amd64.deb

# Install oh-my-zshell
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
chsh -s /bin/zsh

## DEVELOPMENT DEPENDENCIES
# Create development and dotfiles dirs
mkdir -p ~/Dev
mkdir -p ~/Dev/dotfiles

# Clone dotfiles projects
git clone https://github.com/joaopmagalhaes/dotfiles.git ~/Dev/dotfiles

# Create symlinks
ln -s ~/Dev/dotfiles/zshrc ~/.zshrc
ln -s ~/Dev/dotfiles/gitconfig ~/.gitconfig
ln -s ~/Dev/dotfiles/gitignore ~/.gitignore
ln -s ~/Dev/dotfiles/sshconfig ~/.ssh/config
