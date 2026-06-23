#!/bin/sh

# --- НАСТРОЙКИ ---
SERVER_IP="213.176.94.211"
# Добавь сюда через пробел IP своих устройств (ПК, Асик и т.д.)
EXCLUDE_IPS="192.168.1.175 192.168.1.193"
# -----------------

while true; do
    if pidof xray > /dev/null; then
        if ping -c 1 -W 3 $SERVER_IP > /dev/null; then
            # Проверяем, настроены ли правила
            CHECK_IP=$(echo $EXCLUDE_IPS | awk '{print $1}')
            if ! /opt/sbin/iptables -t nat -S XRAY | grep -q "$CHECK_IP"; then
                /opt/sbin/iptables -t nat -F XRAY
                /opt/sbin/iptables -t nat -A XRAY -d 192.168.1.1 -j RETURN
                /opt/sbin/iptables -t nat -A XRAY -d 192.168.0.0/16 -j RETURN
                for ip in $EXCLUDE_IPS; do
                    /opt/sbin/iptables -t nat -A XRAY -s $ip -j RETURN
                done
                /opt/sbin/iptables -t nat -A XRAY -p tcp -j REDIRECT --to-ports 10808
            fi
        else
            /opt/sbin/iptables -t nat -F XRAY
        fi
    else
        /opt/sbin/iptables -t nat -F XRAY
    fi
    sleep 30
done
