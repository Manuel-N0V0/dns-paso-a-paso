#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y bind9 bind9-utils dnsutils

echo "Bind9 instalado correctamente."
