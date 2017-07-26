---
layout: post
title: "Windows 10 UWP uygulamasında MediaEditing ile resimlerden video oluşturmak"
date: 2016-03-06 13:25
author: engin.polat
comments: true
category: [Windows]
tags: [backgroundaudiotrack, button, click, createfromfileasync, createfromimagefileasync, creationcollisionoption, FromMilliseconds, getfilesasync, getfolderasync, installedlocation, mainpage, mediaclip, mediacomposition, mediaelement, package, page, rendertofileasync, stackpanel, TimeSpan, universal app, uwp, windows10, xaml, xaml.cs]
---
Bu makale'de **ilginç** bir **uygulama** yazarak, *10 adet resim* ve *1 adet mp3* dosyasından *1 adet video* üreteceğiz.

Aşağıdaki projeyi *geliştirirken* ihtiyacımız olacak *örnek dosyaları* aşağıda paylaşıyorum;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/03/0.jpg" />
<img class="lazy img-responsive" data-src="/assets/uploads/2016/03/1.jpg" />
<img class="lazy img-responsive" data-src="/assets/uploads/2016/03/2.jpg" />
<img class="lazy img-responsive" data-src="/assets/uploads/2016/03/3.jpg" />
<img class="lazy img-responsive" data-src="/assets/uploads/2016/03/4.jpg" />
<img class="lazy img-responsive" data-src="/assets/uploads/2016/03/5.jpg" />
<img class="lazy img-responsive" data-src="/assets/uploads/2016/03/6.jpg" />
<img class="lazy img-responsive" data-src="/assets/uploads/2016/03/7.jpg" />
<img class="lazy img-responsive" data-src="/assets/uploads/2016/03/8.jpg" />
<img class="lazy img-responsive" data-src="/assets/uploads/2016/03/9.jpg" />
<a href="/assets/uploads/2016/03/relaxing.mp3" target="_blank">relaxing.mp3</a>

Hemen yeni bir **Blank App (Universal Windows)** proje oluşturalım;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/03/mediaediting-1.jpg" />

*MainPage.xaml* dosyasını açalım içerisindeki **kodları** aşağıdaki şekilde güncelleyelim. Böylece ekranda bir <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.button" target="_blank">Button</a> nesnesi gözükecek, üzerine tıklandığında **resim** ve **ses** dosyaları kullanılarak bir **video** oluşturulacak, oluşturulan **video** dosyası <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.button" target="_blank">Button</a>'un hemen altına eklediğimiz <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.mediaelement" target="_blank">MediaElement</a> nesnesinde oynatılacak.

<script src="https://gist.github.com/polatengin/900323a9f1ec20fdbf8467c2d0e0a652.js?file=MainPage.xaml"></script>

*MainPage.xaml.cs* dosyasında *Button_Click()* methodunu oluşturmalıyız;

<script src="https://gist.github.com/polatengin/900323a9f1ec20fdbf8467c2d0e0a652.js?file=MainPage.xaml.cs"></script>

Yukarıdaki kod bloğunda öncelikle <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.editing.mediacomposition" target="_blank">MediaComposition</a> sınıfından yeni bir değişken oluşturuyoruz. Böylece istediğimiz kadar *resim*, *ses* veya *video* dosyasını bu **composition** değişkenine ekleyerek yeni bir *video* oluşturabileceğiz.

<a href="https://msdn.microsoft.com/library/windows/apps/windows.applicationmodel.package" target="_blank">Package</a> sınıfının <a href="https://msdn.microsoft.com/library/windows/apps/windows.applicationmodel.package.installedlocation" target="_blank">InstalledLocation</a> **property**'sinden erişebildiğimiz <a href="https://msdn.microsoft.com/library/windows/apps/windows.storage.storagefolder.getfolderasync" target="_blank">GetFolderAsync()</a> methodu ile projenin istediğim dizinine erişebiliyor, <a href="https://msdn.microsoft.com/library/windows/apps/windows.storage.storagefolder.getfileasync" target="_blank">GetFilesAsync()</a> methodunu kullanarak içindeki dosyaları elde edebiliyoruz.

<a href="https://msdn.microsoft.com/library/windows/apps/windows.media.editing.mediaclip" target="_blank">MediaClip</a> sınıfının **static** <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.editing.mediaclip.createfromimagefileasync" target="_blank">CreateFromImageFileAsync()</a> methodunu kullanarak <a href="https://msdn.microsoft.com/library/system.timespan" target="_blank">TimeSpan</a> sınıfı aracılığıyla belirlediğimiz süre kadar videoda görüntülenecek resimleri **composition** değişkenine ekliyoruz.

<a href="https://msdn.microsoft.com/library/windows/apps/windows.media.editing.backgroundaudiotrack" target="_blank">BackgroundAudioTrack</a> sınıfının **static** <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.editing.backgroundaudiotrack.createfromfileasync" target="_blank">CreateFromFileAsync()</a> methodunu kullanarak videonun arkaplan sesi olacak ses dosyalarını **composition** değişkenine ekliyoruz.

<a href="https://msdn.microsoft.com/library/windows/apps/windows.storage.applicationdata" target="_blank">ApplicationData</a> sınıfının <a href="https://msdn.microsoft.com/library/windows/apps/windows.storage.applicationdata.localfolder" target="_blank">LocalFolder</a> **property**'si aracılığı ile erişebildiğimiz <a href="https://msdn.microsoft.com/library/windows/apps/windows.storage.storagefolder.createfileasync" target="_blank">CreateFileAsync()</a> methodu aracılığıyla *video.mp4* isimli dosyayı oluşturuyoruz, ikinci parametrede **CreationCollisionOption.GenerateUniqueName** değerini verdiğimiz için aynı isimli bir dosya zaten dizinde varsa dosyaya yeni bir isim verilecek.

<a href="https://msdn.microsoft.com/library/windows/apps/windows.media.editing.mediacomposition" target="_blank">MediaComposition</a> sınıfının <a href="https://msdn.microsoft.com/library/windows/apps/windows.media.editing.mediacomposition.rendertofileasync" target="_blank">RenderToFileAsync()</a> methodunu kullanarak, resim ve ses dosyaları eklediğim **composition** değişkeninden **video** oluşturuyoruz.

Ekranda yeralan <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.mediaelement" target="_blank">MediaElement</a> nesnesinin <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.mediaelement.setsource" target="_blank">SetSource()</a> methodunu kullanarak oluşturduğumuz video dosyasını yüklüyor, <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.mediaelement.play" target="_blank">Play()</a> methodunu kullanarak ekranda oynatmaya başlıyoruz.

Bu makalede verdiğim resim ve ses dosyalarını kullanarak oluşturulan videoyu aşağıda izleyebilirsiniz;

<div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="https://www.youtube.com/embed/assets/uploads/2016/03/video.mp4" frameborder="0" allowfullscreen></iframe></div>