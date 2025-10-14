#!/bin/bash

LOG_DIR="/opt/app"
LOG_FILE="/opt/app/log.txt"

# Создание папки
if [ -d "$LOG_DIR" ]; then
    echo "Папка '$LOG_DIR' уже существует"
else
    echo "Папка '$LOG_DIR' создана"
    mkdir -p "$LOG_DIR"
fi

# Создание файла
if [ -f "$LOG_FILE" ]; then
    echo "Файл '$LOG_FILE' уже существует"
else
    echo "Файл '$LOG_FILE' создан"
    touch "$LOG_FILE"
fi

echo "Скрипт начал работу. Для остановки нажмите Ctrl+C"
echo "Используются логи текущей загрузки (journalctl -b)"

# Бесконечный цикл для записи случайных строк из journalctl текущей загрузки
while true; do
    # Получаем одну случайную строку из журнала текущей загрузки
    RANDOM_LINE=$(journalctl -b --no-pager | shuf -n 1 | cut -c 1-20)

    # Записываем в файл с временной меткой
    echo "$(date '+%Y-%m-%d %H:%M:%S'): $RANDOM_LINE" >> "$LOG_FILE"

    # Ожидание 17 секунд
    sleep 17
done
