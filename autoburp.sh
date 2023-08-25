#!/usr/bin/env bash

nohup java -noverify -Dsun.java2d.d3d=false -Dsun.java2d.noddraw=true --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED -javaagent:/home/soc/apps/burp/BurpSuiteLoader.jar -jar /home/soc/apps/burp/burp_pro/burpsuite_pro.jar > ~/scripts/logs/burp.log 2>&1 &
