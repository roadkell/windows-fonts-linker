#!/bin/bash
#
# Make MS Windows fonts available in Linux through symlinking
# (actually, a general purpose symlinking script)
# https://github.com/roadkell/windows-fonts-linker
#
# Usage:
#	linker.sh /path/to/windows/fontdir /path/to/linux/fontdir /path/to/fontlist
#
# Sources of font names:
#	https://wiki.archlinux.org/title/Microsoft_fonts
#	https://aur.archlinux.org/packages/ttf-ms-win10-auto
#	https://aur.archlinux.org/packages/ttf-ms-win11-auto
#	https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ttf-ms-win10-auto
#	https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ttf-ms-win11-auto
#	https://learn.microsoft.com/en-us/typography/fonts/windows_10_font_list
#	https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list
#	https://en.wikipedia.org/wiki/List_of_typefaces_included_with_Microsoft_Windows

filesdir=$(realpath -e "$1")
linksdir=$(realpath -e "$2")
filelist=$(realpath -e "$3")

while read -r filename; do
	ln -sv -t "$linksdir" "$filesdir"/"$filename"
done <"$filelist"
echo "Done! Now run 'fc-cache -f' to regenerate font cache"
