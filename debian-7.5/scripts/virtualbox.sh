if test -f .vbox_version ; then
  if test -f /etc/init.d/virtualbox-ose-guest-utils ; then
    /etc/init.d/virtualbox-ose-guest-utils stop
  fi

  rmmod vboxguest
  aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils
  apt-get install -y dkms

  apt-get -y install --no-install-recommends libdbus-1-3

  mount -o loop VBoxGuestAdditions.iso /mnt
  yes|sh /mnt/VBoxLinuxAdditions.run
  umount /mnt
  rm -f VBoxLinuxAdditions.iso

  # VBox 4.3.10 bug
  if test -d /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions ; then
    ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions || true
  fi

  /etc/init.d/vboxadd start
fi



