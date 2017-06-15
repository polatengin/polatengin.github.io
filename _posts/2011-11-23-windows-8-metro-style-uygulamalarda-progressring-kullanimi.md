---
layout: post
title: "Windows 8 Metro Style Uygulamalarda ProgressRing Kullanımı"
date: 2011-11-23 14:20
author: engin.polat
comments: true
category: [C#]
tags: [center, collapsed, constructor, dispatchertimer, event, fontsize, fromseconds, grid, height, horizontalalignment, indicator, interval, IsActive, loading, MetroUI, progressring, start, stop, textblock, tick, TimeSpan, verticalalignment, visibility, visual studio 2011, width, windows8]
---
Uygulamalarımızda *uzun süren işlemler* sırasında, kullanıcıya işlemin sürdüğünü göstermek için genellikle **yükleniyor** (*loading*) göstergeleri kullanırız.

**Windows 8** için geliştirdiğimiz **Metro Style** uygulamalarda bu yeteneği uygulamamıza katmak için <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.progressring" title="ProgressRing Class" target="_blank">ProgressRing</a> sınıfından faydalanabiliriz.

Bu makalede uygulamanın açılışı esnasında bir *yükleniyor* (*loading*) göstergesi ekrana getireceğiz, *5 saniye* bekledikten sonra (*uygulamanın ihtiyaç duyacağı tüm modüllerin yüklenmesi 5 saniye sürecek diye varsayıyoruz*) **yükleniyor göstergesini** ekrandan kaldıracak ve *Gerekli Modüller Yüklendi* metnini ekranda göstereceğiz.

Hemen yeni bir **Visual Studio 2011** açarak örnek proje üzerinde geliştirmeye başlayalım;

![](/assets/uploads/2011/10/4.png "Visual Studio 2011 - Açılış Ekranı")

*Yeni Proje* oluşturma dialog kutusunda **Windows Metro Style** grubunda yer alan **Application** proje şablonunu seçelim ve projemize bir isim verelim (bu örnekte benim kullandığım isim, *ProgressRingOrnek*)

![](/assets/uploads/2011/11/ProgressRing-0.png "Visual Studio 2011 - Metro Style Application - ProgressRing")

Proje oluşturulduğunda *MainPage.xaml* dosyasının içeriği;



&lt;UserControl x:Class="ProgressRingOrnek.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    d:DesignHeight="768" d:DesignWidth="1366"&gt;

    &lt;Grid x:Name="LayoutRoot" Background="#FF0C0C0C"&gt;
    &lt;/Grid&gt;

&lt;/UserControl&gt;</pre>

Öncelikle <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.grid" title="Grid Control" target="_blank">Grid</a> elementi içerisine bir tane <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.progressring" title="ProgressRing Control" target="_blank">ProgressRing</a>, bir tane de <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.textblock" title="TextBlock Control" target="_blank">TextBlock</a> nesnesi ekliyoruz;

<pre class="brush:xml">&lt;ProgressRing x:Name="ProgressItem" HorizontalAlignment="Center" VerticalAlignment="Center" Width="240" Height="240" /&gt;

&lt;TextBlock x:Name="MessageItem" HorizontalAlignment="Center" VerticalAlignment="Center" Visibility="Collapsed" Text="Gerekli Modüller Yüklendi!" FontSize="22" /&gt;</pre>

**ProgressRing** elementini ekranda yatay eksende (*HorizontalAlignment*) ve dikey eksende (*VerticalAlignment*) ortalıyoruz (*Center*), ayrıca genişlik (*Width*) ve yükseklik (*Height*) değerlerini de belirliyoruz (*240 px*).

**TextBlock** elementini de ekranda yatay eksende (*HorizontalAlignment*) ve dikey eksende (*VerticalAlignment*) ortalıyoruz (*Center*), font boyutunu (*FontSize*) ayarlıyoruz (*22 px*), ekranda gözükmemesi için <a href="http://msdn.microsoft.com/library/system.windows.uielement.visibility" title="Visibility Property" target="_blank">Visibility</a> özelliğine <a href="http://msdn.microsoft.com/library/system.windows.visibility" title="Visibility Enumeration" target="_blank">Collapsed</a> değerini veriyoruz.

**HorizontalAlignment** özelliğine verilebilecek değerler;



*   Center
*   Left
*   Right
*   Stretch

**VerticalAlignment** özelliğine verilebilecek değerler;



*   Bottom
*   Center
*   Stretch
*   Top

**Visibility** özelliğine verilebilecek değerler;



*   Collapsed
*   Visible

*MainPage.xaml.cs* dosyasında, *MainPage* sınıfının **constructor**'ında ilk önce **ProgressRing** nesnesini ekranda gösterelim;

<pre class="brush:csharp">ProgressItem.IsActive = true;</pre>

![](/assets/uploads/2011/11/ProgressRing-1.png "Metro Style Application - ProgressRing Form")

*5 saniye* gecikme sağlayıp, istediğimiz işi yapacak kodu yazmaya başlayalım. Bu iş için <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.dispatchertimer" title="DispatcherTimer Class" target="_blank">DispatcherTimer</a> sınıfını kullanacağız.

<a href="http://msdn.microsoft.com/library/system.timespan" title="TimeSpan Class" target="_blank">TimeSpan</a> tipinde <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.dispatchertimer.interval" title="DispatcherTimer Interval Property" target="_blank">Interval</a> özelliğine *5 saniye* gecikme sağlayacak *TimeSpan.FromSeconds(5)* değerini veriyoruz;

<pre class="brush:csharp">timer.Interval = TimeSpan.FromSeconds(5);</pre>

**DispatcherTimer** nesnesinin <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.dispatchertimer.tick" title="DispatcherTimer Tick Event" target="_blank">Tick</a> olayını yakalayıp, **ProgressRing** nesnesini ekrandan gizlemeli, **TextBlock** nesnesini ekranda göstermeliyiz;

<pre class="brush:csharp">timer.Tick += delegate(object sender, object e)
{
    timer.Stop();

    ProgressItem.IsActive = false;
    MessageItem.Visibility = Visibility.Visible;
};


Son olarak, **DispatcherTimer** nesnesinin <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.dispatchertimer.start" title="DispatcherTimer Start Method" target="_blank">Start()</a> method'unu kullanarak, *5 saniyelik* süreci başlatıyoruz.

**DispatcherTimer** nesnesinin **Interval** özelliğinde belirlediğimiz süre dolduğunda *Gerekli Modüller Yüklendi* mesajı ekranda belirecek;

![](/assets/uploads/2011/11/ProgressRing-2.png "Metro Style Application - ProgressRing Form")

