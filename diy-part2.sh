#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)

currentWorkDir=`pwd`
echo "$currentWorkDir"
cloneRepo(){
  cd "$currentWorkDir"
    #$1 url
    #$2 dest
    #$3 branch
    if [ -d $2 ]
    then
        cd $2 && git pull && cd "$currentWorkDir" && return 0
    fi
    if [ -z $3 ]
    then
      git clone $1 $2
    else
      git clone -b $3 $1 $2
    fi
    cd "$currentWorkDir"
}


# Modify default IP
grep -q -i "192.168.106.1" package/base-files/files/bin/config_generate || sed -i 's/192.168.1.1/192.168.106.1/g' package/base-files/files/bin/config_generate

#sirpdboy
#git clone https://github.com/sirpdboy/sirpdboy-package.git package/sirpdboy-package
cloneRepo https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
cloneRepo https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced
cloneRepo https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
cloneRepo https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
cloneRepo https://github.com/sirpdboy/luci-app-poweroffdevice.git package/luci-app-poweroffdevice
cloneRepo https://github.com/sirpdboy/luci-app-autotimeset.git package/luci-app-autotimeset

#修正连接数（by ベ七秒鱼ベ）(modified by CHH2000day)
grep -q -i "net.netfilter.nf_conntrack_max" package/base-files/files/etc/sysctl.conf || sed -i  '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf
# themes添加（svn co 命令意思：指定版本如https://github）
cloneRepo https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
cloneRepo https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
cloneRepo https://github.com/openwrt-develop/luci-theme-atmaterial.git package/luci-theme-atmaterial
cloneRepo https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter

#git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages

#添加额外软件包
cloneRepo https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
cloneRepo https://github.com/vernesong/OpenClash.git package/OpenClash
cloneRepo https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
cloneRepo https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot
cloneRepo https://github.com/riverscn/openwrt-iptvhelper.git package/openwrt-iptvhelper
#git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
#添加smartdns
cloneRepo https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
cloneRepo https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns lede