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

<script src="https://gist.github.com/polatengin/615467d1a36fae0d77d18f32b71c1db6?file=ExtensionMethods.cs"></script>

İlk olarak method'a geçilen parametrelerin değerlerini kontrol ediyoruz, eğer uygun olmayan bir değer verilmişse ilgili mesaj ile bir **hata** fırlatıyoruz.

*list* parametresinin **enumerator**'unu <a href="http://msdn.microsoft.com/library/system.collections.ienumerable.getenumerator" title="IEnumerable.GetEnumerator Method" target="_blank">GetEnumerator()</a> method'u ile aldıktan sonra <a href="http://msdn.microsoft.com/library/system.collections.ienumerator.movenext" title="IEnumerator.MoveNext Method" target="_blank">MoveNext()</a> method'u ile liste üzerinde ilerliyoruz.

*step* değişkeni *every* değişkeninin değerine eşit olduğunda aradığımız kaydı bulmuşuzdur, ilgili kaydı geri döndürüyoruz.

*Örnek kullanım;*

<script src="https://gist.github.com/polatengin/615467d1a36fae0d77d18f32b71c1db6?file=Program.cs"></script>