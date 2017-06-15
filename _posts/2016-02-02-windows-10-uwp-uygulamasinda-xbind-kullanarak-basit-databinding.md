---
layout: post
title: "Windows 10 UWP uygulamasında {x&#58;Bind} kullanarak basit DataBinding"
date: 2016-02-02 10:15
author: engin.polat
comments: true
category: [Universal App]
tags: [binding, databinding, grid, mainpage, onnavigatedto, override, page, private, property, protected, public, text, textblock, universal app, uwp, windows, windows10, xbind, xaml, xaml.cs]
---
*Bu makaleyi okumadan önce <a href="http://www.enginpolat.com/windows-10-uwp-uygulamasinda-page-resources-icinde-style-kullanmak/" target="_blank">Windows 10 UWP uygulamasında Page.Resources içinde Style kullanmak</a> makalesini okumanızı tavsiye ederim.*

En son **geliştirdiğimiz** hali ile ekranımız aşağıdaki şekilde *gözüküyor* olmalı;

![](/assets/uploads/2016/02/databinding-1.png)

**Databinding** yapabilmek için öncelikle *MainPage.xaml.cs* dosyasını açıp, **binding** yapacağımız **property**'leri ve *varsa* **varsayılan değerlerini** tanımlıyoruz.

*Bu örnekte saat, dakika ve saniyenin her hanesini ayrı gösterebilmek için Hour1, Hour2, Minute1, Minute2, Second1 ve Second2 property'lerini aşağıdaki gibi tanımladım;*



public string Hour1 { get; set; } = "0";

public string Hour2 { get; set; } = "0";

public string Minute1 { get; set; } = "0";

public string Minute2 { get; set; } = "0";

public string Second1 { get; set; } = "0";

public string Second2 { get; set; } = "0";</pre>

Artık ekrandaki <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.textblock" target="_blank">Textblock</a> nesnelerini güncelleyebiliriz, *RefreshDisplay()* methodunu tanımlayıp, içerisinde yukarıda tanımladığımız **property**'lere değer ataması yapıyoruz;

<pre class="brush:csharp">private void RefreshDisplays()
{
    var now = DateTime.Now;

    var hour = now.Hour.ToString("00");
    var minute = now.Minute.ToString("00");
    var second = now.Second.ToString("00");

    Hour1 = hour.Substring(0, 1);
    Hour2 = hour.Substring(1, 1);

    Minute1 = minute.Substring(0, 1);
    Minute2 = minute.Substring(1, 1);

    Second1 = second.Substring(0, 1);
    Second2 = second.Substring(1, 1);
}</pre>

Sayfa açıldığında *RefreshDisplays()* methodunu çağırabilmek için **sayfanın açıldığı anı** bilmemiz ve tam orada *RefreshDisplays()* methodunu çağırmamız lazım.

**Windows 10 UWP** uygulamalarında bir sayfanın açıldığı anı <a href="https://msdn.microsoft.com/library/windows.ui.xaml.controls.page" target="_blank">Page</a> sınıfında tanımlı olan <a href="https://msdn.microsoft.com/library/windows.ui.xaml.controls.page.onnavigatedto" target="_blank">OnNavigatedTo()</a> methodunda yakalayabiliyoruz.

*MainPage* sınıfımızın **base class**'ı olan **Page** sınıfında tanımlı olan **OnNavigatedTo()** methodunda kod çalıştırabilmek için **OnNavigatedTo** methodunu **override** etmemiz lazım;

<pre class="brush:csharp">protected override void OnNavigatedTo(NavigationEventArgs e)
{
    base.OnNavigatedTo(e);

    RefreshDisplays();
}</pre>

**override** ettiğimiz **OnNavigatedTo()** methodunun içerisinde *RefreshDisplays()* methodunu çağırıyoruz.

**Databinding** için **code-behind** tarafında yapmamız gereken tüm hazırlıkları yaptık, şimdi *MainPage.xaml* dosyasını açarak binding kodlarını tamamlayalım.

*MainPage.xaml* dosyasında yeralan nesnelerden **binding** yapmak istediklerimizin, **binding** yapmak istediğimiz **property**'lerine değer olarak **{x:Bind}** ataması yapmalıyız.

Bu örnekte, **Textblock** nesnelerinin **Text** *property*'lerine **binding** yapmak istiyoruz, *MainPage.xaml* dosyasındaki <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.grid" target="_blank">Grid</a> elementini aşağıdaki kodlara dönüştürüyoruz;

<pre class="brush:xml">&lt;Grid&gt;
    &lt;Grid.ColumnDefinitions&gt;
    &lt;ColumnDefinition Width="*" /&gt;
    &lt;ColumnDefinition Width="Auto" /&gt;
    &lt;ColumnDefinition Width="*" /&gt;
    &lt;ColumnDefinition Width="Auto" /&gt;
    &lt;ColumnDefinition Width="*" /&gt;
    &lt;/Grid.ColumnDefinitions&gt;

    &lt;Border Grid.Column="0"&gt;
        &lt;StackPanel Orientation="Horizontal"&gt;
            &lt;TextBlock Text="{x:Bind Hour1}" /&gt;
            &lt;TextBlock Text="{x:Bind Hour2}" /&gt;
        &lt;/StackPanel&gt;
    &lt;/Border&gt;
    &lt;Border Grid.Column="1"&gt;
        &lt;TextBlock Text=":" /&gt;
    &lt;/Border&gt;
    &lt;Border Grid.Column="2"&gt;
        &lt;StackPanel Orientation="Horizontal"&gt;
            &lt;TextBlock Text="{x:Bind Minute1}" /&gt;
            &lt;TextBlock Text="{x:Bind Minute2}" /&gt;
        &lt;/StackPanel&gt;
    &lt;/Border&gt;
    &lt;Border Grid.Column="3"&gt;
        &lt;TextBlock Text=":" /&gt;
    &lt;/Border&gt;
    &lt;Border Grid.Column="4"&gt;
        &lt;StackPanel Orientation="Horizontal"&gt;
            &lt;TextBlock Text="{x:Bind Second1}" /&gt;
            &lt;TextBlock Text="{x:Bind Second2}" /&gt;
        &lt;/StackPanel&gt;
    &lt;/Border&gt;

&lt;/Grid&gt;


*MainPage.xaml* dosyasında sayfamızın **ön izlemesi** aşağıdaki gibi gözükmeli;

![](/assets/uploads/2016/02/databinding-2.png)

Eğer uygulamayı çalıştıracak olursak **zaman** bilgisi aşağıdaki şekilde ekranda gözüküyor olmalı;

![](/assets/uploads/2016/02/databinding-3.png)

