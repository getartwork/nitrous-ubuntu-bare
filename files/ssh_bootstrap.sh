#!/bin/bash

if [ ! -e /etc/ssh/.ssh_bootstrap_done ]; then
  # generate new host keys
  rm -rf /etc/ssh/ssh_host_* && \
  ssh-keygen -A && \
  # generate user's ssh key
  mkdir /home/action/.ssh && \
  chmod 0700 /home/action/.ssh && \
  ssh-keygen -b 2048 -t rsa -N '' -C '' -f /home/action/.ssh/id_rsa && \
  chown -R action:action /home/action/.ssh
  touch /etc/ssh/.ssh_bootstrap_done
fi
