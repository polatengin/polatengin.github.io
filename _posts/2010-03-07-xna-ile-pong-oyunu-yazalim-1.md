---
layout: post
title: "XNA ile Pong oyunu yazalım - 1"
date: 2010-03-07 10:30
author: engin.polat
comments: true
category: [XNA]
tags: [Content.Load, draw, graphics, intersects, isfullscreen, iskeydown, keybo, Keyboard.GetState, keyboardstate, loadcontent, PreferredBackBufferHeight, PreferredBackBufferWidth, rectangle, texture2d, update, vector2, XNA]
---
Bu yazımı okumadan önce **XNA** konusundaki <a title="enginpolat.com : XNA" href="/kategori/xna/" target="_self">diğer  makalelerimi</a> okumanızı öneririm.

Her zamanki gibi, öncelikle ihtiyacımız olacak **görselleri** vereyim;

<a href="/assets/uploads/2010/03/Oyuncu1.png">![XNA - Pong Oyunu - Oyuncu 1](/assets/uploads/2010/03/Oyuncu1.png "Oyuncu1")</a> <a href="/assets/uploads/2010/03/Oyuncu2.png">![XNA - Pong Oyunu - Oyuncu 2](/assets/uploads/2010/03/Oyuncu2.png "Oyuncu2")</a> <a href="/assets/uploads/2010/03/Top.png">![XNA - Pong Oyunu - Top](/assets/uploads/2010/03/Top.png "Top")</a>

Ben *kırmızı pedalı* **Oyuncu 1** için, *mavi pedalı* **Oyuncu 2** için, *yeşil kareyi* ise **Top** olarak kullanacağım.

**Visual Studio 2008** içerisinde yeni bir **XNA projesi** oluşturalım, *Game1.cs*'in ismini *GameLoop.cs* ile değiştirelim ve *class* seviyesinde değişkenlerimizi tanımlayalım;


Texture2D Oyuncu1;
Texture2D Oyuncu2;
Texture2D Top;

Vector2 Oyuncu1Yer;
Vector2 Oyuncu2Yer;
Vector2 TopYer;

private int Oyuncu1Skor = 0;
private int Oyuncu2Skor = 0;
Vector2 TopYon;

private const int PENCERE_GENISLIK = 800;
private const int PENCERE_YUKSEKLIK = 600;
private const string PENCERE_BASLIK = "XNA - Pong Oyunu";
private const bool TAM_EKRAN = false;
private readonly Color ARKAPLAN_RENK = Color.Black;</pre>
*GameLoop* **class**'ımızın *contructor*'ına aşağıdaki kodları ekleyelim;
<pre class="brush:csharp">graphics.PreferredBackBufferWidth = PENCERE_GENISLIK;
graphics.PreferredBackBufferHeight = PENCERE_YUKSEKLIK;
graphics.IsFullScreen = TAM_EKRAN;
this.Window.Title = PENCERE_BASLIK;</pre>
Şimdi *LoadContent()* method'unda görselleri **hafızaya** yükleyeceğimiz kodları ekleyelim;
<pre class="brush:csharp">Oyuncu1 = Content.Load&lt;Texture2D&gt;("Oyuncu1");
Oyuncu2 = Content.Load&lt;Texture2D&gt;("Oyuncu2");
Top = Content.Load&lt;Texture2D&gt;("Top");

Oyuncu1Yer = new Vector2((float)(graphics.GraphicsDevice.Viewport.Width * 0.07), (float)(graphics.GraphicsDevice.Viewport.Height / 2));
Oyuncu2Yer = new Vector2((float)(graphics.GraphicsDevice.Viewport.Width - (graphics.GraphicsDevice.Viewport.Width * 0.07)), (float)(graphics.GraphicsDevice.Viewport.Height / 2));
TopYer = new Vector2(graphics.GraphicsDevice.Viewport.Width / 2, graphics.GraphicsDevice.Viewport.Height / 2);

TopYon = new Vector2(3, 3);</pre>
*Draw()* methodunda **ekrana çizim** işlerini yapalım;
<pre class="brush:csharp">spriteBatch.Begin(SpriteBlendMode.AlphaBlend);

spriteBatch.Draw(Oyuncu1, Oyuncu1Yer, Color.White);
spriteBatch.Draw(Oyuncu2, Oyuncu2Yer, Color.White);
spriteBatch.Draw(Top, TopYer, Color.White);

spriteBatch.End();</pre>
*Update()* methodunda her iki oyuncunun ve top'un yerlerini hesaplayalım. Öncelikle **klavyenin** o andaki durumunu alalım;
<pre class="brush:csharp">KeyboardState ks = Keyboard.GetState();</pre>
Hangi tuşların **basılı** olduğunu kontrol edelim;
<pre class="brush:csharp">if (ks.IsKeyDown(Keys.Escape))
    this.Exit();

if (ks.IsKeyDown(Keys.Up))
    Oyuncu1Yer.Y -= 3;
if (ks.IsKeyDown(Keys.Down))
    Oyuncu1Yer.Y += 3;

if (Oyuncu1Yer.Y &lt; 0)
    Oyuncu1Yer.Y = 0;
if (Oyuncu1Yer.Y &gt; PENCERE_YUKSEKLIK - Oyuncu1.Height)
    Oyuncu1Yer.Y = PENCERE_YUKSEKLIK - Oyuncu1.Height;

if (ks.IsKeyDown(Keys.E))
    Oyuncu2Yer.Y -= 3;
if (ks.IsKeyDown(Keys.D))
    Oyuncu2Yer.Y += 3;

if (Oyuncu2Yer.Y &lt; 0)
    Oyuncu2Yer.Y = 0;
if (Oyuncu2Yer.Y &gt; PENCERE_YUKSEKLIK - Oyuncu2.Height)
    Oyuncu2Yer.Y = PENCERE_YUKSEKLIK - Oyuncu2.Height;</pre>
**Top**'un ekrandan dışarı çıkmaması için, ekranın üstüne veya altına eriştiğinde, **yönünü değiştirecek** kodu ekleyelim;
<pre class="brush:csharp">if ((TopYer.Y &lt; 0) || (TopYer.Y &gt; PENCERE_YUKSEKLIK - Top.Height))
    TopYon.Y *= -1;
if ((TopYer.X &lt; 0) || (TopYer.X &gt; PENCERE_YUKSEKLIK - Top.Width))
    TopYon.X *= -1;</pre>
Şimdi **Oyuncu 1**, **Oyuncu 2** ve **Top** için konum ve boyut bilgilerini tutacağımız *Rectangle* değişkenlerini tanımlayalım;
<pre class="brush:csharp">Rectangle Oyuncu1Rect = new Rectangle((int)Oyuncu1Yer.X, (int)Oyuncu1Yer.Y, Oyuncu1.Width, Oyuncu1.Height);
Rectangle Oyuncu2Rect = new Rectangle((int)Oyuncu2Yer.X, (int)Oyuncu2Yer.Y, Oyuncu2.Width, Oyuncu2.Height);
Rectangle TopRect = new Rectangle((int)TopYer.X, (int)TopYer.Y, Top.Width, Top.Height);</pre>
Yapmamız gereken, **Top**'un **Oyuncu 1** veya **Oyuncu 2** ile **kesiştiği** durumda yönünü ters çevirmek. Ayrıca eğer **Oyuncu 1** veya **Oyuncu 2**'nin arkasına geçerse diğer oyuncunun **skor**'unu bir artırmak ve **Top**'un yerini sıfırlamak;
<pre class="brush:csharp">if (TopRect.Intersects(Oyuncu1Rect) || TopRect.Intersects(Oyuncu2Rect))
    TopYon.X *= -1;

if (TopYer.X &lt; Oyuncu1Yer.X)
{
    Oyuncu2Skor++;
    TopYer.X = graphics.GraphicsDevice.Viewport.Width / 2;
}

if (TopYer.X &gt; Oyuncu2Yer.X)
{
    Oyuncu1Skor++;
    TopYer.X = graphics.GraphicsDevice.Viewport.Width / 2;
}

TopYer += TopYon;

Şu anda elimizde oynayabileceğimiz bir **Pong** oyunu var. Her iki oyuncu için **skor** bilgisini de tutuyoruz. Fakat skor'u ekrana **yazdırmadık**.

Ekrana skor yazdırma işini bir sonraki yazıya bırakıyorum. Oyunun kodlarını da bir sonraki yazıda veriyor olacağım.

