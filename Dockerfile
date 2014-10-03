FROM ubuntu-upstart:trusty
MAINTAINER Nitrous.IO <hello@nitrous.io>

# Create action user and give sudo
RUN \
  useradd --create-home -s /bin/bash action && \
  adduser action sudo && \
  mkdir -p /etc/sudoers.d && \
  echo %action ALL=NOPASSWD:ALL > /etc/sudoers.d/action && \
  chmod 0440 /etc/sudoers.d/action

ADD files/ssh_bootstrap.sh /etc/ssh/ssh_bootstrap.sh
ADD files/ssh.conf /etc/init/ssh.conf
ADD files/sshd_config /etc/ssh/sshd_config

VOLUME ["/nitrous"]
