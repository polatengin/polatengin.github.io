---
layout: post
title: "C# ile LINQ filtrelerinin üç farklı kullanımı (Predicate Function, Anonymous Method, Lambda Expression)"
date: 2011-05-23 08:30
author: engin.polat
comments: true
category: [C#]
tags: [all, anonymous method, any, average, concat, count, distinct, elementat, Enumerable, equalall, except, first, firstordefault, foreach, groupby, IEnumerable, interface, intersect, lambda, lambda expression, linq, list, max, min, oftype, operatör, orderby, orderbydescending, predicate, query, range, repeat, select, single, singleordefault, skip, skipwhile, sum, take, takewhile, thenby, thenbydescending, toarray, todictionary, tolist, union, where]
---
**Listeler** (<a href="http://msdn.microsoft.com/library/system.collections.ienumerable" target="_blank" rel="noopener">IEnumerable&lt;T&gt;</a> **interface**'ini *implemente* eden) üzerinde filtreleme yapmak için **.Net 3.0**'dan beri <a href="http://msdn.microsoft.com/netframework/aa904594" target="_blank" rel="noopener">LINQ</a> sorgularını kullanabiliyoruz.

LINQ ile gelen farklı **operatör grupları** sayesinde, listeler üzerinde sadece **filtreleme** yapmanın ötesinde bir kontrolümüz oluyor (daha detaylı bilgi için MSDN’de yeralan <a href="http://msdn.microsoft.com/library/bb394939.aspx" target="_blank" rel="noopener">The .Net Standard Query Operators</a> makalesini okuyabilirsiniz);

*   *Filtreleme Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336760#WhereSimple1" target="_blank" rel="noopener">Where</a>
*   *Gruplama Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336754.aspx#simple1" target="_blank" rel="noopener">GroupBy</a>
*   *Sıralama Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336756#OrderBySimple1" target="_blank" rel="noopener">OrderBy</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336756#thenBySimple" target="_blank" rel="noopener">ThenBy</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336756#OrderByDescendingSimple1" target="_blank" rel="noopener">OrderByDescending</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336756#thenByDescendingSimple" target="_blank" rel="noopener">ThenByDescending</a>
*   *Bölümleme Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336757#TakeSimple" target="_blank" rel="noopener">Take</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336757#SkipSimple" target="_blank" rel="noopener">Skip</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336757#TakeWhileSimple" target="_blank" rel="noopener">TakeWhile</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336757#SkipWhileSimple" target="_blank" rel="noopener">SkipWhile</a>
*   *Seçme Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336758#SelectSimple1" target="_blank" rel="noopener">Select</a>
*   *Küme Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336761.aspx#distinct1" target="_blank" rel="noopener">Distinct</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336761.aspx#union1" target="_blank" rel="noopener">Union</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336761.aspx#intersect1" target="_blank" rel="noopener">Intersect</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336761.aspx#except1" target="_blank" rel="noopener">Except</a>
*   *Dönüştürme Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336748#ToArray" target="_blank" rel="noopener">ToArray</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336748#ToList" target="_blank" rel="noopener">ToList</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336748#ToDictionary" target="_blank" rel="noopener">ToDictionary</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336748#OfType" target="_blank" rel="noopener">OfType</a>
*   *Eleman Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336750#FirstSimple" target="_blank" rel="noopener">First</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336750#FirstOrDefaultSimple" target="_blank" rel="noopener">FirstOrDefault</a>, <a href="http://msdn.microsoft.com/magazine/cc337893.aspx" target="_blank" rel="noopener">Single</a>, <a href="http://msdn.microsoft.com/magazine/cc337893.aspx" target="_blank" rel="noopener">SingleOrDefault</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336750#ElementAt" target="_blank" rel="noopener">ElementAt</a>
*   *Üretim Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336752.aspx#range" target="_blank" rel="noopener">Range</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336752.aspx#repeat" target="_blank" rel="noopener">Repeat</a>
*   *Gruplama Fonksiyonu Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336747#countSimple" target="_blank" rel="noopener">Count</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336747#sumSimple" target="_blank" rel="noopener">Sum</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336747#minSimple" target="_blank" rel="noopener">Min</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336747#maxSimple" target="_blank" rel="noopener">Max</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336747#avgSimple" target="_blank" rel="noopener">Average</a>
*   *Sayım Operatörleri :* <a href="http://msdn.microsoft.com/vcsharp/aa336759.aspx#anySimple" target="_blank" rel="noopener">Any</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336759.aspx#allSimple" target="_blank" rel="noopener">All</a>
*   *Diğer Operatörler :* <a href="http://msdn.microsoft.com/vcsharp/aa336755#Concat1" target="_blank" rel="noopener">Concat</a>, <a href="http://msdn.microsoft.com/vcsharp/aa336755#equalAll1" target="_blank" rel="noopener">EqualAll</a>

Bu yazımda, bir liste uzerinde **LINQ** sorgusu gerçekleştirmenin 3 farklı yolunu inceleyeceğiz;

*   Predicate
*   Anonymous Method
*   Lambda Sorgusu

Öncelikle üzerinde çalışacağımız bir listeye ihtiyacımız olacak, <a href="http://msdn.microsoft.com/library/system.linq.enumerable" target="_blank" rel="noopener">Enumerable</a> sınıfının **static** <a href="http://msdn.microsoft.com/library/system.linq.enumerable.range" target="_blank" rel="noopener">Range</a> method’u ile iki değer aralığındaki tam sayılardan oluşan listeyi kullanabiliriz;

<script src="https://gist.github.com/polatengin/f5091be50e6be22c8118019875054a28.js?file=MockData.cs"></script>

***Predicate***

<script src="https://gist.github.com/polatengin/f5091be50e6be22c8118019875054a28.js?file=PredicateMethod.cs"></script>

Sonuç;

![LINQ Sorgusu - Predicate Function](/assets/uploads/2011/05/LINQSorgular.png "LINQ Sorgusu - Predicate Function")

***Anonymous Method***

<script src="https://gist.github.com/polatengin/f5091be50e6be22c8118019875054a28.js?file=AnonymousMethod.cs"></script>

![LINQ Sorgusu - Anonymous Method](/assets/uploads/2011/05/LINQSorgular.png "LINQ Sorgusu - Anonymous Method")

***Lambda Sorgusu***

<script src="https://gist.github.com/polatengin/f5091be50e6be22c8118019875054a28.js?file=LambdaExpression.cs"></script>

![LINQ Sorgusu - Lambda Expression](/assets/uploads/2011/05/LINQSorgular.png "LINQ Sorgusu - Lambda Expression")
