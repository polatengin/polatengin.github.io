---
layout: post
title: "Windows Phone ShareLinkTask ile uygulamanın Marketplace adresini paylaşma"
date: 2013-08-20 11:00
author: engin.polat
comments: true
category: [Programlama]
tags: [appid, getattribute, linkuri, marketplace, msdn, productid, readtodescendant, sharelinktask, windows phone, windowsphone, wmappmanifest, wp8, xml, xmlreader, xmlreadersettings, xmlresolver, xmlxapresolver]
---
<a href="http://www.enginpolat.com/windows-phone-8-icin-share-task-larinin-kullanimi/" title="Windows Phone 8 için Share Task'larının kullanımı" target="_blank" rel="noopener">Windows Phone 8 için Share Task'larının kullanımı</a> makalesinde ele aldığımız <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.sharelinktask" title="ShareLinkTask Class" target="_blank" rel="noopener">ShareLinkTask</a> sınıfını kullanarak **Windows Phone** uygulamaları içerisinden link paylaşabiliyoruz;



var task = new ShareLinkTask();
task.Title = "Programcıdan Programcıya";
task.Message = "Engin Polat'ın Programcıdan Programcıya Blog'u";
task.LinkUri = new Uri("http://www.enginpolat.com", UriKind.Absolute);
task.Show();</pre>

Kullanıcının telefonuna eklediği hesaplara bağlı olarak yukarıdaki kod parçası, **Facebook**, **Twitter**, **LinkedIn**, **Outlook** gibi platformlarda paylaşım yapabilir.

Peki uygulamamızın **Windows Phone Marketplace**'deki sayfasını paylaşmak istiyorsak ne yapmalıyız?

<a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.sharelinktask.title" title="ShareLinkTask.Title Property" target="_blank" rel="noopener">Title</a> ve <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.sharelinktask.message" title="ShareLinkTask.Message Property" target="_blank" rel="noopener">Message</a> özelliklerine uygun değerleri girmek kolay, işin karıştığı nokta <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.sharelinktask.linkuri" title="ShareLinkTask.LinkUri Property" target="_blank" rel="noopener">LinkUri</a> özelliğine girilecek değerde.

Örneğin, <a href="http://windowsphone.com/s?appid=20489228-9fe9-4bf9-b313-d81f31aa02ac" title="Programcıdan Programcıya Windows Phone Uygulaması" target="_blank" rel="noopener">Programcıdan Programcıya</a> uygulamasının linki, <a href="http://windowsphone.com/s?appid=20489228-9fe9-4bf9-b313-d81f31aa02ac" title="Programcıdan Programcıya Windows Phone Uygulaması" target="_blank" rel="noopener">http://windowsphone.com/s?appid=20489228-9fe9-4bf9-b313-d81f31aa02ac
</a>

*appid* parametresine verilecek değer **WMAppManifest.xml** dosyası içerisindeki **ProductID** özelliğinden edinilmeli.

Fakat **MSDN**'deki <a href="http://msdn.microsoft.com/library/windowsphone/develop/ff769509" title="App manifest file for Windows Phone" target="_blank" rel="noopener">App manifest file for Windows Phone</a> makalesinde **ProductID** için önemli bir bilgi veriliyor;

<pre>Orjinali; During the app submission process, a new product ID is inserted into the manifest file</pre>

<pre>Türkçesi; Uygulama gönderimi sırasında yeni product ID manifest dosyasında güncellenir</pre>

Yani biz uygulamayı geliştirirken *WMAppManifest.xml* dosyasında gördüğümüz **ProductID** uygulamayı **Windows Phone MarketPlace**'e gönderirken değişecek.

Bu problemin üstesinden gelmek için çalışma zamanında *WMAppManifest.xml* dosyası içerisinden **ProductID** değerini okumalıyız. Bunun için aşağıda geliştirdiğim *ManifestFileReader* sınıfını kullanabiliriz;

<pre class="brush:csharp">public class ManifestFileReader
{
    public static string GetProductID()
    {
        var settings = new XmlReaderSettings { XmlResolver = new XmlXapResolver() };

        using (var reader = XmlReader.Create("WMAppManifest.xml", settings))
        {
            reader.ReadToDescendant("App");

            return reader.GetAttribute("ProductID");
        }
    }
}


Yukarıdaki kod parçasında öncelikle <a href="http://msdn.microsoft.com/library/system.xml.xmlreadersettings" title="XmlReaderSettings Class" target="_blank" rel="noopener">XmlReaderSettings</a> sınıfından yeni bir değişken oluşturuyoruz ve <a href="http://msdn.microsoft.com/library/system.xml.xmlreadersettings.xmlresolver" title="XmlReaderSettings.XmlResolver Property" target="_blank" rel="noopener">XmlResolver</a> özelliğine <a href="http://msdn.microsoft.com/library/system.xml.xmlxapresolver" title="XmlXapResolver Class" target="_blank" rel="noopener">XmlXapResolver</a> sınıfından yeni bir instance veriyoruz.

Ardından <a href="http://msdn.microsoft.com/library/system.xml.xmlreader" title="XmlReader Class" target="_blank" rel="noopener">XmlReader</a> sınıfının static <a href="http://msdn.microsoft.com/library/ms162474" title="XmlReader.Create Method (String, XmlReaderSettings)" target="_blank" rel="noopener">Create()</a> methodunu kullanarak *WMAppManifest.xml* dosyasını açıyoruz, <a href="http://msdn.microsoft.com/library/system.xml.xmlreader.readtodescendant" title="XmlReader.ReadToDescendant Method" target="_blank" rel="noopener">ReadToDescendant()</a> method'u ile *App* node'una gidip, <a href="http://msdn.microsoft.com/library/sxy2cd1w" title="XmlReader.GetAttribute Method (String)" target="_blank" rel="noopener">GetAttribute()</a> method'u ile **ProductID** değerini okuyoruz.

Bu sayede uygulamanın **ProductID** değerini okuyabilir ve paylaşmak için *http://windowsphone.com/s?appid={ProductID}* formatında link hazırlayabiliriz.

