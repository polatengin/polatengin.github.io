---
layout: post
title: "Windows 10 UWP uygulamalarında ön veya arka kamera'nın görüntüsünü almak"
date: 2016-01-26 18:22
author: engin.polat
comments: true
category: [Universal App]
tags: [appxmanifest, async, await, back, camera, capabilities, captureelement, deviceclass, deviceinformation, enclosurelocation, front, grid, mainpage, mediacapture, mediacaptureinitializationsettings, method, microphone, onnavigatedto, override, package, panel, solution explorer, template, uwp, visual studio, webcam, windows10, xaml]
---
**Windows 10 UWP** uygulamalarında cihazda bulunan ön veya arka kamera'dan birinin görüntüsünü alarak ekranda göstermek isteyebiliriz.

Örneğin, daha kaliteli olduğu için *arka kamera*'nın görüntüsünü alıp üzerine filtre uygulayarak ekranda önizleme yaptırabiliriz.

Aynı şekilde *ön kamera*'nın görüntüsünü ekranda göstererek kullanıcının aynaya bakıyormuş gibi uygulamayı kullanmasını sağlayabiliriz.

Hemen **Visual Studio**'yu açarak yeni bir proje oluşturalım ve nasıl yapabildiğimize bakalım.

**Windows** kategorisinden **Blank App (Universal Windows)** proje template'ini seçerek, projeme bir isim veriyorum;

![2-00](/assets/uploads/2016/01/2-00.png)

**Solution Explorer**'dan erişebildiğim **Package.appxmanifest** dosyasına çift tıklayarak açıyoruz.

![2-01](/assets/uploads/2016/01/2-01.png)

**Capabilities** tab'ında yeralan **WebCam** ve **Microphone** kutucuklarını işaretliyoruz;

![2-02](/assets/uploads/2016/01/2-02.png)

*MainPage.xaml* dosyasını açıyor ve sayfaya bir <a href="https://msdn.microsoft.com/library/windows.ui.xaml.controls.captureelement" target="_blank">CaptureElement</a> nesnesi ekliyoruz;

<script src="https://gist.github.com/polatengin/647b7a895e8b0f06daa4a37935d45c78.js?file=MainPage.xaml"></script>

*MainPage.xaml.cs* dosyasını açıyor ve <a href="https://msdn.microsoft.com/library/windows.ui.xaml.controls.page.onnavigatedto" target="_blank">OnNavigatedTo</a> methodunu **override** ediyoruz. Böylece *MainPage* sayfasına gelindiğinde yapılacak işleri yazabileceğimiz bir *method*'umuz oluyor;

<script src="https://gist.github.com/polatengin/647b7a895e8b0f06daa4a37935d45c78.js?file=MainPage-xaml.cs"></script>

**OnNavigatedTo** methodunda sırasıyla şunları yapıyoruz;



*   Uygulamanın çalıştığı cihazda bulunan ve **video** kaydetme yeteneğine sahip olan cihazların listesini alıyoruz
*   Bu cihaz listesinden *ön panel*'de olanları filtreliyoruz
*   Eğer ön panelde bir video kaydedici cihaz varsa, bu cihazın **Id** bilgisi üzerinden cihaza erişiyoruz
*   Eriştiğimiz cihaz'ın önizlemesini *MainPage.xaml* dosyasında tanımladığımız **CaptureElement** nesnesi üzerinde göstermeye başlıyoruz

Eğer *ön kamera*'nın değilde, *arka kamera*'nın görüntüsünü göstermek isteseydik *camera* değişkenine aşağıdaki şekilde değer ataması yapmamız gerekecekti;

<script src="https://gist.github.com/polatengin/647b7a895e8b0f06daa4a37935d45c78.js?file=MainPage-CameraVariable-xaml.cs"></script>

