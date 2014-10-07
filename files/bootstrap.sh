#!/bin/bash

if [ ! -e /nitrous/.bootstrap_done ]; then
  # generate new host keys
  rm -rf /etc/ssh/ssh_host_*
  ssh-keygen -A > /dev/null
  # generate user's ssh key
  mkdir /home/action/.ssh
  chmod 0700 /home/action/.ssh
  ssh-keygen -b 2048 -t rsa -N '' -C '' -f /home/action/.ssh/id_rsa > /dev/null
  chown -R action:action /home/action/.ssh
  # generate random password for action user
  RANDOM_PW=`tr -dc A-Za-z0-9_ < /dev/urandom | head -c24`
  echo "action:$RANDOM_PW" | chpasswd
  echo
  echo "**********************************************************************"
  echo "*                                                                    *"
  echo "*  Default password for user \"action\" is $RANDOM_PW    *"
  echo "*                                                                    *"
  echo "*  Please remember to change it as soon as possible!                 *"
  echo "*                                                                    *"
  echo "**********************************************************************"
  echo
  touch /nitrous/.bootstrap_done
fi

exit 0
