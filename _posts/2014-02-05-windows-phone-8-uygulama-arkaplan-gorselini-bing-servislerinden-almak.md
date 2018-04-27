---
layout: post
title: "Windows Phone 8 uygulama arkaplan görselini Bing servislerinden almak"
date: 2014-02-05 21:00
author: engin.polat
comments: true
category: [C#]
tags: [async, await, background, bing, bitmapimage, button, class, descendants, downloadstringasync, downloadstringcompleted, error, event, firstordefault, format, image, imagebrush, mainpage, microsoft, openreadasync, openreadcompleted, parameter, parse, phoneapplicationpage, result, search, setsource, stackpanel, stream, value, webclient, windows phone, wp8, xaml, xdocument, xml, xmlns]
---
**Windows Phone 8** için geliştirdiğiniz uygulamanın veya <a href="http://msdn.microsoft.com/library/system.windows.controls.button" title="Button class" target="_blank" rel="noopener">Button</a>, <a href="http://msdn.microsoft.com/library/system.windows.controls.image" title="Button class" target="_blank" rel="noopener">Image</a> gibi nesnelerin arkaplan görselinin periyodik olarak değişmesini isteyebilirsiniz. Böylece uygulamanızın içerisinde sürekli olarak güncellenen bir bölüm oluşturabilirsiniz.

**Microsoft**'un geliştirdiği arama motoru olan <a href="http://www.bing.com" title="Bing Arama Motoru" target="_blank" rel="noopener">Bing</a>, ana arama ekranının arkaplan görselini *periyodik* olarak arkaplan görselini değiştirir.

Öncelikle *Bing*'in arkaplan görselini nasıl değiştirdiğini anlamamız lazım. Eğer *Bing* tarayıcınızda açıldıktan sonra yaptığı isteklere bakacak olursanız, *http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1* adresine bir çağrı yaptığını görebilirsiniz.

Bu isteğin parametreleri;

**format**, bu parametre ile dönüş cevabının *xml* formatında olması sağlanıyor
**idx**, bu parametre ile Bing'in arkaplan görsellerinden kaçıncı sıradakinin alınacağı belirleniyor
**n**, bu parametre ile kaç görselin bilgisinin alınacağı belirleniyor

*http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1* adresine yapacağımız istek ile *Bing*'in ilk sıradaki arkaplan görsellerinin bilgilerini **xml** formatında elde edeceğiz.

Öncelikle *MainPage.xaml* dosyasını aşağıdaki gibi güncelleyelim;



&lt;phone:PhoneApplicationPage
    x:Class="BingBackground.MainPage"
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
        &lt;StackPanel.Background&gt;
            &lt;ImageBrush x:Name="imgBackground"&gt;&lt;/ImageBrush&gt;
        &lt;/StackPanel.Background&gt;
    &lt;/StackPanel&gt;

&lt;/phone:PhoneApplicationPage&gt;</pre>

Böylece <a href="http://msdn.microsoft.com/library/system.windows.controls.stackpanel" title="StackPanel class" target="_blank" rel="noopener">StackPanel</a> nesnesinin arkaplanını *imgBackground* isimli <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.media.imagebrush" title="ImageBrush class" target="_blank" rel="noopener">ImageBrush</a> nesnesi ile güncelleyebileceğiz.

*MainPage.xaml.cs* dosyasında yeralan *MainPage* class'ının **constructor**'ında *LoadBackgroundImage()* method'unu çağıralım. *LoadBackgroundImage()* method'unda <a href="http://msdn.microsoft.com/library/system.net.webclient" title="WebClient class" target="_blank" rel="noopener">WebClient</a> sınıfından yeni bir örnek oluşturup *http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1* adresine istek yapacağız;

<pre class="brush:csharp">private async void LoadBackgroundImage()
{
    WebClient client = new WebClient();

    client.DownloadStringCompleted += (sender, e) =>
    {
        if (e.Error == null && !string.IsNullOrEmpty(e.Result))
        {
            var doc = XDocument.Parse(e.Result);

            var url = (from node in doc.Descendants("url") select node.Value).FirstOrDefault();

            var uri = new Uri("http://www.bing.com" + url);

            client.OpenReadCompleted += (s, args) =>
            {
                var image = new BitmapImage();
                image.SetSource(args.Result);

                imgBackground.ImageSource = image;
            };
            client.OpenReadAsync(uri);
        }
    };

    client.DownloadStringAsync(new Uri("http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1"));
}


<a href="http://msdn.microsoft.com/library/system.net.webclient.downloadstringasync" title="WebClient class DownloadStringAsync method" target="_blank" rel="noopener">DownloadStringAsync()</a> method'unu kullanarak yaptığımız isteğin cevabını <a href="http://msdn.microsoft.com/library/system.net.webclient.downloadstringcompleted" title="WebClient class DownloadStringCompleted event" target="_blank" rel="noopener">DownloadStringCompleted</a> event'i ile alabiliyoruz. <a href="http://msdn.microsoft.com/library/system.string" title="String Class" target="_blank" rel="noopener">string</a> tipindeki cevabın *boş* veya *hatalı* olmadığını kontrol ettikten sonra <a href="http://msdn.microsoft.com/library/system.xml.linq.xdocument" title="XDocument class" target="_blank" rel="noopener">XDocument</a> sınıfının **static** <a href="http://msdn.microsoft.com/library/system.xml.linq.xdocument.parse" title="XDocument class Parse method" target="_blank" rel="noopener">Parse()</a> method'unu kullanarak *parse* ediyoruz.

*url* isimli **element**'in içinde yeralan arkaplan görseli adresinin başına *http://www.bing.com* bilgisini ekliyoruz, böylece **Bing**'in arkaplan görselinin adresini tam olarak elde ediyoruz.

Aynı *WebClient* değişkenini kullanarak tam adresini elde ettiğimiz görsel dosyasına ulaşmak için <a href="http://msdn.microsoft.com/library/system.net.webclient.openreadasync" title="WebClient class OpenReadAsync method" target="_blank" rel="noopener">OpenReadAsync()</a> method'unu çağırıyoruz ve cevabı <a href="http://msdn.microsoft.com/library/system.net.webclient.openreadcompleted" title="WebClient class OpenReadCompleted event" target="_blank" rel="noopener">OpenReadCompleted</a> event'i ile elde ediyoruz.

*OpenReadCompleted* event'i içerisinde elde ettiğimiz <a href="http://msdn.microsoft.com/library/system.io.stream" title="Stream class" target="_blank" rel="noopener">Stream</a> ile yeni bir <a href="http://msdn.microsoft.com/library/system.windows.media.imaging.bitmapimage" title="BitmapImage class" target="_blank" rel="noopener">BitmapImage</a> nesnesini dolduruyoruz ve *MainPage.xaml* içerisinde tanımladığımız *imgBackground* nesnesinin görseli olarak belirliyoruz.

Böylece **Bing**'in arkaplan görseli değiştikçe bizim uygulamamızda ilgili alanın görseli değişecektir.

