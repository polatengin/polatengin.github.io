---
layout: post
title: "XNA ile ekranda UzayGemisi yönetmek"
date: 2010-03-06 13:00
author: engin.polat
comments: true
category: [XNA]
tags: [const, draw, isfullscreen, loadcontent, PreferredBackBufferHeight, PreferredBackBufferWidth, readonly, rectangle, texture2d, update, Window.Title, XNA]
---
Bu yazımı okumadan önce **XNA** konusundaki <a title="enginpolat.com : XNA" href="/kategori/xna/" target="_self">diğer makalelerimi</a> okumanızı öneririm.

Öncelikle ihtiyacınız olacak iki görseli buradan indirebilirsiniz;

<a href="/assets/uploads/2010/03/Uzay.jpg">![XNA - Oyun Programlama - Uzay Arkaplanı](/assets/uploads/2010/03/Uzay-150x150.jpg "Uzay")</a> <a href="/assets/uploads/2010/03/UzayGemisi.png">![XNA - Oyun Programlama - Uzay Gemisi](/assets/uploads/2010/03/UzayGemisi.png "UzayGemisi")</a>

Yapmak istediğimiz;


*   **800 x 600** pencere içerisinde arkaplanda **Uzay.jpg** görselini göstermek
*   Pencerenin ortasına **UzayGemisi.png** dosyasını konumlandırmak
*   Klavyenin tuşlarına görevler atayarak, **UzayGemisi**'ni **Uzay** içerisinde yönetmek
Hemen başlayalım, ilk olarak yeni bir **XNA projesi** oluşturalım. *Game1.cs* dosyasının adını *GameLoop.cs* olarak değiştirelim.

**Uzay.jpg** ve **UzayGemisi.png** dosyalarını *Content* içerisine sürükleyip bırakalım. *GameLoop.cs* dosyasını açarak kod yazmaya başlayalım;

**Sabit**lerimizi *class* seviyesinde **const** ve **readonly** field'larda tanımlayalım;


private const int PENCERE_GENISLIK = 800;
private const int PENCERE_YUKSEKLIK = 600;
private const string PENCERE_BASLIK = "XNA - Uzay'da UzayGemisi Yönetelim";
private const bool TAM_EKRAN = false;
private readonly Color ARKAPLAN_RENK = Color.Black;</pre>
*GameLoop* **class**'ının **constructor**'ında bu sabitleri kullanalım;
<pre class="brush:csharp">graphics.PreferredBackBufferWidth = PENCERE_GENISLIK;
graphics.PreferredBackBufferHeight = PENCERE_YUKSEKLIK;
graphics.IsFullScreen = TAM_EKRAN;
this.Window.Title = PENCERE_BASLIK;</pre>
**Uzay** görselimizi **800 x 600** boyutlarındaki oyun penceremize sığdırmak için **class** seviyesinde *Rectangle* tipinde bir değişken tanımlayalım, Uzay ve UzayGemisi görsellerimiz için de birer tane *Texture2D* tipinde değişken tanımlayalım;
<pre class="brush:csharp">Rectangle Pencere;
Texture2D Uzay;
Texture2D UzayGemisi;</pre>
*LoadContent()* method'unda bu değişkenlerin değerlerini atayalım;
<pre class="brush:csharp">Pencere = new Rectangle(0, 0, PENCERE_GENISLIK, PENCERE_YUKSEKLIK);
Uzay = Content.Load&lt;Texture2D&gt;("Uzay");
UzayGemisi = Content.Load&lt;Texture2D&gt;("UzayGemisi");</pre>
Artık **Uzay**ımızı ve **UzayGemi**mizi **oyun penceresine** çizebiliriz. Ama madem uzay gemisini **klavye tuşları** ile yönetmek istiyoruz, o zaman uzay gemisinin kendi çevresinde **dönebilmesini** de sağlamamız gerekir.

Eğer bunu yapmazsak, *Yukarı* tuşu ile yukarı giden uzay gemisi, *Aşağı* tuşu ile aşağı gelirken yönünü **düzeltmez**, geri geri geliyormuş gibi gözükür. Hatta yanlara ve çağrazlara giderken iyice **anlamsız görünmeye** başlar.

Öncelikle uzay gemisinin o anda oyun penceresinin neresinde olduğunu tutacağımız *Vector2* sınıfında bir değişkene **class** seviyesinde ihtiyacımız var, ayrıca uzay gemisinin gideceği yöne göre yönelmesi için, iki değişkene daha ihtiyacımız olacak;
<pre class="brush:csharp">Vector2 Konum = Vector2.Zero;
Vector2 Merkez;
float Yonelme = 0;</pre>
Uzay gemisinin **doğru** bir yönelme yapabilmesi için, **ağırlık merkezini** doğru vermemiz gerekiyor, *LoadContent()* methoduna aşağıdaki kodu ekleyelim;
<pre class="brush:csharp">Merkez = new Vector2(UzayGemisi.Width / 2, UzayGemisi.Height / 2);</pre>
Önce *Draw()* methodumuzu yazalım;
<pre class="brush:csharp">GraphicsDevice.Clear(ARKAPLAN_RENK);
spriteBatch.Begin(SpriteBlendMode.AlphaBlend);

spriteBatch.Draw(Uzay, Pencere, Color.White);
spriteBatch.Draw(UzayGemisi, Konum, null, Color.White, Yonelme, Merkez, 1, SpriteEffects.None, 0);

spriteBatch.End();
base.Draw(gameTime);</pre>
Son olarak *Update()* methodumuzu yazalım;

Öncelikle klavyenin o andaki durumunu tutacağımız değişkenimizi tanımlıyoruz;
<pre class="brush:csharp">KeyboardState ks = Keyboard.GetState();</pre>
Eğer *Escape* tuşuna basılıyorsa, oyunda çıkıyoruz;
<pre class="brush:csharp">if (ks.IsKeyDown(Keys.Escape))
    this.Exit();</pre>
Eğer hem *Yukarı*, hem de *Sağa* tuşlarına basılıyorsa, uzay gemisinin *X* ve *Y* koordinatlarında güncellemeler yapıp, yönelmesini 45 derecenin **radian** karşılığına eşitliyoruz;
<pre class="brush:csharp">if (ks.IsKeyDown(Keys.Up) &amp;&amp; ks.IsKeyDown(Keys.Right))
{
    Konum.Y -= 3;
    Konum.X += 3;
    Yonelme = MathHelper.ToRadians(45);
}</pre>
*MathHelper.ToRadians()* parametre olarak derece cinsinden değer alır ve geriye float cinsinden radian döner.

*Update()* methodunun geri kalanında yön tuşlarına göre uzay gemisinin koordinatlarını ve yönelmesini güncelliyoruz;
<pre class="brush:csharp">if (ks.IsKeyDown(Keys.Up) &amp;&amp; ks.IsKeyDown(Keys.Right))
{
    Konum.Y -= 3;
    Konum.X += 3;
    Yonelme = MathHelper.ToRadians(45);
}
else if (ks.IsKeyDown(Keys.Up) &amp;&amp; ks.IsKeyDown(Keys.Left))
{
    Konum.Y -= 3;
    Konum.X -= 3;
    Yonelme = MathHelper.ToRadians(315);
}
else if (ks.IsKeyDown(Keys.Down) &amp;&amp; ks.IsKeyDown(Keys.Right))
{
    Konum.Y += 3;
    Konum.X += 3;
    Yonelme = MathHelper.ToRadians(135);
}
else if (ks.IsKeyDown(Keys.Down) &amp;&amp; ks.IsKeyDown(Keys.Left))
{
    Konum.Y += 3;
    Konum.X -= 3;
    Yonelme = MathHelper.ToRadians(225);
}
else if (ks.IsKeyDown(Keys.Up))
{
    Konum.Y -= 3;
    Yonelme = MathHelper.ToRadians(0);
}
else if (ks.IsKeyDown(Keys.Down))
{
    Konum.Y += 3;
    Yonelme = MathHelper.ToRadians(180);
}
else if (ks.IsKeyDown(Keys.Left))
{
    Konum.X -= 3;
    Yonelme = MathHelper.ToRadians(270);
}
else if (ks.IsKeyDown(Keys.Right))
{
    Konum.X += 3;
    Yonelme = MathHelper.ToRadians(90);
}</pre>
Son olarak *Update()* methodunda uzay gemisinin pencereden dışarı çıkmasını engelleyecek kontrol kodlarını da yazıyoruz;
<pre class="brush:csharp">if (Konum.X &lt; 0)
    Konum.X = 0;
if (Konum.X &gt; PENCERE_GENISLIK - UzayGemisi.Width)
    Konum.X = PENCERE_GENISLIK - UzayGemisi.Width;
if (Konum.Y &lt; 0)
    Konum.Y = 0;
if (Konum.Y &gt; PENCERE_YUKSEKLIK - UzayGemisi.Height)
    Konum.Y = PENCERE_YUKSEKLIK - UzayGemisi.Height;

"Oyun" projemizin kodlarını <a title="enginpolat.com : XNA ile ekranda UzayGemisi yönetmek" href="/assets/uploads/2010/03/XNA_Ornek2.rar" target="_self">buradan</a> bilgisayarınıza indirebilirsiniz.

Projeyi çalıştırdığınızda aşağıdaki gibi bir sonuç almanız lazım;

<a href="/assets/uploads/2010/03/UzayOyunuPenceresi.jpg">![XNA - Uzay Oyunu Sonuç Penceresi](/assets/uploads/2010/03/UzayOyunuPenceresi.jpg "UzayOyunuPenceresi")</a>

