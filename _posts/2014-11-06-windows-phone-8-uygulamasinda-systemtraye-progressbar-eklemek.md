---
layout: post
title: "Windows Phone 8 uygulamasında SystemTray'e Progressbar eklemek"
date: 2014-11-06 19:20
author: engin.polat
comments: true
category: [Windows Phone]
tags: [isindeterminate, isvisible, phoneapplicationpage, progressindicator, shell, systemtray, text, windows phone, wp8]
---
**Windows Phone 8** için geliştirdiğimiz uygulamada *uzun süren bir işlem* esnasında kullanıcıya *işlemin hala devam ettiğini* göstermek isteriz.

*Mesela, haberler sayfasında güncel haberleri web service'ten çekerken veya kullanıcının ekranda doldurduğu formu web service aracılığı ile kaydederken işlemin devam ettiğini ekranda göstermek isteriz.*

Bunun için telefonda ekranın en üstünde bulunan <a href="https://msdn.microsoft.com/library/windows/apps/microsoft.phone.shell.systemtray" target="_blank">SystemTray</a>'e <a href="https://msdn.microsoft.com/library/windows/apps/microsoft.phone.shell.progressindicator" target="_blank">ProgressIndicator</a> eklememiz yeterli. Bunun için istediğimiz sayfanın **xaml** dosyasını açmalı;



&lt;phone:PhoneApplicationPage
    x:Class="ProgressIndicatorOrnek.MainPage"
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
    shell:SystemTray.IsVisible="True"&gt;

&lt;/phone:PhoneApplicationPage&gt;</pre>

<a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.controls.phoneapplicationpage" target="_blank">PhoneApplicationPage</a> açılış ve kapanış tagları arasına aşağıdaki kod parçasını eklemeliyiz;

<pre class="brush:xml">&lt;shell:SystemTray.ProgressIndicator&gt;
    &lt;shell:ProgressIndicator IsIndeterminate="True" IsVisible="True" Text="Güncel haberler yükleniyor..." /&gt;
&lt;/shell:SystemTray.ProgressIndicator&gt;


Böylece ilgili sayfa ekrana geldiğinde saatin de bulunduğu **SystemTray** alanında *Güncel haberler yükleniyor...* yazısı ile bir **ProgressIndicator** belirecek.

![](/assets/uploads/2014/11/ProgressIndicator.png)

