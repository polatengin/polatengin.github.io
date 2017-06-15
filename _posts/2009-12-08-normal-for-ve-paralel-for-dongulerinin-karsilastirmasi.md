---
layout: post
title: "Normal For ve Paralel For Döngülerinin Karşılaştırması"
date: 2009-12-08 10:38
author: engin.polat
comments: true
category: [C#]
tags: [code, csharp, for, parallel, source, tpl]
---
Yazdığımız uygulamaların olmazsa-olmaz'larından birisi de, for döngüleridir.

Ne kadar basit'te olsa, ne kadar karmaşık'ta olsa, mutlaka uygulamalarımızda for döngülerine ihtiyaç duyarız ve sıklıkla kullanırız.

Bu makaleyi okumaya devam etmeden önce, .Net Framework 4.0 ile birlikte gelecek olan Task Parallel Library hakkında yazdığım şu yazıyı (<a title="enginpolat.com: TPL (Task Parallel Library) – Task Class" href="http://www.enginpolat.com/tpl-task-parallel-library-task-class/" target="_self">TPL (Task Parallel Library) – Task Class</a>) okumanızı tavsiye ederim.

Task Parallel Library ile gelen <a title="MSDN: Parallel Class Members" href="http://msdn.microsoft.com/en-us/library/system.threading.tasks.parallel_members(VS.100).aspx" target="_blank">Parallel</a> sınıfının <a title="MSDN: Parallel.For Method" href="http://msdn.microsoft.com/en-us/library/system.threading.tasks.parallel.for(VS.100).aspx" target="_blank">For</a> methodunu kullanarak, Multi-Core destekli for döngüleri oluşturabiliriz.

**Multi-Core** destekli olması, **Multi-CPU** (birden çok CPU içeren) bilgisayarlarda, döngünün CPU'lara dağıtılabilmesini sağlıyor.

**Parallel Library**'den önce for döngüsü;


//10 adımlı döngü (0 dahil, 10 hariç)
for (int iLoop = 0; iLoop &lt; 100; iLoop++)
{
    // Yapılacak İş
}</pre>
**Parallel Library** ile for döngüsü;
<pre class="brush:csharp">//10 adımlı döngü (0 dahil, 10 hariç)
Parallel.For(0, 10, iLoop =&gt; {
    // Yapılacak İş
});</pre>
Parallel.For metodunu kullarak örnek bir proje hazırladım, projenin kaynak kodlarına <a title="enginpolat.com: NormalFor_ParallelFor_Karsilastirma.rar" href="/assets/uploads/2009/12/NormalFor_ParallelFor_Karsilastirma.rar" target="_blank">buradan</a> ulaşabilirsiniz.

![NormalFor_ParallelFor_1](/assets/uploads/2009/12/NormalFor_ParallelFor_1.png "NormalFor_ParallelFor_1")

Uzun tek bir döngü yazmak yerine, içiçe iki döngü yazdım, böylece, CPU ve İşletim Sistemi'nin çok adımlı döngülerde yaptığı iyileştirmeleri bir miktar azaltmayı ve daha doğru bir sonuç elde etmeyi amaçladım.

Döngülerden bir tanesini gene de uzun tuttum (100.000.000 - Yüz Milyon Adım), böylece, eğer Framework'ün kendisi döngülerde iyileştirme yapıyorsa, bunları yakalamayı hedefledim.

Diğer döngüyü ise nispeten daha kısa (500 - Beş Yüz) tuttum.

![NormalFor_ParallelFor_2](/assets/uploads/2009/12/NormalFor_ParallelFor_2.png "NormalFor_ParallelFor_2")

Böylece toplamda 50.000.000 (Elli Milyar) adımlı döngü oluşmuş oluyor.

Gelelim, kodlara;
<pre class="brush:csharp">private void btnNormalDongu_Click(object sender, EventArgs e)
{
    int Sayac = 0;
    Stopwatch sw = Stopwatch.StartNew();
    for (int iLoop = 0; iLoop &lt; (int)txtTekrarAdedi.Value; iLoop++)
    {
        for (int yLoop = 0; yLoop &lt; (int)txtDonguAdedi.Value; yLoop++)
        {
            Sayac++;
        }
    }
    sw.Stop();

    lblNormalDonguSonuc.Text = string.Format("{0:0,0} ms.", sw.ElapsedMilliseconds);
}</pre>
ve
<pre class="brush:csharp">private void btnParalelDongu_Click(object sender, EventArgs e)
{
    int Sayac = 0;
    Stopwatch sw = Stopwatch.StartNew();
    Parallel.For(0, (int)txtTekrarAdedi.Value, i =&gt; {
        Parallel.For(0, (int)txtDonguAdedi.Value, y =&gt; {
            Sayac++;
        });
    });
    sw.Stop();

    lblParalelDonguSonuc.Text = string.Format("{0:0,0} ms.", sw.ElapsedMilliseconds);
}

Teker teker butonlara bastığımızda, for döngüleri çalışacak ve sonuçları Label'larda göreceğiz.

Uygulamayı kendi bilgisayarımda çalıştırdığımda aldığım sonuçlar;

![NormalFor_ParallelFor_3](/assets/uploads/2009/12/NormalFor_ParallelFor_3.png "NormalFor_ParallelFor_3")

*Normal for döngüsü:* **888.700 ms.** (yaklaşık 14 dakika 48 saniye)

*Paralel for döngüsü:* **219.326 ms.** (yaklaşık 3 dakika 39 saniye)

*Aradaki fark:* **75%**

Uygulamayı çalıştırdığım bilgisayarın özellikleri;

![NormalFor_ParallelFor_4](/assets/uploads/2009/12/NormalFor_ParallelFor_4.png "NormalFor_ParallelFor_4")

