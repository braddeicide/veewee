if test -f .vbox_version
then
  # The netboot installs the VirtualBox support (old) so we have to remove it
  /etc/init.d/virtualbox-ose-guest-utils stop
  rmmod vboxguest
  aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils

  # Install the VirtualBox guest additions
  VBOX_VERSION=$(cat .vbox_version)
  curl -Lo /tmp/VBoxGuestAdditions_$VBOX_VERSION.iso \
    "http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso"
  mount -o loop /tmp/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
  yes|sh /mnt/VBoxLinuxAdditions.run
  umount /mnt
fi
