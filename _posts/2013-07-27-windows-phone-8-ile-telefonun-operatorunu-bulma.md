---
layout: post
title: "Windows Phone 8 ile telefonun operatörünü bulma"
date: 2013-07-27 20:00
author: engin.polat
comments: true
category: [Windows]
tags: [background, button, cellularmobileoperator, content, contentcontrol, devicenetworkinformation, height, mainpage, messagebox, mobile, networkinformation, operatör, phoneaccentbrush, phoneapplicationpage, phonetextnormalstyle, phonetexttitle1style, property, sdk, stackpanel, static, staticresource, windows phone, windowsphone, wp8, xaml]
---
**Windows Phone 8** için geliştirdiğiniz uygulamanın çalıştığı telefonun bağlı olduğu *operatör*'ü bulmak isteyebilirsiniz.

Özellikle *operatör*'e özel seçenekler çıkartmak veya kısıtlamalar getirmek için bunu yapmaya ihtiyacınız olabilir.

*Windows Phone 8 SDK* içerisinde yer alan <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.net.networkinformation.devicenetworkinformation" title="DeviceNetworkInformation Class" target="_blank">DeviceNetworkInformation</a> sınıfında *Mobil Operator* bilgisini kolaylıkla almanızı sağlayan **static** tanımlı <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.net.networkinformation.devicenetworkinformation.cellularmobileoperator" title="DeviceNetworkInformation.CellularMobileOperator Property " target="_blank">CellularMobileOperator</a> özelliği mevcuttur.

Hemen yeni bir proje oluşturarak kullanımını inceleyelim;

![](/assets/uploads/2013/07/OperatorSample-1.png)

*MainPage.xaml* dosyasını açarak sayfanın tasarımını değiştirelim. <a href="http://msdn.microsoft.com/library/system.windows.controls.stackpanel" title="StackPanel Class" target="_blank">StackPanel</a> içerisine bir <a href="http://msdn.microsoft.com/library/system.windows.controls.button" title="Button Class" target="_blank">Button</a> nesnesi ekleyelim, <a href="http://msdn.microsoft.com/library/system.windows.controls.contentcontrol.content" title="ContentControl.Content Property" target="_blank">Content</a> özelliğine *Tıkla*, <a href="http://msdn.microsoft.com/library/system.windows.controls.control.background" title="Control.Background Property" target="_blank">Background</a> özelliğine *StaticResource PhoneAccentBrush*, <a href="http://msdn.microsoft.com/library/system.windows.frameworkelement.height" title="FrameworkElement.Height Property" target="_blank">Height</a> özelliğine *120* değerlerini verelim;



&lt;phone:PhoneApplicationPage
    x:Class="OperatorSample.MainPage"
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

    &lt;StackPanel&gt;
        &lt;StackPanel x:Name="TitlePanel" Margin="12,17,0,28"&gt;
            &lt;TextBlock Text="http://www.enginpolat.com" Style="{StaticResource PhoneTextNormalStyle}" Margin="12,0"/&gt;
            &lt;TextBlock Text="operatör" Margin="9,-7,0,0" Style="{StaticResource PhoneTextTitle1Style}"/&gt;
        &lt;/StackPanel&gt;

        &lt;StackPanel Margin="12,0,12,0"&gt;
            &lt;Button Content="Tıkla" Background="{StaticResource PhoneAccentBrush}" Height="120" Click="Button_OnClick" /&gt;
        &lt;/StackPanel&gt;
    &lt;/StackPanel&gt;

&lt;/phone:PhoneApplicationPage&gt;</pre>

**Background** özelliğine <a href="http://msdn.microsoft.com/library/ms750950.aspx" title="StaticResource Markup Extension" target="_blank">StaticResource</a> listesinden <a href="http://msdn.microsoft.com/library/windowsphone/develop/ff769552.aspx" title="Theme resources for Windows Phone" target="_blank">PhoneAccentBrush</a> değerini vererek, buton'un arkarengini kullanıcının tercih ettiği *tema rengine* ayarlamış olduk;

![](/assets/uploads/2013/07/OperatorSample-2.png)

**Button**'a tıklandığında *Button_OnClick()* method'u tetiklenecek;

<pre class="brush:csharp">private void Button_OnClick(object sender, RoutedEventArgs e)
{
    var operatorAdi = DeviceNetworkInformation.CellularMobileOperator;

    MessageBox.Show(operatorAdi);
}


Butona tıkladığımızda ekrana, uygulamanın kurulu olduğu telefonun *mobil operatörü* gelmeli;

![](/assets/uploads/2013/07/OperatorSample-3.png)

