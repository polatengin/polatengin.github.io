---
layout: post
title: "C# String Dizisini String Uzunluğuna Göre Sıralama"
date: 2010-02-19 09:30
author: engin.polat
comments: true
category: [C#]
tags: [array, comparison, csharp, delegate, length, sort, string, toarray]
---
C# ile string dizisini elemanların uzunluğuna göre sıralama için aşağıdaki kod kullanılabilir;



private IList&lt;string&gt; SortStringLength(IList&lt;string&gt; arrString)
{
    string[] tmpString = arrString.ToArray&lt;string&gt;();
    Array.Sort(tmpString, new Comparison&lt;string&gt;(delegate(string str1, string str2)
    {
        if (str1 == null &amp;&amp; str2 == null)
            return 0; ///iki değişkende null
        else if (str1 == null)
            return -1; ///birinci değişken null
        else if (str2 == null)
            return 1; ///ikinci değişken null
        else
        {
            if (str1.Length &lt; str2.Length)
                return -1; ///birinci değişken daha kısa
            else if (str1.Length &gt; str2.Length)
                return 1; ///ikinci değişken daha kısa
            else
                return str1.CompareTo(str2); ///iki değişken aynı uzunlukta, alfabetik sıralama yapılıyor
        }
    }));

    return tmpString;
}</pre>

<pre class="brush:csharp">string[] OrnekDizi = { "333", null, "1", "22", "12", "4444" };
OrnekDizi = (string[])SortStringLength(OrnekDizi);

foreach (string s in OrnekDizi)
    Console.WriteLine(s);

// Console Çıktısı:
// [null]
// 1
// 12
// 22
// 333
// 4444


Bu kodu kullanarak sıraladığınız string dizisinde, elemanlar önce uzunluklarına göre sıralanacaktır. Aynı uzunlukta olan elemanlar ise alfabetik dizilime göre sıralanacaktır.

