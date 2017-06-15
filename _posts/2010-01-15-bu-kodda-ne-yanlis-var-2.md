---
layout: post
title: "Bu kodda ne yanlış var? - 2"
date: 2010-01-15 13:47
author: engin.polat
comments: true
category: [C#]
tags: [bknyv, code, csharp, delegate, find, hata, int, list, source]
---
Aşağıdaki kod parçasını çalıştıralım. *Sifir* isimli değişkenin değerine baktığımızda **0** olduğunu görüyoruz.



List&lt;int&gt; arrListe = new List&lt;int&gt;(new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9 });
int Sifir = arrListe.Find(
    delegate(int i) {
        return i == 0;
    }
);


Listede **0** değeri yok!. Neden sonuç **0** dönüyor? Bu kodu nasıl düzeltebiliriz?

