#!/usr/bin/env bash
hosts=(192.168.0.1 173.194.222.113 87.250.250.242)
for i in {1..5}
do
date >> hosts.log
    for h in ${hostss[@]}
    do
      curl -Is $h:80 >/dev/null
      echo "      " для хоста $h состояние = $? >> hosts.log
    done
    sleep 5
done1