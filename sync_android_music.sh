#!/bin/bash
cd ~/Music/
interprets=$(ls -d */)
interprets="$(sed -r 's/\/home\/georg\/Music\///g' <<< "$interprets")"
echo "$interprets" > interpret.temp
sed -i -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" interpret.temp
interprets=$(cat interpret.temp)

while read -r interpret; do
	cd ~/Music/"$interpret"
	albums=$(ls -d */)
	albums="$(sed -r 's/\/home\/georg\/Music\/"$interpret"\///g' <<< "$albums")"
	echo $albums;
	echo "############"
	echo "$albums" > albums.temp
	while read -r album; do
		echo "$interpret""$album"
		DIRECTORY="/data/data/com.arachnoid.sshelper/home/SDCard/Music/$interpret$album"
		#DIRECTORY="abc"
result=$((
(
$(sshpass -p 'admin' ssh myphone <<START
		cd "$DIRECTORY"
START
)
) 1>log
) 2>&1)
#))
		if [[ "$result" = *"No such file or directory"* ]]; then
			src="/home/georg/Music/$interpret/$album"
			echo "$src"
			target="myphone:"'"'"/data/data/com.arachnoid.sshelper/home/SDCard/Music/$interpret/$album"'"'
			echo "$target"
			bash -c "scp -r '$src' '$target'"
		else
		  echo "ALBUM ALREADY EXISTS SKIPPING..."
		fi

	done  <<< "$albums"

done <<< "$interprets"
