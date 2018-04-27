---
layout: post
title: "XNA Oyunu / Çanakkale Geçilmez – 2"
date: 2011-06-27 08:45
author: engin.polat
comments: true
category: [XNA]
tags: [const, contains, content, Content.Load, cos, CreateInstance, draw, graphicsdevice, iskeydown, iskeyup, Keyboard.GetState, keyboardstate, lerp, loadcontent, math, mathhelper, nextdouble, position, random, rectangle, Rotation, sin, SoundEffect, spritebatch, spriteblendmode, spriteeffects, texture2d, unloadcontent, vector2, velocity, XNA, xna game studio]
---
<a href="/kategori/xna/" target="_blank" rel="noopener">XNA ile Oyun Programlama</a> serimize, daha önce başlayıp tamamlamadığımız <a href="/xna-oyunu-canakkale-gecilmez-1" target="_blank" rel="noopener">Çanakkale Geçilmez</a> oyununu tamamlayarak devam ediyoruz.

Bu yazıyı okumadan önce **XNA** konusunda diğer makaleler için <a href="/kategori/xna/" target="_blank" rel="noopener">XNA kategorisine</a> bir göz atmanızı tavsiye ederim.

Düşman gemilerine yaptığımız atış miktarını ve isabet adedini tutacağımız iki değişkeni sınıf seviyesinde tanımlayalım;

int SKOR_ATIS = 0;
int SKOR_PUAN = 0;

Oyuna, *düşman gemileri* ve düşman gemilerine atacağımız *gülleler* eklemek için, sınıf seviyesinde *GameObject* sınıfında diziler oluşturacağız;

<pre class="brush:csharp">public GameObject[] Gemiler;
public GameObject[] Gulleler;</pre>

Ayrıca, düşman gemilerine ve onlara atacağımız güllelere sınırlama getirmek için iki sabiti (**const**) sınıf seviyesinde tanımlıyoruz;

<pre class="brush:csharp">public const int DUSMAN_ADET = 3;
public const int GULLE_ADET = 6;</pre>

Bu sayede, oyunun zorluk derecesini değiştirebilmek için iki alanımız oluyor; aynı anda savaşacağımız **düşman gemisi adedi** ve onlara atabileceğimiz **gülle adedi**. Aynı anda attığımız güllelerden bir tanesi hedefi bulmadan veya ekran dışına çıkmadan yeni gülle atamıyoruz.

Bu oyunda, düşman gemisi adedini 3 olarak, onlara aynı anda atabileceğimiz gülle adedini de 6 olarak belirledik.

**LoadContent()** methodunda bu değişkenlere başlangıç değerlerini atamalıyız;

<pre class="brush:csharp">Gemiler = new GameObject[DUSMAN_ADET];
for (int iLoop = 0; iLoop < DUSMAN_ADET; iLoop++)
{
    Gemiler[iLoop] = new GameObject(Content.Load&lt;Texture2D&gt;("DusmanGemi"));
}

Gulleler = new GameObject[GULLE_ADET];
for (int iLoop = 0; iLoop < GULLE_ADET; iLoop++)
{
    Gulleler[iLoop] = new GameObject(Content.Load&lt;Texture2D&gt;("Gulle"));
}</pre>

**Update()** method'unda *boşluk* tuşuna (*Space*) basılınca gülle atılmasını sağlayacak methodu çağıracak kodu ekliyoruz;

</pre><pre class="brush:csharp">if (pks.IsKeyDown(Keys.Space) && ks.IsKeyUp(Keys.Space))
    GulleAtesle();</pre>

**GulleAtesle()** method'unda 6 gülle'nin herbirine tek tek bakarak, ekranda olmayan var mı kontrol ediyoruz.

Eğer o anda ekranda olmayan bir gülle bulursak (*IsAlive* özelliğinin **false** değer içermesinden) düşman gemisine doğru fırlatıyoruz.

Fırlatma işlemini yaparken güllenin fırlatma anındaki yeri ve fırlatma güzergahına dikkat etmeliyiz.

Güllenin **Position** özelliğine Top'umuzun *X* ve *Y* eksenindeki yerini veriyoruz, böylece, gülle tam olarak top'umuzun ucundan fırlatılacak.

**Velocity** özelliği ile güllenin güzergahını belirliyoruz; Top'umuzun baktığı açının *sinus*'unu ve *kosinus*'unu alarak, *hız sabiti* olan 5 değeri ile çarpıyoruz.

*Not : Top'umuz ekranın altında, gemiler üstünde olduğu için Y eksenindeki hız sabitini -1 ile çarpıp, -5 değerini elde ediyoruz.*

Ayrıca, *SKOR_ATIS* değişkeninin değerini de bir yükseltiyoruz.

<pre class="brush:csharp">private void GulleAtesle()
{
    foreach (GameObject Gulle in Gulleler)
    {
        if (!Gulle.IsAlive)
        {
            SKOR_ATIS++;
            Gulle.IsAlive = true;
            Gulle.Position = new Vector2(Top.Position.X - Gulle.Center.X, Top.Position.Y);
            Gulle.Velocity = new Vector2((float)Math.Sin(Top.Rotation) * 5, (float)Math.Cos(Top.Rotation) * -5);
            break;
        }
    }
}</pre>

Böylece, her *boşluk* (*Space*) tuşuna basıldığında 6 gülleden birisi topumuzun ucundan düşman gemisine doğru gönderilecektir. Eğer o anda ekranda 6 gülle varsa, gülle gönderilmeyecektir.

**Update()** method'unda, düşman gemilerini de yönetiyoruz;

<pre class="brush:csharp">foreach (GameObject Gemi in Gemiler)
{
    if (Gemi.IsAlive)
    {
        Gemi.Position += Gemi.Velocity;

        if (Gemi.Position.X < 0)
            Gemi.IsAlive = false;
    }
    else
    {
        Gemi.IsAlive = true;
        Gemi.Position = new Vector2(PENCERE_GENISLIK, MathHelper.Lerp(0, (float)(PENCERE_YUKSEKLIK * 0.6), (float)Rastgele.NextDouble()));
        Gemi.Velocity = new Vector2(MathHelper.Lerp(-2, -4, (float)Rastgele.NextDouble()), 0);
    }
}</pre>

Tüm düşman gemileri (*DUSMAN_ADET* sabitinden dolayı 3 adet) içerisinde dönen bir *foreach* döngüsü ile ilgili düşman gemisinin o anda hayatta olup/olmadığına bakıyoruz;

Eğer hayatta ise; gemi'nin yerini, gidiş yönünde hızı kadar ilerletiyoruz. Eğer gemi'nin yeni yeri pencere dışında ise, bir sonraki ekran güncellemesinde gemi'yi tekrar kullanabilmek için öldürüyoruz.

Eğer hayatta değilse; Gemi'yi ekrana çıkartabilmek için hayatta durumuna getiriyoruz, rastgele bir yer ve hız veriyoruz.

Rastgele yer belirlerken, pencerenin en üstünden itibaren %60'lık kısmını kullanıyoruz.

Rastgele hız belirlerken, <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.mathhelper" target="_blank" rel="noopener">MathHelper</a> sınıfının <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.mathhelper.lerp" target="_blank" rel="noopener">Lerp()</a> methodundan faydalanıyoruz.

**Lerp()** method'u, 3 parametre alır;



*   Değer 1 *(Kaynak değer)*
*   Değer 2 *(Kaynak değer)*
*   Büyüklük *(0 ile 1 arası değer, Değer 2'nin ağırlığı)*

Büyüklük parametresine *0* değer vermek, Değer 1'i, *1* değer vermek, Değer 2'yi döndürür.

Biz bu örnek'te düşman gemilerinin ekranın sağında belirmesi ve ekranın soluna doğru ilerlemesi için, *-2* ve *-4* arası hız'a sahip olmalarını sağladık.

**Update()** method'unda, ekrandaki gülleleri de yönetiyoruz;

</pre><pre class="brush:csharp">foreach (GameObject Gulle in Gulleler)
{
    if (Gulle.IsAlive)
    {
        Gulle.Position += Gulle.Velocity;
        if (!Pencere.Contains(Gulle.TextureRectangle))
            Gulle.IsAlive = false;

        foreach (GameObject Gemi in Gemiler)
        {
            if (Gemi.TextureRectangle.Contains(Gulle.TextureRectangle))
            {
                SKOR_PUAN++;
                GemiVurulduSes.Play();
                Gemi.IsAlive = false;
                Gulle.IsAlive = false;
                break;
            }
        }
    }
}</pre>

Sadece hayatta olan güllelere teker teker bakıyoruz; (*GULLE_ADET* sabitinden dolayı en fazla 6 adet)

Gülle'nin yerini, hızı ve doğrultusu kadar ilerletiyoruz. Eğer pencere dışına çıktı ise, gülle'yi öldürüyoruz.

Hayatta olan her gülle için, hayatta olan her gemi ile çarpışma testi yapıyoruz. Eğer ilgili gülle gemi'lerden bir tanesi ile çarpışıyorsa, gülle'yi ve gemi'yi öldürüp, *SKOR_PUAN* değişkenini bir yükseltiyoruz.

**Draw()** method'unda, Arkaplan, Top, hayatta olan gemiler ve hayatta olan gülleleri ekrana çizdiriyoruz;

<pre class="brush:csharp">GraphicsDevice.Clear(Color.CornflowerBlue);

spriteBatch.Begin(SpriteBlendMode.AlphaBlend);

spriteBatch.Draw(Arkaplan, Pencere, Color.White);

spriteBatch.Draw(Top.Texture, Top.Position, null, Color.White, Top.Rotation, Top.Center, 1, SpriteEffects.None, 0);

foreach (GameObject Gemi in Gemiler)
{
    if (Gemi.IsAlive)
    {
        spriteBatch.Draw(Gemi.Texture, Gemi.Position, Color.White);
    }
}

foreach (GameObject Gulle in Gulleler)
{
    if (Gulle.IsAlive)
    {
        spriteBatch.Draw(Gulle.Texture, Gulle.Position, Color.White);
    }
}</pre>

Skor tablosunu çizdirebilmek için, sınıf seviyesinde iki yeni değişken eklememiz lazım;

<pre class="brush:csharp">Texture2D Karakterler;
Texture2D Sayilar;</pre>

**LoadContent()** method'unda bu değişkenlere değer atıyoruz;

<pre class="brush:csharp">Karakterler = Content.Load<texture2d>("Karakterler");
Sayilar = Content.Load</texture2d><texture2d>("Sayilar");</texture2d></pre>

*Karakterler* imajı'nın (0, 0) noktasından itibaren (113, 25) büyüklüğündeki alanı arasında kalan kısmı ekrana çizdirmek için, *Draw()* method'una;

<pre class="brush:csharp">spriteBatch.Draw(Karakterler, new Vector2((float)(PENCERE_GENISLIK * 0.05), (float)(PENCERE_YUKSEKLIK * 0.90)), new Rectangle(0, 0, 113, 25), Color.White);</pre>

*Karakterler* imajı'nın (0, 25) noktasından itibaren (113, 25) büyüklüğündeki alanı arasında kalan kısmı ekrana çizdirmek için, *Draw()* method'una;

<pre class="brush:csharp">spriteBatch.Draw(Karakterler, new Vector2((float)(PENCERE_GENISLIK * 0.75), (float)(PENCERE_YUKSEKLIK * 0.90)), new Rectangle(0, 25, 113, 25), Color.White);</pre>

Atış adedimizi ve Skor adedimizi ekrana çizdirmek için gerekli method çağrılarını (**DrawAtis()**, **DrawSkor()**) **Draw()** method'unda yapıyoruz.

<pre class="brush:csharp">private void DrawAtis()
{
    string Atis = SKOR_ATIS.ToString();
    for (int iLoop = 0; iLoop < Atis.Length; iLoop++)
    {
        int Rakam = Convert.ToInt32(Atis.Substring(iLoop, 1));
        spriteBatch.Draw(Sayilar, new Vector2((float)(PENCERE_GENISLIK * 0.05) + (23 * iLoop) + 120, (float)(PENCERE_YUKSEKLIK * 0.90)), new Rectangle(Rakam * 23, 0, 23, 25), Color.White);
    }
}

private void DrawSkor()
{
    string Atis = SKOR_PUAN.ToString();
    for (int iLoop = 0; iLoop < Atis.Length; iLoop++)
    {
        int Rakam = Convert.ToInt32(Atis.Substring(iLoop, 1));
        spriteBatch.Draw(Sayilar, new Vector2((float)(PENCERE_GENISLIK * 0.75) + (23 * iLoop) + 120, (float)(PENCERE_YUKSEKLIK * 0.90)), new Rectangle(Rakam * 23, 0, 23, 25), Color.White);
    }
}</pre>

Böylece, oyunumuzun kodlamasını bitirmiş olduk.

![XNA ile Oyun Programlama - Çanakkale Geçilmez Oyunu](/assets/uploads/2011/06/CanakkaleGecilmez.jpg "XNA ile Oyun Programlama - Çanakkale Geçilmez Oyunu")

Oyunu tüm kodlarını <a href="/assets/uploads/2011/06/CanakkaleGecilmez.rar" target="_blank" rel="noopener">buradan</a> indirebilirsiniz.


