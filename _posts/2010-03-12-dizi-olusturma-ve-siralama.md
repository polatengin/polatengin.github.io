---
layout: post
title: "Dizi oluşturma ve sıralama"
date: 2010-03-12 09:00
author: engin.polat
comments: true
category: [C#]
tags: [array, class, dizi, method, sınıf, sort, static]
---
**C#** ile en basit **dizi tanımlama** yöntemi, değişken tipinin sonuna *[]* karakterlerini eklemektir.

***Örnek :***



int[] TekSayilar = { 3, 1, 9, 5, 7 };

string[] Ogrenciler = { "Engin", "Ahmet", "Mehmet", "Ali", "Veli" };</pre>

Dizileri **sıralamak** için, *Array* sınıfının **static** *Sort()* methodunu kullanabiliriz;

<pre class="brush:csharp">Array.Sort(TekSayilar);

Array.Sort(Ogrenciler);</pre>

Şimdi *TekSayilar* ve *Ogrenciler* dizilerindeki elemanları ekrana yazdırırsak;

<pre class="brush:csharp">foreach (int Sayi in TekSayilar)
    Console.WriteLine(Sayi);

foreach (string Ogrenci in Ogrenciler)
    Console.WriteLine(Ogrenci);


Dizilerdeki elemanların **sıralanmış** olduklarını görürüz.

