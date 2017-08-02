---
layout: post
title: "Kelimenin son harfi ile başlayan kelime oyunu"
date: 2010-01-05 17:45
author: engin.polat
comments: true
category: [C#]
tags: [code, csharp, dizi, extensionmethod, game, generics, linq, list, oyun, regex, source]
---
Eminim hepimiz, kendi aramızda, "**Kelimenin Son Harfi ile Başlayan Kelime Oyunu**"nu oynamışızdır.

Oyunun kuralları basittir, iki "**oyuncu**" karşılıklı oturur, oyunculardan biri, bir kelime söyleyerek oyunu başlatır. Sonra oyuncular sırayla, diğerinin söylediği kelimenin son harfi ile başlayan başka bir kelime söylemek zorundadır. Söyleyecek kelime bulamayan oyuncu "oyunu" kaybeder.

Gelin bu basit oyunu **C#** ile yazalım. Hemen ekran görüntüsü vererek başlıyorum;

<a href="/assets/uploads/2010/01/KSHBKO_1.png">![](/assets/uploads/2010/01/KSHBKO_1.png "KSHBKO_1")</a>

Oyunu, bir Oyuncu, bir Bilgisayar Oyuncusuna karşı oynayacak. İhtiyacımız olan ilk şey, Bilgisayar Oyuncusu'nun içinden kelime seçeceği **sözlük**. Sözlük oluşturmak için daha önce yazdığım <a title="enginpolat.com: Web Sayfasından Sözlük Oluşturma" href="/csharp-ile-web-sayfasindan-sozluk-olusturma/" target="_self">Web Sayfasından Sözlük Oluşturma</a> ve <a title="enginpolat.com: Shuffle List" href="/csharp-ile-dizi-karistirma/" target="_self">Dizi Karıştırma </a>makalelerini birleştirip kullanacağız.

*btnYeniOyun* butonunun *Click* olayında, *txtAdres* kontrolüne yazılmış olan web sayfasındaki kelimeler bir listeye dolduruluyor, ayıklanıyor, karıştırılıyor ve *lbKullanilabilecekKelimeler* **ListBox** kontrolünde gösteriliyor.


public static class ExtensionManager
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
}</pre>
<pre class="brush:csharp">private void btnYeniOyun_Click(object sender, EventArgs e)
{
    lbKullanilabilecekKelimeler.Items.Clear();
    lbKullanilabilecekKelimeler.BeginUpdate();

    WebRequest wr = WebRequest.Create(txtAdres.Text);
    WebResponse ws = wr.GetResponse();
    StreamReader sr = new StreamReader(ws.GetResponseStream(), Encoding.UTF8);
    string response = sr.ReadToEnd();
    sr.Close();
    ws.Close();

    List&lt;string&gt; arrKelime = new List&lt;string&gt;();

    Regex r = new Regex("&lt;(.|\n)*?&gt;");
    foreach (string satir in r.Replace(response, "").Split(" \t\r\n({[]}),.;:*-+/?&lt;&gt;&amp;%'#@=\"\\_".ToCharArray(), StringSplitOptions.RemoveEmptyEntries))
        if (satir.Trim().Length &gt; 5 &amp;&amp; !arrKelime.Contains(satir.Trim()))
            arrKelime.Add(satir.Trim());

    lbKullanilabilecekKelimeler.Items.AddRange(arrKelime.ListeKaristir().ToArray());

    lbKullanilabilecekKelimeler.EndUpdate();

    txtYeniKelime.Clear();
    txtOyunTarihce.Clear();
}</pre>
<a href="/assets/uploads/2010/01/KSHBKO_2.png">![](/assets/uploads/2010/01/KSHBKO_2.png "KSHBKO_2")</a>

Oyun, birinci oyuncunun *txtYeniKelime* kontrolüne yazdığı kelime ile başlıyor.
<pre class="brush:csharp">string OncekiKelimeninSonHarfi = string.Empty;
private void btnYeniKelime_Click(object sender, EventArgs e)
{
    if (txtYeniKelime.Text != "" &amp;&amp; txtYeniKelime.Text.StartsWith(OncekiKelimeninSonHarfi))
    {
        string Kelime = txtYeniKelime.Text.Trim();
        txtOyunTarihce.Text = string.Format("(O): {0}{1}{2}", Kelime, Environment.NewLine, txtOyunTarihce.Text);
        txtYeniKelime.Clear();
        KelimeSec(Kelime);
        txtYeniKelime.Focus();
    }
}</pre>
Bilgisayar Oyuncusu Sözlük'ten kelimenin son harfi ile başlayan kelimelerden bir tanesini rastgele olarak seçiyor.

Kullandığı her kelimeyi *lbKullanilabilecekKelimeler* **ListBox** kontrolünden çıkartıp, *lbKullanilmisKelimeler* **ListBox** listesine ekliyor.
<pre class="brush:csharp">private void KelimeSec(string OncekiKelime)
{
    Random r = new Random();

    var Kelimeler = (from k in lbKullanilabilecekKelimeler.Items.OfType&lt;string&gt;() where k.StartsWith(OncekiKelime.Substring(OncekiKelime.Length - 1, 1)) select k).ToList&lt;string&gt;();

    if (Kelimeler.Count == 0)
    {
        MessageBox.Show(lbKullanilmisKelimeler.Items.Count + ". Kelimede Bilgisayar Oyuncusu oynayacak Kelime bulamadı!.", "Oyun Bitti!", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
        return;
    }

    int Sira = r.Next(0, Kelimeler.Count);
    string Kelime = Kelimeler[Sira];
    OncekiKelimeninSonHarfi = Kelime.Substring(Kelime.Length - 1, 1);

    lbKullanilabilecekKelimeler.Items.Remove(Kelime);
    lbKullanilmisKelimeler.Items.Add(Kelime);

    txtOyunTarihce.Text = string.Format("(B): {0}{1}{2}", Kelime, Environment.NewLine, txtOyunTarihce.Text);
}

<a href="/assets/uploads/2010/01/KSHBKO_3.png">![](/assets/uploads/2010/01/KSHBKO_3.png "KSHBKO_3")</a>

Oyun, Bilgisayar Oyuncusu'nun kelime bulamamasına kadar devam ediyor.

<a href="/assets/uploads/2010/01/KSHBKO_4.png">![](/assets/uploads/2010/01/KSHBKO_4.png "KSHBKO_4")</a>

Oyunun kaynak kodlarını <a title="enginpolat.com: Kelimenin Son Harfi ile Başlayan Kelime Oyunu" href="/assets/uploads/2010/01/KelimeninSonHarfiIleBaslayanKelimeOyunu.rar" target="_blank">buradan</a> indirebilirsiniz.

