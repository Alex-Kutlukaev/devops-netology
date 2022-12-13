#!/usr/bin/env bash
hosts=(192.168.0.1 173.194.222.113 87.250.250.24)
for i in {1..5}
do
date >> hosts.log
    for h in ${hosts[@]}
    do
      curl -Is --connect-timeout 5 $h:80 > /dev/null
      if [ "$?" -ne 0 ]
      then echo "          сервер $h не доступен" >> hosts.log
      else echo "          сервер $h доступен" >> hosts.log
      fi
    done
done