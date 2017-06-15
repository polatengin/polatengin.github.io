---
layout: post
title: "Windows 10 UWP uygulamasında resimleri yuvarlak göstermek"
date: 2016-03-02 11:30
author: engin.polat
comments: true
category: [Universal App]
tags: [asset, background, ellipse, fill, grid, image, imagebrush, mainpage, page, source, themeresource, universal app, uwp, windows, windows10]
---
Son yıllarda özellikle mobil uygulamalarda **avatar** dediğimiz stilde resimleri **yuvarlak** göstermek sıklıkla kullanılır oldu.

Bunu gerçekleştirebilmek için resimleri **yuvarlak** kaydetmeye gerek *yok*.

Bu makalede **Windows 10 UWP** projesinde resimleri nasıl **yuvarlak** gösterebileceğimizi inceleyeceğiz.

Önce bir **Blank App (Universal Windows)** projesi oluşturalım;

![](/assets/uploads/2016/03/avatar1.png)

Projenin **Assets** dizinine yuvarlak göstermek istediğimiz resmi ekleyelim, bu makalede ben *Bora Kaşmer*'in aşağıdaki resmini ekliyorum;

![](/assets/uploads/2016/03/avatar2.jpg)

*MainPage.xaml* dosyasını açalım ve kodları aşağıdaki şekilde güncelleyelim;



&lt;Page
    x:Class="YuvarlakAvatarResim.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:YuvarlakAvatarResim"&gt;

    &lt;Grid Background="{ThemeResource ApplicationPageBackgroundThemeBrush}"&gt;
        &lt;Image Source="/Assets/bora.jpg" Width="250" Height="250" /&gt;
    &lt;/Grid&gt;

&lt;/Page&gt;</pre>

Böylece ekrana bir <a href="http://msdn.microsoft.com/library/system.windows.controls.image" target="_blank">Image</a> nesnesi ekledik ve içerisinde *Bora Kaşmer*'in resmini aşağıdaki gibi gösterdik;

![](/assets/uploads/2016/03/avatar3.jpg)

Eğer bu resmi *kare* değil, *yuvarlak* göstermek istiyorsak, <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.grid" target="_blank">Grid</a> nesnesinin içindeki <a href="http://msdn.microsoft.com/library/system.windows.controls.image" target="_blank">Image</a> nesnesini <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.shapes.ellipse" target="_blank">Ellipse</a> nesnesi ile değiştirip, <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.shapes.shape.fill" target="_blank">Fill</a> özelliğine <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.media.imagebrush" target="_blank">ImageBrush</a> nesnesi ekliyoruz;

<pre class="brush:xml">&lt;Page
    x:Class="YuvarlakAvatarResim.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:YuvarlakAvatarResim"&gt;

    &lt;Grid Background="{ThemeResource ApplicationPageBackgroundThemeBrush}"&gt;
        &lt;Ellipse Width="250" Height="250"&gt;
            &lt;Ellipse.Fill&gt;
                &lt;ImageBrush ImageSource="/Assets/bora.jpg" /&gt;
            &lt;/Ellipse.Fill&gt;
        &lt;/Ellipse>
    &lt;/Grid&gt;

&lt;/Page&gt;


Böylece ekranımız aşağıdaki şekilde **yuvarlak** resim ile gözükür hale geliyor;

![](/assets/uploads/2016/03/avatar4.jpg)

