---
layout: post
title: "UWP uygulamasında SystemIdentification ile sistemin benzersiz kimliğini oluşturmak"
date: 2017-02-23 12:30
author: engin.polat
comments: true
category: [Windows]
tags: [csharp, uwp, systemidentification, systemidentificationinfo, xaml, class, textblock, static, namespace, stream, datareader, frombuffer, using, convert, tobase64string, toarray, byte, string]
---
Bu makalede bir **UWP** uygulamasının çalıştığı bilgisayarın diğer bilgisayarlardan farklı *kimlik bilgisini* oluşturacağız.

Genellikle, uygulamanın çalıştığı bilgisayarı, uygulamanın çalıştığı diğer bilgisayarlardan ayırt etmek için buna ihtiyaç duyarız.

Böylece, uygulamamız aynı anda, aynı kullanıcı ile, birden fazla bilgisayarda çalışıyor olsa bile, belirlediğimiz bir tanesine bildirim gönderebilir, ondan gelecek mesajları ayrıca işleyebiliriz.

Hemen **Visual Studio** açalım ve yeni bir **Windows Universal** / **Blank App (*Universal Windows*)** projesi oluşturalım;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/02/system-identification-0.png" alt="UWP projesi oluşturma" />

Oluşturacağımız *benzersiz kimlik bilgisini* (**Unique System Identifier**) ekranda görebilmek için *MainPage.xaml* dosyasına *lblSystemIdentifier* isminde bir <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock" target="_blank" rel="noopener">TextBlock</a> ekleyelim;

<script src="https://gist.github.com/polatengin/c5fa9b1f67cf5d99fbe08eacc2122986.js?file=MainPage.xaml"></script>

*MainPage.xaml* dosyasına eklediğimiz <code>Loaded="Page_Loaded"</code> kodu sayesinde, *MainPage.xaml.cs* dosyasına ekleyeceğimiz *Page_Loaded()* methodunda uygulamanın açıldığı anda yapmak istediklerimizi yapabileceğiz.

*MainPage.xaml.cs* dosyasını açalım ve *Page_Loaded()* methodunu oluşturalım.

Öncelikle <code>SystemIdentification.GetSystemIdForPublisher();</code> methodunu çağırıyoruz.

*Static* olan <a href="https://docs.microsoft.com/uwp/api/windows.system.profile.systemidentification" target="_blank" rel="noopener">SystemIdentification</a> class'ının dokümantasyonuna göre <code>GetSystemIdForPublisher()</code> methodu geriye <a href="https://docs.microsoft.com/uwp/api/windows.system.profile.systemidentificationinfo" target="_blank" rel="noopener">SystemIdentificationInfo</a> sınıfından cevap döner.

Dokümantasyona göre <code>GetSystemIdForPublisher()</code> methodu uygulamanın yayımcısına ve bilgisayara özel bir cevap döner <mark><small>(Gets an identifier value for the system based on the app publisher ID), (Represents a unique system identifier based on either the app publisher ID or a user ID)</small></mark>

Yapmamız gereken, <code>Windows.Storage.Streams</code> *namespace*'inde yeralan <a href="https://docs.microsoft.com/uwp/api/windows.storage.streams.datareader" target="_blank" rel="noopener">DataReader</a> sınıfının <code>FromBuffer()</code> methodu ile bu değeri önce <code>byte[]</code> tipine sonra <code>Convert.ToBase64String()</code> ile <code>string</code> tipine dönüştürmek.

<script src="https://gist.github.com/polatengin/c5fa9b1f67cf5d99fbe08eacc2122986.js?file=MainPage.xaml.cs"></script>

Proje çalıştırıldığında aşağıdaki gibi bir çıktı üretmeli;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/02/system-identification-1.png" />
