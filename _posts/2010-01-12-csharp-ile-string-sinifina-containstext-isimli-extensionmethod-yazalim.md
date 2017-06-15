---
layout: post
title: "C# ile string sınıfına ContainsText isimli ExtensionMethod yazalım"
date: 2010-01-12 08:35
author: engin.polat
comments: true
category: [C#]
tags: [containstext, csharp, extensionmethod, intellisense, isnullorempty, null, string]
---
C# ile string tipindeki bir değişkenin dolu olduğunu kontrol etmek için yapılması gereken iki şey vardır;


*   Değişkenin null olmadığını kontrol etmek
*   Değişkenin boş olmadığını kontrol etmek
Aşağıdaki kod ile bu iki kontrolu doğru şekilde yapabiliriz;


string SiteUrl = "http://www.enginpolat.com";
if (SiteUrl != null &amp;&amp; SiteUrl != "")
{
}</pre>
Daha iyi bir yöntem olarak aşağıdaki şekilde de yazabiliriz;
<pre class="brush:csharp">string SiteUrl = "http://www.enginpolat.com";
if (string.IsNullOrEmpty(SiteUrl) == false)
{
}</pre>
Fakat bu kod parçası ile ilgili canımı sıkan iki nokta var;


*   Karşılaştırma işleminde **negatiflik** aramak. *string.IsNullOrEmpty* fonksiyonu, değişkenin dolu olduğu değil, boş olduğu durumda *true* değer döndürüyor. ("Dolu mu?" yerine "Boş değil, değil mi?")
*   Eğer bir değişkenin dolu olduğunu kontrol edeceksem, değişkenin ismini yazdıktan sonra karşılaştırma yapmam lazım. Yukarıdaki kodda ise, değişkenin ismini yazdıktan sonra başa dönüp, *string.IsNullOrEmpty* fonksiyonunu eklemem gerekiyor.
Benim için kafa karışıklığı olan bu kod yerine aşağıdaki **ExtensionMethod**'u kullanıyorum;
<pre class="brush:csharp">public static class ExtensionMethods
{
    public static bool ContainsText(this string Karsilastirilacak)
    {
        return string.IsNullOrEmpty(Karsilastirilacak) == false;
    }
}

*ContainsText* "C" harfi ile başladığı için, **Intellisense** ilk set ile birlikte gösteriyor.

