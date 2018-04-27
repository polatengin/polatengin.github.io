---
layout: post
title: "C# ile Google Url Kısaltma Servisini Kullanmak"
date: 2009-12-29 11:09
author: engin.polat
comments: true
category: [C#]
tags: [code, csharp, google, source, url kısaltma, url shortener]
---
Adres kısaltma servisleri ile uzun internet linklerini kısaltmak mümkündür. İnternette birçok adres kısaltma servisi şu anda hizmet vermektedir. Birkaç tanesine örnek olarak;


*   <a href="http://tinyurl.com/" target="_blank" rel="noopener">http://tinyurl.com/</a>
*   <a href="http://snipurl.com/" target="_blank" rel="noopener">http://snipurl.com/</a>
*   <a href="http://shorl.com/" target="_blank" rel="noopener">http://shorl.com/</a>
*   <a href="http://tiny.cc/" target="_blank" rel="noopener">http://tiny.cc/</a>
**Facebook** adres kısaltma servisleri listesine <a title="Facebook Adres Kısaltma Servisi" href="http://fb.me" target="_blank" rel="noopener">http://fb.me</a> ile katıldı.

Tabii Google'da boş durmadı ve hemen kolları sıvayarak adres kısaltma servisi <a title="Google Url Shortener" href="http://goo.gl/" target="_blank" rel="noopener">http://goo.gl</a> duyurdu.

Bu yazımda, *C#* ile bu servisi nasıl kullanabileceğimizi anlatacağım.

Öncelikle ekranımızı aşağıdaki resimdeki gibi tasarlayalım;

<a href="/assets/uploads/2009/12/GoogleUrlShortener_1.png">![](/assets/uploads/2009/12/GoogleUrlShortener_1.png "GoogleUrlShortener_1")</a>

Uygulamanın anahtar parçası, *Kısalt* butonunun *Click* olayında gerçekleşiyor. **Google Url Shortener** servisini kullanmak için <a title="Google Url Shortener Service" href="http://ggl-shortener.appspot.com" target="_blank" rel="noopener">http://ggl-shortener.appspot.com</a> adresine *url* parametresi ile kısaltılmak istenen adres geçilmeli.

Biz bunu şöyle gerçekleştireceğiz;


WebRequest wr = WebRequest.Create(string.Format("http://ggl-shortener.appspot.com/?url={0}", txtAdres.Text));
WebResponse ws = wr.GetResponse();
StreamReader sr = new StreamReader(ws.GetResponseStream(), Encoding.UTF8);
string response = sr.ReadToEnd();
sr.Close();
ws.Close();</pre>
Dönen **JSON** sonucu, çok kısa ve basit olduğu için basit bir *Temizle* fonksiyonuna sokacağız,
<pre class="brush:csharp">private string Temizle(string Metin, string Temizlenecek)
{
string oReturn = Metin;

foreach (char c in Temizlenecek)
    oReturn = oReturn.Replace(c.ToString(), string.Empty);

return oReturn.Replace("short_url:", "").Trim();
}</pre>
Böylece, *Kısalt* butonunun *Click* olayına şu satırları da ekleyebiliriz;
<pre class="brush:csharp">lblAdres.Text = txtAdres.Text;
lblKisaAdres.Text = Temizle(response, "{ }\\,;\"");

Artık tek yapmamız gereken, uygulamayı çalıştırmak ve bir adres girip, *Kısalt* butonuna tıklamak;

<a href="/assets/uploads/2009/12/GoogleUrlShortener_2.png">![](/assets/uploads/2009/12/GoogleUrlShortener_2.png "GoogleUrlShortener_2")</a>

Uygulamanın kaynak kodlarını <a title="enginpolat.com: Google Adres Kisaltma Servisi" href="/assets/uploads/2009/12/GoogleUrlKisaltmaServisi.rar" target="_blank" rel="noopener">buradan</a> indirebilirsiniz.

