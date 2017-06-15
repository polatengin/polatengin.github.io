---
layout: post
title: "Windows Phone başlangıç sayfasını belirlemek"
date: 2013-07-17 16:55
author: engin.polat
comments: true
category: [Windows]
tags: [application ui, mainpage, navigation page, rootfolder, views, windows phone, windowsphone, wmappmanifest, wp8, xaml]
---
**Windows Phone** projelerinde uygulamanın başlangıç sayfası *MainPage.xaml* dosyasıdır.

*MainPage.xaml* dosyası proje ilk oluşturulduğunda projenin *root*'unda yer alır.

![](/assets/uploads/2013/07/WP8StartPage-1.png)

Bazı durumlarda proje oluşturulurken üretilen bu dosyanın yerine *başka bir dosyayı* başlangıç ekranı yapmak isteriz.

Yapmamız gereken **WMAppManifest.xml** dosyasını açmak, **Application UI** tabında yer alan **Navigation Page** değerine istediğimiz sayfanın dosya adını yazmak;

![](/assets/uploads/2013/07/WP8StartPage-2.png)

*Örneğin, uygulamanın ekranlarını **Views** altında bir klasörde toplamak istiyorsak, başlangıç ekran dosyasının yolunu yukarıdaki gibi belirleyebiliriz.*

