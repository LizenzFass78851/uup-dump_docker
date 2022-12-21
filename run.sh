#!/bin/bash

cd /root/uupdump-x64

screen -S Run -L -Logfile ./masterLog.0 -d -m ./linux-uupdump-run-website.sh
screen -S Update -L -Logfile ./masterLog.1 -d -m ./update.sh

exec "$@"
