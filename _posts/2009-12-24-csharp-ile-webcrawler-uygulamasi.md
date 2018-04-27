---
layout: post
title: "C# ile WebCrawler Uygulaması"
date: 2009-12-24 08:40
author: engin.polat
comments: true
category: [C#]
tags: [.net, code, crawler, csharp, regex, source, web]
---
<a title="Google" href="http://www.google.com" target="_blank" rel="noopener">Google</a>, <a title="Bing" href="http://www.bing.com" target="_blank" rel="noopener">Bing</a>, <a title="Yahoo" href="http://www.yahoo.com" target="_blank" rel="noopener">Yahoo</a> gibi arama motorları, internetteki sayfaları indexlemek için <a title="Wikipedia: Web Crawler" href="http://en.wikipedia.org/wiki/Web_crawler" target="_blank" rel="noopener">web crawler</a> denilen programcıklar kullanırlar.

Crawler'ların çalışma mantığı basittir;


1.  Web sayfasına git
2.  Sayfanın içeriğini indexle
3.  Sayfadaki her link için **1. adım**a geri dön
Crawler'ın, sayfadaki linkleri bulabilmesi anahtar adımdır.

Yazacağımız uygulamada, bir web crawler gibi sayfadaki linkleri bulacağız.

<a href="/assets/uploads/2009/12/WebCrawler.png">![](/assets/uploads/2009/12/WebCrawler.png "WebCrawler")</a>

Ekran görüntüsündeki formu oluşturduktan sonra, *Buton*'un *Click* olayına ait kodu yazmaya başlayalım.


private void btnLinkleriBul_Click(object sender, EventArgs e)
{
    WebRequest wr = WebRequest.Create(txtAdres.Text);
    WebResponse ws = wr.GetResponse();
    StreamReader sr = new StreamReader(ws.GetResponseStream(), Encoding.UTF8);
    string response = sr.ReadToEnd();
    sr.Close();
    ws.Close();

    Regex r = new Regex("&lt;a.+href=\"http.+://(.+)\"&gt;(.*)&lt;/a&gt;");
    foreach (Match m in r.Matches(response))
    {
        string link = m.Groups[1].Value;
        if (link.IndexOf("\"") &gt; -1)
            link = link.Substring(0, link.IndexOf("\""));
        string metin = m.Groups[2].Value;

        ListViewItem oItem = new ListViewItem(new string[] { metin, link });
        lvSonuc.Items.Add(oItem);
    }
}</pre>
[Code Challenge #1](http://www.enginpolat.com/code-challenge-1/) ve [C# ile Google PageRank Bulma](http://www.enginpolat.com/csharp-ile-google-pagerank-bulma/) yazılarında kullandığım tekniğin aynısı ile sayfanın içeriğini string değişkene alıyoruz.
<pre class="brush:csharp">WebRequest wr = WebRequest.Create(txtAdres.Text);
WebResponse ws = wr.GetResponse();
StreamReader sr = new StreamReader(ws.GetResponseStream(), Encoding.UTF8);
string response = sr.ReadToEnd();
sr.Close();
ws.Close();

Daha sonra, *Regex* sınıfından yeni bir örnek oluşturup (constructer'ına verdiğimiz parametre önemli), dönen sonuç kümesinin içeriğini *ListView* kontrolüne dolduruyoruz.

Eğer sayfanın içeriğini tuttuğumuz değişkeni veritabanına yazsak, ve sayfada bulduğumuz her link için bu adımları tekrar yapsak, tam bir web crawler uygulaması yazmış olacaktık.

Ama bu noktadan itibaren uygulamayı geliştirmeyi size bırakıyorum (BilgeAdam'daki öğrencilerime hep dediğim gibi, "Bundan sonrası size ödev!")

Projenin bu halini <a title="enginpolat.com: WebCrawler" href="/assets/uploads/2009/12/WebCrawler.rar" target="_blank" rel="noopener">şuradan</a> indirebilirsiniz.

