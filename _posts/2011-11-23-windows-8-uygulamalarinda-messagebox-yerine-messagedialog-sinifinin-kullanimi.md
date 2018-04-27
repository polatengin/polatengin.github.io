---
layout: post
title: "Windows 8 Uygulamalarında MessageBox yerine MessageDialog Sınıfının Kullanımı"
date: 2011-11-23 11:03
author: engin.polat
comments: true
category: [C#]
tags: [async, await, background, button, Color, command, commands, constructor, event, grid, iuicommand, messagebox, messagedialog, MetroUI, namespace, routedeventargs, string, uicommand, usercontrol, using, visual studio 2011, windows8, xaml]
---
Geliştirdiğimiz uygulamalarda kullanıcıyı *bilgilendirmek* ve/veya *yönlendirmek* için **Mesaj Kutularını** (**MessageBox**) kullanırız.

**Metro Style** uygulamalar, <a href="http://msdn.microsoft.com/library/system.windows.forms" title="System.Windows.Forms Namespace" target="_blank" rel="noopener">System.Windows.Forms</a> namespace'inde yeralan <a href="http://msdn.microsoft.com/library/system.windows.forms.messagebox" title="MessageBox Class" target="_blank" rel="noopener">MessageBox</a> sınıfına erişemezler. **MessageBox** sınıfı yerine <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.popups.messagedialog" title="MessageDialog Class" target="_blank" rel="noopener">MessageDialog</a> sınıfını kullanarak kullanıcıya bilgilendirme kutusu gösterebilirler.

**MessageDialog** sınıfının **constructor**'ı iki parametre alır;



*   **content** (*string*) : Kullanıcıya göstermek istediğimiz mesaj
*   **title** (*string*) : Mesaj kutusunun başlığı

Hemen yeni bir **Visual Studio 2011** açarak örnek proje üzerinde geliştirmeye başlayalım;

![](/assets/uploads/2011/10/4.png "Visual Studio 2011 - Açılış Ekranı")

*Yeni Proje* oluşturma dialog kutusunda **Windows Metro Style** grubunda yer alan **Application** proje şablonunu seçelim ve projemize bir isim verelim (bu örnekte benim kullandığım isim, *MessageBoxOrnek*)

![](/assets/uploads/2011/11/MessageDialog-0.png "Visual Studio 2011 - Metro Style Application")

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

Öncelikle uygulamamızın *arkaplan rengini* değiştirmek için <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.grid" title="Grid Class" target="_blank" rel="noopener">Grid</a> element'inin <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.panel.background" title="Background Class" target="_blank" rel="noopener">Background</a> özelliğine *Maroon* değerini atayalım;

<pre class="brush:xml">&lt;UserControl x:Class="Windows8ApplicationBar.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    d:DesignHeight="768" d:DesignWidth="1366"&gt;

    &lt;Grid x:Name="LayoutRoot" Background="Maroon"&gt;
    &lt;/Grid&gt;

&lt;/UserControl&gt;</pre>

**Grid** element'inin içerisine bir adet <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.button" title="Button Class" target="_blank" rel="noopener">Button</a> elementi oluşturalım ve <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.primitives.buttonbase.click" title="Click Event" target="_blank" rel="noopener">Click</a> olayını bir method'a yönlendirelim;

<pre class="brush:xml">&lt;Button x:Name="btnMesaj" HorizontalAlignment="Center" VerticalAlignment="Center" Content="Karşıla" Click="btnMesaj_Click" /&gt;</pre>

![](/assets/uploads/2011/11/MessageDialog-1.png "MessageDialog Form")

Böylece *MainPage.xaml* dosyasının **XAML** kod'u aşağıdaki hale gelmiş oluyor;

<pre class="brush:xml">&lt;UserControl x:Class="MessageBoxOrnek.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    d:DesignHeight="768" d:DesignWidth="1366"&gt;
    
    &lt;Grid x:Name="LayoutRoot" Background="Maroon"&gt;

        &lt;Button x:Name="btnMesaj" HorizontalAlignment="Center" VerticalAlignment="Center" Content="Karşıla" Click="btnMesaj_Click" /&gt;
        
    &lt;/Grid&gt;
    
&lt;/UserControl&gt;</pre>

*MainPage.xaml.cs* dosyasında *btnMesaj_Click* method'unu yazıyoruz;

<pre class="brush:csharp">private async void btnMesaj_Click(object sender, RoutedEventArgs e)
{
    MessageDialog dialog = new MessageDialog("Merhaba, uygulamamıza hoşgeldiniz...", "Sayın Kullanıcı");

    await dialog.ShowAsync();
}</pre>

**MessageDialog** sınıfı *Windows.UI.Popups* namespace'inde yer aldığı için, dosyanın **using** kısmına,

<pre class="brush:csharp">using Windows.UI.Popups;</pre>

satırını eklememiz gerekiyor.

Böylece, uygulamayı çalıştırdıktan ekranın ortasında gördüğümüz butona *tıkladığımızda*, aşağıdaki gibi bir **Mesaj Kutusu** ekranda belirecektir;

![](/assets/uploads/2011/11/MessageDialog-2.png "MessageDialog Form")

Gösterilen **MessageDialog** sadece *Kapat* (*Close*) butonuna sahiptir. Eğer *Close* butonu yerine kendi butonlarımızı kullanmak istersek, *dialog* değişkeninin <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.popups.messagedialog.commands" title="MessageDialog.Commands Property" target="_blank" rel="noopener">Commands</a> özelliğine <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.popups.iuicommand" title="IUICommand Interface" target="_blank" rel="noopener">IUICommand</a> interface'ini implemente eden sınıfların birinden yeni bir instance eklememiz gerekir (Örneğin <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.popups.uicommand" title="UICommand Class" target="_blank" rel="noopener">UICommand</a> sınıfı).

***Not : **MessageDialog Commands özelliğine en fazla 3 adet buton ekleyebiliriz.*

Yukarıdaki örnekte gösterdiğimiz **MessageDialog**'a *Yoksay*, *Kapat*, *Tümünü Kapat* butonları ekleyelim, *btnMesaj_Click* method'unu aşağıdaki gibi değiştiriyoruz;

<pre class="brush:csharp">private async void btnMesaj_Click(object sender, RoutedEventArgs e)
    {
    MessageDialog dialog = new MessageDialog("Merhaba, uygulamamıza hoşgeldiniz...", "Sayın Kullanıcı");

    dialog.Commands.Add(new UICommand("Yoksay", (command) =>
    {
        /// yoksayıldı
    }));

    dialog.Commands.Add(new UICommand("Kapat", (command) =>
    {
        /// kapatıldı
    }));

    dialog.Commands.Add(new UICommand("Tümünü Kapat", (command) =>
    {
        /// tümü kapatıldı
    }));

    await dialog.ShowAsync();
}


![](/assets/uploads/2011/11/MessageDialog-3.png "MessageDialog Form")

