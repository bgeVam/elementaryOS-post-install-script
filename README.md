# elementaryOS-post-install-script

A script to set up elementary OS for my personal needs.
Just run .sh with bash.

Sync Music with:

SSHelper

rsync -rvl --size-only --info=progress2  ~/Music/ myphone:/data/data/com.arachnoid.sshelper/home/SDCard/Music/
