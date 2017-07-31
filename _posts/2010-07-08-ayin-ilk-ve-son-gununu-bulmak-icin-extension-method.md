---
layout: post
title: "Ayın ilk ve son gününü bulmak için Extension Method"
date: 2010-07-08 10:34
author: engin.polat
comments: true
category: [C#]
tags: [adddays, addmonths, csharp, datetime, extensionmethod, method, static]
---
Özellikle raporlama uygulamalarında, aylık dönemlere ait sorgulama yapılırken ilgili ayın **ilk** ve **son** günlerinin bilinmesi gerekir.

**C#** uygulamamızda, yazacağımız basit iki tane **extension method** ile ayın ilk ve son günlerini bulan kodu basitleştirebiliriz.

public static class ExtensionMethods
{
    public static DateTime AyinIlkGunu(this DateTime dt)
    {
        return new DateTime(dt.Year, dt.Month, 1);
    }
 
    public static DateTime AyinSonGunu(this DateTime dt)
    {
        return dt.AyinIlkGunu().AddMonths(1).AddDays(-1);
    }
}</pre>

**Extension Method**'ların kullanımı;

<pre class="brush:csharp">static void Main(string[] args)
{
    DateTime BuAy_BaslangicTarihi = DateTime.Now.AyinIlkGunu();
    DateTime BuAy_BitisTarihi = DateTime.Now.AyinSonGunu();

    DateTime GecenAy_BaslangicTarihi = DateTime.Now.AddMonths(-1).AyinIlkGunu();
    DateTime GecenAy_BitisTarihi = DateTime.Now.AddMonths(-1).AyinSonGunu();
}</pre>

Örnek kodun tamamı;

<pre class="brush:csharp">using System;

class Program
{
    static void Main(string[] args)
    {
        DateTime BuAy_BaslangicTarihi = DateTime.Now.AyinIlkGunu();
        DateTime BuAy_BitisTarihi = DateTime.Now.AyinSonGunu();

        DateTime GecenAy_BaslangicTarihi = DateTime.Now.AddMonths(-1).AyinIlkGunu();
        DateTime GecenAy_BitisTarihi = DateTime.Now.AddMonths(-1).AyinSonGunu();
  }
}

public static class ExtensionMethods
{
    public static DateTime AyinIlkGunu(this DateTime dt)
    {
        return new DateTime(dt.Year, dt.Month, 1);
    }

    public static DateTime AyinSonGunu(this DateTime dt)
    {
        return dt.AyinIlkGunu().AddMonths(1).AddDays(-1);
    }
}


