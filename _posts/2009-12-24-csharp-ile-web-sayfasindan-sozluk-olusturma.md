---
layout: post
title: "C# ile Web Sayfasından Sözlük Oluşturma"
date: 2009-12-24 15:12
author: engin.polat
comments: true
category: [C#]
tags: [code, csharp, generic, html, list, regex, source]
---
Bir web sayfasının (<a title="enginpolat.com" href="http://www.enginpolat.com" target="_self">Bir programcının dünyası</a>, <a title="Karalamalar" href="http://www.karalamalar.net" target="_blank" rel="noopener">Karalamalar</a>, <a title="Fatih Durğut" href="http://www.durgut.com" target="_blank" rel="noopener">Fatih Durğut</a>,  <a title="NTVMSNBC" href="http://www.ntvmsnbc.com" target="_blank" rel="noopener">NTVMSNBC</a>, <a title="Wikipedia" href="http://www.wikipedia.org" target="_blank" rel="noopener">Wikipedia</a> gibi..) içeriğini okuduktan sonra, Html taglarından ayıklayıp bir sözlük oluşturabiliriz.

Bu yazımda, *C#* ve *Regex* kullanarak böyle bir uygulamayı nasıl yazabileceğimizi anlatacağım.

<a href="/assets/uploads/2009/12/WebSayfasindanSozlukOlusturma.png"><img class="lazy img-responsive" data-src="/assets/uploads/2009/12/WebSayfasindanSozlukOlusturma.png" title="WebSayfasindanSozlukOlusturma" /></a>

Yukarıdaki resimdeki formu oluşturduysanız, *Button*'un *Click* olayını yazmaya başlayalım;

WebRequest wr = WebRequest.Create(txtAdres.Text);
WebResponse ws = wr.GetResponse();
StreamReader sr = new StreamReader(ws.GetResponseStream(), Encoding.UTF8);
string response = sr.ReadToEnd();
sr.Close();
ws.Close();

List&lt;string&gt; arrSozluk = new List&lt;string&gt;();
Regex r = new Regex("&lt;(.|\n)*?&gt;");
foreach (string satir in r.Replace(response, "").Split(" \t\r\n({[]}),.;:*-+/?&lt;&gt;&amp;%'#@=\"\\_".ToCharArray(), StringSplitOptions.RemoveEmptyEntries))
    if (!arrSozluk.Contains(satir.Trim()))
        arrSozluk.Add(satir.Trim());

StringBuilder sb = new StringBuilder();
foreach (string satir in arrSozluk)
    sb.AppendLine(satir);

txtSozluk.Text = sb.ToString();

*Regex* nesnesi ile Html taglarını, *response*'tan siliyoruz. Daha sonra, kelimeleri bölmek için *Split* fonksiyonunu kullanıyoruz.

*Generic List* sınıfından bir nesneye her bir kelimeyi ekliyoruz.

Son olarakta, *Generic List* içerisindeki kelimeleri *TextBox* aracılığı ile ekrana yazdırıyoruz.

Uygulamanın kaynak kodlarına <a title="enginpolat.com: Web Sayfasından Sözlük Oluşturma" href="/assets/uploads/2009/12/WebSayfasindanSozlukOlusturma.rar" target="_blank" rel="noopener">buradan</a> erişebilirsiniz.

