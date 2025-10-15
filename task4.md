#!/bin/bash

#Скрипт написан с учётом использования параметра командной строки.
#Для проверки доступности ресурса нужно ввести ./check_url.sh http://app.local

URL=$1
CODE=$(curl -o /dev/null -s -w "%{http_code}" $URL)

if [ "$CODE" -eq 200 ]; then
  echo "$URL доступен (код состояния: $CODE)"
else
  echo "$URL недоступен (код состояния: $CODE)"
fi