---
layout: post
title: "C# iki koddan hangisini tercih edersiniz?"
date: 2010-02-19 19:24
author: engin.polat
comments: true
category: [C#]
tags: [bool, csharp, else, if]
---
Aşağıdaki kodlardan hangisini yazmayı **tercih edersiniz**?



bool loginSuccessful;

if (NetworkAvailable())
    loginSuccessful= LogUserOn();
else
    loginSuccessful= false;</pre>

veya

<pre class="brush:csharp">bool loginSuccessful= NetworkAvailable() &amp;&amp; LogUserOn();


İki yazım şekli de **aynı sonucu üretir**. **Siz** olsanız hangisini tercih ederdiniz?

