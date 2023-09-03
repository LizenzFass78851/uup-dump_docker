#!/bin/bash

ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

./linux-uupdump-run-website.sh &

for (( ; ; ))
do
   ./linux-uupdump-get-fileinfo+packs.sh
   sleep 36h
done

exec "$@"
