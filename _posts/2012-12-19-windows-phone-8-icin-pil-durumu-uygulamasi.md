---
layout: post
title: "Windows Phone 8 için Pil Durumu uygulaması"
date: 2012-12-19 10:29
author: engin.polat
comments: true
category: [C#]
tags: [application, applicationbar, applicationbariconbutton, battery, batterylifepercent, batteryliferemaining, click, constructor, iconuri, margin, null, phoneapplicationpage, remainingchargepercent, remainingdischargetime, stackpanel, string.format, textblock, TimeSpan, windows phone, wp8]
---
**Windows Phone 8** için *güncel pil durumunu* görebileceğimiz bir uygulama geliştireceğiz.

Bu uygulamanın geliştirilmesi sırasında <a href="http://msdn.microsoft.com/library/windowsphone/develop/jj207231" title="Battery Class" target="_blank">Battery</a>, <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.phoneapplicationpage" title="PhoneApplicationPage Class" target="_blank">PhoneApplicationPage</a>, <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.phoneapplicationpage.applicationbar" title="PhoneApplicationPage Class ApplicationBar Property" target="_blank">ApplicationBar</a>, <a href="http://msdn.microsoft.com/library/system.timespan" title="TimeSpan Structure" target="_blank">TimeSpan</a> gibi yapıları kullandığımız kodlar yazacağız.

Öncelikle *BatteryLevel* isimli yeni bir **Windows Phone App** projesi oluşturalım;

![Battery Level Windows Phone Application Project](/assets/uploads/2012/12/BatteryLevel1.png)

Proje oluşturduktan sonra gelen **Windows Phone Platform** versiyon seçim penceresinde *Windows Phone OS 8.0* seçeneğinin seçili olduğundan emin olmalıyız;

![Windows Phone 8.0 SDK](/assets/uploads/2012/12/BatteryLevel2.png)

*MainPage.xaml* dosyasını aşağıdaki gibi güncelleyelim;



&lt;Grid x:Name="LayoutRoot" Background="Transparent"&gt;
    &lt;Grid.RowDefinitions&gt;
        &lt;RowDefinition Height="Auto"/&gt;
    &lt;/Grid.RowDefinitions&gt;

    &lt;StackPanel x:Name="TitlePanel" Grid.Row="0" Margin="12,17,0,28"&gt;
        &lt;TextBlock Text="PİL SEVİYESİ" Style="{StaticResource PhoneTextNormalStyle}" Margin="12,0"/&gt;
    &lt;/StackPanel&gt;
    &lt;TextBlock HorizontalAlignment="Stretch" Margin="0,0,70,-125" TextWrapping="Wrap" Text="- / 100" Name="lblRemainingChargePercent" VerticalAlignment="Bottom" Width="340"/&gt;
    &lt;TextBlock HorizontalAlignment="Stretch" Margin="35,0,105,-180" TextWrapping="Wrap" Text="- / 100" Name="lblRemainingDischargeTime" VerticalAlignment="Bottom" Width="340"/&gt;
&lt;/Grid&gt;

&lt;phone:PhoneApplicationPage.ApplicationBar&gt;
    &lt;shell:ApplicationBar IsVisible="True"&gt;
        &lt;shell:ApplicationBarIconButton IconUri="/Assets/appbar.refresh.png" Text="Güncelle" Click="RefreshBatteryLabel" /&gt;
    &lt;/shell:ApplicationBar&gt;
&lt;/phone:PhoneApplicationPage.ApplicationBar&gt;</pre>

İki **TextBlock** nesnesinde *güncel pil durumunu* göstereceğiz. Ayrıca eklediğimiz **ApplicationBar** sayesinde telefonun altında bir *güncelleme butonu* konumlandırmış olacağız.

<a href="http://msdn.microsoft.com/library/microsoft.phone.controls.phoneapplicationpage.applicationbar" title="PhoneApplicationPage Class ApplicationBar Property" target="_blank">ApplicationBar</a>'a eklediğimiz <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.shell.applicationbariconbutton" title="ApplicationBarIconButton Class" target="_blank">ApplicationBarIconButton</a> nesnesine basıldığında *RefreshBatteryLabel()* method'unun tetiklenmesini sağlıyoruz.

*MainPage.xaml.cs* dosyasına *RefreshBatteryLevel()* method'unu ekleyelim;

<pre class="brush:csharp">private void RefreshBatteryLabel(object sender, EventArgs e)
{
    Battery Pil = Battery.GetDefault();

    int Yuzde = Pil.RemainingChargePercent;
    int Gun = Pil.RemainingDischargeTime.Days;
    int Saat = Pil.RemainingDischargeTime.Hours;
    int Dakika = Pil.RemainingDischargeTime.Minutes;

    string SarjYuzdesi = string.Format("Kalan pil : {0} / 100", Yuzde);

    string SarjSuresi = "Kalan şarj süresi : ";

    if (Gun > 0)
    {
        SarjSuresi += string.Format("{0} gün ", Gun);
    }
    if (Saat > 0)
    {
        SarjSuresi += string.Format("{0} saat ", Saat);
    }
    if (Dakika > 0)
    {
        SarjSuresi += string.Format("{0} dakika ", Dakika);
    }

    lblRemainingChargePercent.Text = SarjYuzdesi;

    lblRemainingDischargeTime.Text = SarjSuresi;
}</pre>

Son olarak, *MainPage* sınıfının **constructor**'ında *RefreshBatteryLevel()* method'unu çağırırsak, uygulama ilk açıldığında pil seviyesi güncellenmiş olur;

<pre class="brush:csharp">RefreshBatteryLabel(null, null);


Uygulamayı çalıştırdığımızda aşağıdaki ekran görüntüsünü görüyor olmamız lazım;

![Battery Level Windows Phone 8 Application](/assets/uploads/2012/12/BatteryLevel3.png)

Projenin kodlarını <a href="/assets/uploads/2012/12/BatteryLevel.rar" title="Battery Level Windows Phone 8 Application Kaynak Kodlar" target="_blank">buradan</a> indirebilirsiniz.

