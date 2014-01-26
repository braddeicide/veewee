# Installing the virtualbox guest additions
if test -f .vbox_version
then
	VBOX_VERSION=$(cat .vbox_version)
	#wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
	mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
	cd /tmp
	sh /mnt/VBoxLinuxAdditions.run
	umount /mnt
	cd
	rm VBoxGuestAdditions_$VBOX_VERSION.iso
fi

