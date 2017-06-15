---
layout: post
title: "C# ile Dizi Bölümleme"
date: 2009-12-30 10:05
author: engin.polat
comments: true
category: [C#]
tags: [array, bölümleme, code, csharp, dizi, extensionmethod, multi-core, multi-thread, parallel, source, split]
---
Bilgeadam'da öğrencilerimden birinin sorduğu soru üzerine, bir dizinin, belli sayıda elemanlardan oluşan alt dizilere bölünmesi ile ilgili aşağıdaki uygulamayı yazdım.

Uygulama şöyle çalışıyor; rastgele kelimelerden oluşan bir dizimiz var, bu diziyi, ***n*** elemanlı alt dizilere bölmek istiyoruz.

Hemen kolları sıvayalım ve kod yazmaya başlayalım.

Öncelikle rastgele kelime oluşturma fonksiyonunu yazalım;



const string Harfler = "abcdefghijklmnopqrstuvwxyz";
Random r = new Random();

public string RastgeleKelimeUret(int HarfAdet)
{
    char[] arrReturn = new char[HarfAdet];

    Parallel.For(0, HarfAdet, iLoop =&gt; {
        arrReturn[iLoop] = Harfler[r.Next(0, Harfler.Length - 1)];
    });

    return new string(arrReturn);
}</pre>

Bu fonksiyonu <a title="enginpolat.com: Shuffle List" href="http://www.enginpolat.com/csharp-ile-dizi-karistirma/" target="_self">C# ile Dizi Karıştırma</a> yazımdan hatırlayacaksınız. Şimdi bu fonksiyonu kullanarak *List&lt;string&gt;* tipinde bir diziye 25 eleman dolduran kodumuzu yazalım;

<pre class="brush:csharp">List&lt;string&gt; BolunecekDizi = new List&lt;string&gt;();
Parallel.For(5, 25, iLoop =&gt; {
    BolunecekDizi.Add(RastgeleKelimeUret(iLoop));
});</pre>

**Parallel For** kullanarak **Multi-Core** ve **Multi-Thread** destekli kod yazdığımıza dikkat edelim. **Bölümleme** fonksiyonunu **ExtensionMethod** olarak yazacağız.

<pre class="brush:csharp">public static class ExtensionManager
{
    public static List&lt;T&gt;[] Bolumle&lt;T&gt;(this List&lt;T&gt; Dizi, int ParcaAdet)
    {
        if (Dizi == null)
            throw new Exception("Dizi boş olamaz..");

        if (ParcaAdet &lt; 1)
            throw new Exception("Parça Adet 1'den küçük olamaz..");

        int DiziBoyu = (int)Math.Floor(Dizi.Count / (double)ParcaAdet) + 1;

        List&lt;T&gt;[] arrReturn = new List&lt;T&gt;[DiziBoyu];

        int Adim = 0;
        Parallel.For(0, Dizi.Count, iLoop =&gt; {
            if (iLoop % ParcaAdet == 0 &amp;&amp; iLoop &gt; 0)
                Adim += 1;

            if (arrReturn[Adim] == null)
                arrReturn[Adim] = new List&lt;T&gt;();

            arrReturn[Adim].Add(Dizi[iLoop]);
        });

        return arrReturn;
    }
}</pre>

Artık tek yapmamız gereken *List&lt;T&gt;* generic tipinde nesnelerde *Bolumle()* fonksiyonunu kullanmak olacak.

<pre class="brush:csharp">List&lt;string&gt;[] Bolumler = BolunecekDizi.Bolumle(3);


Uygulamanın kaynak kodlarını <a title="enginpolat.com: Dizi Bölümleme" href="/assets/uploads/2009/12/DiziBolumleme.rar" target="_blank">buradan</a> indirebilirsiniz.

