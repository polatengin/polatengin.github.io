---
layout: post
title: "Windows Phone için Bing arama uygulaması"
date: 2013-08-02 08:30
author: engin.polat
comments: true
category: [Programlama]
tags: [api, applicationbar, applicationbariconbutton, azure, binding, bing, bingsearchcontainer, dataservicequery, datatemplate, dispatcher, image, inputscope, itemtemplate, longlistselector, margin, marketplace, nuget, orientation, phoneapplicationpage, progressindicator, sdk, search, selectionchanged, setprogressindicator, stackpanel, staticresource, systemtray, textblock, textbox, uri, urikind, webbrowsertask, webresult, windows phone, windowsphone, wp8]
---
**Windows Phone** uygulamamıza internetten *arama* özelliği eklememiz gerektiği durumda, <a href="http://www.bing.com/" title="Bing" target="_blank">Bing</a> arama motorunun **API** desteği olduğu için bunu yapabilmemiz çok zor olmayacaktır.

<a href="https://datamarket.azure.com/" title="Windows Azure Marketplace" target="_blank">Windows Azure Markeplace</a> üzerinden erişebileceğiniz <a href="https://datamarket.azure.com/dataset/bing/searchweb" title="Bing Search API - Web Results Only" target="_blank">Bing Search API - Web Results Only</a> *API* sayfasından **Bing Web Search API** kullanım bilgilerine erişebiliriz, gerekli yetkiyi alabiliriz.

İlk olarak *Sign In* linkine tıklayarak oturum açalım ve aylık *5000* aramayı ücretsiz yapabilmemize olanak sağlayacak *Sign Up* butonuna tıklayarak gerekli yetkiyi alalım.

*Sign Up* butonuna tıkladığınızda ekrana sözleşme şartlarını kabul etmenizi sağlayacak bir ekran gelecek. Basitçe ileri-ileri diyerek geçebileceğiniz ekranlardan sonra aylık *5000* aramayı ücretsiz yapabileceğiniz yetkiyi almış olacaksınız.

Gelelim **Windows Phone 8** projemize;

![](/assets/uploads/2013/08/BingSearchSample-1.png)

*MainPage.xaml* dosyasını açarak tasarımı aşağıdaki gibi olacak şekilde değiştirelim;

![](/assets/uploads/2013/08/BingSearchSample-2.png)



&lt;phone:PhoneApplicationPage
    x:Class="BingSearchSample.MainPage"
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
        &lt;StackPanel Orientation="Horizontal" Margin="10,0,0,0"&gt;
            &lt;Image Source="/Assets/bing-logo.png" Width="120" Height="45" /&gt;
            &lt;TextBox Name="SearchKey" Width="350" InputScope="Search" KeyUp="SearchKey_OnKeyUp" /&gt;
        &lt;/StackPanel&gt;

        &lt;phone:LongListSelector Name="SearchResultList" Height="655" SelectionChanged="SearchResultList_OnSelectionChanged"&gt;
            &lt;phone:LongListSelector.ItemTemplate&gt;
                &lt;DataTemplate&gt;
                    &lt;StackPanel Margin="0,0,0,30"&gt;
                        &lt;TextBlock Text="{Binding Title}" Style="{StaticResource PhoneTextTitle2Style}" /&gt;
                        &lt;TextBlock Text="{Binding Description}" Style="{StaticResource PhoneTextSmallStyle}" TextWrapping="Wrap" /&gt;
                        &lt;TextBlock Text="{Binding DisplayUrl}" Style="{StaticResource PhoneTextAccentStyle}" /&gt;
                    &lt;/StackPanel&gt;
                &lt;/DataTemplate&gt;
            &lt;/phone:LongListSelector.ItemTemplate&gt;
        &lt;/phone:LongListSelector&gt;
    &lt;/StackPanel&gt;

    &lt;phone:PhoneApplicationPage.ApplicationBar&gt;
        &lt;shell:ApplicationBar&gt;
            &lt;shell:ApplicationBarIconButton IconUri="/Assets/feature.search.png" Text="ara" Click="SearchButton_OnClick"&gt;&lt;/shell:ApplicationBarIconButton&gt;
        &lt;/shell:ApplicationBar&gt;
    &lt;/phone:PhoneApplicationPage.ApplicationBar&gt;

&lt;/phone:PhoneApplicationPage&gt;</pre>

Bir <a href="http://msdn.microsoft.com/library/system.windows.controls.stackpanel" title="StackPanel Class" target="_blank">StackPanel</a> içerisine *Bing* logosu ve arama kelimesinin girileceği <a href="http://msdn.microsoft.com/library/system.windows.controls.textbox" title="TextBox Class" target="_blank">TextBox</a> nesnesini ekliyoruz;

<pre class="brush:csharp">&lt;StackPanel Orientation="Horizontal" Margin="10,0,0,0"&gt;
    &lt;Image Source="/Assets/bing-logo.png" Width="120" Height="45" /&gt;
    &lt;TextBox Name="SearchKey" Width="350" InputScope="Search" KeyUp="SearchKey_OnKeyUp" /&gt;
&lt;/StackPanel&gt;</pre>

*SearchKey* isimli **TextBox** nesnesinin <a href="http://msdn.microsoft.com/library/system.windows.controls.textbox.inputscope" title="TextBox.InputScope Property" target="_blank">InputScope</a> özelliğine <a href="http://msdn.microsoft.com/library/system.windows.input.inputscopenamevalue" title="InputScopeNameValue Enumeration" target="_blank">Search</a> değerini veriyoruz, böylece *TextBox*'a giriş yaparken klavye'de arama butonu gözüküyor olacak;

![](/assets/uploads/2013/08/BingSearchSample-3.png)

Sayfaya <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.shell.applicationbar" title="ApplicationBar Class" target="_blank">ApplicationBar</a>, içerisine de <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.shell.applicationbariconbutton" title="ApplicationBarIconButton Class" target="_blank">ApplicationBarIconButton</a> ekliyoruz, icon olarak *feature.search.png* dosyasını kullanacağız.

**SDK** ile birlikte bilgisayarınıza yüklenen örnek *icon*'lara aşağıdaki yol ile ulaşabilirsiniz;

<pre>C:\Program Files (x86)\Microsoft SDKs\Windows Phone\v8.0\Icons</pre>

*Arama kutusuna* kelime girerken arama butonuna basıldığında veya **ApplicationBar**'daki arama butonuna basınca *Bing* üzerinde arama yapacağız, **TextBox**'ın <a href="http://msdn.microsoft.com/library/system.windows.uielement.keyup" title="UIElement.KeyUp Event" target="_blank">KeyUp</a> event'ini ve **ApplicationBarIconButton**'ın <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.shell.applicationbariconbutton.click" title="ApplicationBarIconButton.Click Event" target="_blank">Click</a> event'ini yakalıyoruz;

<pre class="brush:csharp">private void SearchKey_OnKeyUp(object sender, KeyEventArgs e)
{
    if (e.Key == Key.Enter)
    {
        SearchBing();
    }
}

private void SearchButton_OnClick(object sender, EventArgs e)
{
    SearchBing();
}</pre>

Asıl arama olayının döneceği *SearchBing()* method'unu yazmadan önce projemizde yapmamız gereken düzenlemeler var.

Projenin **References**'ına sağ tuşla tıklayıp **Nuget Package Manager** penceresini açalım ve *Microsoft.Data.Services.Client* paketini aratalım, <a href="https://www.nuget.org/packages/Microsoft.Data.Services.Client.WindowsPhone" title="OData Client for Windows Phone Apps" target="_blank">OData Client for Windows Phone Apps</a> paketini projeye ekleyelim;

![](/assets/uploads/2013/08/BingSearchSample-4.png)

<a href="https://datamarket.azure.com/dataset/bing/searchweb" title="Bing Search API - Web Results Only" target="_blank">Bing Search API - Web Results Only</a> sayfasından bulabileceğiniz <a href="https://datamarket.azure.com/dataset/explore/getproxy/8818f55e-2fe5-4ce3-a617-0b8ba8419f65" title=".NET C# Class Library" target="_blank">.NET C# Class Library</a> class dosyasını indirip projeye ekliyoruz.

Gelelim *SearchBing()* method'una;

<pre class="brush:csharp">private void SearchBing()
{
    SystemTray.SetProgressIndicator(this, new ProgressIndicator
    {
        IsVisible = true,
        IsIndeterminate = true,
        Text = "Bing üzerinden arama yapılıyor..."
    });

    var searchUri = new Uri("https://user:[AccountKey]@api.datamarket.azure.com/bing/search");

    var container = new BingSearchContainer(searchUri);
    var query = container.Web(SearchKey.Text, null, null, null, null, null, null, null);

    query.BeginExecute(ar =>
    {
        var state = ar.AsyncState as DataServiceQuery&lt;WebResult&gt;;

        if (state != null)
        {
            var result = state.EndExecute(ar);

            if (result != null)
            {
                Dispatcher.BeginInvoke(() =>
                {
                    SearchResultList.ItemsSource = result.ToList();

                    SystemTray.SetProgressIndicator(this, null);
                });
            }
        }
    }, query);
}</pre>

İlk olarak <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.shell.systemtray" title="SystemTray Class" target="_blank">SystemTray</a> sınıfının *static* <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.shell.systemtray.setprogressindicator" title="SystemTray.SetProgressIndicator Method" target="_blank">SetProgressIndicator</a> method'unu çağırıyoruz, böylece arama başladığında ekranın üstünde ilerleme çubuğu belirecek;

![](/assets/uploads/2013/08/BingSearchSample-5.png)

<a href="https://datamarket.azure.com/dataset/bing/searchweb" title="Bing Search API - Web Results Only" target="_blank">Bing Search API - Web Results Only</a> sayfasından elde edeceğiniz *AccountKey* ile **Bing Search Uri** oluşturuyoruz.

**BingSearchContainer** sınıfından yeni bir *instance* oluşturup, *Web()* method'unu çağırıyoruz, parametre olarak arama kelimemizi veriyoruz.

*BeginExecute()* method'u ile aramayı başlatıyoruz, gerekli kontrolleri yaptıktan sonra arama sonuç listesini **Dispatcher.BeginInvoke** içerisinde ekrandaki <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.controls.longlistselector" title="LongListSelector Class" target="_blank">LongListSelector</a> nesnesine bağlıyoruz.

Son olarak, **LongListSelector** içerisinde listelenen öğelerden birine tıklandığında ilgili adrese gitmesi için <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.controls.longlistselector.selectionchanged" title="LongListSelector.SelectionChanged Event" target="_blank">SelectionChanged</a> event'ini yakalıyoruz;

<pre class="brush:csharp">var item = SearchResultList.SelectedItem as WebResult;

if (item != null)
{
    var webBrowserTask = new WebBrowserTask { Uri = new Uri(item.Url, UriKind.Absolute) };
    webBrowserTask.Show();
}


![](/assets/uploads/2013/08/BingSearchSample-6.png)

