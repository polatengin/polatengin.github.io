---
layout: post
title: "C# ile Dizi Karıştırma"
date: 2009-12-29 13:41
author: engin.polat
comments: true
category: [C#]
tags: [array, code, csharp, extensionmethod, list, shuffle, source, string]
---
Bu yazımda, bir dizi'nin C# ile nasıl karıştırılacağı (shuffle edileceği) ile ilgili bir örnek yapacağım.

Aşağıdaki formu oluşturarak, hemen programlamaya başlayalım.

<a href="/assets/uploads/2009/12/ShuffleList_1.png">![](/assets/uploads/2009/12/ShuffleList_1.png "ShuffleList_1")</a>

İlk ihtiyacımız olan şey, tabiiki bir **Liste**. Rastgele kelimelerden oluşan karışık bir liste oluşturmak için, aşağıdaki *RastgeleKelimeUret* fonksiyonunu yazalım.



const string Harfler = "1234567890abcdefghijklmnopqrstuvwxyz";
Random r = new Random();

public string RastgeleKelimeUret()
{
    char[] arrReturn = new char[15];

    Parallel.For(0, 15, iLoop =&gt; {
        arrReturn[iLoop] = Harfler[r.Next(0, Harfler.Length - 1)];
    });

    return new string(arrReturn);
}</pre>

Form'umuzun *Load* olayında, ***Parallel For*** yeteneklerinden faydalanarak, 15 harften oluşan 100 adet rastgele kelime üretiyoruz ve *OrjinalListe* isimli **Generic Collection**'a dolduruyoruz.

<pre class="brush:csharp">private void MainForm_Load(object sender, EventArgs e)
{
    Parallel.For(0, 100, iLoop =&gt; {
        OrjinalListe.Add(RastgeleKelimeUret());
    });

    lbOrjinalListe.BeginUpdate();

    for (int iLoop = 0; iLoop &lt; OrjinalListe.Count; iLoop++)
        lbOrjinalListe.Items.Add(OrjinalListe[iLoop]);

    lbOrjinalListe.EndUpdate();
}</pre>

*Karıştır* butonunun *Click* olayında ise; *OrjinalListe* collection'ının *ListeKaristir()* fonksiyonunu kullanıyoruz.

<pre class="brush:csharp">private void btnKaristir_Click(object sender, EventArgs e)
{
    lbKaristirilmisListe.BeginUpdate();

    lbKaristirilmisListe.Items.Clear();

    List&lt;string&gt; KaristirilmisListe = OrjinalListe.ListeKaristir();

    for (int iLoop = 0; iLoop &lt; KaristirilmisListe.Count; iLoop++)
        lbKaristirilmisListe.Items.Add(KaristirilmisListe[iLoop]);

    lbKaristirilmisListe.EndUpdate();
}</pre>

**Generic dizilerde** *ListeKaristir()* isminde bir fonksiyon bulunmaz. Nereden geliyor bu fonksiyon?

<pre class="brush:csharp">public static class ExtensionManager
{
    private static Random r = new Random();

    public static List&lt;T&gt; ListeKaristir&lt;T&gt;(this List&lt;T&gt; Liste)
    {
        List&lt;T&gt; tmpList = Liste.GetRange(0, Liste.Count);
        List&lt;T&gt; arrReturn = new List&lt;T&gt;();

        while (tmpList.Count &gt; 0)
        {
            int rastgele = r.Next(0, tmpList.Count);
            arrReturn.Add(tmpList[rastgele]);
            tmpList.RemoveAt(rastgele);
        }

        return arrReturn;
    }
}


*ExtensionManager* isimli **static class**'ın içerisine yazdığım *ListeKaristir&lt;T&gt;* fonksiyonundan geliyor. İlk parametreye eklediğim *this* anahtar kelimesine dikkat edelim. Bu sayede, *List&lt;T&gt;* yapısında olan tüm nesnelerde *ListeKaristir()* fonksiyonunun çalışmasını sağlamış olduk.

<a href="/assets/uploads/2009/12/ShuffleList_2.png">![](/assets/uploads/2009/12/ShuffleList_2.png "ShuffleList_2")</a>

Uygulamanın kaynak kodlarını <a title="enginpolat.com: Shuffle List" href="/assets/uploads/2009/12/ShuffleList.rar" target="_blank" rel="noopener">buradan</a> indirebilirsiniz.

