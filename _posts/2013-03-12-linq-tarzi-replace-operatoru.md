---
layout: post
title: "LINQ tarzı Replace operatorü"
date: 2013-03-12 21:00
author: engin.polat
comments: true
category: [C#]
tags: [class, equals, exception, extensionmethod, foreach, IEnumerable, int, linq, linq query, list, replace, return, string, this, throw, yield]
---
Bir **dizi**deki elemanlardan, *belli bir değere* sahip olanları *başka bir değerle* değiştirecek bir methoda sahip olmak çok faydalıdır.

*Language-Integrated Query* (**LINQ**) bu amaç için standart bir sorgu işlecini **sağlamaz** ama oluşturması *basittir*.

*Örneğin;* <a href="http://msdn.microsoft.com/library/system.string" title="MSDN : string Class" target="_blank">string</a> sınıfı <a href="http://msdn.microsoft.com/library/system.string.replace" title="MSDN : string Class Replace Method" target="_blank">Replace()</a> isminde bir method barındırır ve değişkenin değerinde yer alan belli bir karakterin tamamını başka bir karakter ile *değiştirir*.

Aynı mantık ile *diziler* üzerinde çalışan bir *method* olsaydı **çok kullanışlı** olurdu.

Öncelikle **static** *ExtensionMethods* isimli bir sınıf oluşturalım;



public static class ExtensionMethods
{
}</pre>

**Replace()** methodunu yazalım;

<pre class="brush:csharp">public static IEnumerable&lt;T&gt; Replace&lt;T&gt;(this IEnumerable&lt;T&gt; list, T find, T replaceWith)
{
    if (list == null) throw new ArgumentNullException("sequence");

    foreach (T item in list)
    {
        yield return find.Equals(item) ? replaceWith : item;
    }
}</pre>

*Örnek kullanım şekli;*

<pre class="brush:csharp">int[] values = new int[] { 1, 2, 3, 4, 5, 4, 3, 2, 1 };
int[] replacedInts = values.Replace(3, 0).ToArray();
 
// SONUÇ
// 1, 2, 0, 4, 5, 4, 0, 2, 1

string[] strings = new string[] { "A", "B", "C", "D", "C", "B", "A" };
string[] replacedStrings = strings.Replace("B", "-").ToArray();

// SONUÇ
// "A", "-", "C", "D", "C", "-", "A"


