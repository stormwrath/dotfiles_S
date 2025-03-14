# USAGE
LINK `stow -v .`
UNLINK `stow -Dv .`

# PACKGE
![[pkglist.txt]]

```bash

for i in $(cat pkglist.txt);do
    yes|pacman -S $i --needed;
done

```
