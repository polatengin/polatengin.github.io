---
layout: post
title: "Windows 8 Uygulamaya Application Bar Ekleme"
date: 2011-11-16 16:22
author: engin.polat
comments: true
category: [C#]
tags: [application, applicationbar, button, click, grid, image, MetroUI, orientation, stackpanel, textblock, textbox, usercontrol, verticalalignment, visual studio 2011, windows8, xaml]
---
<a href="http://www.enginpolat.com/etiket/windows8/" target="_blank">Windows 8</a> uygulamalarında sık kullanılan özelliklerin <a href="http://msdn.microsoft.com/en-us/library/ff431801.aspx" target="_blank">Application Bar</a> sayesinde hızlı erişilmesini sağlayabilirsiniz.

Hemen yeni bir **Visual Studio 2011** açarak geliştirmeye başlıyoruz;

![](/assets/uploads/2011/10/4.png "Visual Studio 2011 - Açılış Ekranı")

Öncelikle *Yeni Proje* oluşturma dialog kutusunda **Windows Metro Style** grubunda yer alan **Application** proje şablonunu seçelim ve projemize bir isim verelim (bu örnekte benim kullandığım isim, *Windows8ApplicationBar*)

![](/assets/uploads/2011/11/Windows8-ApplicationBar-1.png "Windows Metro Style Application New Project Dialog")

Proje oluşturulduğunda *MainPage.xaml* dosyasının içeriği;



&lt;UserControl x:Class="Windows8ApplicationBar.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    d:DesignHeight="768" d:DesignWidth="1366"&gt;

    &lt;Grid x:Name="LayoutRoot" Background="#FF0C0C0C"&gt;
    &lt;/Grid&gt;

&lt;/UserControl&gt;</pre>

İlk önce uygulamamızın altına hizalanacak bir **Application Bar** oluşturalım. Bunun için <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.applicationbar" title="Grid Control" target="_blank">Grid</a>'in içerisine **ApplicationBar** elementinden bir tane ekliyoruz;

<pre class="brush:xml">&lt;ApplicationBar VerticalAlignment="Bottom"&gt;
    &lt;Button Content="Çıkış" x:Name="btnCikis" /&gt;
&lt;/ApplicationBar&gt;</pre>

<a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.applicationbar" title="Application Bar Control" target="_blank">ApplicationBar</a> elementi içerisine eklediğimiz <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.button" title="Button Control" target="_blank">Button</a> elementi sayesinde uygulamamızın altına *Çıkış* butonu içeren bir **Application Bar** oluşturmuş olduk.

**ApplicationBar** elementinin <a href="http://msdn.microsoft.com/library/windows.ui.xaml.verticalalignment" title="ApplicationBar - VerticalAlignment" target="_blank">VerticalAlignment</a> özelliği, oluşturulacak *Application Bar*'ın ekranda nereye konumlandırılacağını belirliyor.

**VerticalAlignment** özelliğine verebileceğiniz değerler;



*   *Top :* Ekranın üstüne konumlanır
*   *Center :* Ekranın ortasına konumlanır
*   *Bottom :* Ekranın altına konumlanır
*   *Stretch :* Ekranı kaplar

*Çıkış* butonuna basıldığında uygulamanın kapanması için, butonun **Click** olayını bir method'a bağlamamız lazım. *Çıkış* butonunu şu şekilde güncelliyoruz;

<pre class="brush:xml">&lt;Button Content="Çıkış" x:Name="btnCikis" Click="btnCikis_Click" /&gt;</pre>

*MainPage.xaml.cs* dosyasına da *btnCikis_Click* method'unu yazmamız gerekiyor;

<pre class="brush:csharp">private void btnCikis_Click(object sender, RoutedEventArgs e)
{
    Application.Current.Exit();
}</pre>

Bu haliyle uygulamamızı bir çalıştıralım;

![](/assets/uploads/2011/11/Windows8-ApplicationBar-3.png "Windows Metro Style Application")

**Application Bar**'ı açmak için, uygulamanın herhangi bir yerinde mouse'un *sağ tuşuna* basıyoruz;

![](/assets/uploads/2011/11/Windows8-ApplicationBar-4.png "Windows 8 Application Bar")

Ekranın altında beliren **Application Bar**'daki *Çıkış* butonuna tıklarsak uygulamamız kapanır.

**Internet Explorer**'ın **Windows 8** için geliştirilen versiyonu (**IE 10**) aynı anda iki **Application Bar** kullanacak şekilde yazılmış. Bir *Application Bar* ekranın altında belirirken, diğeri ekranın üstünde beliriyor.

![](/assets/uploads/2011/11/Windows8-ApplicationBar-5.png "Windows 8 Internet Explorer 10")

Biz de uygulamamıza ikinci bir **Application Bar** ekleyebiliriz. İkinci ekleyeceğimiz **Application Bar**, ekranın üstüne konumlansın;

<pre class="brush:xml">&lt;ApplicationBar VerticalAlignment="Top"&gt;&lt;/ApplicationBar&gt;</pre>

Yeni eklediğimiz **Application Bar**'ın birden fazla nesne içerebilmesi için, kapsayıcı olarak bir <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.applicationbar" title="StackPanel Control" target="_blank">StackPanel</a> ekliyoruz. **StackPanel** içerisine ekleyeceğimiz nesnelerin yan yana dizilmesi için, <a href="http://msdn.microsoft.com/en-gb/library/windows.ui.xaml.controls.orientation" title="StackPanel Orientation" target="_blank">Orientation</a> özelliğini **Horizontal** olarak belirlememiz gerekiyor. **Orientation** özelliğine verebileceğimiz değerler;



*   *Vertical :* Nesneler alt alta dizilir *(Varsayılan değer)*
*   *Horizontal :* Nesneler yan yana dizilir

**StackPanel**'in içerisine bir <a href="http://msdn.microsoft.com/en-gb/library/windows.ui.xaml.controls.button" title="Button Control" target="_blank">Button</a>, bir <a href="http://msdn.microsoft.com/en-gb/library/windows.ui.xaml.controls.textbox" title="TextBox Control" target="_blank">TextBox</a> ve bir <a href="http://msdn.microsoft.com/en-gb/library/windows.ui.xaml.controls.button" title="Button Control" target="_blank">Button</a> daha ekliyoruz;

<pre class="brush:xml">&lt;Button x:Name="btnAyarlar"&gt;
    &lt;Button.Content&gt;
        &lt;StackPanel Orientation="Horizontal"&gt;
            &lt;Image Width="20" Height="20" Source="Images/SmallLogo.png" /&gt;
            &lt;TextBlock Text="Ayarlar" Margin="5,0,0,0" /&gt;
        &lt;/StackPanel&gt;
    &lt;/Button.Content&gt;
&lt;/Button&gt;
&lt;TextBox Margin="15,0,0,0" Width="150" x:Name="txtAranan" /&gt;
&lt;Button x:Name="btnAra" Content="Ara" /&gt;</pre>

İlk eklediğimiz <a href="http://msdn.microsoft.com/en-gb/library/windows.ui.xaml.controls.button" title="Button Control" target="_blank">Button</a>'un bir görsele de sahip olabilmesi için, Content'ine bir <a href="http://msdn.microsoft.com/en-gb/library/windows.ui.xaml.controls.image" title="Image Control" target="_blank">Image</a>, bir de <a href="http://msdn.microsoft.com/en-gb/library/windows.ui.xaml.controls.textblock" title="Textblock Control" target="_blank">TextBlock</a> ekliyoruz.

![](/assets/uploads/2011/11/Windows8-ApplicationBar-6.png "Windows 8 Application Bar")

**Image**'ın <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.image.source" title="Image Source Property" target="_blank">Source</a> özelliğine, proje'nin *Images* dizininden bir görsel seçiyoruz; *(SmallLogo.png)*

![](/assets/uploads/2011/11/Windows8-ApplicationBar-2.png "Visual Studio 2011 - Metro Style Project - Solution Explorer")

Örnek uygulamanın **XAML** kodları'nın tamamı;

<pre class="brush:xml">&lt;UserControl x:Class="Windows8ApplicationBar.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    d:DesignHeight="768" d:DesignWidth="1366"&gt;

    &lt;Grid x:Name="LayoutRoot" Background="#FF0C0C0C"&gt;
        &lt;ApplicationBar VerticalAlignment="Top"&gt;
            &lt;StackPanel Orientation="Horizontal"&gt;
                &lt;Button x:Name="btnAyarlar"&gt;
                    &lt;Button.Content&gt;
                        &lt;StackPanel Orientation="Horizontal"&gt;
                            &lt;Image Width="20" Height="20" Source="Images/SmallLogo.png" /&gt;
                            &lt;TextBlock Text="Ayarlar" Margin="5,0,0,0" /&gt;
                        &lt;/StackPanel&gt;
                    &lt;/Button.Content&gt;
                &lt;/Button&gt;
                &lt;TextBox Margin="15,0,0,0" Width="150" x:Name="txtAranan" /&gt;
                &lt;Button x:Name="btnAra" Content="Ara" /&gt;
            &lt;/StackPanel&gt;
        &lt;/ApplicationBar&gt;
        &lt;ApplicationBar VerticalAlignment="Bottom"&gt;
            &lt;StackPanel Orientation="Horizontal"&gt;
                &lt;Button Content="Çıkış" x:Name="btnCikis" Click="btnCikis_Click" /&gt;
            &lt;/StackPanel&gt;
        &lt;/ApplicationBar&gt;
    &lt;/Grid&gt;

&lt;/UserControl&gt;


