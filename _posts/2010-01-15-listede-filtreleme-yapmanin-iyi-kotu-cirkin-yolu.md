---
layout: post
title: "Listede Filtreleme Yapmanın İyi - Kötü - Çirkin Yolu"
date: 2010-01-15 14:14
author: engin.polat
comments: true
category: [C#]
tags: [code, csharp, foreach, function, lambda, list, predicate, predicate function, source]
---
Bütün gün, dizilerde filtrelemeler yaptıktan sonra, bu konu ile ilgili bir yazı yazmaya karar verdim. Elimizde bir *List&lt;int&gt;* olsun, dizideki **0**'dan büyük rakamları döndüren fonksiyon yazmak istediğimizi varsayalım;

Önce ***Kötü Yol;***


private static List&lt;int&gt; FiltrelemeninKotuYolu(List&lt;int&gt; t)
{
    List&lt;int&gt; arrReturn = new List&lt;int&gt;();
    foreach (int i in t)
    {
        if (i &gt; 0)
        {
            arrReturn.Add(i);
        }
    }
    return arrReturn;
}</pre>
Umarım artık böyle kodlar yazmıyorsunuzdur!!..

***Çirkin Yol;***

Önce bir *Predicate Function* tanımlarız;
<pre class="brush:csharp">private static bool Karsilastir(int i)
{
    if (i &gt; 0)
    {
        return true;
    }
    return false;
}</pre>
Sonra, *Predicate Function*'ı kullanırız;
<pre class="brush:csharp">private static List&lt;int&gt; FiltrelemeninCirkinYolu(List&lt;int&gt; t)
{
    Predicate&lt;int&gt; pred = new Predicate&lt;int&gt;(Karsilastir);
    return t.FindAll(pred);
}</pre>
**Kötü Yol**'dan daha doğru olduğu ortada, ama **Güzel** bir yol değil.

Son olarak ***İyi Yol;***
<pre class="brush:csharp">private static List&lt;int&gt; FiltrelemeninIyiYolu(List&lt;int&gt; t)
{
    return t.FindAll(n =&gt; n &gt; 0);
}

**İyi Yol** aslında sadece **Çirkin Yol**'un iyileştirilmiş hali. *Predicate Method* kullanacağımıza *Lambda Expression* kullanıyoruz. *n =&gt; n &gt; 0* : **n**'nin **0**'dan büyük olduğu durumlar anlamına geliyor.

