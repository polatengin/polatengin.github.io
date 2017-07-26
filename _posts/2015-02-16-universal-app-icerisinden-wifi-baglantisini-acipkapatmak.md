---
layout: post
title: "Universal App içerisinden WiFi bağlantısını açıp/kapatmak"
date: 2015-02-16 21:30
author: engin.polat
comments: true
category: [Windows]
tags: [class, connectionsettingstask, connectionsettingstype, enum, instance, method, msdn, show, wifi, windows phone, wp8, uwp]
---
Aslında uygulama içerisinde **WiFi** bağlantısını *açıp/kapatamayız*. Fakat **WiFi** bağlantısını açıp/kapatabilecek *sistem ayarları* ekranını açabiliriz.

Bunun için basitçe;



*   <a href="http://msdn.microsoft.com/library/windows/apps/microsoft.phone.tasks.connectionsettingstask" target="_blank">ConnectionSettingsTask</a> sınıfından yeni bir **instance** oluşturmamız
*   <a href="https://msdn.microsoft.com/library/windows/apps/microsoft.phone.tasks.connectionsettingstask.connectionsettingstype" target="_blank">ConnectionSettingsType</a> özelliğine <a href="http://msdn.microsoft.com/library/windows/apps/microsoft.phone.tasks.connectionsettingstype" target="_blank">WiFi</a> değerini atamamız
*   <a href="http://msdn.microsoft.com/library/windows/apps/microsoft.phone.tasks.connectionsettingstask.show" target="_blank">Show()</a> methodunu çağırmamız

yeterlidir.



private void btnWiFiAcKapat_Click(object sender, RoutedEventArgs e)
{
    var connectionSettingsTask = new ConnectionSettingsTask();
    connectionSettingsTask.ConnectionSettingsType = ConnectionSettingsType.WiFi;
    connectionSettingsTask.Show();
}


