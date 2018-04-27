---
layout: post
title: "Twitter Arama - Twitter Search"
date: 2009-12-10 08:45
author: engin.polat
comments: true
category: [C#]
tags: [api, arama, arraylist, code, csharp, hashtable, json, search, source, twitter]
---
Bu yazımda, <a title="Twitter" href="http://www.twitter.com" target="_blank" rel="noopener">Twitter</a>'da arama yapan bir uygulama yazacağım. Siz de yazıyı baştan sona takip ederek, kendi twitter arama uygulamanızı yazabilirsiniz.

Hemen ekran tasarımımızı yapmakla işe başlayalım;

![TwitterSearch_1](/assets/uploads/2009/12/TwitterSearch_1.png "TwitterSearch_1")

Sayfadaki elemanlar;


*   txtSonucAdet
*   txtSayfa
*   btnGeri
*   btnIleri
*   txtArama
*   btnArama
*   flowLayoutPanel1
Öncelikle <a title="Twitter: Search API" href="http://apiwiki.twitter.com/Twitter-API-Documentation" target="_blank" rel="noopener">Twitter Search API</a>'sini inceleyelim;

<a title="Twitter: Search API Search Method" href="http://apiwiki.twitter.com/Twitter-Search-API-Method%3A-search" target="_blank" rel="noopener">Search fonksiyonu</a> geriye <a title="JSON" href="http://www.json.org/" target="_blank" rel="noopener">JSON</a> formatında bilgi döndürüyor. Uygulamalarınızda JSON verilerini kullanabilmek için, <a title="JSON Class" href="http://techblog.procurios.nl/k/618/news/view/14605/14863/How-do-I-write-my-own-parser-for-JSON.html" target="_blank" rel="noopener">şu sayfadan</a> bulabileceğiniz JSON parser class'ını kullanabilirsiniz.

Şimdi, butonların (btnArama, btnGeri, btnIleri) Click olayını yazalım;


private void btnArama_Click(object sender, EventArgs e)
{
    txtSayfa.Text = "1";
    AramaYap();
}</pre>
<pre class="brush:csharp">private void btnGeri_Click(object sender, EventArgs e)
{
    int Sayfa = Convert.ToInt32(txtSayfa.Text) - 1;
    txtSayfa.Text = Sayfa &lt; 1 ? "1" : Sayfa.ToString();
    AramaYap();
}</pre>
<pre class="brush:csharp">private void btnIleri_Click(object sender, EventArgs e)
{
    txtSayfa.Text = (Convert.ToInt32(txtSayfa.Text) + 1).ToString();
    AramaYap();
}</pre>
Butonların **Click** olaylarının kalbinde *AramaYap()* methodu yatıyor. Hemen yazalım;
<pre class="brush:csharp">private void AramaYap()
{
    flowLayoutPanel1.Controls.Clear();

    WebRequest wr = WebRequest.Create(string.Format("http://search.twitter.com/search.json?q={0}&amp;rpp={1}&amp;page={2}", txtArama.Text, txtSonucAdet.Value, txtSayfa.Text));
    Stream s = wr.GetResponse().GetResponseStream();
    StreamReader sr = new StreamReader(s);
    string Sonuc = sr.ReadToEnd();

    Hashtable hs = (Hashtable)JSON.JsonDecode(Sonuc);

    foreach (Hashtable oItem in (ArrayList)hs["results"])
        flowLayoutPanel1.Controls.Add(CreateTwitItem(oItem));
    }</pre>
*AramaYap()* method'unda ilk iş, flowLayoutPanel'i temizliyoruz.

Daha sonra, **Twitter Search API**'den öğrendiğimiz gibi, http://search.twitter.com/search.json adresine uygun parametreler ile sorgu atıyoruz.

Gelen bilgi **JSON** formatında olduğu için, JSON parser class'ımızı kullanıyoruz (**JSON.JsonDecode**) ve sonuç bilgisini <a title="MSDN: Hashtable" href="http://msdn.microsoft.com/en-us/library/system.collections.hashtable.aspx" target="_blank" rel="noopener">Hashtable</a> formatına çeviriyoruz.

**Hashtable**'ın *results* öğesi <a title="MSDN: ArrayList" href="http://msdn.microsoft.com/en-us/library/system.collections.arraylist.aspx" target="_blank" rel="noopener">ArrayList</a> formatındadır ve arama sonucunun herbir satırını ifade etmektedir. Bu yüzden basit bir <a title="MSDN: foreach" href="http://msdn.microsoft.com/en-us/library/ttw7t8t6.aspx" target="_blank" rel="noopener">foreach</a> döngüsü ile flowLayoutPanel'e ekleme yapıyoruz.

flowLayoutPanel'e ekleyeceğimiz her nesne *CreateTwitItem* fonksiyonunda oluşturuluyor;
<pre class="brush:csharp">private Panel CreateTwitItem(Hashtable TwitItem)
{
    Panel p = new Panel();

    string from_user = TwitItem["from_user"] != null ? TwitItem["from_user"].ToString() : "";
    string to_user = TwitItem["to_user"] != null ? TwitItem["to_user"].ToString() : "";
    string text = TwitItem["text"] != null ? TwitItem["text"].ToString() : "";
    string profile_image_url = TwitItem["profile_image_url"] != null ? TwitItem["profile_image_url"].ToString() : "";
    string tweet_id = TwitItem["id"] != null ? TwitItem["id"].ToString() : "";
    DateTime created_at = TwitItem["created_at"] != null ? DateTime.Parse(TwitItem["created_at"].ToString()) : DateTime.Now;
    string twitter_url = string.Format("http://twitter.com/{0}/statuses/{1}", from_user, tweet_id);

    p.Size = new Size(flowLayoutPanel1.Width - 23, 60);
    p.BorderStyle = BorderStyle.FixedSingle;

    PictureBox pb = new PictureBox();
    pb.Dock = DockStyle.Left;
    pb.Size = new Size(50, 50);
    pb.BorderStyle = BorderStyle.FixedSingle;
    pb.Load(profile_image_url);

    Label l1 = new Label();
    l1.AutoSize = false;
    l1.Location = new Point(pb.Width, 2);
    l1.Size = new Size(300, 15);
    l1.Text = string.Format("@{0} -&gt; @{1} ({2} {3})", from_user, to_user, created_at.ToShortDateString(), created_at.ToShortTimeString());

    Label l2 = new Label();
    l2.AutoSize = false;
    l2.Location = new Point(pb.Width, 19);
    l2.Size = new Size(flowLayoutPanel1.Width - pb.Width - 20, 38);
    l2.Text = text;

    LinkLabel l3 = new LinkLabel();
    l3.Text = "Sayfaya Git";
    l3.Location = new Point(flowLayoutPanel1.Width - (l3.Width - 10), 2);
    l3.Click += delegate { Process.Start(twitter_url); };

    p.Controls.Add(pb);
    p.Controls.Add(l1);
    p.Controls.Add(l2);
    p.Controls.Add(l3);

    p.MouseEnter += delegate { p.BackColor = Color.LightYellow; };
    pb.MouseEnter += delegate { p.BackColor = Color.LightYellow; };
    l1.MouseEnter += delegate { p.BackColor = Color.LightYellow; };
    l2.MouseEnter += delegate { p.BackColor = Color.LightYellow; };
    p.MouseLeave += delegate { p.BackColor = SystemColors.Control; };
    l2.MouseLeave += delegate { p.BackColor = SystemColors.Control; };

    return p;
}

*CreateTwitItem()* fonksiyonunda bir **Panel** nesnesi oluşturup, içerisine bir picturebox, iki label, bir linklabel ekliyoruz ve geriye Panel nesnesini döndürüyoruz. Böylece foreach'in her adımında flowLayoutPanel'e yeni Panel nesnesi ekleniyor.

Uygulamamızı çalıştırıyoruz ve işte örnek ekran görüntüsü;

![TwitterSearch_2](/assets/uploads/2009/12/TwitterSearch_2.png "TwitterSearch_2")

İsterseniz uygulamanın kodlarını <a title="enginpolat.com: TwitterSearch.rar" href="/assets/uploads/2009/12/TwitterSearch.rar" target="_blank" rel="noopener">buradan</a> indirebilirsiniz.

