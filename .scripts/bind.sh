#!/usr/bin/env bash

set -e

[[ "$EUID" == 0 ]] || exec sudo -s "$0" "$@"

MYUID=$(whoami)
echo "running as $MYUID"
echo "unbinding gpu"
echo "0000:06:00.0" > /sys/bus/pci/devices/0000\:06\:00.0/driver/unbind
echo "rebinding"
echo "1912 0014" > /sys/bus/pci/drivers/vfio-pci/new_id
