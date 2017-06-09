#!/bin/bash

# Date : 2017-06-10
# Licence : GPLv3 (see the LICENCE file)
# Author : Simon Descarpentries <siltaar /\ acoeuro.com>

# Usage : ./get_deb_depends.sh <package-name> <depends-string> [<wanted-architecture>]
#	depends-string is the text part of your (may be) localized `apt-cache depends` answer :
#		("Dépend" in french)
#	wanted-architecture, if using multiarch you can specify which arch to download: amd64, i386…
#		(defaults to 'amd64')

# Strongly inspired from : https://stackoverflow.com/a/39968534


pkg_name=$1
depends_str=$2
arch=$3 || 'amd64'
tmp_file=/tmp/get_deb_depends

apt-cache depends "$pkg_name" | grep $depends_str: >> "$tmp_file"

sed -i -e 's/[<>|:]//g' "$tmp_file"
sed -i -e "s/$depends_str//g" "$tmp_file"
sed -i -e 's/ //g' "$tmp_file"

while read -r line
do
    apt-get download "$line":"$arch"
done < "$tmp_file"

apt-get download "$pkg_name":"$arch"
rm $tmp_file
