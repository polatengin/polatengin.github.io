---
layout: post
title: "Windows 10 UWP uygulamalarında TTS için Speech Synthesis kullanımı"
date: 2016-03-10 12:30
author: engin.polat
comments: true
category: [Windows]
tags: [button, click, mainpage, mediaelement, setsource, speechsynthesisstream, speechsynthesizer, synthesizetexttostreamasync, text to speech, textbox, tts, universal app, uwp, windows10, xaml, xaml.cs]
---
Uygulamalarımıza **TTS** (*text-to-speech*, yani *yazıdan-sese*) özelliği ekleyerek belirlediğimiz metinlerin sese dönüştürülmesini sağlayabiliriz.

**Windows 8.1** ve **Windows Phone 8.1** zamanından beri kullanımımıza açık olan <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.speechsynthesis" target="_blank" rel="noopener">SpeechSynthesis</a> **namespace**'i aracılığıyla uygulamamıza **TTS** desteği ekleyebiliriz.

Hemen yeni bir proje oluşturarak *kodlamaya* başlayalım;

![](/assets/uploads/2016/03/tts-1.png)

*MainPage.xaml* dosyasını açarak *sese* dönüştürmek istediğimiz *metni* yazabileceğimiz bir <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.textbox" target="_blank" rel="noopener">TextBox</a>, bir de <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.button" target="_blank" rel="noopener">Button</a> nesnesi ekleyelim.

Bir metnin sese dönüştürülerek okunması için uygulamamıza **ses** dosyalarını oynatabilecek bir nesne eklememiz yeterlidir. Bunu için *MainPage.xaml* dosyasına bir tane de <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.mediaelement" target="_blank" rel="noopener">MediaElement</a> nesnesi ekleyelim.

<script src="https://gist.github.com/polatengin/fd8bf8ed1aeab2b584239c2f90cc5fb5.js?file=MainPage.xaml"></script>

Böylece uygulamanın başlangıç ekranı aşağıdaki gibi gözükmeli;

![](/assets/uploads/2016/03/tts-2.png)

*MainPage.xaml.cs* dosyasında *Button_Click()* methodu aracılığıyla, butona tıklandığında yapılacak işleri yazıyoruz;

<script src="https://gist.github.com/polatengin/fd8bf8ed1aeab2b584239c2f90cc5fb5.js?file=MainPage.xaml.cs"></script>

Bu methodun içerisinde öncelikle <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.speechsynthesis.speechsynthesizer" target="_blank" rel="noopener">SpeechSynthesizer</a> sınıfından yeni bir **değişken** oluşturduk.

<a href="https://msdn.microsoft.com/library/windows/apps/windows.media.speechsynthesis.speechsynthesizer.synthesizetexttostreamasync" target="_blank" rel="noopener">SynthesizeTextToStreamAsync()</a> methoduna okunmasını istediğimiz metni **string** tipinde parametre olarak verdik ve geri dönen <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.speechsynthesis.speechsynthesisstream" target="_blank" rel="noopener">SpeechSynthesisStream</a> tipindeki cevabı bir değişkene atadık.

*Son olarak*, ekranda yeralan <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.mediaelement" target="_blank" rel="noopener">MediaElement</a> nesnesinin <a href="https://msdn.microsoft.com/library/windows/apps/br244338" target="_blank" rel="noopener">SetSource()</a> methoduna <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.speechsynthesis.speechsynthesisstream" target="_blank" rel="noopener">SpeechSynthesisStream</a> tipindeki değişkenimizi **parametre** olarak vererek, oluşan sesin oynatılmasını sağladık.

Böylece, ekrandaki <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.textbox" target="_blank" rel="noopener">TextBox</a> nesnesine yazılan cümle, <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.button" target="_blank" rel="noopener">Button</a> nesnesine tıklandığında uygulama tarafından okunacak ve bizler de duyabileceğiz.