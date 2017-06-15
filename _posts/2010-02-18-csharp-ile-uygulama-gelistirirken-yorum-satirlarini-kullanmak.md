---
layout: post
title: "C# ile Uygulama Geliştirirken Yorum Satırlarını Kullanmak"
date: 2010-02-18 12:05
author: engin.polat
comments: true
category: [C#]
tags: [comment, csharp, operatör, string, yorum]
---
Bu yazımda aslında çok kolay bir konuyu işliyor olacağım, **C#** kodunuza **yorum satır(lar)ı** eklemek.

Bu konuyu yazmamdaki asıl amacım, **BilgeAdam**'daki öğrencilerim için hatırlatma niteliğinde olmasıdır.

C# **geleneksel C-tarzı** yorum satır(lar)ını destekler; (**// ...**) veya (**/* ... */**)

<span style="color: #008000;">*// Bu satır örnek olarak yorum haline getirilmiştir.
/* Bu satır örnek olarak yorum haline getirilmiştir. */*</span>

Tek satır yorum operatörünün (**//**) satırda buluduğu noktadan satırın sonuna kadar herşey yorum olarak kabul edilir.

Çok satır yorum operastöründe (**/* */**), *başlangıç operatöründen* (**/***) *bitiş operatörüne* (***/**) kadar herşey **yorum** olarak kabul edilir.

Tek satırlı ve çok satırlı yorumlar şu şekilde yazılabilir;

<span style="color: #008000;">*// Tek satırlı yorum
/* Bu satırlar
çok satırlı yorum
için iyi bir örnektir. */*</span>

Aşağıdaki kod'da geçerlidir;

*Console.WriteLine(<span style="color: #008000;">/* İşte yorum! */</span> "Kodun burası derlenir.");*

Aynı zamanda aşağıdaki gibi kodlar sayesinde, satır içerisinde kod parçalarına yorum yazabilmek mümkündür;

*EkranaCiz(Boy, <span style="color: #008000;">/* Yukseklik */</span> 250);*

Tabiki string karakterleri arasındaki yorum operatörleri, normal karakter olarak değerlendirilecektir;

*string mesaj = "/* Bu normal bir metin değişkenidir */";*

