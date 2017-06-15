---
layout: post
title: "UWP Tam Ekran Video Player"
date: 2016-12-10 15:00
author: engin.polat
comments: true
category: [Windows]
tags: [uwp, videoplayer, fullscreen, tamekran]
---
Bu makalede, *Windows 10* üzerinde çalışacak bir **UWP** (*Universal Windows Platform*) uygulaması geliştireceğiz.

Uygulama, açılış ekranında (*MainPage.xaml*) bir video oynatıcıya (<a href="https://docs.microsoft.com/uwp/api/Windows.UI.Xaml.Controls.MediaElement" target="_blank">MediaElement</a>) sahip olacak.

Aynı ekrana bir <a href="https://msdn.microsoft.com/library/system.windows.controls.button" target="_blank">Button</a> ekleyecek ve tıklandığında *tam ekran* (*full screen*) moduna geçeceğiz.

Öncelikle **Visual Studio 2017** editörümüzü açalım ve hemen yeni bir <code>Blank App (Universal Windows)</code> projesi oluşturalım;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/12/FullScreenMediaPlayer-0.png" />

*MainPage.xaml* dosyası içerisine aşağıdaki kodları ekleyelim;

<script src="https://gist.github.com/polatengin/0ca220b55bd315d9b15cb03ce7a4ab21.js?file=MainPage.xaml"></script>

*Tam Ekran* butonuna tıklandığında *MainPage.xaml.cs* dosyası içerisine ekleyeceğimiz aşağıdaki method çalıştırılacak;

<script src="https://gist.github.com/polatengin/0ca220b55bd315d9b15cb03ce7a4ab21.js?file=MainPage.xaml.cs"></script>

**MediaElement** nesnesinin <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement#Windows_UI_Xaml_Controls_MediaElement_AreTransportControlsEnabled" target="_blank">AreTransportControlsEnabled</a> özelliğini *true* yaparak, video oynatıcısı üzerinde <code>Başlat</code>, <code>Durdur</code>, <code>Ses Seviyesi</code>, <code>Tam Ekran</code> gibi butonların gözükmesini sağlıyoruz.

Son olarak, **Button**'a tıklandığında **MediaElement** nesnesinin <a href="https://docs.microsoft.com/uwp/api/Windows.UI.Xaml.Controls.MediaElement#Windows_UI_Xaml_Controls_MediaElement_IsFullWindow" target="_blank">IsFullWindow</a> özelliğine *true* değerini atayarak video oynatıcısının ekranın tamamını kaplamasını sağlıyoruz.