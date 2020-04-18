packages-update:
> yay --sudoloop --answerupgrade All --nocleanmenu --nodiffmenu --noconfirm -Syu

update-mirrors: /usr/bin/reflector
> reflector --protocol https --age 12 --sort rate --save /etc/pacman.d/mirrorlist

/usr/bin/reflector:
> sudo pacman -S reflector
