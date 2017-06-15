---
layout: post
title: "Windows Phone 8 varsayılan harita uygulaması ile yol tarifi alma"
date: 2013-08-21 11:00
author: engin.polat
comments: true
category: [Programlama]
tags: [button, buttonbase, click, constructor, event, geocoordinate, instance, labeledmaplocation, location, mapsdirectionstask, start, uri, urikind, windows phone, windowsphone, wp8]
---
**Windows Phone 8 SDK** ile birlikte gelen <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.mapsdirectionstask" title="MapsDirectionsTask Class" target="_blank">MapsDirectionsTask</a> sınıfı sayesinde yol güzergahı hesaplatmak ve kullanıcıya göstermek çok kolaylaştı.

<a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.mapsdirectionstask.start" title="MapsDirectionsTask.Start Property" target="_blank">Start</a> ve <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.mapsdirectionstask.end" title="MapsDirectionsTask.End Property" target="_blank">End</a> *özelliklerine* uygun değerleri girerek iki nokta arasında **yol tarifi** alabilmek mümkün.

Bu özelliği denemek için ekrana bir *buton* ekleyelim;



&lt;Button x:Name="btnMap" Content="Güzergah Hesapla" Height="140" Width="420" Click="btnMap_Click" /&gt;</pre>

Eklediğimiz <a href="http://msdn.microsoft.com/library/system.windows.controls.button" title="Button Class" target="_blank">Button</a>'un <a href="http://msdn.microsoft.com/library/system.windows.controls.primitives.buttonbase.click" title="ButtonBase.Click Event" target="_blank">Click</a> **event**'ine bağladığımız *method*'u yazalım;

<pre class="brush:csharp">var task = new MapsDirectionsTask();

task.End = new LabeledMapLocation("Kadıköy Rıhtım", new GeoCoordinate(40.990, 29.025));

task.Show();


**MapsDirectionsTask** sınıfından yeni bir *instance* çıkartıp, **End** özelliğine <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.labeledmaplocation" title="LabeledMapLocation Class" target="_blank">LabeledMapLocation</a> sınıfından bir değişken atıyoruz.

<a href="http://msdn.microsoft.com/library/system.device.location.geocoordinate" title="GeoCoordinate Class" target="_blank">GeoCoordinate</a> sınıfının *constructor*'ında varış noktasının koordinatlarını vermemiz gerekiyor, ben örnek olarak *40.990* ve *29.025* değerlerini verdim böylece *Kadıköy Rıhtım*'a nasıl gidileceğini buluyor olacağız;

![](/assets/uploads/2013/08/mapsdirectiontask-1.png)

**Start** özelliğine değer atamadığımız için *konum servisinden* bulunan konumumuz kullanılacak ve **End** özelliğine verdiğimiz konum'a giden *güzergah* hesaplanarak ekranda bir **harita** ve altında **liste** şeklide gösterilecek;

![](/assets/uploads/2013/08/mapsdirectiontask-2.png)

