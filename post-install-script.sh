#!/bin/bash
read -p "Press [ENTER] to set up elementary OS..."

# Enable PPAs
sudo apt-get install software-properties-common

# Add Repositories
sudo apt-add-repository \
ppa:qos/pulseaudio-dlna \
ppa:webupd8team/sublime-text-3 \
ppa:alessandro-strada/ppa \
ppa:philip.scott/elementary-tweaks \
ppa:pinta-maintainers/pinta-stable \
ppa:nilarimogard/webupd8

# Uninstall Packages
sudo apt-get remove --auto-remove \
epiphany-browser \
scratch-text-editor

# Autoclean
sudo apt-get autoclean

# Update Repositories
sudo apt-get update

# Upgrade System
sudo apt-get upgrade
sudo apt-get upgrade-dist

# Install Packages
sudo apt-get install -f \
pulseaudio-dlna \
openjdk-8-jdk \
chromium-browser \
chromium-codecs-ffmpeg \
chromium-codecs-ffmpeg-extra \
sublime-text-installer \
google-drive-ocamlfuse \
solaar-gnome3 \
elementary-tweaks \
pinta \
albert \
curl \
vim \
git \
zsh

# Post Installation Action
apt-cache search jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk/bin
google-drive-ocamlfuse
sudo mkdir -p "$HOME/Google Drive"
google-drive-ocamlfuse "$HOME/Google Drive"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash
sudo chsh -s $(which zsh) $(whoami)

# Set default applications
# TODO sed -i -e 's/midori\.desktop/chromium-browser\.desktop/g' ~/.config/mimeapps.list
#TODO Add Sublime

#Reboot
read -p "Press [ENTER] to reboot..."
read -p "Sure?"
sudo reboot