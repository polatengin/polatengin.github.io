---
layout: post
title: "C# ile LINQ filtrelerinin üç farklı kullanımı (Predicate Function, Anonymous Method, Lambda Expression)"
date: 2011-05-23 08:30
author: engin.polat
comments: true
category: [C#]
tags: [all, anonymous method, any, average, concat, count, distinct, elementat, Enumerable, equalall, except, first, firstordefault, foreach, groupby, IEnumerable, interface, intersect, lambda, lambda expression, linq, list, max, min, oftype, operatör, orderby, orderbydescending, predicate, query, range, repeat, select, single, singleordefault, skip, skipwhile, sum, take, takewhile, thenby, thenbydescending, toarray, todictionary, tolist, union, where]
---
**Listeler** (<a href="http://msdn.microsoft.com/library/system.collections.ienumerable" target="_blank">IEnumerable&lt;T&gt;</a> interface’ini implemente eden) üzerinde filtreleme yapmak için .Net 3.0’dan beri <a href="http://msdn.microsoft.com/netframework/aa904594" target="_blank">LINQ</a> sorgularını kullanabiliyoruz.

LINQ ile gelen farklı **operatör grupları** sayesinde, listeler üzerinde sadece **filtreleme** yapmanın ötesinde bir kontrolümüz oluyor (daha detaylı bilgi için MSDN’de yeralan <a href="http://msdn.microsoft.com/library/bb394939.aspx" target="_blank">The .Net Standard Query Operators</a> makalesini okuyabilirsiniz);



*   *Filtreleme Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336760#WhereSimple1" target="_blank">Where</a>
*   *Gruplama Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336754.aspx#simple1" target="_blank">GroupBy</a>
*   *Sıralama Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336756#OrderBySimple1" target="_blank">OrderBy</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336756#thenBySimple" target="_blank">ThenBy</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336756#OrderByDescendingSimple1" target="_blank">OrderByDescending</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336756#thenByDescendingSimple" target="_blank">ThenByDescending</a>
*   *Bölümleme Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336757#TakeSimple" target="_blank">Take</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336757#SkipSimple" target="_blank">Skip</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336757#TakeWhileSimple" target="_blank">TakeWhile</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336757#SkipWhileSimple" target="_blank">SkipWhile</a>
*   *Seçme Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336758#SelectSimple1" target="_blank">Select</a>
*   *Küme Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336761.aspx#distinct1" target="_blank">Distinct</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336761.aspx#union1" target="_blank">Union</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336761.aspx#intersect1" target="_blank">Intersect</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336761.aspx#except1" target="_blank">Except</a>
*   *Dönüştürme Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336748#ToArray" target="_blank">ToArray</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336748#ToList" target="_blank">ToList</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336748#ToDictionary" target="_blank">ToDictionary</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336748#OfType" target="_blank">OfType</a>
*   *Eleman Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336750#FirstSimple" target="_blank">First</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336750#FirstOrDefaultSimple" target="_blank">FirstOrDefault</a>, <a href="http://msdn.microsoft.com/magazine/cc337893.aspx" target="_blank">Single</a>, <a href="http://msdn.microsoft.com/magazine/cc337893.aspx" target="_blank">SingleOrDefault</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336750#ElementAt" target="_blank">ElementAt</a>
*   *Üretim Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336752.aspx#range" target="_blank">Range</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336752.aspx#repeat" target="_blank">Repeat</a>
*   *Gruplama Fonksiyonu Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336747#countSimple" target="_blank">Count</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336747#sumSimple" target="_blank">Sum</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336747#minSimple" target="_blank">Min</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336747#maxSimple" target="_blank">Max</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336747#avgSimple" target="_blank">Average</a>
*   *Sayım Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336759.aspx#anySimple" target="_blank">Any</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336759.aspx#allSimple" target="_blank">All</a>
*   *Diğer Operatörler :* <a href="http://msdn.microsoft.com/vcsharp/aa336755#Concat1" target="_blank">Concat</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336755#equalAll1" target="_blank">EqualAll</a>

Bu yazımda, bir liste uzerinde **LINQ** sorgusu gerçekleştirmenin 3 farklı yolunu inceleyeceğiz;



*   Predicate
*   Anonymous Method
*   Lambda Sorgusu

Öncelikle üzerinde çalışacağımız bir listeye ihtiyacımız olacak, <a href="http://msdn.microsoft.com/library/system.linq.enumerable" target="_blank">Enumerable</a> sınıfının **static** <a href="http://msdn.microsoft.com/library/system.linq.enumerable.range" target="_blank">Range</a> method’u ile iki değer aralığındaki tam sayılardan oluşan listeyi kullanabiliriz;



Enumerable.Range(50, 100);</pre>

***Predicate***

<pre class="brush:csharp">private static bool CiftSayiKontrol(int Rakam)
{
    if (Rakam % 2 == 0)
        return true;
    else
        return false;
}

public static void Main(string[] args)
{
    var SonucListe = Enumerable.Range(1, 20).Where(CiftSayiKontrol);
    foreach (var Rakam in SonucListe)
    {
        Console.WriteLine(Rakam);
    }

    Console.ReadLine();
}</pre>

Sonuç;

![LINQ Sorgusu - Predicate Function](/assets/uploads/2011/05/LINQSorgular.png "LINQ Sorgusu - Predicate Function")

***Anonymous Method***

<pre class="brush:csharp">public static void Main(string[] args)
{
    var SonucListe = Enumerable.Range(1, 20).Where(delegate(int number) {
        if (number % 2 == 0)
            return true;
        else
            return false;
    });

    foreach (var Rakam in SonucListe)
    {
        Console.WriteLine(Rakam);
    }

    Console.ReadLine();
}</pre>

![LINQ Sorgusu - Anonymous Method](/assets/uploads/2011/05/LINQSorgular.png "LINQ Sorgusu - Anonymous Method")

***Lambda Sorgusu***

<pre class="brush:csharp">public static void Main(string[] args)
{
    var SonucListe = Enumerable.Range(1, 20).Where(Rakam =&gt; Rakam % 2 == 0);
    foreach (var Rakam in SonucListe)
    {
        Console.WriteLine(Rakam);
    }

    Console.ReadLine();
}



![LINQ Sorgusu - Lambda Expression](/assets/uploads/2011/05/LINQSorgular.png "LINQ Sorgusu - Lambda Expression")

