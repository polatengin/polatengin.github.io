---
layout: post
title: "Windows 10 UWP uygulamasında Log için Slack kullanmak"
date: 2016-02-22 20:45
author: engin.polat
comments: true
category: [Windows]
tags: [async, await, binding, borderbrush, button, channel, click, databinding, entegrasyon, event, header, horizontalalignment, httpclient, httpstringcontent, mainpage, margin, mode, postasync, property, public, slack, stackpanel, text, textbox, twoway, universal app, uwp, visual studio, webhook, windows10, xbind, xaml, xaml.cs]
---
*Bu makaleyi okumadan önce <a href="http://www.enginpolat.com/windows-10-uwp-uygulamasinda-xbind-kullanarak-basit-databinding/" target="_blank" rel="noopener">Windows 10 UWP uygulamasında {x:Bind} kullanarak basit DataBinding</a> makalesini okumanızı tavsiye ederim.*

**Slack**, <a href="http://www.slack.com" target="_blank" rel="noopener">http://www.slack.com</a> adresinde hizmet veren, son yılların en başarılı uygulamalarından birisi. Kendi sitelerinde yazana göre;

*Slack is a messaging app for teams that is on a mission to make your working life simpler, more pleasant, and more productive*

Geçen hafta aldığım çok ilginç bir **email**'de bir uygulamada **loglama** için **Slack** kullanabilir miyiz? sorusu vardı.

Bu makalede **Windows 10 UWP** uygulamasında **Slack** entegrasyonu yapacağız, fakat aynı yöntemler ile rahatlıkla bir *web uygulaması*nda veya *web service*'inde aynı **entegrasyon** kurulabilir.

Öncelikle **Slack** üzerinde ücretsiz olarak bir *hesap*, hesabı oluşturduktan sonra yeni bir **Channel** oluşturmamız gerekiyor. Örneğin *SlackLoggerApp-Logs* isimli bir **channel** oluşturmak için;

![](/assets/uploads/2016/02/slack-1.png)

Yeni bir **public channel** oluşturunca Slack sayfasında aşağıdaki gibi bir mesaj gözükmeli;

![](/assets/uploads/2016/02/slack-2.png)

**Got it!** butonuna tıkladığımızda bizi **channel**'in sayfasına yönlendirmeli;

![](/assets/uploads/2016/02/slack-3.png)

*https://{hesap}.slack.com/apps/build/custom-integration* adresine giderek yazacağımız uygulamanın **entegre** olacağı **Slack** *web servisini* oluşturuyoruz. Bunun için **Incoming WebHooks** seçeneğini seçerek ilerlememiz lazım;

![](/assets/uploads/2016/02/slack-4.png)

Gelen ekranda uygulamamızı geliştirirken ihtiyaç duyacağımız tüm **bilgiler** yer alıyor. Özellikle **Webhook URL** ve **Sending Messages** alanındaki bilgilere *kesinlikle* ihtiyacımız olacak;

![](/assets/uploads/2016/02/slack-5.png)

Bu noktaya geldikten sonra **Visual Studio**'yu açalım ve yeni bir **Blank App (Universal App)** projesi oluşturalım;

![](/assets/uploads/2016/02/slack-9.png)

Projeyi oluşturduktan sonra *MainPage.xaml* dosyasını açalım ve aşağıdaki **kodları** yazalım;



&lt;Page
    x:Class="SlackLogger.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:SlackLogger"&gt;

    &lt;StackPanel Background="#1abc9c" Padding="10"&gt;
        &lt;TextBox Header="Adınız" Margin="5" BorderBrush="Transparent" Text="{x:Bind FirstName, Mode=TwoWay}" /&gt;
        &lt;TextBox Header="Soyadınız" Margin="5" BorderBrush="Transparent" Text="{x:Bind LastName, Mode=TwoWay}" /&gt;
        &lt;TextBox Header="EMail Adresiniz" Margin="5" BorderBrush="Transparent" Text="{x:Bind EMail, Mode=TwoWay}" /&gt;
        &lt;TextBox Header="Mesajınız" Margin="5" Height="300" BorderBrush="Transparent" Text="{x:Bind MessageBody, Mode=TwoWay}" /&gt;
        &lt;Button Content="Gönder" Margin="5" Height="40" HorizontalAlignment="Stretch" Click="{x:Bind Send}" /&gt;
    &lt;/StackPanel&gt;

&lt;/Page&gt;</pre>

Önce bir <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.stackpanel" target="_blank" rel="noopener">StackPanel</a> nesnesi oluşturduk, içerisine 4 adet <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.textbox" target="_blank" rel="noopener">Textbox</a> 1 adet <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.button" target="_blank" rel="noopener">Button</a> nesnesi ekledik.

**Textbox** nesnelerinin <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.textbox.header" target="_blank" rel="noopener">Header</a> özelliklerine verdiğimiz değerler ile birer *başlığa* sahip olmalarını sağladık.

<a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.control.borderbrush" target="_blank" rel="noopener">BorderBrush</a> özelliklerine verdiğimiz **Transparent** değer sayesinde çerçevelerin gözükmemesini sağladık.

Son olarak, **Text** özelliklerine ve **Click** olayına *{x:Bind}* tipinde değerler vererek **Databinding** yapıyoruz. Burada önemli olan nokta, **Textbox**'ların **Text** özelliklerine yaptığımız **Databinding**'de **Mode** özelliğine **TwoWay** değerini vererek, iki yönlü **Databinding** yapmak. Böylece ekranda bir değer değiştirildiği zaman **Databinding** yapıldığı **property**'nin değeri otomatik olarak güncellenecek.

Böylece çalıştırdığımızda aşağıdaki gibi **gözüken** bir **uygulama** elde edeceğiz;

![](/assets/uploads/2016/02/slack-6.png)

**Databinding** için *FirstName*, *LastName*, *EMail* ve *MessageBody* **property**'lerini, ayrıca *Send()* **methodunu** yazmamız lazım. *MainPage.xaml.cs* dosyasını açalım ve aşağıdaki kodları ekleyelim;

<pre class="brush:csharp">public string FirstName { get; set; }
public string LastName { get; set; }
public string EMail { get; set; }
public string MessageBody { get; set; }

private async void Send()
{
    var client = new HttpClient();

    var payload = "{\"text\": \"" + FirstName + " " + LastName + "(" + EMail + ") : " + MessageBody + "\"}";

    await client.PostAsync(new Uri("https://hooks.slack.com/services/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"), new HttpStringContent(payload));
}


Böylece *Gönder* butonuna basıldığında **Slack**'te oluşturduğumuz **public channel**'ın **web service**'ine istediğimiz bilgiyi gönderebileceğiz. Bu makaledeki örnekte *Ad Soyad (EMail) : Message* formatında bilgiyi *Windows.Web.Http* **namespace**'i altında yeralan <a href="http://msdn.microsoft.com/library/windows/apps/windows.web.http.httpclient" target="_blank" rel="noopener">HttpClient</a> sınıfının <a href="http://msdn.microsoft.com/library/windows/apps/windows.web.http.httpclient.postasync" target="_blank" rel="noopener">PostAsync()</a> methoduna <a href="http://msdn.microsoft.com/library/windows/apps/windows.web.http.httpstringcontent" target="_blank" rel="noopener">HttpStringContent</a> tipinde gönderiyoruz.

*Gönder* butonuna bastığımızda, **Slack**, aşağıdaki **notification**'ı gösterecek;

![](/assets/uploads/2016/02/slack-7.png)

Eğer **Slack**'teki **public channel**'ın sayfasını açacak olursak, orada da *mesajı* görebileceğiz;

![](/assets/uploads/2016/02/slack-8.png)

