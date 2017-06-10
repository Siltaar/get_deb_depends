#!/bin/bash

# Date : 2017-06-10
# Licence : GPLv3 (see the LICENCE file)
# Author : Simon Descarpentries <siltaar /\ acoeuro.com>

# Usage : ./get_deb_depends.sh <package-name> [<wanted-architecture>]
#	wanted-architecture, if using multiarch you can specify which arch to download: amd64, i386…
#		(defaults to 'amd64')

# Strongly inspired from solutions of this thread : https://stackoverflow.com/a/39968534

pkg_name=$1
arch=$2 || 'amd64'

for dep in `apt-rdepends "$pkg_name" | grep -v "^ "`; do
    apt-get download "$dep":"$arch"
done

apt-get download "$pkg_name":"$arch"
