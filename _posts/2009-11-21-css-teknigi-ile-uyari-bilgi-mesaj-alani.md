---
layout: post
title: "CSS tekniği ile uyarı / bilgi mesaj alanı"
date: 2009-11-21 09:15
author: engin.polat
comments: true
category: [Programlama]
tags: [alert, css, info, İnternet, mesaj, teknik, web]
---
Yazdığımız web uygulamalarında, uyarı / bilgilendirme mesajı vermeye her zaman ihtiyaç duyarız.

Gelelim, CSS tekniklerini kullanarak, bu mesaj kutularını nasıl yapabileceğimize.

Öncelikle style'larımızı yazdığımız css dosyasına, şu satırları ekleyelim;


.alert
{
  background: #fff6bf url(exclamation.png) 15px 50% no-repeat;
  text-align: left;
  padding: 5px 20px 5px 45px;
  border-top: 2px solid #ffd324;
  border-bottom: 2px solid #ffd324;
}
.info
{
  background: #f8fafc url(information.png) 15px 50% no-repeat;
  text-align: left;
  padding: 5px 20px 5px 45px;
  border-top: 2px solid #b5d4fe;
  border-bottom: 2px solid #b5d4fe;
}</pre>
Şimdi tek yapmamız gereken, paragraf tagları arasına mesajımızı yazmak ve paragraf tagına ilgili class'ı atamak.

Örnek;
<pre class="brush:html">&lt;p class="alert"&gt;Uyarı mesajı buraya gelecek.&lt;/p&gt;

&lt;p class="info"&gt;Bilgilendirme mesajı buraya gelecek.
Birden fazla satır olabilir.&lt;/p&gt;

İşte sonuç;

![CSS_Mesaj_Kutulari](/assets/uploads/2009/11/CSS_Mesaj_Kutulari.png "CSS_Mesaj_Kutulari")

Demo sayfasını görmek ve kodları indirmek için <a title="http://www.enginpolat.com" href="/assets/uploads/2009/11/MesajKutulari.html" target="_blank">tıklayın</a>.

<a title="eBurhan" href="http://www.eburhan.com/css-ile-hazirladigim-mesaj-kutulari/" target="_blank">Şu adreste</a>, bu tekniğin uygulandığı, download edilebilir kodları bulabilirsiniz.

Yazının orjinaline ise <a title="Bioneural" href="http://www.bioneural.net/2006/04/01/create-a-valid-css-alert-message/" target="_blank">şu kaynaktan</a> ulaşabilirsiniz.

