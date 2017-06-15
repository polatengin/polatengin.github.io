---
layout: post
title: "Nullable Tipler"
date: 2010-09-26 15:00
author: engin.polat
comments: true
category: [C#]
tags: [class, generic, hasvalue, null, nullable, public, read-only, sadece okunabilir, static, System.InvalidOperationException, system.nullable, T, value, value type]
---
**Nullable tipler**, *ilgili tip*'in **değer aralığına** ve **karakteristiğine** sahip olmakla birlikte ek olarak **null** değer de *içerebilen* yapılardır.

Basit olarak, *değişkenin değer içerip içermediği bilgisini saklar.*

**Nullable tipler**, <a href="http://msdn.microsoft.com/library/system.nullable" target="_blank">System.Nullable&lt;T&gt;</a> türündedirler (*T, değer tipi olmalıdır*)

**Unutmayın!** *Sadece değer tipleri (value type) nullable olabilir.*

C# dili [değer tipi listesi](http://www.enginpolat.com/csharp-veri-tipleri)'ne daha önce yazdığım **makale** veya <a href="http://msdn.microsoft.com/library/s1ax56ch.aspx" target="_blank">MSDN üzerinden</a> ulaşabilirsiniz.

C# dilinde, **Nullable tipte** değişkenler **iki şekilde** tanımlanabilir.

Birinci yöntemde, **System.Nullable** *generic* tipini ilgili **değer tipi** ile birlikte yazabiliriz;



System.Nullable&lt;int&gt; adet;
System.Nullable&lt;bool&gt; sonuclandi;</pre>

İkinci yöntem, *daha çok kullanılır* ve *daha kısa yazım şekline* sahiptir. İlgili değer tipinin yanına *soruişareti* (*?*) karakteri koyarak yazılır;

<pre class="brush:csharp">int? adet;
bool? sonuclandi;</pre>

Bir *nullable değişken*, tanımlandığı anda **null değerini içermez**, sizin **null** eşitlemesini yapmanız beklenir;

<pre class="brush:csharp">int? adet = null;</pre>

**Nullable tipteki** bir değişkene **değer ataması** yapmak, *normal bir değişkene* değer ataması yapmak ile **aynıdır**.

<pre class="brush:csharp">adet = 100;</pre>

**Nullable** bir değişkenin değer içerip içermediğini anlamanın **iki yolu** vardır.

Birinci yöntemde, **değişkenin null olup/olmadığı** kontrol edilebilir.

<pre class="brush:csharp">if (adet != null)
{
    /// değeri var
}</pre>

Eğer değişken **null değilse**, *değer içeriyor* demektir.

İkinci yöntemde, değişkenin **System.Nullable** tipinden gelen *sadece-okunabilir (read-only)* **HasValue** özelliği kontrol edilir.

<pre class="brush:csharp">if (adet.HasValue)
{
    /// değeri var
}</pre>

Eğer değişken **değer içeriyorsa**, *değeri okumak için*, değişkenin **System.Nullable** tipinden gelen **Value** özelliği kullanılır.

Eğer **değer içermeyen** *nullable* bir değişkenin **Value** özelliğinden değer okumaya çalışırsanız, <a href="http://msdn.microsoft.com/library/system.invalidoperationexception" target="_blank">System.InvalidOperationException</a> istisnası **fırlatılır**.

<pre class="brush:csharp">using System;

class NullableTipTest
{
    public static void Main()
    {
        int? adet = null;

        if (adet.HasValue)
            Console.WriteLine("adet değeri: " + adet.Value);
        else
            Console.WriteLine("adet değeri yok.");

        adet = 10;

        if (adet.HasValue)
            Console.WriteLine("adet değeri: " + adet.Value);
        else
            Console.WriteLine("adet değeri yok.");
    }
}


Yukarıdaki kodun çıktısı şöyle *olacaktır*;



>adet değeri yok.
adet değeri: 10



