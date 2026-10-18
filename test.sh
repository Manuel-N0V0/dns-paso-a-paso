
#!/usr/bin/env bash

echo "=== 1. Comprobación de sintaxis de ficheros ==="

named-checkconf /etc/bind/named.conf.options && echo "[OK] named.conf.options"

named-checkzone manuel.test /var/lib/bind/manuel.test.dns && echo "[OK] Zona directa"

named-checkzone 56.168.192.in-addr.arpa /var/lib/bind/manuel.test.rev && echo "[OK] Zona inversa"

echo "=== 2. Comprobación de resolución ==="

dig @localhost web.manuel.test CNAME +short

dig @localhost manuel.test TXT +short

dig @localhost -x 192.168.56.10 +short
