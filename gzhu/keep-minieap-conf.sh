#!/bin/bash
#在非clean build中防止重复添加
sed -n -e '/minieap.conf/p' package/base-files/files/etc/sysupgrade.conf || printf '\n/etc/minieap.conf' >> package/base-files/files/etc/sysupgrade.conf
