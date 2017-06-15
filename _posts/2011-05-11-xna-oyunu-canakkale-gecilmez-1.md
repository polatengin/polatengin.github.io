---
layout: post
title: "XNA Oyunu / Çanakkale Geçilmez - 1"
date: 2011-05-11 11:25
author: engin.polat
comments: true
category: [Programlama]
tags: [bool, class, const, constructor, CreateInstance, game, getstate, isfullscreen, iskeydown, keyboard, loadcontent, mathhelper, object orriented, OnActivated, OnDeactivated, oop, override, PreferredBackBufferHeight, PreferredBackBufferWidth, rectangle, Rotation, SoundEffect, SoundEffectInstance, texture2d, toradians, vector2, XNA]
---
Bu yazımı okumadan önce **XNA** konusundaki <a title="enginpolat.com : XNA" href="http://www.enginpolat.com/kategori/xna/" target="_self">diğer   makalelerimi</a> okumanızı öneririm.

Bu sefer yapacağımız oyun, **30 Ağustos**'un ruhuna uygun olacak - **Çanakkale Geçilmez**.

Önce görsellerimizi verelim;

<a href="/assets/uploads/2010/03/Arkaplan.png">![XNA - Çanakkale Geçilmez - Arkaplan](/assets/uploads/2010/03/Arkaplan-150x150.png "Arkaplan")</a> <a href="/assets/uploads/2010/03/DusmanGemi.png">![XNA - Çanakkale Geçilmez - Düşman Gemisi](/assets/uploads/2010/03/DusmanGemi.png "DusmanGemi")</a> <a href="/assets/uploads/2010/03/Top1.png">![XNA - Çanakkale Geçilmez - Top](/assets/uploads/2010/03/Top1.png "Top")</a> <a href="/assets/uploads/2010/03/Gulle.png">![XNA - Çanakkale Geçilmez - Gülle](/assets/uploads/2010/03/Gulle.png "Gulle")</a> <a href="/assets/uploads/2010/03/Karakterler.png">![XNA - Çanakkale Geçilmez - Karakterler](/assets/uploads/2010/03/Karakterler.png "Karakterler")</a> <a href="/assets/uploads/2010/03/Sayilar.png">![XNA - Çanakkale Geçilmez - Sayılar](/assets/uploads/2010/03/Sayilar.png "Sayilar")</a>

İki tane de ses dosyamız var;

[Gemi Vuruldu Sesi](/assets/uploads/2010/03/ir_begin.wav)

[Arkaplan Müziği](/assets/uploads/2010/03/pong.wav)

Başlayalım oyunumuzu yazmaya; *Çanakkale Geçilmez* projemizi oluşturduktan ve *Game1.cs*'in ismini *GameLoop.cs* olarak değiştirdikten sonra, **class** seviyesindeki değişkenlerimizi tanımlayalım;



public const int PENCERE_GENISLIK = 800;
public const int PENCERE_YUKSEKLIK = 600;
public const bool TAM_EKRAN = false;

Texture2D Arkaplan;</pre>

Oyun penceremizin sınırlarını tutacağımız **Rectangle** tipinde bir değişkeni *class seviyesindeki* değişkenlerimize ekleyelim;

<pre class="brush:csharp">Rectangle Pencere;</pre>

Gelelim bu değişkenleri kullanmaya, *GameLoop* **class**'ımızın **constructor** methodunda aşağıdaki kodları yazalım;

<pre class="brush:csharp">graphics.PreferredBackBufferWidth = PENCERE_GENISLIK;
graphics.PreferredBackBufferHeight = PENCERE_YUKSEKLIK;
graphics.IsFullScreen = TAM_EKRAN;
Pencere = new Rectangle(0, 0, PENCERE_GENISLIK, PENCERE_YUKSEKLIK);</pre>

Ses dosyalarımız için **class** seviyesinde değişkenlerimiz tanımlayalım;

<pre class="brush:csharp">SoundEffectInstance ArkaplanSes;
SoundEffectInstance GemiVurulduSes;</pre>

*LoadContent()* **method**'unda değişkenlerimize yükleme işlemlerini gerçekleştirelim;

<pre class="brush:csharp">Arkaplan = Content.Load&lt;Texture2D&gt;("Arkaplan");

ArkaplanSes = Content.Load&lt;SoundEffect&gt;("pong").CreateInstance();
GemiVurulduSes = Content.Load&lt;SoundEffect&gt;("ir_begin").CreateInstance();

ArkaplanSes.IsLooped = true;
ArkaplanSes.Volume = 0.3f;
ArkaplanSes.Play();</pre>

Ses dosyaları ile yaptığımız bu işlemleri [XNA ile Pong oyunu yazalım – 2](http://www.enginpolat.com/xna-ile-pong-oyunu-yazalim-2/) yazımdan hatırlayacaksınız.

Bu oyunumuzda aktörleri **Nesne Yönelimli Programlama (Object Orriented Programming)** kurallarına uyarak oluşturalım; oyun projemize yeni bir **class** ekleyelim ve ismini *GameObject.cs* verelim.

**Çanakkale Geçilmez** oyunumuzda oluşturacağımız tüm nesneleri *GameObject* class'ından oluşturacağız.

<pre class="brush:csharp">public class GameObject
{
    public bool IsAlive;
    public Texture2D Texture;
    public Vector2 Position;
    public Vector2 Center;
    public Vector2 Velocity;
    public float Rotation;

    private Rectangle _TextureRectangle;
    public Rectangle TextureRectangle
    {
        get
        {
            _TextureRectangle.X = (int)Position.X;
            _TextureRectangle.Y = (int)Position.Y;

            return _TextureRectangle;
        }
    }

    public GameObject(Texture2D Texture)
    {
        this.IsAlive = false;
        this.Texture = Texture;
        this.Center = new Vector2(Texture.Width / 2, Texture.Height / 2);
        this.Position = Vector2.Zero;
        this.Velocity = Vector2.Zero;
        this.Rotation = 0;

        this._TextureRectangle = new Rectangle(0, 0, Texture.Width, Texture.Height);
    }
}</pre>

Yukarıdaki kodu incelediğimizde;



*   Oyun nesnesinin hala *canlı* olup olmadığını anlamak için **IsAlive** değişkeninin olduğunu
*   Oyun nesnesinin *Texture*'unu almak için **Texture** nesnesinin olduğunu
*   Oyun nesnesinin *ekrandaki yerini* almak için **Position** değişkeninin olduğunu
*   Oyun nesnesinin kendi etrafında *dönüş miktarını* almak için **Center** ve **Rotation** değişkenlerinin olduğunu
*   Oyun nesnesinin *hızını* almak için **Velocity** değişkeninin olduğunu
*   Oyun nesnesinin ekranda kapladığı *alanı* bulmak için **TextureRectangle** özelliğinin olduğunu görürüz.

*GameObject* sınıfının **constructor**'ı sadece bir *Texture2D* nesnesi alıyor ve bu parametreyi kendi iç değişkenlerinin değerlerini hesaplamada kullanıyor.

Artık *GameLoop* sınıfımızın **class** seviyesinde, **Top** nesnesi için, *GameObject* sınıfından değişken oluşturabiliriz.

<pre class="brush:csharp">public GameObject Top;</pre>

**LoadContent()** methodunda bu değişkenin atamasını yapalım;

<pre class="brush:csharp">Top = new GameObject(Content.Load&lt;Texture2D&gt;("Top"));</pre>

**Update()** methodunda *Top* nesnemizin yerini hesaplayalım;

<pre class="brush:csharp">KeyboardState ks = Keyboard.GetState();

if (ks.IsKeyDown(Keys.Left))
    Top.Position.X -= 5;
if (ks.IsKeyDown(Keys.Right))
    Top.Position.X += 5;</pre>

Aynı method içerisinde *Top* nesnemizin dönüş miktarını da hesaplayabiliriz; *(Yukarı ve Aşağı tuşlarına basıldıkça 10 derece dönmesini sağlayacağız)*

<pre class="brush:csharp">if (ks.IsKeyDown(Keys.Up))
    Top.Rotation += MathHelper.ToRadians(10);
if (ks.IsKeyDown(Keys.Down))
    Top.Rotation -= MathHelper.ToRadians(10);</pre>

<a href="http://msdn.microsoft.com/library/microsoft.xna.framework.mathhelper" target="_blank">MathHelper</a> sınıfının **static** <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.mathhelper.toradians" target="_blank">ToRadians</a> fonksiyonu sayesinde, Top'umuzun dönme açısını **radian** cinsinden kolaylıkla hesaplayabiliyoruz.

**Top**'umuzun dönme açısının *-90* ile *+90* dereceler arasında olduğundan ve ekrandan dışarı çıkmayıp, **görünür** olduğundan emin olalım;

<pre class="brush:csharp">if (Top.Position.X < 0)
    Top.Position.X = 0;
if (Top.Position.X > PENCERE_GENISLIK)
    Top.Position.X = PENCERE_GENISLIK;

if (Top.Rotation > MathHelper.ToRadians(90))
    Top.Rotation = MathHelper.ToRadians(90);
if (Top.Rotation < MathHelper.ToRadians(-90))
    Top.Rotation = MathHelper.ToRadians(-90);</pre>

Oyunun, Windows'ta başka bir pencereye geçilmesi esnasında (**focus** kaybetme) bekleme moduna geçmesini, tekrar oyuna dönüldüğünde ise (**focus** alma), kaldığı yerden devam etmesini sağlayalım;

Öncelikle sınıf seviyesindeki değişkenlerimize,

</pre><pre class="brush:csharp">bool OYUN_DEVAM_EDIYOR = true;</pre>

ekliyoruz. [Microsoft.Xna.Framework.Game](http://msdn.microsoft.com/library/microsoft.xna.framework.game) sınıfından türetildiği için *GameLoop* sınıfının [OnActivated](http://msdn.microsoft.com/library/microsoft.xna.framework.game.onactivated) ve [OnDeactivated](http://msdn.microsoft.com/library/microsoft.xna.framework.game.ondeactivated) method'larını override edebiliriz.

**OnDeactivated** method'unda, oyun penceresinin *focus kaybettiğini*, **OnActivated** method'unda ise, oyun penceresinin *focus aldığını* anlayabiliriz.

<pre class="brush:csharp">protected override void OnActivated(object sender, EventArgs args)
{
  OYUN_DEVAM_EDIYOR = true;
  ArkaplanSes.Resume();
  base.OnActivated(sender, args);
}

protected override void OnDeactivated(object sender, EventArgs args)
{
  OYUN_DEVAM_EDIYOR = false;
  ArkaplanSes.Pause();
  base.OnDeactivated(sender, args);
}


Şu ana kadar oyunumuza hiç düşman eklemedik. Bir sonraki yazımda düşmanları ekleyeceğiz.

*Top'umuzla da düşmanları vurup, puan kazanıyor olacağız.*

