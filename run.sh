#!/bin/bash

ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# -------------------------

echo start uupdump
./linux-uupdump-run-website.sh &

for (( ; ; ))
do
   echo start uupdump - get fileinfo and packs
   ./linux-uupdump-get-fileinfo+packs.sh
   echo waiting $set_interval_to_get_packs_and_fileinfo to next run for get fileinfo and packs
   sleep $set_interval_to_get_packs_and_fileinfo
done

exec "$@"
