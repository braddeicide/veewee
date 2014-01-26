if test -f .vbox_version ; then

  # Installing the virtualbox guest additions
  apt-get -y install dkms
  VBOX_VERSION=$(cat .vbox_version)
  cd /tmp
  wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso
  mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
  sh /mnt/VBoxLinuxAdditions.run
  umount /mnt
  
  rm VBoxGuestAdditions_$VBOX_VERSION.iso

fi
