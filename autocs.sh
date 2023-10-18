#!/usr/bin/env bash

cd /home/soc/apps/cs/CobaltStrike/Client/

nohup bash cobaltstrike-client.sh >~/scripts/logs/cs.log 2>&1 &
