---
layout: post
title: "XNA Oyunu / Vahşi Batı"
date: 2012-06-25 06:50
author: engin.polat
comments: true
category: [C#]
tags: [begin, class, Color, const, content, Content.Load, draw, drawstring, end, float, GameTime, getstate, graphics, graphicsdevice, GraphicsDeviceManager, int, intersect, intersects, loadcontent, mouse, mousestate, play, prefferedbackbufferheight, prefferedbackbufferwidth, random, rectangle, sound, SoundEffect, SoundEffectInstance, sprite, spritebatch, spriteeffects, spritefont, texture2d, TimeSpan, TimeSpan.Zero, totalgametime, unloadcontent, update, vector2, XNA, xna game studio]
---
Bu yazımı okumadan önce <a href="http://www.enginpolat.com/kategori/xna/" title="enginpolat.com : XNA" target="_blank">XNA konusundaki diğer makalelerimi</a> okumanızı öneririm.

Her zamanki gibi önce görseller;

<a href="/assets/uploads/2012/06/Cursor.png">![XNA Oyun - Vahşi Batı - Cursor](/assets/uploads/2012/06/Cursor.png "Cursor")</a> <a href="/assets/uploads/2012/06/Tombstone.png">![XNA Oyun - Vahşi Batı - Tombstone](/assets/uploads/2012/06/Tombstone.png "Tombstone")</a> <a href="/assets/uploads/2012/06/Horse.png">![XNA Oyun - Vahşi Batı - Horse](/assets/uploads/2012/06/Horse.png "Horse")</a> <a href="/assets/uploads/2012/06/Background.jpg">![XNA Oyun - Vahşi Batı - Background](/assets/uploads/2012/06/Background.jpg "Background")</a>

Bir tane silah sesi dosyamız var;

[Magnum Gunshot](/assets/uploads/2012/06/Magnum.wav)

Bir tane de Sprite Font dosyamız var;

*SkorFont.spritefont* ismini verdiğim dosyanın, "yorum satırları kaldırılmış halini" aşağıdaki gibi düzenledim;



&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;XnaContent xmlns:Graphics="Microsoft.Xna.Framework.Content.Pipeline.Graphics"&gt;
    &lt;Asset Type="Graphics:FontDescription"&gt;
        &lt;FontName&gt;Segoe UI Mono&lt;/FontName&gt;
        &lt;Size&gt;18&lt;/Size&gt;
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

Başlayalım oyunumuzu yazmaya; *VahsiBati* projemizi oluşturduktan ve *Game1.cs*'in ismini *GameLoop.cs* olarak değiştirdikten sonra, *Target* isminde bir sınıf oluşturalım;

<pre class="brush:csharp">public class Target
{
    public const int FrameWidth = 104;

    public Vector2 Position;

    private Rectangle _Area = new Rectangle(0, 0, FrameWidth, FrameWidth);
    public Rectangle Area
    {
        get
        {
            _Area.X = (int)Position.X;
            _Area.Y = (int)Position.Y;

            return _Area;
        }
    }

    public bool ToLeft;

    public float RunSpeed;

    public int FrameIndex;

    public SpriteEffects SpriteEffect;

    public TimeSpan LastFrameChange = TimeSpan.Zero;

    public TimeSpan FrameChangeBuffer = TimeSpan.Zero;

    public bool IsDead = false;
}</pre>

**Target** sınıfı sayesinde, ekrana getireceğimiz *hedef*'lerin ekranın neresinden çıkıp, hangi yöne doğru gideceğini bileceğiz, hedefin vurulup/vurulmadığını bileceğiz, *çarpışma testi* yapabilmek için ekranda kapladığı alanı bileceğiz, hızını bileceğiz, ayrıca *hedef*'imizin harekete sahip olmasını sağlayabileceğiz (bknz; <a href="http://www.enginpolat.com/xna-ile-karakter-hareketi/" title="enginpolat.com : XNA ile Karakter Hareketi" target="_blank">XNA ile Karakter Hareketi</a>)

*GameLoop.cs* dosyasına geri dönelim, ilk önce arkaplanımızın hareketli olması için (bknz; <a href="http://www.enginpolat.com/xna-ile-hareketli-arkaplan/" title="XNA ile Hareketli Arkaplan" target="_blank">XNA ile Hareketli Arkaplan</a>) sınıf seviyesinde şu değişkenleri tanımlayalım;

<pre class="brush:csharp">Rectangle Screen;

Texture2D Background1;
Texture2D Background2;

Rectangle Background1Position;
Rectangle Background2Position;</pre>

*GameLoop* **constructor**'ında *Screen* değişkenine;

<pre class="brush:csharp">Screen = new Rectangle(0, 0, graphics.PreferredBackBufferWidth, graphics.PreferredBackBufferHeight);</pre>

**LoadContent** method'unda *Background* değişkenlerine değer atayalım;

<pre class="brush:csharp">Background1 = Content.Load&lt;Texture2D&gt;("Background");
Background2 = Content.Load&lt;Texture2D&gt;("Background");

Background1Position = new Rectangle(0, 0, Background1.Width, Background1.Height);
Background2Position = new Rectangle(Background1.Width, 0, Background2.Width, Background2.Height);</pre>

**Update** method'unda *Background*'un yerini güncelleyelim;

<pre class="brush:csharp">Background1Position.X -= 1;
Background2Position.X -= 1;

if (Background1Position.X < -Background1.Width)
{
    Background1Position.X = Background2Position.X + Background2.Width;
}

if (Background2Position.X < -Background2.Width)
{
    Background2Position.X = Background1Position.X + Background1.Width;
}</pre>

Son olarak **Draw** method'unda *Background*'u ekrana çizelim;

</pre><pre class="brush:csharp">spriteBatch.Begin();

spriteBatch.Draw(Background1, Background1Position, Color.White);
spriteBatch.Draw(Background2, Background2Position, Color.White);

spriteBatch.End();</pre>

Ekrana *işaretçi* çizdirmek için, sınıf seviyesinde aşağıdaki değişkenleri ekleyelim;

<pre class="brush:csharp">Texture2D Cursor;

Vector2 CursorPosition = Vector2.Zero;
Vector2 CursorCenter = Vector2.Zero;

Rectangle CursorZone;

MouseState ms;
MouseState pms;</pre>

*GameLoop* **constructor**'ında *CursorZone* değişkenini dolduralım;

<pre class="brush:csharp">CursorZone = new Rectangle(0, 0, 5, 5);</pre>

**LoadContent** *method*'unda **Cursor** değişkenlerine değer atayalım;

<pre class="brush:csharp">Cursor = Content.Load&lt;Texture2D&gt;("Cursor");
CursorCenter = new Vector2(Cursor.Width / 2, Cursor.Height / 2);</pre>

**Update** *method*'unda işaretçinin ekranda görüntüleneceği yeri hesaplayalım;

<pre class="brush:csharp">ms = Mouse.GetState();

CursorPosition = new Vector2(ms.X, ms.Y);

pms = ms;</pre>

**Draw** method'unda *Cursor* nesnemizi ekrana çizdirelim;

<pre class="brush:csharp">spriteBatch.Draw(Cursor, CursorPosition, null, Color.White, 0f, CursorCenter, 0.6f, SpriteEffects.None, 0f);</pre>

Sınıf seviyesinde aşağıdaki değişkenleri tanımlayalım;

<pre class="brush:csharp">Texture2D Horse;

Texture2D Tombstone;

SpriteFont SkorFont;
Vector2 SkorPosition;

SoundEffect Gunshot;

Random r;

int Score = 0;</pre>

Böylece *hedef*'in görselini, vurulduğunda dönüşeceği *mezarlık* görselini, ateş etme sırasında duyulacak *silah sesini*, *kaç hedef* vurduğumuzu tutabileceğimiz değişkenlerimiz tanımlamış olduk.

**Constructor**'da r değişkenine değer ataması yapalım;

<pre class="brush:csharp">r = new Random();</pre>

**LoadContent** method'unda diğer değişkenlerimize değer atayalım;

<pre class="brush:csharp">Horse = Content.Load&lt;Texture2D&gt;("Horse");
Tombstone = Content.Load&lt;Texture2D&gt;("Tombstone");

SkorFont = Content.Load&lt;SpriteFont&gt;("SkorFont");
SkorPosition = new Vector2(20, 10);

Gunshot = Content.Load&lt;SoundEffect&gt;("Magnum");</pre>

Henüz ekranda hedefleri *göremesek*'te oyunumuzun önemli kısımlarının hazırlıklarını tamamladık. Artık *hedef listesini* tanımlayabilir, **Update** ve **Draw** method'larında kullanabiliriz. Sınıf seviyesinde aşağıdaki değişkenleri tanımlayalım;

<pre class="brush:csharp">TimeSpan LastHorseSpawn = TimeSpan.Zero;
TimeSpan SpawnHorseBuffer = TimeSpan.FromSeconds(3);

List&lt;Target&gt; TargetList = new List&lt;Target&gt;();</pre>

**Update** method'unda *son hedef üretilme zamanından* itibaren *yeterli süre* geçmişse, yeni hedef oluşturmamız lazım;

<pre class="brush:csharp">if (gameTime.TotalGameTime - LastHorseSpawn > SpawnHorseBuffer)
{
    Target t = new Target();
    t.FrameIndex = 0;
    t.ToLeft = r.Next(0, 2) == 0;
    t.RunSpeed = Convert.ToSingle(r.Next(20, 70)) / 10;
    t.FrameChangeBuffer = TimeSpan.FromMilliseconds(100 + -t.RunSpeed);

    if (t.ToLeft)
    {
        t.Position = new Vector2(graphics.PreferredBackBufferWidth - t.Area.Width, r.Next(200, 400));
        t.SpriteEffect = SpriteEffects.FlipHorizontally;
    }
    else
    {
        t.Position = new Vector2(0, r.Next(200, 400));
        t.SpriteEffect = SpriteEffects.None;
    }

    TargetList.Add(t);

    LastHorseSpawn = gameTime.TotalGameTime;
}</pre>

Hedef'in ekranın *solundan sağına*/*sağından soluna* gideceğine **rastgele** karar veriyoruz (*ToLeft* alanı sayesinde)

Hedef'in ekranda *koşma hızına* rastgele karar veriyoruz (*RunSpeed* alanı sayesinde)

**Update** method'unda *hedef listesindeki* hedeflerin hala ekranda göründüğünü *kontrol* ediyoruz, eğer ekrandan çıkmışlarsa hedef listesinden de *çıkartıyoruz*. Ekranda kalan hedefleri, *koşma hızları* kadar *koşturuyoruz*;

<pre class="brush:csharp">foreach (var t in TargetList)
{
    if (!Screen.Intersects(t.Area))
    {
        TargetList.Remove(t);
        break;
    }

    if (gameTime.TotalGameTime - t.LastFrameChange > t.FrameChangeBuffer)
    {
        t.FrameIndex += 1;
        t.LastFrameChange = gameTime.TotalGameTime;
    }

    if (t.FrameIndex > 3)
    {
        t.FrameIndex = 0;
    }

    if (t.ToLeft)
    {
        t.Position.X -= t.RunSpeed;
    }
    else
    {
        t.Position.X += t.RunSpeed;
    }
}</pre>

**Update** method'unda ayrıca, **mouse**'un *sol tuşuna* basıldığında *ateş edilmesini* sağlamamız gerekiyor. Öncelikle *sol tuşa* ilk basıldığı anı buluyoruz, *silah sesi* çıkartıyoruz, *hedef listesindeki* hedefleri kontrol ediyoruz. Eğer *vurulan* hedef varsa, *mezarlık görseline* döndürüyoruz, *Skor*'umuzu 1 arttırıyoruz;

<pre class="brush:csharp">if (ms.LeftButton == ButtonState.Pressed && pms.LeftButton == ButtonState.Released)
{
    Gunshot.Play();

    CursorZone.X = ms.X - 2;
    CursorZone.Y = ms.Y - 2;

    foreach (var t in TargetList)
    {
        if (!t.IsDead && t.Area.Intersects(CursorZone))
        {
            Score++;
            t.Position += new Vector2(20, 20);
            t.IsDead = true;
            t.ToLeft = true;
            t.RunSpeed = 1;
            break;
        }
    }
}</pre>

Son olarak **Draw** method'unda, hala *hedef listesinde* olan hedefleri ve *skorumuzu* ekrana *çizdirmemiz* gerekiyor;

<pre class="brush:csharp">foreach (var t in TargetList)
{
    if (t.IsDead)
    {
        spriteBatch.Draw(Tombstone, t.Position, Color.White);
    }
    else
    {
        spriteBatch.Draw(Horse, t.Position, new Rectangle(t.FrameIndex * Target.FrameWidth, 0, Target.FrameWidth, Target.FrameWidth), Color.White, 0f, Vector2.Zero, Vector2.One, t.SpriteEffect, 0);
    }
}

spriteBatch.DrawString(SkorFont, "Skor : " + Score, SkorPosition + Vector2.One, Color.Black);
spriteBatch.DrawString(SkorFont, "Skor : " + Score, SkorPosition, Color.White);


İşte *Vahşi Batı* oyunundan bir ekran görüntüsü. Oyunun kaynak kodlarını <a href="/assets/uploads/2012/06/VahsiBati.rar" title="XNA : Vahşi Batı" target="_blank">buradan</a> indirebilirsiniz.

![XNA Oyun : Vahşi Batı](/assets/uploads/2012/06/VahsiBati.jpg "XNA Oyun : Vahşi Batı")

