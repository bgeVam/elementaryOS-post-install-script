#!/bin/bash
read -p "Press [ENTER] to set up elementary OS..."

# Enable PPAs
sudo apt-get install software-properties-common

# Add Repositories
sudo apt-add-repository -y ppa:qos/pulseaudio-dlna
sudo apt-add-repository -y ppa:webupd8team/sublime-text-3
sudo apt-add-repository -y ppa:alessandro-strada/ppa
sudo apt-add-repository -y ppa:philip.scott/elementary-tweaks
sudo apt-add-repository -y ppa:pinta-maintainers/pinta-stable
sudo apt-add-repository -y ppa:nilarimogard/webupd8
sudo apt-add-repository -y ppa:libreoffice/libreoffice-5-0

# Uninstall Packages
sudo apt-get remove --auto-remove \
#epiphany-browser \
scratch-text-editor

# Autoclean
sudo apt-get autoclean

# Update Repositories
sudo apt-get update

# Upgrade System
sudo apt-get upgrade
sudo apt-get dist-upgrade

# Install Packages
sudo apt-get install -y pulseaudio-dlna
sudo apt-get install -y openjdk-8-jdk
sudo apt-get install -y chromium-browser
sudo apt-get install -y chromium-codecs-ffmpeg
sudo apt-get install -y chromium-codecs-ffmpeg-extra
sudo apt-get install -y sublime-text-installer
sudo apt-get install -y google-drive-ocamlfuse
sudo apt-get install -y solaar-gnome3
sudo apt-get install -y elementary-tweaks
sudo apt-get install -y pinta
sudo apt-get install -y albert
sudo apt-get install -y curl
sudo apt-get install -y vim
sudo apt-get install -y git
# sudo apt-get install -y zsh \
sudo apt-get install -y pulseaudio-dlna
sudo apt-get install -y redshift
sudo apt-get install -y redshift-gtk
sudo apt-get install -y libreoffice

# Install non-package software
sudo mkdir -p /opt/franz
wget -qO- https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz | sudo tar xvz -C /opt/franz/
sudo wget "https://cdn-images-1.medium.com/max/360/1*v86tTomtFZIdqzMNpvwIZw.png" -O /opt/franz/franz-icon.png
sudo bash -c "cat <<EOF > /usr/share/applications/franz.desktop                                                                 
[Desktop Entry]
Name=Franz
Comment=
Exec=/opt/franz/Franz
Icon=/opt/franz/franz-icon.png
Terminal=false
Type=Application
Categories=Messaging,Internet
EOF"

sudo bash -c "cat <<EOF > /usr/share/applications/google_drive.desktop                                                                 
[Desktop Entry]
Name=Google Drive
Comment=
Exec=xdg-open /home/georg/Google_Drive
Icon=/home/georg/google-drive.png
Terminal=false
Type=Application
Categories=
EOF"

sudo bash -c "cat <<EOF > /usr/share/applications/tu_wien.desktop                                                                 
[Desktop Entry]
Name=TU Informatik
Comment=
Exec=xdg-open /home/georg/Google_Drive/TU\ Informatik
Icon=/home/georg/tu_logo.png
Terminal=false
Type=Application
Categories=
EOF"

# Post Installation Action
apt-cache search jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk/bin
google-drive-ocamlfuse
sudo mkdir -p "$HOME/Google_Drive"
google-drive-ocamlfuse "$HOME/Google_Drive"
#curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash
#sudo chsh -s $(which zsh) $(whoami)
gtk-redshift -l geoclue -t 6500:5000 -b 1.0:0.6

# Set default applications
# TODO sed -i -e 's/midori\.desktop/chromium-browser\.desktop/g' ~/.config/mimeapps.list
# TODO Add Sublime

# Set startup applications
# TODO pulseaudio-dlna
# TODO redshift

# Fix USB Hot Plug Issue:

echo "on" | sudo tee /sys/bus/usb/devices/usb*/power/control

check powertop settings:
echo 'on' > '/sys/bus/usb/devices/1-7/power/control';
echo 'on' > '/sys/bus/usb/devices/1-9/power/control';


#Reboot
read -p "Press [ENTER] to reboot..."
read -p "Sure?"
sudo reboot
