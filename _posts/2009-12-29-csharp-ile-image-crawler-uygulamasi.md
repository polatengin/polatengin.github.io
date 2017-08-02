---
layout: post
title: "C# ile Image Crawler Uygulaması"
date: 2009-12-29 15:38
author: engin.polat
comments: true
category: [C#]
tags: [code, crawler, csharp, image, source, web]
---
Daha önce yazdığımız <a title="enginpolat.com: WebCrawler" href="/csharp-ile-webcrawler-uygulamasi/" target="_self">C# ile WebCrawler Uygulaması</a>na ek olarak, bu sefer, sayfadaki resimleri bulup, ekranda gösteren bir uygulama yazacağız.

Uygulamamız, bir web sayfasına bağlacak, sayfadaki **img** taglarının **src** değerlerini bir diziye dolduracak ve bu diziyi ekranda gösterecek. Dizi'den bir satır seçildiğinde, ilgili resmi ekrana getirecek.

Hemen aşağıdaki ekran görüntüsünü oluşturarak uygulamayı yazmaya başlayalım;

<a href="/assets/uploads/2009/12/ImageCrawler_1.png">![](/assets/uploads/2009/12/ImageCrawler_1.png "ImageCrawler_1")</a>

Bir web sayfasındaki resimleri bulmak için, *List&lt;string&gt;* tipinde değer döndüren *ResimleriBul()* isimli fonksiyon yazacağız. Bu fonksiyon *adres* bilgisini parametre olarak alacak, sayfadaki her **img** tagının **src** özelliğini bir listeye ekleyecek. Geriye bu liste'yi döndürecek.



private List&lt;string&gt; ResimleriBul(string adres)
{
    List&lt;string&gt; arrReturn = new List&lt;string&gt;();

    WebRequest wr = WebRequest.Create(txtAdres.Text);
    WebResponse ws = wr.GetResponse();
    StreamReader sr = new StreamReader(ws.GetResponseStream(), Encoding.UTF8);
    string response = sr.ReadToEnd();
    sr.Close();
    ws.Close();

    string imageHtmlCode = "&lt;img";
    string imageSrcCode = "src=\"";

    int index = response.IndexOf(imageHtmlCode);
    while (index != -1)
    {
        response = response.Substring(index);

        int tagSonu = response.IndexOf('&gt;');
        int baslangic = response.IndexOf(imageSrcCode) + imageSrcCode.Length;
        int bitis = response.IndexOf('"', baslangic + 1);

        if (bitis &gt; baslangic &amp;&amp; baslangic &lt; tagSonu)
            arrReturn.Add(response.Substring(baslangic, bitis - baslangic));

        if (imageHtmlCode.Length &lt; response.Length)
            index = response.IndexOf(imageHtmlCode, imageHtmlCode.Length);
        else
            index = -1;
    }

    return arrReturn;
}</pre>

*ResimleriBul* butonunun *Click* olayında, *ResimleriBul()* fonksiyonunun döndürdüğü her öğe, **ListBox** kontrolüne dolduracak.

<pre class="brush:csharp">private void btnResimleriBul_Click(object sender, EventArgs e)
{
    lbResimListe.Items.Clear();

    foreach (string image in ResimleriBul(txtAdres.Text))
        lbResimListe.Items.Add(image);
}</pre>

Son olarak, ListBox'ın seçili elemanı her değiştiğinde, PictureBox'ta seçili resim gösterilecek.

<pre class="brush:csharp">private void lbResimListe_SelectedIndexChanged(object sender, EventArgs e)
{
    pbResim.Load(lbResimListe.SelectedItem.ToString());
}


<a href="/assets/uploads/2009/12/ImageCrawler_2.png">![](/assets/uploads/2009/12/ImageCrawler_2.png "ImageCrawler_2")</a>

Uygulamanın kaynak kodlarını <a title="enginpolat.com: Image Crawler" href="/assets/uploads/2009/12/ImageCrawler.rar" target="_blank">buradan</a> indirebilirsiniz.

