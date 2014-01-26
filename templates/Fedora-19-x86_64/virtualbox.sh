if test -f .vbox_version ; then

  # Installing the virtualbox guest additions
  VBOX_VERSION=$(cat .vbox_version)
  mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
  cd /tmp
  sh /mnt/VBoxLinuxAdditions.run
  umount /mnt
  cd 
  rm -rf VBoxGuestAdditions_*.iso

fi
