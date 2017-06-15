---
layout: post
title: "For - ForEach - List.ForEach performans karşılaştırması"
date: 2010-10-31 14:32
author: engin.polat
comments: true
category: [C#]
tags: [action, add, array, average, benchmark, console, dizi, Enumerable, for, foreach, generic, karşılaştırma, lambda, list, loop, performance, performans, range, restart, start, static, stop, stopwatch, test]
---
Bir **dizinin tüm elemanları** üzerinde bir **aksiyon** gerçekleştirmemiz gerektiğinde, sıklıkla şu *üç* yoldan *birini* kullanırız;



*   For döngüsü
*   ForEach Döngüsü
*   List generic sınıfının ForEach extension method'u

Şimdi basit bir örnek ile bu üç yöntemi karşılaştıralım <sup>*(*)*</sup>;

<sub>*(* Not : Karşılaştırmalar; Windows7 64bit kurulu, Core2Duo 3.0 GHz ve 4 GB Ram'li bilgisayarımda yapılmıştır. Sadece fikir verme amaçlıdır, farklı durumlarda faklı sonuçlar ile karşılaşılabilir.)*</sub>

Öncelikle parametre olarak Generic List (List&lt;T&gt;) alan *üç* tane **method** yazalım;



private static long ToplamFor(List&lt;int&gt; Liste)
{
    long Sonuc = 0;
    int ListeAdet = Liste.Count;

    for (int iLoop = 0; iLoop &lt; ListeAdet; iLoop++)
        Sonuc += Liste[iLoop];

    return Sonuc;
}

private static long ToplamForEach(List&lt;int&gt; Liste)
{
    long Sonuc = 0;

    foreach (int Rakam in Liste)
        Sonuc += Rakam;

    return Sonuc;
}

private static long ToplamForEachExtension(List&lt;int&gt; Liste)
{
    long Sonuc = 0;

    Liste.ForEach(Rakam =&gt; Sonuc += Rakam);

    return Sonuc;
}</pre>

Aynı testi *10 defa* gerçekleştirip, **ortalamasını** alacak bir **test fonksiyonu** yazalım. Yazacağımız fonksiyonu *test listesinde* olacak **eleman adedini** *parametre* olarak alacak;

<pre class="brush:csharp">private static void Testler(int ListeElemanAdet)
{
    List&lt;int&gt; ForSureler = new List&lt;int&gt;();
    List&lt;int&gt; ForEachSureler = new List&lt;int&gt;();
    List&lt;int&gt; ForEachExtensionSureler = new List&lt;int&gt;();

    List&lt;int&gt; TestVerisi = Enumerable.Range(0, ListeElemanAdet).ToList();

    Stopwatch sw = new Stopwatch();

    for (int iLoop = 0; iLoop &lt; 10; iLoop++)
    {
        sw.Restart();
        ToplamFor(TestVerisi);
        sw.Stop();
        ForSureler.Add(sw.ElapsedTicks);

        sw.Restart();
        ToplamForEach(TestVerisi);
        sw.Stop();
        ForEachSureler.Add(sw.ElapsedTicks);

        sw.Restart();
        ToplamForEachExtension(TestVerisi);
        sw.Stop();
        ForEachExtensionSureler.Add(sw.ElapsedTicks);
    }

    Console.WriteLine("For Döngüsü ({0} Eleman) : {1}", ListeElemanAdet, ForSureler.Average());

    Console.WriteLine("ForEach Döngüsü ({0} Eleman) : {1}", ListeElemanAdet, ForEachSureler.Average());

    Console.WriteLine("ForEach Extension ({0} Eleman) : {1}", ListeElemanAdet, ForEachExtensionSureler.Average());
}</pre>

Artık uygulamamızın **test fonksiyonunu** kullanacak son kod parçasını yazabiliriz;

<pre class="brush:csharp">public static void Main(string[] args)
{
    Console.WriteLine("Test Başladı");

    Testler(1000);
    Testler(5000);
    Testler(10000);
    Testler(50000);
    Testler(100000);
    Testler(500000);
    Testler(1000000);
    Testler(5000000);
    Testler(10000000);
    Testler(50000000);

    Console.WriteLine("Test Bitti");

    Console.ReadLine();
}


Bakalım yaptığımız testler nasıl sonuç vermiş;

![For - ForEach - ForEach extension Performans Karşılaştırması / Ekran Görüntüsü](/assets/uploads/2010/10/For_ForEach_ForEachExtensionPerformansTest_0.png "For_ForEach_ForEachExtensionPerformansTest")

Sonuçlardan aşağıdaki tabloyu çıkarttım;
<table>
<tbody>
<tr>
<td style="text-align: right;">**Test Verisi**</td>
<td style="text-align: right;">**For**</td>
<td style="text-align: right;">**ForEach**</td>
<td style="text-align: right;">**ForEach Extension**</td>
</tr>
<tr>
<td style="text-align: right;">*1.000*</td>
<td style="text-align: right;">71,1</td>
<td style="text-align: right;">121,5</td>
<td style="text-align: right;">79,7</td>
</tr>
<tr>
<td style="text-align: right;">*5.000*</td>
<td style="text-align: right;">34,3</td>
<td style="text-align: right;">92,2</td>
<td style="text-align: right;">55,6</td>
</tr>
<tr>
<td style="text-align: right;">*10.000*</td>
<td style="text-align: right;">70,0</td>
<td style="text-align: right;">185,1</td>
<td style="text-align: right;">110,4</td>
</tr>
<tr>
<td style="text-align: right;">*50.000*</td>
<td style="text-align: right;">349,3</td>
<td style="text-align: right;">918,4</td>
<td style="text-align: right;">568,3</td>
</tr>
<tr>
<td style="text-align: right;">*100.000*</td>
<td style="text-align: right;">715,2</td>
<td style="text-align: right;">1.902,7</td>
<td style="text-align: right;">1.159,0</td>
</tr>
<tr>
<td style="text-align: right;">*500.000*</td>
<td style="text-align: right;">3.583,3</td>
<td style="text-align: right;">9.379,3</td>
<td style="text-align: right;">5.600,0</td>
</tr>
<tr>
<td style="text-align: right;">*1.000.000*</td>
<td style="text-align: right;">7.260,4</td>
<td style="text-align: right;">18.877,9</td>
<td style="text-align: right;">11.242,8</td>
</tr>
<tr>
<td style="text-align: right;">*5.000.000*</td>
<td style="text-align: right;">37.927,2</td>
<td style="text-align: right;">96.096,9</td>
<td style="text-align: right;">57.845,4</td>
</tr>
<tr>
<td style="text-align: right;">*10.000.000*</td>
<td style="text-align: right;">74.553,5</td>
<td style="text-align: right;">192.621,6</td>
<td style="text-align: right;">115.559,6</td>
</tr>
<tr>
<td style="text-align: right;">*50.000.000*</td>
<td style="text-align: right;">371.698,1</td>
<td style="text-align: right;">956.394,4</td>
<td style="text-align: right;">572.776,7</td>
</tr>
</tbody>
</table>

İlk olarak **50.000 elemana** kadar olan listeler için **karşılaştırma** yapalım;

![For - ForEach - ForEach extension Performans Karşılaştırması / 50.000 elemana kadar inceleme](/assets/uploads/2010/10/For_ForEach_ForEachExtensionPerformansTest_1.png "For_ForEach_ForEachExtensionPerformansTest")

Son olarak **50.000.000 elemana** kadar olan listeler için **karşılaştırma** yapalım;

![For - ForEach - ForEach extension Performans Karşılaştırması / 50.000.000 elemana kadar inceleme](/assets/uploads/2010/10/For_ForEach_ForEachExtensionPerformansTest_2.png "For_ForEach_ForEachExtensionPerformansTest")

