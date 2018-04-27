---
layout: post
title: "C# SortedSet sınıfı"
date: 2010-10-31 16:58
author: engin.polat
comments: true
category: [C#]
tags: [add, array, clear, collection, dizi, foreach, int, max, min, property, reverse, sortedset, static, string]
---
<a href="http://msdn.microsoft.com/library/dd412070.aspx" target="_blank" rel="noopener">SortedSet</a> sınıfı, **.Net Framework 4.0** ile birlikte gelen en yeni sınıflardan biridir ve listesine eklenen elemanları **sıralı** bir şekilde tutar.

Bir örnek ile göstermek gerekirse;



public static void Main(string[] args)
{
    var SiraliListe = new SortedSet&lt;string&gt;();

    SiraliListe.Add("Engin");
    SiraliListe.Add("Ahmet");
    SiraliListe.Add("Mehmet");
    SiraliListe.Add("Ayşe");
    SiraliListe.Add("Fatma");

    foreach (string s in SiraliListe)
    {
        Console.WriteLine(s);
    }

    Console.ReadLine();
}</pre>

kodunun *çıktısı* aşağıdaki gibi olacaktır;

<pre>Ahmet
Ayşe
Engin
Fatma
Mehmet</pre>

<pre class="brush:csharp">public static void Main(string[] args)
{
    var SiraliListe = new SortedSet&lt;int&gt;() { 2, 5, 4, 6, 9, 3, 2, 8, 10, 7, 1 };

    foreach (int Sayi in SiraliListe)
    {
        Console.WriteLine(Sayi);
    }

    Console.ReadLine();
}</pre>

<pre>*Çıktı : *1, 2, 3, 4, 5, 6, 7, 8, 9, 10</pre>

*Tüm koleksiyonlara* uygulayabildiğimiz <a href="http://msdn.microsoft.com/library/dd412080.aspx" target="_blank" rel="noopener">Reverse()</a> methodu **SortedSet** sınıfında da kullanılabiliyor;

<pre class="brush:csharp">public static void Main(string[] args)
{
    var SiraliListe = new SortedSet&lt;int&gt;() { 2, 5, 4, 6, 9, 3, 2, 8, 10, 7, 1 };

    foreach (int Sayi in SiraliListe.Reverse())
    {
        Console.WriteLine(Sayi);
    }

    Console.ReadLine();
}</pre>

<pre>*Çıktı : *10, 9, 8, 7, 6, 5, 4, 3, 2, 1</pre>

[Clear()](http://msdn.microsoft.com/library/dd381802.aspx) methodu, **tüm elemanları silmeye** yarıyor;

<pre class="brush:csharp">public static void Main(string[] args)
{
    var SiraliListe = new SortedSet() { 2, 5, 4, 6, 9, 3, 2, 8, 10, 7, 1 };

    SiraliListe.Clear();

    Console.ReadLine();
}</pre>

<a href="http://msdn.microsoft.com/library/dd411719.aspx" target="_blank" rel="noopener">Min</a> ve <a href="http://msdn.microsoft.com/library/dd382351.aspx" target="_blank" rel="noopener">Max</a> özellikleri sayesinde listedeki **en küçük** ve **en büyük** değerli elemanlara ulaşabiliriz;

<pre class="brush:csharp">public static void Main(string[] args)
{
    var SiraliListe = new SortedSet&lt;int&gt;() { 2, 5, 4, 6, 9, 3, 2, 8, 10, 7, 1 };

    Console.WriteLine("Min : {0}, Max : {1}", SiraliListe.Min, SiraliListe.Max);

    Console.ReadLine();
}</pre>

<pre>*Çıktı : *Min : 1, Max : 10


