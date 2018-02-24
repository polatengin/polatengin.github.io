---
layout: post
title: "Bu kodda ne yanlış var? – 7"
date: 2010-10-31 07:05
author: engin.polat
comments: true
category: [C#]
tags: [action, add, bknyv, class, console, delegate, foreach, generic, list, msdn, static, string, tolower, using, WriteLine]
---
Aşağıdaki kod sayesinde ekrana, *listedeki isimleri* **küçük harflerle** yazdırmak istiyorsunuz.

using System;
using System.Collections.Generic;

public class EkranaYazdir
{
    public static void Main()
    {
        List&lt;string&gt; Kisiler = new List&lt;string&gt;();

        Kisiler.Add("AHMET");
        Kisiler.Add("MEHMET");
        Kisiler.Add("AYŞE");
        Kisiler.Add("FATMA");

        /// string elemanları küçük harfe çevir
        Kisiler.ForEach(
            delegate(string k)
            {
                k = k.ToLower();
            }
        );

        /// console'a yaz
        Kisiler.ForEach(
            delegate(string s)
            {
                Console.WriteLine(s);
            }
        );
    }
}

**MSDN**'de [List&lt;T&gt;.ForEach()](http://msdn.microsoft.com/library/bwabdf9z.aspx) sayfasında;

*Orjinali;* Performs the specified *action* on each element of the List.

*Türkçesi;* Listedeki her eleman için belirlenmiş *action* çalıştırır.

yazısını okudunuz, ve kodun doğru çalışmasını bekliyorsunuz.

Fakat istediğiniz gibi çalışmıyor, sizce **problem nedir** ve **nasıl düzeltilebilir**?