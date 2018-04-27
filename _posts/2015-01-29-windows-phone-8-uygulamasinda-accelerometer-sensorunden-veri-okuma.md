---
layout: post
title: "Windows Phone 8 uygulamasında Accelerometer sensöründen veri okuma"
date: 2015-01-29 17:30
author: engin.polat
comments: true
category: [Windows]
tags: [accelerationx, accelerationy, accelerationz, accelerometer, accelerometerreading, AccelerometerReadingEventArgs, AccelerometerShakenEventArgs, class, event, eventhandler, getcurrentreading, getdefault, instance, method, namespace, property, readingchanged, reportinterval, sensor, shaken, start, stop, string.format, TypedEventHandler, using, wp8]
---
**Windows Phone** cihazlar, cihazın *hareket*-*yön*-*ivme* gibi çeşitli bilgilerini yazılımsal olarak algılamamıza yardım eden algılayıcılar (*sensör*) ile birlikte geliyorlar.

**Accelerometer** sensörü cihazın *X*, *Y*, *Z* eksenlerindeki ivme bilgisini algılar ve işletim sistemi aracılığıyla yazılıma iletebilir.

Öncelikle projenin *References* kısmında *Microsoft.Devices.Sensors* referansının olduğunu kontrol edelim ve sınıfın *using* kısmına *Microsoft.Devices.Sensors* *namespace*'ini ekleyelim;



using Microsoft.Devices.Sensors;</pre>

**Accelerometer** sensörüne erişebilmek ve verisini okuyabilmek için <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.sensors.accelerometer" target="_blank" rel="noopener">Accelerometer</a> sınıfından yeni bir *instance* oluşturmalıyız, bunun için *static* olan <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.sensors.accelerometer.getdefault" target="_blank" rel="noopener">GetDefault()</a> methodunu kullanabiliriz;

<pre class="brush:csharp">var _accelerometer = Accelerometer.GetDefault();</pre>

Sensör verisini bir defa okumak için *_accelerometer* değişkeninin <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.sensors.accelerometer.getcurrentreading" target="_blank" rel="noopener">GetCurrentReading()</a> methodunu kullanıyoruz. Methoddan geri dönen <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.sensors.accelerometerreading" target="_blank" rel="noopener">AccelerometerReading</a> tipindeki cevabın içerisindeki <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.sensors.accelerometerreading.accelerationx" target="_blank" rel="noopener">AccelerationX</a>, <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.sensors.accelerometerreading.accelerationy" target="_blank" rel="noopener">AccelerationY</a>, <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.sensors.accelerometerreading.accelerationz" target="_blank" rel="noopener">AccelerationZ</a> *property*'leri sayesinde ivme bilgisini elde edebiliriz;

<pre class="brush:csharp">var reading = _accelerometer.GetCurrentReading();
if (reading != null)
{
    var x = string.Format("{0,5:0.00}", reading.AccelerationX);
    var y = string.Format("{0,5:0.00}", reading.AccelerationY);
    var z = string.Format("{0,5:0.00}", reading.AccelerationZ);
}</pre>

Eğer ivme bilgisini sürekli okumamız gerekiyorsa *_accelerometer* değişkeninin <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.sensors.accelerometer.readingchanged" target="_blank" rel="noopener">ReadingChanged</a> event'ini kullanabiliriz, <a href="http://msdn.microsoft.com/library/windows/apps/microsoft.devices.sensors.accelerometer.start" target="_blank" rel="noopener">Start()</a> method'unu çağırmayı unutmamamız lazım;

<pre class="brush:csharp">_accelerometer.ReadingChanged += new EventHandler&lt;AccelerometerReadingEventArgs&gt;(AccelerometerReadingChanged);

_accelerometer.Start();</pre>

<pre class="brush:csharp">public void AccelerometerReadingChanged(object sender, AccelerometerReadingEventArgs e)
{
    var x = string.Format("{0,5:0.00}", e.X);
    var y = string.Format("{0,5:0.00}", e.Y);
    var z = string.Format("{0,5:0.00}", e.Z);
}</pre>

**Accelerometer** verisine ihtiyacımız kalmadığında *_accelerometer* değişkeninin <a href="http://msdn.microsoft.com/library/windows/apps/microsoft.devices.sensors.accelerometer.stop" target="_blank" rel="noopener">Stop()</a> method'unu çağırmalıyız;

<pre class="brush:csharp">_accelerometer.Stop();</pre>

*X*, *Y*, *Z* eksenlerindeki değerler *-2* ile *+2* aralığında değişiyorlar. Yerçekimsiz ortamda değerlerin *0* olması bekleniyor. Eğer telefonu masa üzerine bırakırsak *X* ve *Y* değerleri *0*, *Z* değeri *-1* olarak okunmalı.

*Start()* methodu çağırıldıktan sonra yaklaşık olarak *50Hz* hızında yani saniyede yaklaşık *50* defa *ReadingChanged* event'i tetiklenecektir.

Eğer *ReadingChanged* event'inin tetiklenme hızını değiştirmek istiyorsak *_accelerometer* değişkeninin <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.sensors.accelerometer.reportinterval" target="_blank" rel="noopener">ReportInterval</a> property'sine yeni bir değer ataması yapmalıyız.

Son olarak, *_accelerometer* değişkeninin <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.sensors.accelerometer.shaken" target="_blank" rel="noopener">Shaken</a> event'ini kullanarak telefonun sallanma durumunu yakalayabiliriz;

<pre class="brush:csharp">_accelerometer.Shaken += new TypedEventHandler&lt;Accelerometer, AccelerometerShakenEventArgs&gt;(Shaken);


