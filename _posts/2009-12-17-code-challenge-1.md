---
layout: post
title: "Code Challenge #1"
date: 2009-12-17 17:44
author: engin.polat
comments: true
category: [C#]
tags: [challenge, code, csharp, hosts, parallel, parse, regex, source, youtube]
---
Dün <a title="Karalamalar" href="http://www.karalamalar.net" target="_blank" rel="noopener">Emre</a> (nam-ı diğer <a title="Karalamalar" href="http://www.karalamalar.net" target="_blank" rel="noopener">kara</a>) arkadaşımla internette gezerken, bir youtube video'suna denk geldik. Emre'nin bilgisayarındaki hosts dosyasında güncel **youtube** ip adresleri olmadığı için videoyu izleyemedik.

Aklımıza, youtube domainine ait ip adreslerini otomatik olarak bulacak ve hosts dosyasını güncelleyecek bir uygulama yazmak geldi. Öğle yemeğine çıkmamıza 15 dakika olduğu için, bunu bir yarışa dönüştürmeye karar verdik.

**İşte Yarışmanın Kuralları**;


*   youtube.com, www.youtube.com, img.youtube.com alan adlarının ve v{1-24}.lscache{1-8}.c.youtube.com formatındaki alan adlarının ip adresleri otomatik olarak çözümlenecek
*   Domain adından IP adresini çözen bir servis kullanılacak (Ben böyle bir web service bulamadım, o yüzden http://www.hcidata.info/host2ip.cgi adresindeki formu kullandık)
*   Sonuç bilgisi C:\Windows\System32\drivers\etc\ altındaki hosts dosyasına otomatik olarak yazılacak
*   Uygulamayı yazma - test etme ve çalıştırma sonucunda, ilk kimin uygulaması hosts dosyasını güncellerse kazanmış olacak
![YoutubeHostDuzenleyici_2](/assets/uploads/2009/12/YoutubeHostDuzenleyici_2.png "YoutubeHostDuzenleyici_2")

Sizinde **15 dakika**nız var, **code challenge**'ımıza katılmak ister misiniz?

Benim çözümümü görmek için <!--more-->

Ben öncelikle *http://www.hcidata.info/host2ip.cgi* adresindeki formu inceleyerek başladım;

![YoutubeHostDuzenleyici_1](/assets/uploads/2009/12/YoutubeHostDuzenleyici_1.png "YoutubeHostDuzenleyici_1")

<a title="MSDN: WebRequest Class" href="http://msdn.microsoft.com/en-us/library/system.net.webrequest.aspx" target="_blank" rel="noopener">WebRequest</a> sınıfından bir örnek oluşturdum, sayfanın çıktısını *<a title="MSDN: WebRequest.GetResponse() Method" href="http://msdn.microsoft.com/en-us/library/system.net.webrequest.getresponse.aspx" target="_blank" rel="noopener">GetResponse()</a>* methodu ile alarak <a title="MSDN: WebResponse Class" href="http://msdn.microsoft.com/en-us/library/system.net.webresponse.aspx" target="_blank" rel="noopener">WebResponse</a> sınıfında bir nesnede sakladım. <a title="MSDN: StreamReader Class" href="http://msdn.microsoft.com/en-us/library/system.net.webresponse.aspx" target="_blank" rel="noopener">StreamReader</a> nesnesini kullarak, sayfanın HTML çıktısını string tipinde bir değişkene atadım.

*v{1-24}.lscache{1-8}.c.youtube.com* adreslerinin ip adreslerini bulmak için içiçe iki paralel for döngüsü kurdum.

*response* değişkeninde oluşan HTML'i parse ederek, ip adresine ulaştım.

hosts dosyasında **youtube.com** adresli satırları bulmak ve güncellemek için **.Net Regular Expression** (<a title="MSDN: Regex Class" href="http://msdn.microsoft.com/en-us/library/system.text.regularexpressions.regex.aspx" target="_blank" rel="noopener">Regex</a>) classını kullandım.

Son olarak, bu kodları fonksiyon haline getirdim;


private void btnIPBul_Click(object sender, EventArgs e)
{
    txtHosts.Clear();
    StringBuilder sb = new StringBuilder();
    sb.AppendLine(string.Format("{0}\t{1}", FindIP("youtube.com"), "youtube.com"));
    sb.AppendLine(string.Format("{0}\t{1}", FindIP("www.youtube.com"), "www.youtube.com"));
    sb.AppendLine(string.Format("{0}\t{1}", FindIP("img.youtube.com"), "img.youtube.com"));
    Parallel.For(1, 9, iLoop =&gt;
    {
        Parallel.For(1, 25, yLoop =&gt; {
            string url = string.Format("v{0}.lscache{1}.c.youtube.com", yLoop, iLoop);
            sb.AppendLine(string.Format("{0}\t{1}", FindIP(url), url));
        });
    });

    txtHosts.Text = sb.ToString();
}

private string FindIP(string AddressToLookUp)
{
    WebRequest r = WebRequest.Create(string.Format("http://www.hcidata.info/host2ip.cgi?domainname={0}&amp;findIP=Find IP Address&amp;ipaddress=127.0.0.1", AddressToLookUp));
    WebResponse s = r.GetResponse();

    StreamReader sr = new StreamReader(s.GetResponseStream(), Encoding.UTF8);
    string response = sr.ReadToEnd();

    sr.Close();
    s.Close();

    string ipAddress = response.Substring(response.IndexOf("IP Address : ") + 13, 16);

    return ipAddress.Substring(0, ipAddress.IndexOf("\n"));
}

private void btnHostsGuncelle_Click(object sender, EventArgs e)
{
    if (txtHosts.Text == "")
        btnIPBul.PerformClick();

    Regex r = new Regex(@"^(.*youtube\.com)");
    StringBuilder sb = new StringBuilder();

    foreach (string line in File.ReadAllText(@"C:\Windows\System32\drivers\etc\hosts").Split(Environment.NewLine.ToCharArray(), StringSplitOptions.RemoveEmptyEntries))
        if (!r.IsMatch(line))
            sb.AppendLine(line);

    sb.AppendLine();
    sb.AppendLine();
    sb.AppendLine("# youtube.com IP'leri Buradan Başlıyor");
    sb.Append(txtHosts.Text);

    File.WriteAllText(@"C:\Windows\System32\drivers\etc\hosts", sb.ToString());
}

Uygulamanın kodlarını <a title="enginpolat.com: Youtube Host Düzenleyici" href="/assets/uploads/2009/12/YoutubeHostDuzenleyici.rar" target="_self">buradan</a> indirebilirsiniz.

