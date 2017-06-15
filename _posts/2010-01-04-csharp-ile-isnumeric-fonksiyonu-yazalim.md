---
layout: post
title: "C# ile isNumeric() fonksiyonu yazalım"
date: 2010-01-04 12:33
author: engin.polat
comments: true
category: [C#]
tags: [code, csharp, extension method, function, isnumeric, source, static, vbnet]
---
**VB.NET** programcılarının kullanabildiği, ama **C#**'ta bulunmayan *isNumeric()* fonksiyonunu kendimiz yazacağız;



public static class ExtensionManager
{
    public static bool isNumeric(this string value)
    {
        double oReturn = 0;
        return double.TryParse(value, out oReturn);
    }
}</pre>

Artık **C#** kodumuzun herhangi bir yerinde

<pre class="brush:csharp">string Deger = "5";
bool Rakamsal = Deger.isNumeric();</pre>

veya

<pre class="brush:csharp">string Deger = "5";
bool Rakamsal = ExtensionManager.isNumeric(Deger);


kullanabiliriz.

