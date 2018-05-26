#!/bin/bash

pacstrap /mnt base gnome xorg-twm xorg-xclock xterm xf86-input-synaptics xorg-xinit xorg-server xorg-utils xorg-server-utils vim openssh grub-bios upower
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
locale-gen
ln -s /usr/share/zoneinfo/America/moncton /etc/localtime
grub-install --target=i386-pc --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount /mnt
reboot
