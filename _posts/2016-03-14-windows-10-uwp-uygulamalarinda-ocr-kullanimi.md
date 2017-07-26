---
layout: post
title: "Windows 10 UWP uygulamalarında OCR kullanımı"
date: 2016-03-14 17:30
author: engin.polat
comments: true
category: [Windows]
tags: [async, await, bitmapdecoder, button, cameracaptureui, cameracaptureuimode.photo, capturefileasync, createasync, enum, fileaccessmode, getsoftwarebitmapasync, method, ocr, ocrengine, ocrresult, openasync, optical character recognition, recognizeasync, softwarebitmap, string, text, trycreatefromuserprofilelanguages, universal app, uwp, windows10]
---
*Microsoft*, **Windows 10** uygulamaları içerisinden kullanabilmemiz için **Optical Character Recognition** (*OCR*) kütüphanelerini **Universal Windows Platform** (*UWP*) içerisine ekledi.

Böylece, **Windows 10** yüklü olan tüm cihazlarda çalışabilen **UWP** uygulamaları **Optical Character Recognition** (*OCR*) yeteneklerine sahip olabiliyor.

**Windows 10** *Kasım 2015* güncellemesi ile birlikte **OCR** desteği *25* dil için hali hazırda sağlanıyor ve **Türkçe** dili de bunlardan biri.

Üstelik uygulamanın kullanılabilirliğini arttıracak bu yapıyı kodlamanız son derece kolay.

Kamerayı açarak resim çeken ve çektiği resimdeki yazıları algılayan örnek bir projeyi birlikte yapalım;

![](/assets/uploads/2016/03/ocr-1.png)

Öncelikle *MainPage.xaml* dosyasını açalım ve resim çekme ve resim içerisindeki yazıları bulma işini başlatacak olan <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.button" target="_blank">Button</a> nesnesini sayfaya ekleyelim;

<script src="https://gist.github.com/polatengin/c100ac14cf191f2fc2d3ad67af680ca4.js?file=MainPage.xaml"></script>

*MainPage.xaml.cs* dosyası içerisinde *Button_Click()* methodunu oluşturalım ve **OCR** kütüphanelerini kullanmaya başlayalım;

<script src="https://gist.github.com/polatengin/c100ac14cf191f2fc2d3ad67af680ca4.js?file=MainPage-xaml.cs"></script>

Yukarıdaki method içerisinde öncelikle <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.capture.cameracaptureui" target="_blank">CameraCaptureUI</a> sınıfını ve <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.capture.cameracaptureui.capturefileasync" target="_blank">CaptureFileAsync()</a> methodunu kullanarak uygulamamızın kamera aracılığıyla **resim** çekmesini sağladık. Bunun için <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.capture.cameracaptureui.capturefileasync" target="_blank">CaptureFileAsync()</a> **method**'una <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.capture.cameracaptureuimode" target="_blank">CameraCaptureUIMode</a> **enum**'ından **Photo** değerini verdik.

Çekilen resmi <a href="https://msdn.microsoft.com/library/windows/apps/br227221" target="_blank">OpenAsync()</a> methodu ile açıp <a href="https://msdn.microsoft.com/library/windows/apps/windows.graphics.imaging.bitmapdecoder" target="_blank">BitmapDecoder</a> sınıfının <a href="https://msdn.microsoft.com/library/windows/apps/br226184.aspx" target="_blank">CreateAsync()</a> methoduna parametre olarak verdik. Böylece çekilen resmin hafıza içerisinde tutulduğu yere erişim sağlamış olduk.

<a href="https://msdn.microsoft.com/library/windows/apps/dn887334" target="_blank">GetSoftwareBitmapAsync()</a> methodunu kullanarak <a href="https://msdn.microsoft.com/library/windows/apps/windows.graphics.imaging.softwarebitmap" target="_blank">SoftwareBitmap</a> sınıfından bir değişken oluşturmuş, resmi bu değişken içerisinde saklamış olduk.

Artık <a href="https://msdn.microsoft.com/library/windows.media.ocr.ocrengine" target="_blank">OcrEngine</a> sınıfının <a href="https://msdn.microsoft.com/library/windows.media.ocr.ocrengine.trycreatefromuserprofilelanguages" target="_blank">TryCreateFromUserProfileLanguages()</a> methodu aracılığıyla kullanıcının cihazı kullandığı dilde **OCR** yapabileceği değişkeni oluşturabilir, <a href="https://msdn.microsoft.com/library/windows.media.ocr.ocrengine.recognizeasync" target="_blank">RecognizeAsync()</a> methodu ile *karakter tanıma* işini yaptırabiliriz.

Son olarak, <a href="https://msdn.microsoft.com/library/windows.media.ocr.ocrresult" target="_blank">OcrResult</a> tipindeki değişkenin <a href="https://msdn.microsoft.com/library/windows.media.ocr.ocrresult.text" target="_blank">Text</a> özelliği ile taranan resmin içerisindeki yazıları **string** tipinde elde edebiliriz.

Ben aşağıdaki görseli kullanarak bir tarama yaptırdım ve sonucu aşağıya yazdım;

![](/assets/uploads/2016/03/ocr-2.jpg)

*Bir mum diğerini tutuşturmakla, kendinden bir şey kaybetmez. Mevlana Celaleddin-i Rumi*

