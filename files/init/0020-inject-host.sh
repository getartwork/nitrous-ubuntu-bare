#!/bin/bash

if [ -n "$__HOST" ]; then
  if ! grep -Fxq "$__HOST host" /etc/hosts; then
    echo "$__HOST host" >> /etc/hosts
  fi
fi
