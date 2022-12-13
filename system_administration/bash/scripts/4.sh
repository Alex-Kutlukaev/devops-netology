#!/usr/bin/env bash
hosts=(192.168.0.1 173.194.222.113 87.250.250.24)
code=0
while [ $code -eq 0 ]
do
  date >> hosts4.log
  for h in ${hosts[@]}
  do
    curl -Is --connect-timeout 5 $h:80 > /dev/null
    code=$?
    if [ $code -ne 0 ]
      then
        echo "      сервер $h недоступен" >> hosts4.log
    fi
  done
done
