# elementaryOS-post-install-script

A script to set up elementary OS for my personal needs.
Just run .sh with bash.

Sync Music with:

SSHelper

rsync -rvl --size-only --info=progress2  ~/Music/ myphone:/data/data/com.arachnoid.sshelper/home/SDCard/Music/

Install Driver for D-Link DWA-131

```
git clone https://github.com/Mange/rtl8192eu-linux-driver.git
cd rtl8192eu-linux-driver
make clean
rm .cache.mk
make
sudo make install 
sudo modprope -rv rtl8xxxu
sudo modprobe 8192eu

echo "blacklist rtl8xxxu" | sudo tee -a /etc/modprobe.d/blacklist.conf
```

Rename AlbumArt

find -name .cover.jpg -execdir mv '{}' AlbumArt.jpg ';'

install sacad!
