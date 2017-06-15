---
layout: post
title: "C# Windows tarzı dosya boyutu formatlayıcı"
date: 2010-09-04 22:37
author: engin.polat
comments: true
category: [C#]
tags: [byte, directory, dizin, dosya, dosya sistemi, enum, file, FileSystem, format, gigabyte, kilobyte, math, megabyte, method, petabyte, round, static, string, terabyte, while]
---
Eğer uygulamalarınızda **dosya sistemindeki** *dosyalar* veya *dizinler* ile uğraşıyorsanız (listeleme, filtreleme, vs.) büyük ihtimalle dosya veya dizinlerin **boyutlarını** hespalayan bir yönteminiz vardır.

Genellikle (*kolay olduğundan ötürü*) **byte** cinsinden dosya boyutunu 1000'e (bin) böler **kilobyte** cinsinden veya 1.000.000'a (milyon) böler **megabyte** cinsinden karşılığını buluruz.

Fakat Windows işletim sisteminde dosya veya dizinlerin boyutları **en yakın birime** göre hesaplanır ve gösterilir.

Küçük dosyalar **byte**, **kilobyte** veya **megabyte** cinsinden gösterilirken, daha büyük dosyalar **gigabyte** hatta **terabyte** cinsinden gösterilebiliyor.

Eğer biz de uygulamamızda dosya boyutlarını **Windows tarzında** göstermek istiyorsak, öncelikle birimleri elde etmemize yarayacak bir <a href="http://msdn.microsoft.com/en-us/library/sbbt4032.aspx" target="_blank">enum</a> tanımlamalıyız;



public enum Boyutlar
{
    byte,
    kilobyte,
    megabyte,
    gigabyte,
    terabyte,
    petabyte
}</pre>

Daha sonra, parametre olarak noktalı rakam alan, geriye string döndüren bir method tanımlamalıyız;

<pre class="brush:csharp">public static string FormatDosyaBoyutu(decimal DosyaBoyutu)
{
}</pre>

*FormatDosyaBoyutu* method'unda, önce *Boyutlar* **enum**'ından bir örnek oluşturacağız ve *byte* değerini içermesini sağlayacağız;

<pre class="brush:csharp">Boyutlar BoyutTanim = Boyutlar.byte;</pre>

Daha sonra bir döngü aracılığıyla, *DosyaBoyutu* değişkeni 1000'e bölünebildiği sürece *BoyutTanim* değişkeninin **bir üst birimi** içermesini sağlayacağız;

<pre class="brush:csharp">while (Math.Round(DosyaBoyutu) >= 1000)
{
    DosyaBoyutu /= 1024;
    BoyutTanim++;
}</pre>

Son olarak, method'dan geriye *DosyaBoyutu* değişkenin *virgülden sonra 2 hane* içeren ve *doğru birimi* gösteren değeri döndürmesini sağlayacağız;

<pre class="brush:csharp">return string.Format("{0}\t{1}", DosyaBoyutu.ToString("f2"), BoyutTanim);</pre>

![Dosya Boyutu Formatlayıcı](/assets/uploads/2010/09/DosyaBoyutuFormatlayici.png "Dosya Boyutu Formatlayıcı")

Örnek kodun tamamı;

<pre class="brush:csharp">using System;
using System.Text;

namespace DosyaBoyutuFormatlayici
{
    class Program
    {
        public enum Boyutlar
        {
            byte,
            kilobyte,
            megabyte,
            gigabyte,
            terabyte,
            petabyte
        }

        public static void Main(string[] args)
        {
            Console.WriteLine(FormatDosyaBoyutu(0));
            Console.WriteLine(FormatDosyaBoyutu(10));
            Console.WriteLine(FormatDosyaBoyutu(200));
            Console.WriteLine(FormatDosyaBoyutu(3000));
            Console.WriteLine(FormatDosyaBoyutu(40000));
            Console.WriteLine(FormatDosyaBoyutu(500000));
            Console.WriteLine(FormatDosyaBoyutu(6000000));
            Console.WriteLine(FormatDosyaBoyutu(70000000));
            Console.WriteLine(FormatDosyaBoyutu(800000000));
            Console.WriteLine(FormatDosyaBoyutu(9000000000));
            Console.WriteLine(FormatDosyaBoyutu(10000000000));
            Console.WriteLine(FormatDosyaBoyutu(200000000000));
            Console.WriteLine(FormatDosyaBoyutu(3000000000000));
            Console.WriteLine(FormatDosyaBoyutu(40000000000000));
            Console.WriteLine(FormatDosyaBoyutu(500000000000000));
            Console.WriteLine(FormatDosyaBoyutu(6000000000000000));
            Console.WriteLine(FormatDosyaBoyutu(70000000000000000));
            Console.WriteLine(FormatDosyaBoyutu(800000000000000000));
            Console.WriteLine(FormatDosyaBoyutu(9000000000000000000));
            Console.WriteLine(FormatDosyaBoyutu(10000000000000000000));

            Console.ReadLine();
        }

        public static string FormatDosyaBoyutu(decimal DosyaBoyutu)
        {
            Boyutlar BoyutTanim = Boyutlar.byte;

            while (Math.Round(DosyaBoyutu) >= 1000)
            {
                DosyaBoyutu /= 1024;
                BoyutTanim++;
            }

            return string.Format("{0}\t{1}", DosyaBoyutu.ToString("f2"), BoyutTanim);
        }
    }
}


