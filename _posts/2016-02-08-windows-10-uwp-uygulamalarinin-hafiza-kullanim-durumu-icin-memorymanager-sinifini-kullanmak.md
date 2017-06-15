---
layout: post
title: "Windows 10 UWP Uygulamalarının Hafıza Kullanım Durumu için MemoryManager sınıfını kullanmak"
date: 2016-02-08 08:45
author: engin.polat
comments: true
category: [Universal App]
tags: [appmemoryusage, appmemoryusagelimit, class, constructor, dispatchertimer, event, mainpage, memory, memorymanager, namespace, page, stackpanel, textblock, tick, TimeSpan, uwp, visual studio, windows10, xaml, xaml.cs, xmlns]
---
**Windows 10 UWP** uygulaması geliştirirken *hafıza*'nın ne kadarını kullandığınızı ve kullanabileceğiniz ne kadar hafıza alanı kaldığını bulmanız gerekebilir.

Bu durumda <a href="http://msdn.microsoft.com/library/windows/apps/windows.system" target="_blank">Windows.System</a> **namespace**'i altında yeralan <a href="http://msdn.microsoft.com/library/windows/apps/windows.system.memorymanager" target="_blank">MemoryManager</a> sınıfını kullanabiliriz.

Hemen **Visual Studio** açarak yeni bir proje oluşturalım;

![](/assets/uploads/2016/02/MemoryManagerOrnek-1.png)

Öncelikle *MainPage.xaml* dosyasını açalım ve içerisine aşağıdaki kodları yazarak ekranımızı **tasarlayalım**;



&lt;Page
    x:Class="MemoryManagerOrnek.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:MemoryManagerOrnek"&gt;

    &lt;StackPanel&gt;

        &lt;TextBlock Text="AppMemoryUsage:" /&gt;
        &lt;TextBlock Name="AppMemoryUsage" /&gt;
        &lt;TextBlock Text="AppMemoryUsageLimit:" /&gt;
        &lt;TextBlock Name="AppMemoryUsageLimit" /&gt;

    &lt;/StackPanel&gt;

&lt;/Page&gt;</pre>

Şimdi *MainPage.xaml.cs* dosyasını açalım ve <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.dispatchertimer" target="_blank">DispatcherTimer</a> sınıfından yeni bir **değişken** tanımlayıp, *MainPage* sınıfının **constructor**'ında, her 1 saniyede bir *tetiklenmesini* sağlayalım;

<pre class="brush:csharp">DispatcherTimer timer = null;

public MainPage()
{
    this.InitializeComponent();

    timer = new DispatcherTimer();
    timer.Interval = new TimeSpan(0, 0, 1);
    timer.Tick += timer_Tick;
    timer.Start();
}</pre>

Artık *timer_Tick()* metodumuzu yazabiliriz;

<pre class="brush:csharp">private void timer_Tick(object sender, object e)
{
    AppMemoryUsage.Text = string.Format("{0} ({1:0.00} MB)", MemoryManager.AppMemoryUsage, MemoryManager.AppMemoryUsage / (1024.0 * 1024.0));
    AppMemoryUsageLimit.Text = string.Format("{0} ({1:0.00} GB)", MemoryManager.AppMemoryUsageLimit, MemoryManager.AppMemoryUsageLimit / (1024 * 1024 * 1024));
}


Yukarıdaki metodun içerisinde öncelikle <a href="http://msdn.microsoft.com/library/windows/apps/windows.system.memorymanager" target="_blank">MemoryManager</a> sınıfının <a href="http://msdn.microsoft.com/library/windows/apps/windows.system.memorymanager.appmemoryusage" target="_blank">AppMemorryUsage</a> **property**'sinin değerini okuduk ve bunu (*1024* x *1024*) değerine bölerek kaç **megabayt** (*MB*) yaptığını hesapladık, *AppMemoryUsage* isimli <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.textblock" target="_blank">Textblock</a> nesnesinde gösterdik.

Aynı şekilde <a href="http://msdn.microsoft.com/library/windows/apps/windows.system.memorymanager" target="_blank">MemoryManager</a> sınıfının <a href="http://msdn.microsoft.com/library/windows/apps/windows.system.memorymanager.appmemoryusagelimit" target="_blank">AppMemorryUsageLimit</a> **property**'sinin değerini okuduk ve bunu (*1024* x *1024* x *1024*) değerine bölerek kaç **gigabayt** (*GB*) yaptığını hesapladık, *AppMemoryUsageLimit* isimli <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.textblock" target="_blank">Textblock</a> nesnesinde gösterdik.

Uygulama açıldıktan sonra her 1 saniyede bir, uygulamanın o anda *kullandığı* **hafıza miktarı** ve *kullanabileceği* **hafıza miktarı** ekranda gösterilecek.

![](/assets/uploads/2016/02/MemoryManagerOrnek-2.png)

*Not : Eğer uygulamayı bilgisayarınızda çalıştıracak olursanız, **AppMemoryUsageLimit** değeri olarak, sistemde kullanılabilir boş hafıza miktarını görmelisiniz. Eğer **512 MB** hafızaya sahip bir cep telefonunda çalıştıracak olursanız, **185 MB** limitini, **1024 MB** (1 GB) hafızalı bir cep telefonunda çalıştıracak olursanız **390 MB** limit görmelisiniz.*

