#!/bin/bash
# 2017 j.peschke@syseleven.de

# install some useful stuff

# wait for a valid network configuration
echo "# Waiting for a valid network configuration"
until ping -c 1 syseleven.de; do sleep 5; done

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" curl haveged unzip wget jq git
