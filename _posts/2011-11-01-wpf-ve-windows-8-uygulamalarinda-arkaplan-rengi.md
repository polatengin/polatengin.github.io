---
layout: post
title: "WPF ve Windows 8 Uygulamalarında Arkaplan Rengi"
date: 2011-11-01 17:40
author: engin.polat
comments: true
category: [C#]
tags: [Color, endpoint, gradient, gradientstop, lineargradientbrush, MetroUI, offset, radialgradientbrush, strtpoint, usercontrol, visual studio 2011, windows8, wpf, xaml]
---
**Windows 8** uygulamaları **WPF** ile geliştirildikleri için, **WPF** uygulamalarında arkaplan'a verebildiğimiz *geçiş renkleri* (*gradient*) **Windows 8** uygulamalarında da kullanılabiliyor.

<a href="http://msdn.microsoft.com/library/system.windows.media.lineargradientbrush" target="_blank">LinearGradientBrush</a> sınıfını kullanarak uygulamamızın arkaplan renginin birden fazla renk arasında geçişli (*gradient*) olmasını sağlayabiliriz.

İlk olarak *Visual Studio 2011*'imizi açarak *New Project* dialog penceresinde **Windows Metro Style** grubundan **Application** şablonunu seçelim ve yeni oluşturacağımız projeye bir isim verelim;

![](/assets/uploads/2011/11/LinearGradientBrush-1.png "Windows 8 WPF LinearGradientBrush")

İlk önce iki renk içeren bir geçişe sahip arkaplan hazırlayalım;

![](/assets/uploads/2011/11/LinearGradientBrush-4.png "Windows 8 WPF LinearGradientBrush")



&lt;UserControl x:Class="RenkliUygulama.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    d:DesignHeight="768" d:DesignWidth="1366"&gt;

    &lt;Grid x:Name="LayoutRoot"&gt;
        &lt;Grid.Background&gt;
            &lt;LinearGradientBrush StartPoint="0,0" EndPoint="1,1"&gt;
                &lt;GradientStop Color="#3f98f1"/&gt;
                &lt;GradientStop Color="#003c7b" Offset="1"/&gt;
            &lt;/LinearGradientBrush&gt;
        &lt;/Grid.Background&gt;
    &lt;/Grid&gt;

&lt;/UserControl&gt;</pre>

![](/assets/uploads/2011/11/LinearGradientBrush-3.png "Windows 8 WPF LinearGradientBrush")

**LinearGradientBrush** element'inin <a href="http://msdn.microsoft.com/library/system.windows.media.lineargradientbrush.startpoint" target="_blank">StartPoint</a> özelliğine *0,0* değerini, <a href="http://msdn.microsoft.com/library/system.windows.media.lineargradientbrush.endpoint" target="_blank">EndPoint</a> özelliğine *1,1* değerini verdik.

**StartPoint** ve **EndPoint** alanlarına vereceğimiz değerler için, aşağıdaki şablona bakabilirsiniz;

![](/assets/uploads/2011/11/LinearGradientBrush-2.png "Windows 8 WPF LinearGradientBrush")

Yukarıdaki **Xaml** koduna sahip formu çalıştırdığımızda aşağıdaki ekran ile karşılaşırız;

![](/assets/uploads/2011/11/LinearGradientBrush-5.png "Windows 8 WPF LinearGradientBrush")

Eğer iki renk değil, beş renk geçişli bir arkaplan oluşturmak istiyorsak, <a href="http://msdn.microsoft.com/library/system.windows.media.gradientstop" target="_blank">GradientStop</a> elemanlarını artırmamız lazım;

![](/assets/uploads/2011/11/LinearGradientBrush-6.png "Windows 8 WPF LinearGradientBrush")

<pre class="brush:xml">&lt;UserControl x:Class="RenkliUygulama.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    d:DesignHeight="768" d:DesignWidth="1366"&gt;

    &lt;Grid x:Name="LayoutRoot"&gt;
        &lt;Grid.Background&gt;
            &lt;LinearGradientBrush StartPoint="0,0" EndPoint="1,1"&gt;
                &lt;GradientStop Color="White"/&gt;
                &lt;GradientStop Color="#FEFFBF3C" Offset="0.25"/&gt;
                &lt;GradientStop Color="#FEFF607C" Offset="0.5"/&gt;
                &lt;GradientStop Color="#FED68FAC" Offset="0.75"/&gt;
                &lt;GradientStop Color="#FF4C68AD" Offset="1"/&gt;
            &lt;/LinearGradientBrush&gt;
        &lt;/Grid.Background&gt;
    &lt;/Grid&gt;

&lt;/UserControl&gt;


![](/assets/uploads/2011/11/LinearGradientBrush-7.png "Windows 8 WPF LinearGradientBrush")

Yukarıdaki **Xaml** koduna sahip formu çalıştırdığımızda aşağıdaki ekran ile karşılaşırız;

![](/assets/uploads/2011/11/LinearGradientBrush-8.png "Windows 8 WPF LinearGradientBrush")

**LinearGradientBrush** sınıfı yerine <a href="http://msdn.microsoft.com/library/system.windows.media.radialgradientbrush" target="_blank">RadialGradientBrush</a> sınıfını da kullanabiliriz.

**RadialGradientBrush** kullanarak yaptığınız form arkaplan görüntülerini yorum alanında paylaşın.

