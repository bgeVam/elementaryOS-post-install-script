#!/bin/bash
COMPUTER_MUSIC_PATH='/home/georg/Music/'
PHONE_MUSIC_PATH='/data/data/com.arachnoid.sshelper/home/SDCard/Music/'

# List music on computer
find $COMPUTER_MUSIC_PATH -type d -print > notebook.temp
sed -i "s:$COMPUTER_MUSIC_PATH::g" notebook.temp 
sort notebook.temp > notebook_sorted.temp
rm notebook.temp

# List music on phone
ssh myphone "find $PHONE_MUSIC_PATH -type d -print" > phone.temp
sed -i "s:$PHONE_MUSIC_PATH::g" phone.temp 
sort phone.temp > phone_sorted.temp
rm phone.temp

# List diff
diff -w phone_sorted.temp notebook_sorted.temp > diff.temp
echo ">... Exists on computer, missing on phone."
echo "<... Exists on phone, missing on computer."
cat diff.temp

# Get missing interpret list
cat diff.temp |  grep ">" | grep -v "/" | cut -c 3- > diff_interprets.temp
while read interpret; do
	echo "Create new Interpret Directory..."
	ssh myphone "mkdir '$PHONE_MUSIC_PATH$interpret'"
done <diff_interprets.temp
rm diff_interprets.temp

#Get missing album list
cat diff.temp |  grep ">" | grep "/" | cut -c 3- > diff_albums.temp
while read album; do
	src="$COMPUTER_MUSIC_PATH$album"
	target="myphone:"'"'"/data/data/com.arachnoid.sshelper/home/SDCard/Music/$album"'"'
	echo "scp -r '$src' '$target'"
	bash -c "scp -r '$src' '$target'"
done <diff_albums.temp
rm diff_albums.temp

# Remove diff
rm diff.temp

exit 0;
