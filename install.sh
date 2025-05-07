#! /bin/bash
distro=$(\cat /etc/os-release | grep "^NAME")
distrolist="Arch Ubuntu Debian"

for distrofinal in $distrolist
do
 [[ $distro =~ $distrofinal ]] && distroset=$distrofinal;
done

./$distroset"config".sh


