#!/usr/bin/env bash
echo "antx-soc" | nohup sudo -S openconnect q9r3.com:1443 < ~/.pass.word > ~/scripts/logs/openconnect.log 2>&1 &
