---
layout: post
title: "Windows Phone 8 - XNA Oyunu / PlaneHunter"
date: 2013-02-18 10:00
author: engin.polat
comments: true
category: [XNA]
tags: [bool, class, const, constructor, content, Content.Load, displayorientation, draw, drawstring, elapsed, elapsedgametime, FromMilliseconds, gameloop, GameTime, getstate, intersects, isfullscreen, landscapeleft, landscaperight, loadcontent, nextdouble, prefferedbackbufferheight, prefferedbackbufferwidth, pressed, private, public, random, readonly, rectangle, sprite, spritebatch, spriteeffects, spritefont, state, static, supportedorientations, switch, texture2d, TimeSpan, TimeSpan.Zero, totalgametime, touchcollection, touchlocation, touchlocationstate, touchpanel, unloadcontent, update, vector2, xml, XNA, xna game studio]
---
Bu yazımı okumadan önce <a href="/kategori/windows-phone" title="enginpolat.com : Windows Phone" target="_blank" rel="noopener">Windows Phone</a> ve <a href="/kategori/xna/" title="enginpolat.com : XNA" target="_blank" rel="noopener">XNA</a> konusundaki diğer makalelerimi okumanızı öneririm.

Her zamanki gibi önce *görseller*;

![PlaneHunter : Background](/assets/uploads/2013/02/PlaneHunterBackground.png)![PlaneHunter : Coin](/assets/uploads/2013/02/PlaneHunterCoin.png)![PlaneHunter : Target1](/assets/uploads/2013/02/PlaneHunterTarget1.png)![PlaneHunter : Target2](/assets/uploads/2013/02/PlaneHunterTarget2.png)![PlaneHunter : Target3](/assets/uploads/2013/02/PlaneHunterTarget3.png)![PlaneHunter : Target4](/assets/uploads/2013/02/PlaneHunterTarget4.png)![PlaneHunter : Target5](/assets/uploads/2013/02/PlaneHunterTarget5.png)![PlaneHunter : Target6](/assets/uploads/2013/02/PlaneHunterTarget6.png)![PlaneHunter : Target7](/assets/uploads/2013/02/PlaneHunterTarget7.png)

Bir tane de *Sprite Font* dosyamız var, *HitCountFont.spritefont* ismini verdiğim dosyanın, *"yorum satırları kaldırılmış halini"* aşağıdaki gibi düzenledim;



&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;XnaContent xmlns:Graphics="Microsoft.Xna.Framework.Content.Pipeline.Graphics"&gt;
    &lt;Asset Type="Graphics:FontDescription"&gt;
        &lt;FontName&gt;Segoe UI Mono&lt;/FontName&gt;
        &lt;Size&gt;14&lt;/Size&gt;
        &lt;Spacing&gt;0&lt;/Spacing&gt;
        &lt;UseKerning&gt;true&lt;/UseKerning&gt;
        &lt;Style&gt;Regular&lt;/Style&gt;
        &lt;CharacterRegions&gt;
            &lt;CharacterRegion&gt;
                &lt;Start&gt;&#32;&lt;/Start&gt;
                &lt;End&gt;&#126;&lt;/End&gt;
            &lt;/CharacterRegion&gt;
        &lt;/CharacterRegions&gt;
    &lt;/Asset&gt;
&lt;/XnaContent&gt;</pre>

İlk olarak *XNA Game Studio 4.0* grubundaki **Windows Phone Game** şablonundan *PlaneHunter* isimli projeyi oluşturalım;

![Windows Phone : XNA Game Project Template](/assets/uploads/2013/02/PlaneHunter-1.png)

*Game1.cs* dosyasının ismini *GameLoop.cs* olarak değiştirdikten sonra, *Target* isminde yeni bir class ekleyelim;

<pre class="brush:csharp">public class Target
{
    public Texture2D Texture;

    public Vector2 Position;

    public Vector2 Velocity;

    public Rectangle Area;

    public SpriteEffects Effect;

    public bool IsAlive;

    public Target(Texture2D texture)
    {
        this.Texture = texture;

        this.IsAlive = true;

        this.Area = new Rectangle(0, 0, texture.Width, texture.Height);
    }
}</pre>

*Target* sınıfı sayesinde, ekrana getireceğimiz *hedef*'lerin ekranın neresinden çıkıp, hangi yöne doğru gideceğini, hedefin vurulup/vurulmadığını, *çarpışma testi* yapabilmek için ekranda kapladığı alanı ve hızını bileceğiz.

*GameLoop* sınıfına geri dönelim ve sınıf seviyesindeki değişkenlere aşağıdakileri ekleyelim;

<pre class="brush:csharp">private const int PENCERE_GENISLIK = 800;
private const int PENCERE_YUKSEKLIK = 480;

private Texture2D backgroundTexture;

private readonly Texture2D[] targetTextures = new Texture2D[7];

private Texture2D coinTexture;
private Rectangle coinPart;
private int coinPartIndex = 0;

private SpriteFont hitCountFont;
private int targetHitCount = 0;

private readonly List<target> targetList = new List</target><target>();

private TimeSpan lastTargetSpawnTime = TimeSpan.Zero;

private readonly Rectangle screenArea = new Rectangle(0, 0, PENCERE_GENISLIK, PENCERE_YUKSEKLIK);

private readonly Random r = new Random();</target></pre>

Yukarıdaki kodlar için daha önce yazmış olduğum <a href="/kategori/windows-phone" title="enginpolat.com : Windows Phone" target="_blank" rel="noopener">Windows Phone</a> ve <a href="/kategori/xna/" title="enginpolat.com : XNA" target="_blank" rel="noopener">XNA</a> konusundaki diğer makalelerimi okumanızı öneririm.

*GameLoop* sınıfının **constructor**'ında aşağıdaki atama işlerini yapalım;

<pre class="brush:csharp">graphics.PreferredBackBufferWidth = PENCERE_GENISLIK;
graphics.PreferredBackBufferHeight = PENCERE_YUKSEKLIK;
graphics.IsFullScreen = true;

graphics.SupportedOrientations = DisplayOrientation.LandscapeLeft | DisplayOrientation.LandscapeRight;</pre>

<a href="http://msdn.microsoft.com/library/microsoft.xna.framework.graphicsdevicemanager.supportedorientations" title="GraphicsDeviceManager SupportedOrientations Property" target="_blank" rel="noopener">SupportedOrientations</a> özelliğine <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.displayorientation" title="DisplayOrientation Enumeration" target="_blank" rel="noopener">DisplayOrientation</a> enum'ından *LandscapeLeft* ve *LandscapeRight* değerlerini atayarak, oyun ekranının telefon *dikey değil*, *yatay tutulduğunda* düzgün görüntüleneceğini tanımlamış olduk.

**LoadContent** method'unda <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.graphics.texture2d" title="Texture2D class" target="_blank" rel="noopener">Texture2D</a> tipindeki değişkenlerimize değer atayalım;

<pre class="brush:csharp">backgroundTexture = Content.Load&lt;Texture2D&gt;("PlaneHunterBackground");

coinTexture = Content.Load&lt;Texture2D&gt;("PlaneHunterCoin");
hitCountFont = Content.Load&lt;SpriteFont&gt;("PlaneHunterHitCountFont");

for (int i = 0; i < targetTextures.Length; i++)
{
    targetTextures[i] = Content.Load&lt;Texture2D&gt;("PlaneHunterTarget" + (i + 1));
}</pre>

**Update** method’unda *son hedef üretilme* zamanından itibaren yeterli süre geçmişse, yeni hedef oluşturmamız lazım;

</pre><pre class="brush:csharp">lastTargetSpawnTime += gameTime.ElapsedGameTime;

if (lastTargetSpawnTime > TimeSpan.FromMilliseconds(1500))
{
    Target t = new Target(targetTextures[r.Next(0, 7)]);
    switch (r.Next(0, 4))
    {
        case 0:
        default:
            t.Position = new Vector2(r.Next(100, 300), 480);
            t.Velocity = new Vector2((float)r.NextDouble() * 8 + 2, (float)r.NextDouble() * -4 - 2);
            t.Effect = SpriteEffects.FlipHorizontally;
            break;
        case 1:
            t.Position = new Vector2(r.Next(500, 700), 480);
            t.Velocity = new Vector2((float)r.NextDouble() * -8 - 2, (float)r.NextDouble() * -4 - 2);
            t.Effect = SpriteEffects.None;
            break;
        case 2:
            t.Position = new Vector2(r.Next(100, 300), 0);
            t.Velocity = new Vector2((float)r.NextDouble() * 8 + 2, (float)r.NextDouble() * 4 + 2);
            t.Effect = SpriteEffects.FlipHorizontally;
            break;
        case 3:
            t.Position = new Vector2(r.Next(500, 700), 0);
            t.Velocity = new Vector2((float)r.NextDouble() * -8 - 2, (float)r.NextDouble() * 4 + 2);
            t.Effect = SpriteEffects.None;
            break;
    }

    targetList.Add(t);

    lastTargetSpawnTime = TimeSpan.Zero;
}</pre>

Yeni hedef ekleyeceğimiz zaman öncelikle hedef'i ekranın dört köşesinden **rastgele** birtanesine koyup, **rastgele** hız veriyoruz. Böylece hedefler ekranın **rastgele** bir yerinden çıkıp rastgele hızla **rastgele** bir yöne doğru hareket edecek.

**Update** method'unda o esnada ekranda olan hedeflerin yerlerini ve ekranda kapladıkları alanı *güncelliyoruz*;

<pre class="brush:csharp">foreach (Target hedef in targetList)
{
    hedef.Position += hedef.Velocity;

    hedef.Area.X = (int)hedef.Position.X;
    hedef.Area.Y = (int)hedef.Position.Y;
}</pre>

**Windows Phone** oyunlarında, oyuncunun ekrana dokunduğu noktaların listesini <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touch.touchpanel" title="TouchPanel class" target="_blank" rel="noopener">TouchPanel</a> sınıfının *static* <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touch.touchpanel.getstate" title="TouchPanel class GetState method" target="_blank" rel="noopener">GetState</a> methodundan dönen <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touchcollection" title="TouchCollection Structure" target="_blank" rel="noopener">TouchCollection</a> ile alabilmekteyiz.

**TouchCollection** koleksiyonunun her bir elemanı <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touchlocation" title="TouchLocation structure" target="_blank" rel="noopener">TouchLocation</a> tipindedir, <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touchlocation.state" title="TouchLocation structure State property" target="_blank" rel="noopener">State</a> özelliğinin <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touchlocationstate" title="TouchLocationState Enumeration" target="_blank" rel="noopener">TouchLocationState</a> enum'ından *Pressed* değerinde olduğunu kontrol ederek, ilgili noktaya dokunulduğu durumu yakalayabilir, eğer bir hedef ile kesişiyorsa, hedefi öldürebiliriz;

<pre class="brush:csharp">TouchCollection tc = TouchPanel.GetState();
foreach (TouchLocation tl in tc)
{
    if (tl.State == TouchLocationState.Pressed)
    {
        Rectangle touchArea = new Rectangle((int)tl.Position.X, (int)tl.Position.Y, 1, 1);

        foreach (Target hedef in targetList)
        {
            if (hedef.Area.Intersects(touchArea))
            {
                hedef.Velocity = Vector2.Zero;

                hedef.IsAlive = false;

                targetHitCount++;
            }
        }
    }
}</pre>

**Update** method'unda, ekran sınırları dışına çıkan hedefleri *listeden çıkartmalıyız*. Eğer ekran dışına çıkan hedefleri listeden temizlemezsek, liste zamanla *çok büyüyecek*, telefonun kısıtlı olan hafızasını dolduracak ve oyunun önce *yavaşlamasına* sonra *kapanmasına* yol açabilecektir.

<pre class="brush:csharp">foreach (Target hedef in targetList)
{
    if (!hedef.Area.Intersects(screenArea))
    {
        targetList.Remove(hedef);

        break;
    }
}</pre>

**Draw** method'unda elimizdeki *arkaplan görselini*, *hayatta olan hedefleri*, *hayatta olmayan hedefler için kendi etrafında dönen altın görselini* ve toplam kaç hedefin vurulduğunu gösteren *skor*'u ekrana çizdireceğiz;

<pre class="brush:csharp">spriteBatch.Begin();

spriteBatch.Draw(backgroundTexture, Vector2.Zero, Color.White);

foreach (Target hedef in targetList)
{
    if (hedef.IsAlive)
    {
        spriteBatch.Draw(hedef.Texture, hedef.Position, null, Color.White, 0, Vector2.Zero, 1, hedef.Effect, 0);
    }
    else
    {
        spriteBatch.Draw(coinTexture, hedef.Position, coinPart, Color.White);
    }
}

spriteBatch.DrawString(hitCountFont, "Hit Count : " + targetHitCount, new Vector2(10, 10), Color.Black);
spriteBatch.DrawString(hitCountFont, "Hit Count : " + targetHitCount, new Vector2(9, 9), Color.White);

spriteBatch.End();


Oyunumuzdan bir kare;

![Windows Phone - XNA Oyunu : PlaneHunter](/assets/uploads/2013/02/PlaneHunter-2.png)

Oyunun kodlarını <a href="/assets/uploads/2013/02/PlaneHunter.rar" title="Windows Phone - XNA Game : PlaneHunter" target="_blank" rel="noopener">buradan</a> indirebilirsiniz.

