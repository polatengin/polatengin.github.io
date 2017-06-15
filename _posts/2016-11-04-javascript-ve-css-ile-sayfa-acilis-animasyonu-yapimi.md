---
layout: post
title: "Javascript ve CSS ile sayfa açılış animasyonu yapımı"
date: 2016-11-04 19:00
author: engin.polat
comments: true
category: [Web]
tags: [css, javascript, animasyon, html, html5]
---
*Email* ile aldığım soruların cevaplarını birer makale olarak yayınlıyorum.

İlginç sorulardan biri, '*Bir html sayfasının açılışını nasıl animatif hale getirebilirim?*' idi.

Bu makalede önce bir **html** sayfası oluşturacağız, **javascript** ve **css** kullanarak bu sayfanın açılışına yaklaşık *750ms*'lik **fade** (*yavaşça belirme*) animasyonu ekleyeceğiz.

Benim de yaptığım gibi <a href="http://code.visualstudio.com/" target="_blank">Visual Studio Code</a> editorünü veya başka favori editorünüzü açarak *index.html* isimli bir dosya oluşturalım ve aşağıdaki **html** şablonunu yazalım.

<script src="https://gist.github.com/polatengin/fcdff64c8edf66f3648c32a3e24a3fae.js?file=index-sablon.html"></script>

Sayfaya ekleyeceğimiz **fade** animasyonunu görebilmek için sayfada *yazılar*-*resimler*-vs olması gerekiyor. <a href="http://www.lipsum.com" target="_blank">Lorem Ipsum</a> sitesinde istediğimiz kadar rastgele yazı oluşturabilmeye yarayan bir sayfa var.

<img class="lazy img-responsive" data-src="http://www.enginpolat.com/wp-content/uploads/2017/01/lipsum.png" />

Ben **10** paragraflık rastgele yazı oluşturdum ve *html* sayfasının *body* taglarının arasına aşağıdaki şekilde ekledim;

<script src="https://gist.github.com/polatengin/fcdff64c8edf66f3648c32a3e24a3fae.js?file=index-lipsum.html"></script>

Artık sayfanın açılışına **fade** animasyonu ekleyebiliriz, öncelikle *body* taglarımıza **fade** *css class*'ını ve *head* tag'ının içerisine aşağıdaki stili yazdığımız *style* tagını ekleyelim;

<script src="https://gist.github.com/polatengin/fcdff64c8edf66f3648c32a3e24a3fae.js?file=index-style.html"></script>

Böylece *body* tag'ında **fade** *css class*'ı var olduğunda sayfa ekranda gözükmeyecek (**opacity** özelliği *0* olduğu için), **fade** *css class*'ını kaldırdığımızda sayfa *750ms* içerisinde görünür olacak (**opacity** özelliği *1* olduğu için)

Şimdi tek yapmamız gereken sayfa yüklendiğinde **fade** *css class*'ını **body** *tag*'ından kaldırmak, bunu aşağıdaki **javascript** kodu ile gerçekleştirebiliriz;

<script src="https://gist.github.com/polatengin/fcdff64c8edf66f3648c32a3e24a3fae.js?file=index-script.html"></script>

Böylece sayfayı açtığımızda *1200ms* içerisinde **fade** animasyonu ile görünür olacak;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/11/JavascriptSayfaAcilisAnimasyonu.gif" width="640" height="480" />