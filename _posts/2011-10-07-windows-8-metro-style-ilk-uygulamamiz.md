---
layout: post
title: "Windows 8 Metro Style ilk uygulamamız"
date: 2011-10-07 16:21
author: engin.polat
comments: true
category: [C#]
tags: [alignment, button, center, click, content, controls, file, fontsize, foreground, grid, height, horizontalalignment, label, MetroUI, new, project, silverlight, stackpanel, start screen, textblock, usercontrol, verticalalignment, visual studio 2011, width, windows8, wpf, xaml]
---
<a href="http://www.enginpolat.com/etiket/windows8/" title="Windows 8 Programlama" target="_blank">Windows 8 Programlama</a> makalelerinde ilk uygulamamızı geliştirmeye başlıyoruz.

**Windows 8 Başlangıç Ekranımızda** (*Start Screen*) **Visual Studio 2011** üzerine tıklayarak, yeni bir **Visual Studio 2011** başlatıyoruz.

![](/assets/uploads/2011/10/11.png "Windows 8 Start Screen")

*File* / *New* / *Project* menüsünden **Windows Metro Style** kategorisindeki **Application** proje şablonunu seçiyoruz ve *MetroStyleIlkUygulama* ismini vererek projemizi oluşturuyoruz.

![](/assets/uploads/2011/10/21.png "Visual Studio New Project Dialog")

Proje oluşturulduğunda **Visual Studio 2011** *varsayılan* olarak *MainPage.xaml* dosyasını açıyor. Uygulamamızın başlangıç ekranı **varsayılan** olarak *MainPage.xaml* dosyasıdır.

![](/assets/uploads/2011/10/31.png "Windows 8 Visual Studio 2011 Açılış")

<a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.grid" target="_blank">Grid</a> elementi içerisine bir *button*, bir de *label* eklemek için aşağıdaki satırları yazıyoruz;



&lt;Button Content="Mesaj Göster" FontSize="28" Width="250" Height="80" HorizontalAlignment="Center" /&gt;
&lt;TextBlock x:Name="MessageText" FontSize="48" Foreground="White" /&gt;</pre>

**WPF** ve **Silverlight**'ta Label nesnesi oluşturmak için <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.textblock" target="_blank">TextBlock</a> nesnesi kullanmamız gerekiyor. Bu elementler ile ekranımıza *Mesaj Göster* metinli bir *button* ve metin içermediği için ekranda gözükmeyen bir *textblock* nesnesi koymuş olduk.

Fakat bu kontrolleri ekranda ortalayabilmek için bir <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.stackpanel" target="_blank">StackPanel</a> içerisine koymamız gerekiyor;

<pre class="brush:xml">&lt;StackPanel HorizontalAlignment="Center" VerticalAlignment="Center"&gt;
    &lt;Button Content="Mesaj Göster" FontSize="28" Width="250" Height="80" HorizontalAlignment="Center" /&gt;
    &lt;TextBlock x:Name="MessageText" FontSize="48" Foreground="White" /&gt;
&lt;/StackPanel&gt;</pre>

**StackPanel** ve **Button** elemanlarına verdiğimiz *Alignment* özellikleri sayesinde elemanları ekranda ortalıyoruz.

Son olarak *Button* element'imize

<pre class="brush:csharp">Click="Button_Click"</pre>

özelliğini ekleyelim. Böylece butona tıklanma **event**'i ile tetiklenen bir **method**'umuz oluyor.

*MainPage.xaml.cs* dosyasına;

<pre class="brush:csharp">private void Button_Click(object sender, RoutedEventArgs e)
{
    MessageText.Text = "Windows 8 üzerinde çalışan\r\nilk uygulamamız!!";
}</pre>

method'unu ekliyoruz.

Son olarak <kbd>F5</kbd> tuşuna basarak projeyi test amaçlı çalıştırıyoruz. Uygulama açılışında ilk önce bekleme ekranı ekrana geliyor.

![](/assets/uploads/2011/10/41.png "Windows 8 Uygulama Başlangıç Ekranı")

Fakat çok kısa süre içerisinde ilk ekranımız açılıyor.

![](/assets/uploads/2011/10/51.png "Windows 8 Programlama Metro Style")

Butona tıkladığımızda **TextBlock** metin ile doluyor.

![](/assets/uploads/2011/10/61.png "Windows 8 Programlama Metro Style")

Kodların tamamı;

<pre class="brush:xml">&lt;UserControl x:Class="MetroStyleIlkUygulama.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    d:DesignHeight="768" d:DesignWidth="1366"&gt;

&lt;Grid x:Name="LayoutRoot" Background="#FF0C0C0C"&gt;
    &lt;StackPanel HorizontalAlignment="Center" VerticalAlignment="Center"&gt;
        &lt;Button Content="Mesaj Göster" FontSize="28" Width="250" Height="80" HorizontalAlignment="Center" Click="Button_Click" /&gt;
        &lt;TextBlock x:Name="MessageText" FontSize="48" Foreground="White" /&gt;
    &lt;/StackPanel&gt;
&lt;/Grid&gt;

&lt;/UserControl&gt;


