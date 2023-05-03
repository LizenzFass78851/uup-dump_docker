#!/bin/bash

./linux-uupdump-run-website.sh &

for (( ; ; ))
do
   ./linux-uupdump-get-fileinfo+packs.sh
   sleep 36h
done

exec "$@"
