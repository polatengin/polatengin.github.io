---
layout: post
title: "Windows 10 UWP Uygulamalarında InkCanvas ile imza almak"
date: 2016-02-10 19:45
author: engin.polat
comments: true
category: [Universal App]
tags: [background, Color, constructor, coreinputdevicetypes, emulator, grid, inkcanvas, inkdrawingattributes, inkpresenter, inputdevicetypes, mainpage, method, mouse, page, pentip, property, rowdefinition, size, textblock, textbox, touch, universal app, updatedefaultdrawingattributes, uwp, visual studio, windows10, xaml, xaml.cs]
---
Geçen hafta **email** ile aldığım bir soruyu cevaplamak üzere bu **makaleyi** yazıyorum.

**Windows 10 UWP** uygulamalarında eğer kullanıcının *imzasını* ekran üzerinde almak isterseniz <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.inkcanvas" target="_blank">InkCanvas</a> sınıfını kullanabilirsiniz.

Hemen **Visual Studio** açıp yeni bir **proje** oluşturarak nasıl yapabileceğimizi inceleyelim;

![](/assets/uploads/2016/02/InkCanvas-1.png)

Öncelikle *MainPage.xaml* dosyasını açalım ve içerisini aşağıdaki gibi değiştirerek, ekran tasarımımızı yapalım;



&lt;Page
    x:Class="InkCanvasOrnek.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:InkCanvasOrnek"&gt;

    &lt;Grid Background="#f1c40f" Padding="20"&gt;
        &lt;Grid.RowDefinitions&gt;
            &lt;RowDefinition Height="Auto" /&gt;
            &lt;RowDefinition Height="Auto" /&gt;
            &lt;RowDefinition Height="Auto" /&gt;
            &lt;RowDefinition Height="*" /&gt;
            &lt;RowDefinition Height="Auto" /&gt;
        &lt;/Grid.RowDefinitions&gt;

        &lt;TextBox Header="Adınız" Grid.Row="0" /&gt;
        &lt;TextBox Header="Soyadınız" Grid.Row="1" /&gt;
        &lt;TextBlock Text="İmzanız" Margin="0, 4, 0, 8 " Grid.Row="2" /&gt;
        &lt;InkCanvas x:Name="ink" Grid.Row="3" /&gt;
        &lt;Button HorizontalAlignment="Stretch" VerticalAlignment="Stretch" Content="Kaydet" Padding="10" Grid.Row="4" /&gt;
    &lt;/Grid&gt;

&lt;/Page&gt;</pre>

Eğer uygulamamızı **Windows 10 Mobile Emulator**'ünde açacak olursak aşağıdaki gibi gözükmeli;

![](/assets/uploads/2016/02/InkCanvas-2.png)

*Dokunmatik ekran* ve *Mouse* ile <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.inkcanvas" target="_blank">InkCanvas</a>'ın kullanılabilmesi için *MainPage.xaml.cs* dosyasında bulunan **constructor**'da <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.inkcanvas.inkpresenter" target="_blank">InkPresenter</a> **property**'sinde yeralan <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.input.inking.inkpresenter.inputdevicetypes" target="_blank">InputDeviceTypes</a> özelliğine <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.core.coreinputdevicetypes" target="_blank">CoreInputDeviceTypes</a> enum'ında bulunan **Mouse** ve **Touch** değerlerini aşağıdaki şekilde eklememiz gerekli;

<pre class="brush:csharp">ink.InkPresenter.InputDeviceTypes = CoreInputDeviceTypes.Mouse | CoreInputDeviceTypes.Touch;</pre>

Böylece uygulamada imza atmak için bir boşluk oluşturmuş olduk;

![](/assets/uploads/2016/02/InkCanvas-3.png)

Eğer istersek, **InkCanvas** sınıfının **InkPresenter** property'sinde yeralan <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.input.inking.inkpresenter.updatedefaultdrawingattributes" target="_blank">UpdateDefaultDrawingAttributes()</a> methoduna yeni bir <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.input.inking.inkdrawingattributes" target="_blank">InkDrawingAttributes</a> sınıfından değişken tanımlayabilir ve **InkCanvas** üzerine yapılan çizimlerin *kalemini* değiştirebiliriz;

<pre class="brush:csharp">var attr = new InkDrawingAttributes();
attr.Color = Colors.Red;
attr.PenTip = PenTipShape.Circle;
attr.Size = new Size(3, 18);
ink.InkPresenter.UpdateDefaultDrawingAttributes(attr);


![](/assets/uploads/2016/02/InkCanvas-4.png)

*Not : Taklit etmeye çalıştığım **Picasso**'nun çok bilinen imzası aşağıdaki gibidir, ne dersiniz, benzetebilmiş miyim?*

![](/assets/uploads/2016/02/InkCanvas-5.png)

