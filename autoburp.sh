#!/usr/bin/env bash

nohup java -Dfile.encoding=utf-8 -javaagent:/home/antx-soc/Downs/Hacks/burpsuite/BurpSuiteLoader_v2021.9.jar -noverify -jar /home/antx-soc/Downs/Hacks/burpsuite/burpsuite_pro_v2021.9.jar > ~/scripts/logs/burp.log 2>&1 &
