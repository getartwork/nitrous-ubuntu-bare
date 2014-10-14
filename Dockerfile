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
  mkdir /nitrous && \
  touch /nitrous/dont_delete_this_dir

ADD files/nitrous_bootstrap.conf /etc/init/nitrous_bootstrap.conf
ADD files/bootstrap.sh /nitrous/bootstrap.sh
ADD files/dockerenv-inject /nitrous/dockerenv-inject
ADD files/sshd_config /etc/ssh/sshd_config

ENV NITROUS_IMAGE_VERSION 1
ENV NITROUS_USERNAME action
ENV NITROUS_SSH_ENABLED true

CMD ["/sbin/init", "--default-console", "none"]
