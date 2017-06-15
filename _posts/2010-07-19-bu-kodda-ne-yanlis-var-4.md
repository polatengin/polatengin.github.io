---
layout: post
title: "Bu kodda ne yanlış var? – 4"
date: 2010-07-19 18:09
author: engin.polat
comments: true
category: [C#]
tags: [array, bknyv, console, for, int, loop, WriteLine]
---
**Bowling** skorlarını hesaplayan bir uygulama yazıyoruz.

**2** oyuncunun **3** oyunda aldığı skorları hesaplayan aşağıdaki kodu yazdık ve çalıştırdık.

Fakat rakamlarda bir terslik var sanki. Sizce **problem nedir** ve **nasıl düzeltebiliriz**?



using System;

class Program
{
    static void Main(string[] args)
    {
        int[,] PuanTablosu = { {101, 128, 143}, {123, 115, 116} };

        int OyuncuPuan = 0;

        for (int iLoop = 0; iLoop < = PuanTablosu.GetUpperBound(0); iLoop++)
        {
            for (int yLoop = 0; yLoop <= PuanTablosu.GetUpperBound(1); yLoop++)
            {
                OyuncuPuan += PuanTablosu[iLoop, yLoop];
            }

            Console.WriteLine("Oyuncu {0} skor: {1}", iLoop + 1, OyuncuPuan);
        }

        Console.ReadLine();
    }
}</pre>


