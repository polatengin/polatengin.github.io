---
layout: post
title: "Windows Phone 8 uygulamasına Network Connection ayarları sayfası eklemek"
date: 2013-02-14 10:00
author: engin.polat
comments: true
category: [Programlama]
tags: [class, click, connectionsettingstask, connectionsettingstype, constructor, enum, event, method, namespace, property, show, windows phone, wp8]
---
**Windows Phone 8** uygulamanıza *Network Connection* ayarları sayfalarını (örneğin; *Airplane*, *Bluetooth*, *Cellular*, *WiFi*) açan **butonlar**/**linkler** mi eklemek istiyorsunuz?

Bu yazıda ilgili ayarlar ekranlarını nasıl açacağımıza bakacağız.

Kullanmaya başlamadan önce *Microsoft.Phone.Tasks* **namespace**'inde yeralan <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.connectionsettingstask" title="ConnectionSettingsTask Class" target="_blank">ConnectionSettingsTask</a> sınıfını inceleyelim;



namespace Microsoft.Phone.Tasks
{
    public sealed class ConnectionSettingsTask
    {
        public ConnectionSettingsTask();
        public ConnectionSettingsType ConnectionSettingsType { get; set; }
        public void Show();
    }

    public enum ConnectionSettingsType
    {
        WiFi = 0,
        Bluetooth = 1,
        Cellular = 2,
        AirplaneMode = 3,
    }
}</pre>

Gördüğünüz gibi *sealed* anahtar kelimesi ile *kalıtıma kapatılmış sınıf*'ın **constructor** haricinde *ConnectionSettingsType* tipinde **ConnectionSettingsType** isminde bir property'si, <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.connectionsettingstask.show" title="ConnectionSettingsTask.Show Method" target="_blank">Show</a> isminde bir *method*'u bulunmakta.

<a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.connectionsettingstask.connectionsettingstype" title="ConnectionSettingsTask.ConnectionSettingsType Property" target="_blank">ConnectionSettingsType</a> enum'ı 4 adet değer içermektedir; *WiFi*, *Bluetooth*, *Cellular* ve *AirplaneMode*

Uygulama içerisinden ilgili ayarlar ekranını açmak için, örneğin bir *buton*'un veya bir *hyperlink*'in **Click** *event*'ine aşağıdaki kodları yazmak lazım;

**WiFi ayarlar ekranı açmak için;**

<pre class="brush:csharp">ConnectionSettingsTask task = new ConnectionSettingsTask();
task.ConnectionSettingsType = ConnectionSettingsType.WiFi;
task.Show();</pre>

**Bluetooth ayarlar ekranını açmak için;**

<pre class="brush:csharp">ConnectionSettingsTask task = new ConnectionSettingsTask();
task.ConnectionSettingsType = ConnectionSettingsType.Bluetooth;
task.Show();</pre>

**Cellular ayarlar ekranını açmak için;**

<pre class="brush:csharp">ConnectionSettingsTask task = new ConnectionSettingsTask();
task.ConnectionSettingsType = ConnectionSettingsType.Cellular;
task.Show();</pre>

**AirplaneMode ayarlar ekranını açmak için;**

<pre class="brush:csharp">ConnectionSettingsTask task = new ConnectionSettingsTask();
task.ConnectionSettingsType = ConnectionSettingsType.AirplaneMode;
task.Show();


