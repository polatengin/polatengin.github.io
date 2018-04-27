---
layout: post
title: "Windows 8 uygulamasında seçilen resmin hakim rengini bulma"
date: 2015-06-09 08:35
author: engin.polat
comments: true
category: [Windows]
tags: [async, await, bitmapalphamode, bitmapdecoder, bitmappixelformat, bitmaptransform, class, colormanagementmode, detachpixeldata, exiforientationmode, fileaccessmode, getfilefromapplicationuriasync, getpixeldataasync, image, method, openasync, pixel, rgb, scaledheight, scaledwidth, storage, storagefile, stream, windows8, winrt, wp8]
---
Uygulamalarımızda sıklıkla *resimler* kullanırız ve bir resimde hakim olan (en çok kullanılan) rengi bulmak ve uygulama içerisinde kullanabilmek çok faydalı olabilir.

Resmi *hafızaya* yükledikten sonra **pixel pixel** üzerinde gezip her **pixel**'in değerlerini toplayıp ve ortalamasını alarak hakim rengi bulabiliriz. Fakat aşağıda kodlarını paylaşacağım yöntem ile bu işi çok daha hızlı ve az hafıza gerektiren bir şekilde gerçekleştirebiliriz.

Öncelikle hakim rengini bulacağımız resim dosyasını <a href="http://msdn.microsoft.com/library/windows/apps/windows.storage.storagefile" target="_blank" rel="noopener">StorageFile</a> sınıfının <a href="http://msdn.microsoft.com/library/windows/apps/windows.storage.storagefile.getfilefromapplicationuriasync" target="_blank" rel="noopener">GetFileFromApplicationUriAsync()</a> methodunu kullanarak bir değişkene alıyoruz;



var file = await StorageFile.GetFileFromApplicationUriAsync(imageUri);</pre>

Şimdi dosyayı açacak, <a href="http://msdn.microsoft.com/library/windows/apps/windows.graphics.imaging.bitmapdecoder" target="_blank" rel="noopener">BitmapDecoder</a> nesnesi oluşturacak, resim dosyasını <a href="http://msdn.microsoft.com/library/windows/apps/windows.graphics.imaging.bitmapdecoder.getpixeldataasync" target="_blank" rel="noopener">GetPixelDataAsync()</a> methodunu kullanarak *1x1* boyuta boyutlandıracak, *1x1* boyutlu yeni resmin **renk** değerini okuyacağız;

<pre class="brush:csharp">using (var stream = await file.OpenAsync(FileAccessMode.Read))
{
    var decoder = await BitmapDecoder.CreateAsync(stream);

    var transform = new BitmapTransform { ScaledHeight = 1, ScaledWidth = 1 };

    var pixels = await decoder.GetPixelDataAsync(
            BitmapPixelFormat.Rgba8,
            BitmapAlphaMode.Ignore,
            transform,
            ExifOrientationMode.IgnoreExifOrientation,
            ColorManagementMode.DoNotColorManage);

    var bytes = pixels.DetachPixelData();

    var dominantColor = Color.FromArgb(255, bytes[0], bytes[1], bytes[2]);
}


Örnek resim ile kullandığımızda aşağıdaki sonucu elde etmeliyiz;

![](/assets/uploads/2015/06/dominant-color.png)

*Kaynak : <a href="http://www.jonathanantoine.com/2013/07/16/winrt-how-to-easily-get-the-dominant-color-of-a-picture/" target="_blank" rel="noopener">#WinRT : how to easily get the dominant color of a picture</a>*

