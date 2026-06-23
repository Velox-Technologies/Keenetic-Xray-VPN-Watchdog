# Keenetic Xray Watchdog

Решение для стабильной работы Xray на Keenetic. Забудьте про «восклицательный знак» и обрывы соединения при использовании торрентов.

## Особенности
- Автоматический мониторинг VPN-туннеля.
- Гибкая настройка устройств-исключений (трафик идет мимо VPN).
- Автоматическое восстановление правил `iptables` каждые 30 секунд.

## Установка
1. Перейдите в `/opt/etc/xray/`:
   `cd /opt/etc/xray/`
2. Загрузите скрипт:
   `wget https://raw.githubusercontent.com/ВАШ_НИК/keenetic-xray-helper/main/xray-watchdog.sh`
3. Дайте права на выполнение:
   `chmod +x xray-watchdog.sh`
4. Запустите в фоне:
   `sh xray-watchdog.sh &`

## Как настроить под себя
Отредактируйте переменные `SERVER_IP` и `EXCLUDE_IPS` внутри `xray-watchdog.sh` под вашу домашнюю сеть.
