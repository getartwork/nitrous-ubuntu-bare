FROM ubuntu-upstart:trusty
MAINTAINER Nitrous.IO <hello@nitrous.io>

# Disable root password
RUN passwd -l root

# Create action user and give sudo
RUN \
  useradd --create-home -s /bin/bash action && \
  adduser action sudo && \
  mkdir -p /etc/sudoers.d && \
  echo %action ALL=NOPASSWD:ALL > /etc/sudoers.d/action && \
  chmod 0440 /etc/sudoers.d/action

RUN \
  mkdir -p /nitrous/init /nitrous/initonce && \
  touch /nitrous/dont_delete_this_dir

RUN \
  rm /etc/legal && \
  rm /etc/update-motd.d/10-help-text

ADD files/motd /etc/update-motd.d/00-header
ADD files/nitrous_bootstrap.conf /etc/init/nitrous_bootstrap.conf
ADD files/bootstrap.sh /nitrous/bootstrap.sh
ADD files/dockerenv-inject /nitrous/dockerenv-inject
ADD files/sshd_config /etc/ssh/sshd_config

ADD files/nitrous-unison /nitrous/nitrous-unison
ADD files/nitrous-watcher /nitrous/nitrous-watcher

ADD files/init/0010-inject-env.sh  /nitrous/init/0010-inject-env.sh
ADD files/init/0020-inject-host.sh /nitrous/init/0020-inject-host.sh

ADD files/initonce/0010-generate-pw.sh /nitrous/initonce/0010-generate-pw.sh

ENV NITROUS_IMAGE_VERSION 1
ENV NITROUS_USERNAME action
ENV NITROUS_SSH_ENABLED true

CMD ["/sbin/init", "--default-console", "none"]
