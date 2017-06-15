---
layout: post
title: "C# ile Ping Uygulaması"
date: 2010-01-12 15:10
author: engin.polat
comments: true
category: [C#]
tags: [code, csharp, delegate, namespace, ping, pingreply, roundtriptime, send, source, textbox, timer]
---
Windows komut satırından çağırabileceğiniz **ping** komutu ile kendi bilgisayarınızdan, networkünüzde bulunan diğer bilgisayarlara **Ping** atabilirsiniz.

Bazı durumlarda uygulamamıza **ping** yeteneği eklememiz gerekebilir. (Sunuculara erişilemediği anı yakalayıp, ilgili birimleri uyarmak gibi) Bu yazımda C# ile ping uygulaması yazacağız.

Hemen ekran görüntüsü ile başlayalım;

<a href="/assets/uploads/2010/01/Ping_1.png">![](/assets/uploads/2010/01/Ping_1.png "Ping_1")</a>

İlk başlangıç noktamız, MSDN'de şu sayfadan bilgilerine erişebileceğiniz <a title="MSDN: Ping" href="http://msdn.microsoft.com/en-us/library/system.net.networkinformation.ping.aspx" target="_blank">Ping</a> class'ı olacak. *Ping* class'ı, framework içerisinde *System.Net.NetworkInformation* namespace'i içerisinde yeralır.



private void btnPing_Click(object sender, EventArgs e)
{
    Ping p = new Ping();
    Timer t = new Timer() { Interval=1000 };
    t.Start();
    t.Tick += delegate(object _s, EventArgs _e) {
        PingReply pr = p.Send(txtAdres.Text);
        txtSonuc.Text += string.Format("Sonuç: {0}, {1} -&gt; {2} ms.{3}", pr.Status.ToString(), pr.Address.ToString(), pr.RoundtripTime.ToString(), Environment.NewLine);
    };
}


*Ping* butonunun *Click* olayında, *Ping* ve *Timer* class'larından birer örnek oluşturuyoruz. *Timer* nesnesinin *Tick* olayında, *Ping* nesnesinin *Send()* method'unu çağırıyoruz, dönen sonucu *PingReply* sınıfında bir değişkene atıyoruz ve *txtSonuc* **Textbox**'ında gösteriyoruz.

Uygulamanın kaynak kodlarını <a title="enginpolat.com: Ping Uygulaması" href="/assets/uploads/2010/01/PingUygulamasi.rar" target="_blank">buradan</a> indirebilirsiniz.

