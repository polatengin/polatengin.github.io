---
layout: post
title: "Listedeki Her X'inci Elemanı Çekmek"
date: 2013-06-27 10:00
author: engin.polat
comments: true
category: [C#]
tags: [argumentexception, current, Enumerable, extensionmethod, getenumerator, IEnumerable, ienumerator, interface, linq, method, MoveNext, range, return, skip, take, throw, while, yield]
---
Bu yazıda elimizdeki listenin her x'inci *elemanını* çeken **extension method** yazacağız.

Örneğin, bir ankete cevap veren katılımcılardan her *5000'inci* katılımcıyı seçmek istediğimiz durumlarda böyle bir method'a ihtiyaç duyarız.

*TakeEvery()* **extension method**'u, *Language Integrated Query* (LINQ) method'larından <a href="http://msdn.microsoft.com/en-us/library/bb358985.aspx" title="Enumerable.Skip&lt;TSource&gt; Method" target="_blank">Skip()</a> ve <a href="http://msdn.microsoft.com/en-us/library/bb503062.aspx" title="Enumerable.Take&lt;TSource&gt; Method" target="_blank">Take()</a> gibi çalışacak, fakat listenin belli sayıda öğesini atlayıp, belli sayıda öğesini seçmek yerine, her x'inci elemanı seçecek.

İlk olarak *TakeEverySample* isimli projeyi oluşturalım;

![](/assets/uploads/2013/06/TakeEvery-1.png)

<a href="http://msdn.microsoft.com/en-us/library/9eekhta0.aspx" title="IEnumerable&lt;T&gt; Interface" target="_blank">IEnumerable&lt;T&gt;</a> sınıfına *TakeEvery()* method'unu eklemek için projemize *ExtensionMethods* isimli sınıfı ekleyelim;



public static class ExtensionMethods
{
    public static IEnumerable&lt;T&gt; TakeEvery&lt;T&gt;(this IEnumerable&lt;T&gt; list, int every)
    {
        if (list == null)
        {
            throw new ArgumentException("list parametresi boş geçilemez");
        }
        if (every < 1)
        {
            throw new ArgumentException("'every' parametresi en az 1 olabilir");
        }

        var step = 0;

        var enumerator = list.GetEnumerator();
        while (enumerator.MoveNext())
        {
            step++;
            if (step == every)
            {
                yield return enumerator.Current;
                step = 0;
            }
        }
    }
}</pre>

İlk olarak method'a geçilen parametrelerin değerlerini kontrol ediyoruz, eğer uygun olmayan bir değer verilmişse ilgili mesaj ile bir **hata** fırlatıyoruz.

*list* parametresinin **enumerator**'unu <a href="http://msdn.microsoft.com/library/system.collections.ienumerable.getenumerator" title="IEnumerable.GetEnumerator Method" target="_blank">GetEnumerator()</a> method'u ile aldıktan sonra <a href="http://msdn.microsoft.com/library/system.collections.ienumerator.movenext" title="IEnumerator.MoveNext Method" target="_blank">MoveNext()</a> method'u ile liste üzerinde ilerliyoruz.

*step* değişkeni *every* değişkeninin değerine eşit olduğunda aradığımız kaydı bulmuşuzdur, ilgili kaydı geri döndürüyoruz.

*Örnek kullanım;
*
</pre><pre class="brush:csharp">var rakamlar = Enumerable.Range(1, 1000000);

var her50000 = rakamlar.TakeEvery(50000);

// her50000 = { 50000, 100000, 150000, 200000, 250000, 300000, ... }



