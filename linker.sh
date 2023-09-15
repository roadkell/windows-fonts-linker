#!/bin/bash
#
# Make MS Windows fonts available in Linux through symlinking
# (actually, a general purpose symlinking script)
# https://github.com/roadkell/windows-fonts-linker

filesdir=$(realpath -e "$1")
linksdir=$(realpath -e "$2")
filelist=$(realpath -e "$3")

while read -r filename; do
	ln -sv -t "$linksdir" "$filesdir"/"$filename"
done <"$filelist"
echo "Done! Now run 'fc-cache -f' to regenerate font cache"
