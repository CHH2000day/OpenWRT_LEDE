#!/bin/bash
#在非clean build中防止重复添加
sed -n 'minieap.conf' package/base-files/files/etc/sysupgrade.conf || sed -i  '/etc/minieap.conf' package/base-files/files/etc/sysupgrade.conf
