---
layout: post
title: "URI şemaları üzerinden Windows Phone 8 uygulamaları çalıştırmak"
date: 2013-02-20 10:00
author: engin.polat
comments: true
category: [Programlama]
tags: [async, asynchronous, launchuriasync, uri]
---
**Windows Phone 8** işletim sisteminin çeşitli ayarlarının ekranlarını veya üzerinde yüklü gelen uygulamaları çalıştırmak isterseniz aşağıdaki adresleri <a href="http://msdn.microsoft.com/en-us/library/windowsphone/develop/hh701476.aspx" title="Launcher.LaunchUriAsync methods" target="_blank">LaunchUriAsync()</a> method'u ile çağırmanız yeterlidir.

<table>
<tbody>
<tr>
<td>**URI şema**</td>
<td>**Açıklama**</td>
</tr>
<tr>
<td>*http:[URL]*</td>
<td>Web tarayıcıyı açar ve belirtilen adrese yönlenir</td>
</tr>
<tr>
<td>*mailto:[email address]*</td>
<td>EMail istemcisini açar, To alanında belirtilen email adresinin olduğu yeni bir mail gönderme ekranına yönlenir. Kullanıcı Gönder butonuna basmadan email gönderilmez</td>
</tr>
<tr>
<td>*ms-settings-accounts:*</td>
<td>Hesap Ayarlar ekranını açar</td>
</tr>
<tr>
<td>*ms-settings-airplanemode:*</td>
<td>Uçuş Modu Ayarlar ekranını açar</td>
</tr>
<tr>
<td>*ms-settings-bluetooth:*</td>
<td>Bluetooth Ayarlar ekranını açar</td>
</tr>
<tr>
<td>*ms-settings-cellular:*</td>
<td>Hücresel Veri Ayarlar ekranını açar</td>
</tr>
<tr>
<td>*ms-settings-emailandaccounts:*</td>
<td>EMail ve Hesaplar Ayarlar ekranını açar</td>
</tr>
<tr>
<td>*ms-settings-location:*</td>
<td>Konum Ayarlar ekranını açar</td>
</tr>
<tr>
<td>*ms-settings-lock:*</td>
<td>Kilit Ekranı Ayarlar ekranını açar</td>
</tr>
<tr>
<td>*ms-settings-wifi:*</td>
<td>Wi-Fi Ayarlar ekranını açar</td>
</tr>
<tr>
<td>*zune:navigate?appid=[app ID]*</td>
<td>Windows Phone Store uygulamasını açar ve parametre ile verilen ApplicationID'ye ait uygulamanın detay ekranına yönlenir</td>
</tr>
<tr>
<td>*zune:reviewapp?appid=app[app ID]*</td>
<td>Windows Phone Store uygulamasını açar ve parametre ile verilen ApplicationID'ye ait uygulamanın incelemeler ekranına yönlenir</td>
</tr>
<tr>
<td>*zune:search?keyword=[search keyword]&publisher=[publisher name]&contenttype=app*</td>
<td>Windows Phone Store uygulamasını açar ve parametre ile verilen yayınlayıcı adı ve/veya arama kriteri için uygun uygulamaları listeler</td>
</tr>
<tr>
<td>*zune:search?keyword=[search keyword]&contenttype=app*</td>
<td>Windows Phone Store uygulamasını açar ve parametre ile verilen arama kriteri için uygun uygulamaları listeler</td>
</tr>
<tr>
<td>*zune:search?publisher=[publisher name]*</td>
<td>Windows Phone Store uygulamasını açar ve parametre ile verilen yayınlayıcı adı için uygun uygulamaları listeler</td>
</tr>
</tbody>
</table>

*Örnek çalıştırma kodu;*



Windows.System.Launcher.LaunchUriAsync(new Uri("ms-settings-bluetooth:"));


