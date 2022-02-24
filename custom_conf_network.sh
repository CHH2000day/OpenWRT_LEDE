#!/bin/bash
# Modify default IP
sed -i 's/192.168.1.1/192.168.106.1/g' package/base-files/files/bin/config_generate

#修正连接数（by ベ七秒鱼ベ）(modified by CHH2000day)
sed -n  'net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf || sed -i  '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf