---
layout: post
title: "XNA Oyunu / Meyve Veren Ağaç"
date: 2012-04-15 13:11
author: engin.polat
comments: true
category: [XNA]
tags: [begin, const, CreateInstance, draw, drawablegamecomponent, drawstring, end, enum, FromMilliseconds, game, gameloop, GameTime, getstate, graphics, graphicsdevice, GraphicsDeviceManager, loadcontent, mouse, mousestate, prefferedbackbufferheight, prefferedbackbufferwidth, public, random, rectangle, SoundEffect, SoundEffectInstance, spritebatch, spritefont, texture2d, TimeSpan, totalgametime, unloadcontent, vector2, XNA, xna game studio]
---
Bu yazımı okumadan önce XNA konusundaki <a href="http://www.enginpolat.com/kategori/xna/" title="enginpolat.com : XNA" target="_blank">diğer makalelerimi</a> okumanızı öneririm.

Önce görseller;

<a href="/assets/uploads/2012/06/Araba.png">![XNA - Meyve Veren Ağaç - Araba](/assets/uploads/2012/06/Araba.png "Araba")</a> <a href="/assets/uploads/2012/06/Adam.png">![XNA - Meyve Veren Ağaç - Adam](/assets/uploads/2012/06/Adam.png "Adam")</a> <a href="/assets/uploads/2012/06/Sepet.png">![XNA - Meyve Veren Ağaç - Sepet](/assets/uploads/2012/06/Sepet.png "Sepet")</a> <a href="/assets/uploads/2012/06/Armut.png">![XNA - Meyve Veren Ağaç - Armut](/assets/uploads/2012/06/Armut.png "Armut")</a> <a href="/assets/uploads/2012/06/Uzum.png">![XNA - Meyve Veren Ağaç - Uzum](/assets/uploads/2012/06/Uzum.png "Uzum")</a> <a href="/assets/uploads/2012/06/Elma.png">![XNA - Meyve Veren Ağaç - Elma](/assets/uploads/2012/06/Elma.png "Elma")</a> <a href="/assets/uploads/2012/06/Portakal.png">![XNA - Meyve Veren Ağaç - Portakal](/assets/uploads/2012/06/Portakal.png "Portakal")</a> <a href="/assets/uploads/2012/06/Seftali.png">![XNA - Meyve Veren Ağaç - Seftali](/assets/uploads/2012/06/Seftali.png "Seftali")</a> <a href="/assets/uploads/2012/06/Cilek.png">![XNA - Meyve Veren Ağaç - Cilek](/assets/uploads/2012/06/Cilek.png "Cilek")</a> <a href="/assets/uploads/2012/06/Kavun.png">![XNA - Meyve Veren Ağaç - Kavun](/assets/uploads/2012/06/Kavun.png "Kavun")</a> <a href="/assets/uploads/2012/06/Tas.png">![XNA - Meyve Veren Ağaç - Tas](/assets/uploads/2012/06/Tas.png "Tas")</a> <a href="/assets/uploads/2012/06/Muz.png">![XNA - Meyve Veren Ağaç - Muz](/assets/uploads/2012/06/Muz.png "Muz")</a> <a href="/assets/uploads/2012/06/AgacArkaplan.png">![XNA - Meyve Veren Ağaç - Ağaç Arkaplan](/assets/uploads/2012/06/AgacArkaplan.png "Ağaç Arkaplan")</a>

Bir tane arkaplan ses dosyamız var;

[Arkaplan Müziği](/assets/uploads/2012/06/BackgroundLoop.wav)

Bir tane de *Sprite Font* dosyamız var;

*SkorFont.spritefont* ismini verdiğim dosyanın, "yorum satırları kaldırılmış halini" aşağıdaki gibi düzenledim;



&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;XnaContent xmlns:Graphics="Microsoft.Xna.Framework.Content.Pipeline.Graphics"&gt;
    &lt;Asset Type="Graphics:FontDescription"&gt;
        &lt;FontName&gt;Arial&lt;/FontName&gt;
        &lt;Size&gt;16&lt;/Size&gt;
        &lt;Spacing&gt;0&lt;/Spacing&gt;
        &lt;UseKerning&gt;true&lt;/UseKerning&gt;
        &lt;Style&gt;Regular&lt;/Style&gt;
        &lt;CharacterRegions&gt;
            &lt;CharacterRegion&gt;
                &lt;Start&gt;&amp;#32;&lt;/Start&gt;
                &lt;End&gt;&amp;#126;&lt;/End&gt;
            &lt;/CharacterRegion&gt;
        &lt;/CharacterRegions&gt;
    &lt;/Asset&gt;
&lt;/XnaContent&gt;</pre>

Başlayalım oyunumuzu yazmaya; *MeyveVerenAgac* projemizi oluşturduktan ve *Game1.cs*'in ismini *GameLoop.cs* olarak değiştirdikten sonra, class seviyesindeki değişkenlerimizi tanımlayalım;

<pre class="brush:csharp">public const int PENCERE_GENISLIK = 800;
public const int PENCERE_YUKSEKLIK = 600;
public const bool TAM_EKRAN = false;

Texture2D Arkaplan;</pre>

Oyun penceremizin sınırlarını tutacağımız **Rectangle** tipinde bir değişkeni *class seviyesindeki* değişkenlerimize ekleyelim;

<pre class="brush:csharp">Rectangle Pencere;</pre>

Gelelim bu değişkenleri kullanmaya, *GameLoop* **class**&#8216;ımızın **constructor** methodunda aşağıdaki kodları yazalım;

<pre class="brush:csharp">graphics.PreferredBackBufferWidth = PENCERE_GENISLIK;

graphics.PreferredBackBufferHeight = PENCERE_YUKSEKLIK;

graphics.IsFullScreen = TAM_EKRAN;

Pencere = new Rectangle(0, 0, PENCERE_GENISLIK, PENCERE_YUKSEKLIK);</pre>

Ses dosyalarımız için **class** seviyesinde değişkenlerimiz tanımlayalım;

<pre class="brush:csharp">SoundEffectInstance BackgroundLoop;</pre>

*LoadContent()* **method**'unda değişkenlerimize yükleme işlemlerini gerçekleştirelim;

<pre class="brush:csharp">BackgroundLoop = Content.Load&lt;SoundEffect&gt;("BackgroundLoop").CreateInstance();

BackgroundLoop.Volume = 0.2f;
BackgroundLoop.IsLooped = true;
BackgroundLoop.Play();</pre>

Ses dosyası ile yaptığımız bu işlemleri [XNA ile Pong oyunu yazalım – 2](http://www.enginpolat.com/xna-ile-pong-oyunu-yazalim-2/) ve [XNA Oyun / Çanakkale Geçilmez - 1](http://www.enginpolat.com/xna-oyunu-canakkale-gecilmez-1/) yazılarımdan hatırlayacaksınız.

[XNA Oyun / Çanakkale Geçilmez - 1](http://www.enginpolat.com/xna-oyunu-canakkale-gecilmez-1/) oyunumdan hatırlayacağınız *GameObject* sınıfını oluşturalım;

<pre class="brush:csharp">public enum GameObjectList
{
    Background,
    Basket,
    Random,
    Man,
    Car,
    Pear,
    Strawberry,
    Apple,
    Melon,
    Banana,
    Orange,
    Peach,
    Rock,
    Grape
}

public class GameObject : DrawableGameComponent
{
    SpriteBatch spriteBatch;

    public GameObjectList GameObjectType;

    Texture2D ObjectTexture;

    Vector2 ObjectPosition;

    Random r;

    MouseState ms;

    float FallSpeed = 0f;

    public Rectangle ObjectRectangle;

    public GameObject(Game game, GameObjectList GameObjectType) : base(game)
    {
        r = new Random();

        if (GameObjectType == GameObjectList.Random)
        {
            this.GameObjectType = (GameObjectList)r.Next(3, 14);
        }
        else
        {
            this.GameObjectType = GameObjectType;
        }

        FallSpeed = (float)(r.Next(1, 4) + r.NextDouble());
    }

    public override void Initialize()
    {
        base.Initialize();
    }

    protected override void LoadContent()
    {
        spriteBatch = new SpriteBatch(this.Game.GraphicsDevice);

        switch (this.GameObjectType)
        {
            case GameObjectList.Background:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("AgacArkaplan");

                ObjectPosition = Vector2.Zero;
                break;
            case GameObjectList.Man:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Adam");

                ObjectPosition = new Vector2(r.Next(0, 800), 10);
                break;
            case GameObjectList.Car:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Araba");

                ObjectPosition = new Vector2(r.Next(0, 800), 10);
                break;
            case GameObjectList.Pear:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Armut");

                ObjectPosition = new Vector2(r.Next(0, 800), 10);
                break;
            case GameObjectList.Strawberry:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Cilek");

                ObjectPosition = new Vector2(r.Next(0, 800), 10);
                break;
            case GameObjectList.Apple:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Elma");

                ObjectPosition = new Vector2(r.Next(0, 800), 10);
                break;
            case GameObjectList.Melon:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Kavun");

                ObjectPosition = new Vector2(r.Next(0, 800), 10);
                break;
            case GameObjectList.Banana:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Muz");

                ObjectPosition = new Vector2(r.Next(0, 800), 10);
                break;
            case GameObjectList.Orange:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Portakal");

                ObjectPosition = new Vector2(r.Next(0, 800), 10);
                break;
            case GameObjectList.Peach:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Seftali");

                ObjectPosition = new Vector2(r.Next(0, 800), 10);
                break;
            case GameObjectList.Basket:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Sepet");

                ObjectPosition = new Vector2(350, 520);
                break;
            case GameObjectList.Rock:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Tas");

                ObjectPosition = new Vector2(r.Next(0, 800), 10);
                break;
            case GameObjectList.Grape:
                ObjectTexture = this.Game.Content.Load&lt;Texture2D&gt;("Uzum");

                ObjectPosition = new Vector2(r.Next(0, 800), 10);
                break;
        }

        ObjectRectangle = new Rectangle((int)ObjectPosition.X, (int)ObjectPosition.Y, ObjectTexture.Width, ObjectTexture.Height);

        base.LoadContent();
    }

    public override void Update(GameTime gameTime)
    {
        if (GameObjectType == GameObjectList.Basket)
        {
            ms = Mouse.GetState();

            ObjectPosition.X = ms.X;

            ObjectRectangle.X = ms.X;
        }
        else if (GameObjectType != GameObjectList.Background)
        {
            ObjectPosition.Y += FallSpeed;

            ObjectRectangle.Y = (int)ObjectPosition.Y;
        }

        base.Update(gameTime);
    }

    public override void Draw(GameTime gameTime)
    {
        spriteBatch.Begin();

        spriteBatch.Draw(ObjectTexture, ObjectPosition, Color.White);

        spriteBatch.End();

        base.Draw(gameTime);
    }
}</pre>

Yeni eklediğimiz *GameObjectList* **enum** sayesinde, *GameObject* sınıfından ürettiğimiz her değişken farklı bir görünüşe ve davranışa sahip olabiliyor. (Örneğin, puan alacağımız üzüm-çilek-kavun gibi meyveler veya puan kaybedeceğimiz taş-araba-insan gibi nesneler)

*GameObject* sınıfını *Microsoft.Xna.Framework* **namespace**'inde yer alan <a href="http://msdn.microsoft.com/microsoft.xna.framework.drawablegamecomponent" title="MSDN : DrawableGameComponent Class" target="_blank">DrawableGameComponent</a> sınıfından türetiyoruz.

*DrawableGameComponent* sınıfından türettiğimiz için, *GameObject* sınıfının kendi **LoadContent**, **Update** ve **Draw** method'ları oluyor.

**LoadContent** method'unda, ilgili görseli seçip, hafızaya yüklüyoruz. **Update** method'unda, eğer nesne *Sepet* veya *Arkaplan* değilse, rastgele hızda aşağı düşürüyoruz. Eğer nesne *Sepet* ise, **Mouse** tarafından kontrol edilmesini sağlıyoruz;

<pre class="brush:csharp">if (GameObjectType == GameObjectList.Basket)
{
    ms = Mouse.GetState();

    ObjectPosition.X = ms.X;

    ObjectRectangle.X = ms.X;
}</pre>

**Draw** method'unda ise, basitçe ilgili nesneyi ekrana çizdiriyoruz.

*GameLoop* sınıfına aşağıdaki değişkenleri ekleyelim;

<pre class="brush:csharp">GameObject Basket;
SpriteFont ScoreFont;
Vector2 ScorePosition;
</pre>

*GameObject* sınıfınının *constructor*'ına aşağıdaki satırları ekleyelim;

<pre class="brush:csharp">Basket = new GameObject(this, GameObjectList.Basket);

this.Components.Add(Basket);

this.Components.Add(new GameObject(this, GameObjectList.Background));</pre>

**LoadContent** method'una aşağıdaki kodları ekleyelim;

<pre class="brush:csharp">ScoreFont = Content.Load&lt;SpriteFont&gt;("SkorFont");
ScorePosition = new Vector2(30, 560);</pre>

Rastgele nesne oluşturup, ağaçtan aşağı düşürmeden önce, *Son Nesne Oluşturma Zamanı*, *Nesne Oluşturma Zaman Aralığı* gibi değerleri saklayabileceğimiz değişkenlere ihtiyacımız olacak, hemen *GameLoop* sınıfının içerisinde tanımlayalım;

<pre class="brush:csharp">TimeSpan PreviousFallTime;
TimeSpan FallBufferTime = TimeSpan.FromMilliseconds(1000);</pre>

Böylece, her saniye yeni bir nesne oluşturmak için ihtiyaç duyacağımız tüm değişkenleri tanımlamış olduk.

**Update** method'una aşağıdaki kodları yazalım;

<pre class="brush:csharp">if (gameTime.TotalGameTime - PreviousFallTime > FallBufferTime)
{
    this.Components.Add(new GameObject(this, GameObjectList.Random));

    PreviousFallTime = gameTime.TotalGameTime;
}

for (int iLoop = 0; iLoop < this.Components.Count; iLoop++)
{
    GameObject CurrentComponent = (GameObject)this.Components[iLoop];

    if (CurrentComponent.GameObjectType != GameObjectList.Background && CurrentComponent.GameObjectType != GameObjectList.Basket)
    {
        if (Basket.ObjectRectangle.Intersects(CurrentComponent.ObjectRectangle))
        {
            if (CurrentComponent.GameObjectType == GameObjectList.Rock)
            {
                Skor -= 1;
            }
            else if (CurrentComponent.GameObjectType == GameObjectList.Man)
            {
                Skor -= 2;
            }
            else if (CurrentComponent.GameObjectType == GameObjectList.Car)
            {
                Skor -= 3;
            }
            else
            {
                Skor += 1;
            }

            this.Components.Remove(CurrentComponent);
        }
    }
}</pre>

Geriye sadece **Draw** method'u kaldı;

</pre><pre class="brush:csharp">spriteBatch.Begin();

spriteBatch.DrawString(ScoreFont, "Skor : " + Skor, ScorePosition + Vector2.One, Color.Black);
spriteBatch.DrawString(ScoreFont, "Skor : " + Skor, ScorePosition, Color.White);

spriteBatch.End();


Skor bilgisini, bir beyaz, bir siyah renkle, iki defa çizdiriyoruz. İkinci çizimi *1px* farklı konuma çizdirdiğimiz için, yazı ekranda sanki *gölgesi* varmış gibi gözüküyor.

İşte *Meyve Veren Ağaç* oyunundan bir ekran görüntüsü. Oyunun kaynak kodlarını <a href="/assets/uploads/2012/06/MeyveVerenAgac.rar" title="XNA : Meyve Veren Ağaç oyunu tüm kodlar" target="_blank">buradan</a> indirebilirsiniz.

![Meyve Veren Ağaç oyunun bitmiş hali](/assets/uploads/2012/06/MeyveVerenAgac.jpg "XNA : Meyve Veren Ağaç")

