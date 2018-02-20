---
layout: post
title: "Windows Phone 8 cihazın WiFi üzerinden internete bağlı olduğunu kontrol etme"
date: 2014-07-18 09:00
author: engin.polat
comments: true
category: [Windows]
tags: [3g, class, devicenetworkinformation, enum, iswifienabled, msdn, networkinformation, networkinterface, networkinterfacetype, property, wifi, wireless80211]
---
*MSDN*'de yeralan <a href="http://msdn.microsoft.com/library/windows/apps/hh487166" title="MSDN : How to detect network changes for Windows Phone 8" target="_blank">How to detect network changes for Windows Phone 8</a> makalesine göre *Windows Phone* cihazın **WiFi** üzerinden internete bağlı olduğunu anlamak için <a href="http://msdn.microsoft.com/library/windows/apps/microsoft.phone.net.networkinformation.devicenetworkinformation" title="DeviceNetworkInformation Class" target="_blank">DeviceNetworkInformation</a> *class*'ının <a href="http://msdn.microsoft.com/library/windows/apps/microsoft.phone.net.networkinformation.devicenetworkinformation.iswifienabled" title="DeviceNetworkInformation.IsWiFiEnabled Property" target="_blank">IsWiFiEnabled</a> *property*'sini kullanabiliriz.

Bu *property* sayesinde çok hızlı bir şekilde cihazda *WiFi* özelliğinin aktif olup/olmadığını yakalayabiliriz, fakat cihaz üzerinde *WiFi* aktif olabilir ama internete *3G* üzerinden bağlı olabilir, *DeviceNetworkInformation.IsWiFiEnabled* bu durumda gene *true* değerini döndürecektir.

Eğer uygulamamızın çalıştığı cihazın internete **WiFi** üzerinden bağlı olduğundan emin olmak istiyorsak bir kontrol daha yapmalıyız.

<a href="http://msdn.microsoft.com/library/system.net.networkinformation.networkinterface" title="NetworkInterface Class" target="_blank">NetworkInterface</a> *class*'ının <a href="http://msdn.microsoft.com/library/system.net.networkinformation.networkinterface.networkinterfacetype" title="NetworkInterface.NetworkInterfaceType Property" target="_blank">NetworkInterfaceType</a> *property*'si eğer <a href="http://msdn.microsoft.com/library/system.net.networkinformation.networkinterfacetype" title="NetworkInterfaceType Enumeration" target="_blank">NetworkInterfaceType</a> *enum*'ından **Wireless80211** değerine sahipse, cihazın *WiFi* üzerinden internete bağlı olduğundan emin olabiliriz.

Bu durumda yapmamız gereken kontrol aşağıdaki gibi olmalı;



if (DeviceNetworkInformation.IsWiFiEnabled && NetworkInterface.NetworkInterfaceType == NetworkInterfaceType.Wireless80211)
{
// Cihaz WiFi üzerinden internete bağlı
}


