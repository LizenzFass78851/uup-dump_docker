#!/bin/bash

./linux-uupdump-run-website.sh &

for (( ; ; ))
do
   ./linux-uupdump-get-fileinfo+packs.sh
   sleep $set_interval_to_get_packs_and_fileinfo
done

exec "$@"
