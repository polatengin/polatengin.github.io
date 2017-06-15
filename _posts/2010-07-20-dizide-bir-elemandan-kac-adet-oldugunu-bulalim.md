---
layout: post
title: "Dizide bir elemandan kaç adet olduğunu bulalım"
date: 2010-07-20 16:48
author: engin.polat
comments: true
category: [C#]
tags: [count, csharp, extension method, extensionmethod, generic, int, linq, linq query, list, string]
---
Elimizdeki bir dizide, belli bir elemandan **kaç adet** olduğunu bulmamız gerekebilir.

Bunu yapmanın programatik olarak **en kolay** yolu **LINQ sorgusu** yazmaktır.

Örneğin aşağıdaki **Extension Method**, **LINQ sorgusu** ile aranan elemandan, ilgili listede **kaç adet** olduğu sonucunu döndürür;



public static int CountTimes< T >(this List< T > list, T item)
{
    return ((from t in list where t.Equals(item) select t).Count());
}</pre>

*Örnek kullanım;*

<pre class="brush:csharp">using System;
using System.Linq;
using System.Collections.Generic;

public static class Program
{
    static void Main(string[] args)
    {
        var list1 = new List< int >() { 1, 2, 3, 4, 5, 6, 7, 7, 8, 9 };
        var list2 = new List< string >() { "a", "b", "b", "b", "c", "d", "e", "f" };

        Console.WriteLine("Birinci listede 7, " + list1.CountTimes(7) + " adet var");
        Console.WriteLine("İkinci  listede b, " + list2.CountTimes("b") + " adet var");

        Console.ReadLine();
    }

    public static int CountTimes< T >(this List< T > list, T item)
    {
        return ((from t in list where t.Equals(item) select t).Count());
    }
}</pre>

Yukarıdaki örnek kodu çalıştırdığınızda, şöyle bir **sonuç** almanız lazım;

<pre>Birinci listede 7, 2 adet var
İkinci  listede b, 3 adet var


