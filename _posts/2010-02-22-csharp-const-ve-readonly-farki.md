---
layout: post
title: "C# const ve readonly farkı"
date: 2010-02-22 10:28
author: engin.polat
comments: true
category: [C#]
tags: [const, constant, constructor, csharp, değişken, readonly, sabit, sadece okunabilir, variable]
---
**Senaryo :** Uygulama çalışırken değeri değiştirilemeyecek değişken tanımlamanız gerekiyor.

**Çözüm :** Muhtemel iki çözüm var, *const* ve *readonly* değişken tanımlamak. Fakat aralarında önemli bir fark var;

***const :*** Türkçe'ye **Sabit** olarak çevrilebilir. Class seviyesinde tanımlanır ve tanımlanma anında değeri verilmek zorundadır. Sonradan değeri değiştirilemez.

***readonly :*** **Sadece-Okunabilir** anlamına gelir. Class seviyesinde tanımlanır. Tanımlandığı anda değeri verilebilir veya Class Constructor'ında değeri verilebilir. Sonradan değeri değiştirilemez.



public class Matematik
{
    private const double PI = 3.14159;
}</pre>

<pre class="brush:csharp">public class Matematik
{
    private readonly int PI; /// PI değişkeninin değerini burada da verebilirdim.

    public Matematik()
    {
        PI = 22 / 7;
    }
}


