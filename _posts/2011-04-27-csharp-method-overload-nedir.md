---
layout: post
title: "C# method overload nedir?"
date: 2011-04-27 09:00
author: engin.polat
comments: true
category: [C#]
tags: [array, imza, int, method, overload, send, signature, string, void]
---
[Method Overload](http://en.wikipedia.org/wiki/Method_overloading), **aynı isme sahip** birden fazla method'un olabilmesidir diyebiliriz.

*Kural olarak, **overload** edilmiş **method**'lar aynı **imza**'ya (**signature**) sahip olamazlar.*

**Method İmzası** (*Method Signature*), method'un ismi ve aldığı parametrelerin tipleri/adedidir. Method imzasına, method'un dönüş tipi **dahil değildir**.

Örnek olarak;



void Topla(int Sayi1, int Sayi2) /// Topla(int, int)
{
}

void Topla(string Isim1, string Isim2) /// Topla(string, string)
{
}

/// Aşağıdaki method, ilk Topla method'u ile aynı imzaya sahip
void Topla(int Rakam1, int Rakam2) /// Topla(int, int)
{
}</pre>

Farklı bir örnek;

<pre class="brush:csharp">void EMailGonder(string To, string CC, string Konu, string Mesaj)
{
}</pre>

*EMailGonder()* **method**'unu kullanarak, email gönderme işlevini yerine getirebiliriz.

Tek bir alıcı yerine, *To* kısmının **string dizisi** (*string[]*) olması gerektiği durumda, yeni bir method yazmamız, hangi method'u kullanmamız gerektiği konusunda kafa karışıklığına sebep olacaktır.

**Method Overload** sayesinde, bu kafa karışıklığı ve kod kalabalığından kurtulabiliriz;

<pre class="brush:csharp">void EMailGonder(string[] To, string CC, string Konu, string Mesaj)
{
}</pre>

İki method'umuz birlikte;

<pre class="brush:csharp">void EMailGonder(string To, string CC, string Konu, string Mesaj)
{
}

void EMailGonder(string[] To, string CC, string Konu, string Mesaj)
{
}</pre>

Artık, *EMailGonder()* method'unu kullanacağımız zaman, ilk parametreyi **string dizisi** (*string[]*) şeklinde verirsek,

<pre class="brush:csharp">void EMailGonder(string[], string, string, string)</pre>

imzasına sahip method, ilk parametreyi **string** olarak verirsek,

<pre class="brush:csharp">void EMailGonder(string, string, string, string)


imzasına sahip olan method çalıştırılacaktır.

