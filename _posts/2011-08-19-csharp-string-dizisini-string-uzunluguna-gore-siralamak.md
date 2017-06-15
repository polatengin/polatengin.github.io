---
layout: post
title: "C# String Dizisini String Uzunluğuna Göre Sıralamak"
date: 2011-08-19 15:30
author: engin.polat
comments: true
category: [C#]
tags: [array, collections, comparison, delegate, delegate method, extension method, extensionmethod, foreach, IEnumerable, public, sort, static, string, this, toarray]
---
Geliştirdiğimiz projelerde ekrana listeleyeceğimiz dizileri *harf uzunluklarına göre* **sıralamak** isteyebiliriz.

Bu makale ile, <a href="http://msdn.microsoft.com/library/system.collections.ienumerable" target="_blank">IEnumerable&lt;string&gt;</a> tipinden değişkenlere bu özelliği nasıl ekleyeceğimizi göreceğiz.

Öncelikle **Extension Method**'umuzu **static** bir sınıf içerisine (*ExtensionManager*) yazmamız lazım;



public static class ExtensionManager
{
    public static IEnumerable&lt;string&gt; Sirala(this IEnumerable&lt;string&gt; Liste)
    {
        string[] strArray = Liste.ToArray&lt;string&gt;();
        Array.Sort(strArray, new Comparison&lt;string&gt;(delegate(string Kelime1, string Kelime2)
        {
            if (Kelime1 == null && Kelime2 == null)
            {
                return 0;
            }
            else if (Kelime1 == null)
            {
                return -1;
            }
            else if (Kelime2 == null)
            {
                return 1;
            }
            else
            {
                if (Kelime1.Length &lt; Kelime2.Length)
                    return -1;
                else if (Kelime1.Length &gt; Kelime2.Length)
                    return 1;
                else
                    return Kelime1.CompareTo(Kelime2);
            }
        }));

        return strArray;
    }
}</pre>

Yukarıdaki kod'da <a href="http://msdn.microsoft.com/library/system.array" target="_blank">Array</a> sınıfının **static** <a href="http://msdn.microsoft.com/library/system.array.sort" target="_blank">Sort</a> method'unu çağırıyoruz. Karşılaştırma koşulunu, ikinci parametre'de **delegate method** olarak yazıyoruz.

Kullanımı;

<pre class="brush:csharp">var Rakamlar = new List&lt;string&gt; { "12", "1", null, "2314", "55555", "123", "222" };

foreach (var Rakam in Rakamlar.Sirala())
{
    Console.WriteLine(Rakam);
}</pre>

Sonuç;

<pre class="brush:csharp">[null]
1
12
123
222
2314
55555


