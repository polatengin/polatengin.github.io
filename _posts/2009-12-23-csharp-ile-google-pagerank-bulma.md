---
layout: post
title: "C# ile Google PageRank Bulma"
date: 2009-12-23 16:27
author: engin.polat
comments: true
category: [C#]
tags: [class, code, csharp, google, method, pagerank, source, static]
---
<a title="Google" href="http://www.google.com" target="_blank" rel="noopener">Google</a>'ın **PageRank** uygulaması, web sitelerinin Google tarafından önemini bulmakta kullanılan bir algoritmadır.

Wikipedia'daki <a title="Wikipedia: PageRank" href="http://en.wikipedia.org/wiki/PageRank" target="_blank" rel="noopener">şu adres</a>ten, PageRank algoritması ile ilgili ayrıntılı bilgiye erişebilirsiniz.

Siz de sitenizin PageRank değerini <a title="Google PageRank" href="http://www.prchecker.info" target="_blank" rel="noopener">http://www.prchecker.info</a> adresinden bulabilirsiniz.

Yazacağımız uygulama ile, sitenizin **Google PageRank** değerini programatik olarak buldurabileceğiz.

<a href="/assets/uploads/2009/12/GooglePageRank_1.png"><img class="lazy img-responsive" data-src="/assets/uploads/2009/12/GooglePageRank_1.png" title="GooglePageRank_1" /></a>

Google sitelerin PageRank değerlerini, <a title="Google PageRank" href="http://toolbarqueries.google.com/search" target="_blank" rel="noopener">http://toolbarqueries.google.com/search</a> adresine gönderilen sorgulara cevap olarak verebiliyor. Fakat sonuç alabilmemiz için bu adrese doğru parametreleri vermemiz gerekiyor, aksi halde *HTTP403 : Forbidden* hatası alıyoruz.

Parametreler:


*   **features**=Rank
*   **client**=navclient-auto
*   **q**=info:{adres}
*   **ch**={checksum}
Checksum bilgisini hesaplamak için Google'ın yayınladığı bir algoritma var. Uygulamamızda, bu algoritmayı C# ile yazacağız.

Yukarıdaki resimde görünen arayüzü hazırladıktan sonra, projemize *GooglePageRank* isminde static class ekliyoruz.

GooglePageRank static class'ı üç tane static method'dan oluşuyor.



private static void Mix(ref uint a, ref uint b, ref uint c)
{
    a -= b;
    a -= c;
    a ^= c &gt;&gt; 13;
    b -= c;
    b -= a;
    b ^= a &lt;&lt; 8;
    c -= a;
    c -= b;
    c ^= b &gt;&gt; 13;
    a -= b;
    a -= c;
    a ^= c &gt;&gt; 12;
    b -= c;
    b -= a;
    b ^= a &lt;&lt; 16;
    c -= a;
    c -= b;
    c ^= b &gt;&gt; 5;
    a -= b;
    a -= c;
    a ^= c &gt;&gt; 3;
    b -= c;
    b -= a;
    b ^= a &lt;&lt; 10;
    c -= a;
    c -= b;
    c ^= b &gt;&gt; 15;
}</pre>

<pre class="brush:csharp">private static string GoogleChecksum(string url)
{
    uint GoogleMagic = 0xE6359A60;

    uint a, b;
    uint c = GoogleMagic;

    a = b = 0x9E3779B9;

    int k = 0;
    int length = url.Length;

    while (length &gt;= 12)
    {
        a += (uint)(url[k + 0] + (url[k + 1] &lt;&lt; 8) + (url[k + 2] &lt;&lt; 16) + (url[k + 3] &lt;&lt; 24));
        b += (uint)(url[k + 4] + (url[k + 5] &lt;&lt; 8) + (url[k + 6] &lt;&lt; 16) + (url[k + 7] &lt;&lt; 24));
        c += (uint)(url[k + 8] + (url[k + 9] &lt;&lt; 8) + (url[k + 10] &lt;&lt; 16) + (url[k + 11] &lt;&lt; 24));

        Mix(ref a, ref b, ref c);

        k += 12;
        length -= 12;
    }

    c += (uint)url.Length;

    switch (length)
    {
        case 11:
            c += (uint)(url[k + 10] &lt;&lt; 24);
            goto case 10;
        case 10:
            c += (uint)(url[k + 9] &lt;&lt; 16);
            goto case 9;
        case 9:
            c += (uint)(url[k + 8] &lt;&lt; 8);
            goto case 8;
        case 8:
            b += (uint)(url[k + 7] &lt;&lt; 24);
            goto case 7;
        case 7:
            b += (uint)(url[k + 6] &lt;&lt; 16);
            goto case 6;
        case 6:
            b += (uint)(url[k + 5] &lt;&lt; 8);
            goto case 5;
        case 5:
            b += (uint)(url[k + 4]);
            goto case 4;
        case 4:
            a += (uint)(url[k + 3] &lt;&lt; 24);
            goto case 3;
        case 3:
            a += (uint)(url[k + 2] &lt;&lt; 16);
            goto case 2;
        case 2:
            a += (uint)(url[k + 1] &lt;&lt; 8);
            goto case 1;
        case 1:
            a += (uint)(url[k + 0]);
            break;
        default:
            break;
    }

    Mix(ref a, ref b, ref c);

    return string.Format("6{0}", c);
}</pre>

<pre class="brush:csharp">public static string PageRankHesapla(string adres)
{
    string checkSum = GoogleChecksum("info:" + adres);
    string url = "http://toolbarqueries.google.com/search?client=navclient-auto&amp;ch=" + checkSum + "&amp;features=Rank&amp;q=info:" + adres;

    try
    {
        WebRequest request = WebRequest.Create(url);
        WebResponse response = request.GetResponse();

        StreamReader reader = new StreamReader(response.GetResponseStream());
        string data = reader.ReadToEnd();

        reader.Close();
        response.Close();

        if (data.IndexOf(':') != -1)
            data = data.Substring(data.LastIndexOf(':') + 1);

        return data;
    }
    catch (Exception)
    {
        return "-1";
    }
}


Şimdi yapmamız gereken, Butonun *Click* olayında, *GooglePageRank* static class'ının *PageRankHesapla* method'unu çağırmak ve dönen değeri Label'da göstermek.

Uygulamanın çalışır halini <a title="enginpolat.com: PageRank" href="/assets/uploads/2009/12/GooglePageRank.rar" target="_blank" rel="noopener">bu adres</a>ten indirebilirsiniz.

