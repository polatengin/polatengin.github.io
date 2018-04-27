---
layout: post
title: "C# ile GMail üzerinden e-posta gönderme"
date: 2010-07-07 14:51
author: engin.polat
comments: true
category: [C#]
tags: [attachment, csharp, email, EnableSsl, gmail, MailMessage, NetworkCredential, send, smtp, SmtpClient, System.Net, System.Net.Mail]
---
Windows uygulamalarınız üzerinden e-posta gönderebilmek güzel bir özellik.

Uygulama içerisinden e-posta gönderme konusunda ilk akla gelen sorulardan bir tanesi, "*GMail üzerinden e-posta gönderebilir miyim?*" oluyor.

Bu yazımda, **GMail** üzerinden e-posta gönderebileceğimiz bir uygulama geliştireceğim.

Öncelikle kodumuzun *using* kısmına **System.Net** ve **System.Net.Mail** namespace'ini eklememiz gerekiyor.

.Net Framework, <a title="MSDN: System.Net.Mail" href="http://msdn.microsoft.com/en-us/library/system.net.mail.aspx" target="_blank" rel="noopener">System.Net.Mail</a> *namespace*'i içerisinde çeşitli *class*'lar aracılığı ile uygulamanız içerisinden kolaylıkla e-posta gönderilmesini mümkün kılıyor.


using System.Net.Mail;
using System.Net;</pre>
İlk yapmamız gereken, <a href="http://msdn.microsoft.com/en-us/library/system.net.mail.smtpclient.aspx" target="_blank" rel="noopener">SmtpClient</a> sınıfından bir örnek oluşturmak ve bazı özelliklerini ayarlamak.
<pre class="brush:csharp">SmtpClient sc = new SmtpClient();
sc.Port = 587;
sc.Host = "smtp.gmail.com";
sc.EnableSsl = true;</pre>
<a href="http://msdn.microsoft.com/en-us/library/system.net.mail.smtpclient.port.aspx" target="_blank" rel="noopener">Port</a> özelliği ile, Smtp sunucusuna erişeceğimiz port numarasını belirliyoruz

<a href="http://msdn.microsoft.com/en-us/library/system.net.mail.smtpclient.host.aspx" target="_blank" rel="noopener">Host</a> özelliği ile, GMail Smtp sunucusunun adresini belirliyoruz

<a href="http://msdn.microsoft.com/en-us/library/system.net.mail.smtpclient.enablessl.aspx" target="_blank" rel="noopener">EnableSsl</a> özelliği ile, GMail Smtp sunucusuna bağlanacağımız protokolu belirliyoruz. Eğer *true* değer atarsak **https**, eğer *false* değer atarsak **http** protokolü kullanılır.

GMail e-posta adresimizi ve şifremizi, <a href="http://msdn.microsoft.com/en-us/library/system.net.mail.smtpclient.credentials.aspx" target="_blank" rel="noopener">Credentials</a> özelliğine **NetworkCredential** sınıfından bir örnek ile atamamız gerekiyor.
<pre class="brush:csharp">sc.Credentials = new NetworkCredential("eposta@gmail.com", "gmail_sifre");</pre>
**SmtpClient** örneği üzerinden gönderilecek posta, <a href="http://msdn.microsoft.com/en-us/library/system.net.mail.mailmessage.aspx" target="_blank" rel="noopener">MailMessage</a> tipinde olmalıdır. Bir sonraki adımda **MailMessage** sınıfından bir örnek oluşturuyoruz.
<pre class="brush:csharp">MailMessage mail = new MailMessage();

mail.From = new MailAddress("eposta@gmail.com", "Ekranda Görünecek İsim");

mail.To.Add("alici1@mail.com");
mail.To.Add("alici2@mail.com");

mail.CC.Add("alici3@mail.com");
mail.CC.Add("alici4@mail.com");

mail.Subject = "E-Posta Konusu";
mail.IsBodyHtml = true;
mail.Body = "E-Posta İçeriği";

mail.Attachments.Add(new Attachment(@"C:\Rapor.xlsx"));
mail.Attachments.Add(new Attachment(@"C:\Sonuc.pptx"));</pre>
Son olarak, *SmtpClient* sınıfının <a href="http://msdn.microsoft.com/en-us/library/swas0fwc.aspx" target="_blank" rel="noopener">Send()</a> method'unu kullanarak, oluşturduğumuz *MailMessage* örneğini gönderiyoruz.
<pre class="brush:csharp">sc.Send(mail);</pre>
Kodların toparlanmış hali;
<pre class="brush:csharp">using System;
using System.Net.Mail;
using System.Net;

class Program
{
    static void Main(string[] args)
    {
        SmtpClient sc = new SmtpClient();
        sc.Port = 587;
        sc.Host = "smtp.gmail.com";
        sc.EnableSsl = true;

        sc.Credentials = new NetworkCredential("eposta@gmail.com", "gmail_sifre");

        MailMessage mail = new MailMessage();

        mail.From = new MailAddress("eposta@gmail.com", "Ekranda Görünecek İsim");

        mail.To.Add("alici1@mail.com");
        mail.To.Add("alici2@mail.com");

        mail.CC.Add("alici3@mail.com");
        mail.CC.Add("alici4@mail.com");

        mail.Subject = "E-Posta Konusu"; mail.IsBodyHtml = true; mail.Body = "E-Posta İçeriği";

        mail.Attachments.Add(new Attachment(@"C:\Rapor.xlsx"));
        mail.Attachments.Add(new Attachment(@"C:\Sonuc.pptx"));

        sc.Send(mail);
    }
}


