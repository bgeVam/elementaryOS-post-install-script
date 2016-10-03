#!/bin/bash

clear

read -p "Press [ENTER] to set up elementary OS..."

# Enable PPAs
sudo apt-get install software-properties-common

# Add Repositories
sudo apt-add-repository \
ppa:qos/pulseaudio-dlna \
ppa:webupd8team/sublime-text-3 \
ppa:alessandro-strada/ppa \
ppa:philip.scott/elementary-tweaks \


# Update Repositories
sudo apt-get update

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
elementary-tweaks



# Post Installation Action
apt-cache search jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk/bin
google-drive-ocamlfuse
sudo mkdir -p "/home/georg/Google Drive"
google-drive-ocamlfuse "/home/georg/Google Drive"