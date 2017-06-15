---
layout: post
title: "C# Null Coalescing (??) Operatörü"
date: 2010-01-19 16:24
author: engin.polat
comments: true
category: [C#]
tags: [coalescing, code, csharp, int, null, operatör, source, string]
---
**Null Coalescing Operatörü (??)** C# dilinin gözden kaçan, ama çok kullanışlı bir operatörüdür.

**??** operatörü sayesinde bir değişkenin değerinin *null* olduğu durumda alternatif değer döndürebiliriz.



string mesaj = "merhaba dünya!";
string sonuc = mesaj ?? "mesaj yok";</pre>

Eğer *mesaj* değişkeni *null* değer içeriyor olsaydı, *sonuc* değişkenine **"mesaj yok"** değeri atanacaktı.

<pre class="brush:csharp">string mesaj = null;
string sonuc = mesaj ?? "mesaj yok";</pre>

<pre class="brush:csharp">int? yas = 30;
int sonuc = yas ?? -1;</pre>

**Eğer** *yas* değişkeni *null* ise, *sonuc* değişkenine **-1** değeri ata.

<pre class="brush:csharp">int? yas = null;
int sonuc = yas ?? -1;


