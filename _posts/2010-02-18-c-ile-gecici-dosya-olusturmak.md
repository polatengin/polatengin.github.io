---
layout: post
title: "C# ile Geçici Dosya Oluşturmak"
date: 2010-02-18 18:29
author: engin.polat
comments: true
category: [C#]
tags: [combine, csharp, dosya, file, geçici, path, random, rastgele, temp]
---
Uygulama geliştirirken bazen geçici olarak dosya oluşturmak zorunda kalabiliriz.

Fakat dosya oluşturma ve yazma iznimizin olduğu bir klasör olmasını her zaman garantileyemeyebiliriz.

Ayrıca, oluşturduğumuz dosya ile işimiz bittiğinde silinmesini de kendimizin yönetmesi gerekir.

Aşağıdaki kod ise, **Windows**'un **geçici dosyalar** (**temporary files**) klasöründe rastgele isimde bir dosya oluşturur. Böylece geçici dosyanın temizlenmesi işini bizim yerimize **Windows** üstlenir.



public static string GeciciDosyaOlustur(string OnEk, string Uzanti)
{
    if (OnEk == null)
        throw new ArgumentNullException("OnEk");
    if (Uzanti == null)
        throw new ArgumentNullException("Uzanti");

    return Path.Combine(Path.GetTempPath(), String.Format("{0}.{1}.{2}", OnEk, Guid.NewGuid(), Uzanti));
}


