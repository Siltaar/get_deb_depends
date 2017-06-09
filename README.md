## Usage

`./get_deb_depends.sh <package-name> <depends-string> [<wanted-architecture>]`

* `depends-string` is the text part of your (may be) localized `apt-cache depends` answer ("Dépend" in french)
* `wanted-architecture`, if using multiarch you can specify which arch to download: amd64, i386… (defaults to 'amd64')

Strongly inspired from : https://stackoverflow.com/a/39968534

Date : 2017-06-10

Licence : GPLv3 (see the LICENCE file)

Author : Simon Descarpentries <siltaar /\ acoeuro.com)
