---
layout: post
title: "Fluent Interface ve Class nasıl geliştirilir?"
date: 2017-02-10 15:00
author: engin.polat
comments: true
category: [C#]
tags: []
---
Geçen günlerde <a href="https://msdn.microsoft.com/en-us/library/bb308959.aspx" target="_blank" rel="noopener">LINQ: .NET Language-Integrated Query</a> tarzı kütüphaneler nasıl yazılıyor diye düşünürken ve internette gezinirken <a href="https://twitter.com/VinKamat" target="_blank" rel="noopener">VinKamat</a> kullanıcısının *02 Temmuz 2009* tarihinde attığı aşağıdaki tweet'e denk geldim;

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">FI(Fluent Interface) - when you use method chaining, after finishing the functionality, &quot;return this&quot;, and that&#39;s how you make it fluent</p>&mdash; Vin (@VinKamat) <a href="https://twitter.com/VinKamat/status/2440745544">July 2, 2009</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

**LINQ** tarzı kodlara örnek olarak aşağıdaki koda bakabiliriz;

<script src="https://gist.github.com/polatengin/f27cffb04cf8c1153da48b1af6246647.js?file=Orders.cs"></script>

Yukarıdaki örnekte de görebileceğimiz gibi, <code>OrderList</code> değişkenindeki listeyi <code>Where()</code> methodu ile filtreliyoruz, <code>OrderBy()</code> methodu ile sıralıyoruz, <code>Take()</code> methodu ile sadece istediğimiz kadar kaydı alıp, <code>Select()</code> methodu ile geriye yeni bir dizi döndürüyoruz.

Biz de benzer şekilde çalışacak bir kod geliştirelim, bu örnekte yemek oluşturacak kodları yazacağız. Öncelikle aşağıdaki **interface**'i projemize ekleyelim;

<script src="https://gist.github.com/polatengin/f27cffb04cf8c1153da48b1af6246647.js?file=IMenu.cs"></script>

Bu **interface**'de önemli nokta, tüm *method*'ların kendi **interface**'inin tipinde sonuç döndürmesi.

Böylece projeye aşağıdaki gibi bir **class** ekleyebiliriz;

<script src="https://gist.github.com/polatengin/f27cffb04cf8c1153da48b1af6246647.js?file=Menu.cs"></script>

Bu **class**'ta önemli nokta, tüm method'ların <code>this</code> anahtar kelimesi ile kendi sınıfını geri döndürmesi. Böylece bu methodları bir *zincir* (*chain*) oluşturacak şekilde aşağıdaki gibi kullanabiliriz;

<script src="https://gist.github.com/polatengin/f27cffb04cf8c1153da48b1af6246647.js?file=Program.cs"></script>