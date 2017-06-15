---
layout: post
title: "Dosyanın UTF8 Formatında Olduğunu Belirleme"
date: 2010-01-30 19:29
author: engin.polat
comments: true
category: [C#]
tags: [csharp, dosya formatı, encoding, file format, file.open, filemode, getpreamble, read, sequenceequal, system.text, utf8]
---
**BilgeAdam**'da bir öğrencimin sorusu üzerine, bir dosyanın **UTF8** formatında olup olmadığını belirlemek için programatik yollar düşünmeye başlamıştım.

*System.Text* namespace'inde bulunan *Encoding* **class**'ını incelerken şöyle bir yol buldum;



public static bool IsUtf8(string DosyaAdi)
{
    using (var Dosya = File.Open(DosyaAdi, FileMode.Open))
    {
        byte[] pre = Encoding.UTF8.GetPreamble();
        var b = new byte[pre.Length];
        Dosya.Read(b, 0, b.Length);
        return b.SequenceEqual(pre);
    }
}


Sadece dosyanın **UTF8** olduğunu kontrol etmek için biraz hantal bir yol gibi gözüküyor değil mi?

Daha iyi bir yöntem öneriniz varsa, yorumlarınızı bekliyorum.

