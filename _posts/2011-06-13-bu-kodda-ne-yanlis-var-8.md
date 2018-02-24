---
layout: post
title: "Bu kodda ne yanlış var? – 8"
date: 2011-06-13 14:35
author: engin.polat
comments: true
category: [C#]
tags: [array, bknyv, function, int, performance, performans, public, struct]
---
Çalıştığımız proje’de, aşağıda tanımı verilmiş **struct**'tan *1000* tane üretip geri döndüren bir **fonksiyon** yazmamız gerekiyor;

struct Boyut
{
    public int Genislik;
    public int Yukseklik;
}

**Proje Liderine** yazdığımız kodu gösteriyoruz. Kod çalışırken hiçbir **hata üretmemesine** rağmen, kodu *değiştirmemizi* istiyor.

private Boyut[] BoyutlarListesi()
{
    Boyut[] boyutlar = new Boyut[1000];

    for (int iLoop = 0; iLoop < boyutlar.Length; iLoop++)
    {
        boyutlar[iLoop] = new Boyut();
    }

    return boyutlar;
}

Sizce neden böyle bir istekte bulunmuş olabilir?

*İpucu : Proje Lideri performans takıntısı olan eski bir programcı*