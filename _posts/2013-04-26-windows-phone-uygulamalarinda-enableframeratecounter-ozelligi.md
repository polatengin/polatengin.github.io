---
layout: post
title: "Windows Phone uygulamalarında EnableFrameRateCounter özelliği"
date: 2013-04-26 14:00
author: engin.polat
comments: true
category: [Programlama]
tags: [enableframeratecounter, frame per second, list, longlistselector, marketplace, memory, performance, performans, render, surface, texture, thread]
---
**Windows Phone** uygulamaları geliştirirken elimizin altında basit ama önemli *performans ipuçlarının* olması işimize yarar.

<a href="http://msdn.microsoft.com/en-us/library/windowsphone/develop/gg588380.aspx" title="MSDN : Frame rate counters in Windows Phone Emulator" target="_blank" rel="noopener">EnableFrameRateCounter</a> özelliğini açmak



*   Render Thread FPS
*   User Interface Thread FPS
*   Texture Memory Usage
*   Surface Counter
*   Intermediate Texture Counter
*   Screen Fill Rate

değerlerinin ekranda gözükmesini sağlar;

![](/assets/uploads/2013/04/EnableFrameRateCounter.png)

Bu değerler şu anlamlara gelir;

**Render Thread FPS**
Ekran'ın güncellenme sıklığı. 60 fps civarı güncelleme hızı son kullanıcıya iyi bir deneyim sunacaktır, 30 fps ve üzeri ise kabul edilebilir bir deneyim sunacaktır. Ekran güncelleme hızı 30 fps altınaa düştüğünde bu değer kırmızı olacaktır, dikkat etmek lazım!

**User Interface Thread FPS**
O esnada çalışan UI thread'in güncellenme sıklığı. Data Binding, animasyonlar ve property change notifications bu thread'de işletilirler. Eğer 15 fps altına düşerse bu değer kırmızı olacaktır, dikkat etmek lazım!

**Texture Memory Usage**
Çalışan uygulamada kullanılan Texture'ların kullandığı grafik hafıza miktarı

**Surface Counter**
Graphical Processing Unit (GPU) tarafından işlenecek yüzey miktarı

**Intermediate Surface Counter**
Önbelleklenmiş bellekler dahil işlenecek yüzey miktarı

**Screen Fill Rate**
Ekranda güncellenecek piksel miktarı. 1 değeri ekran çözünürlüğü kadar anlamına geliyor, örneğin 480x800. Eğer 1'in altına düşerse veya 2'nin üzerine çıkarsa kırmızı olur, dikkat etmek lazım!

*App.xaml.cs* dosyasında yeralan



Application.Current.Host.Settings.EnableFrameRateCounter = true;</pre>

satırı ile performans ipuçlarını ekranda göstermeye başlayabiliriz.

Uygulamanın son halini *MarketPlace*'e göndermeden önce *performans ipuçlarının* ekranda gözükmediğinden emin olmamız gerekiyor.

Yukarıda ekranın bir parçasının gözüktüğü örnek uygulama için *MainPage.xaml* dosyasını aşağıdaki şekilde güncellemek gerekiyor;

<pre class="brush:xml">&lt;phone:PhoneApplicationPage
    x:Class="EnableFrameRateCounterTest.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:phone="clr-namespace:Microsoft.Phone.Controls;assembly=Microsoft.Phone"
    xmlns:shell="clr-namespace:Microsoft.Phone.Shell;assembly=Microsoft.Phone"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    FontFamily="{StaticResource PhoneFontFamilyNormal}"
    FontSize="{StaticResource PhoneFontSizeNormal}"
    Foreground="{StaticResource PhoneForegroundBrush}"
    SupportedOrientations="Portrait" Orientation="Portrait"
    shell:SystemTray.IsVisible="True">

    &lt;phone:LongListSelector Name="lstMessages" /&gt;

&lt;/phone:PhoneApplicationPage&gt;</pre>

*MainPage.xaml.cs* dosyasında aşağıdaki değişiklikler yapılmalı;

<pre class="brush:csharp">public MainPage()
{
    InitializeComponent();

    var messageList = new List&lt;string&gt;();

    for (int iLoop = 0; iLoop < 150; iLoop++)
    {
        messageList.Add("Long message line #" + iLoop);
    }

    lstMessages.ItemsSource = messageList;
}</pre>


