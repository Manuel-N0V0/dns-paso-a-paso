#!/bin/bash
set -e

cp /vagrant/config/named.conf /etc/bind/named.conf
cp /vagrant/config/named.conf.local /etc/bind/named.conf.local
cp /vagrant/config/named.conf.options /etc/bind/named.conf.options

cp /vagrant/files/db.manuel.test /var/lib/bind/manuel.test.dns
cp /vagrant/files/manuel.test.rev /var/lib/bind/manuel.test.rev

chown root:bind /var/lib/bind/manuel.test.dns
chown root:bind /var/lib/bind/manuel.test.rev
chmod 644 /var/lib/bind/manuel.test.dns
chmod 644 /var/lib/bind/manuel.test.rev

named-checkconf
named-checkzone manuel.test /var/lib/bind/manuel.test.dns
named-checkzone 56.168.192.in-addr.arpa /var/lib/bind/manuel.test.rev

systemctl restart bind9
systemctl enable bind9

echo "Configuración DNS aplicada correctamente."
