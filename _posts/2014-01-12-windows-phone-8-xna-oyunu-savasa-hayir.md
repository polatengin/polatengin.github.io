---
layout: post
title: "Windows Phone 8 - XNA Oyunu / Savaşa Hayır"
date: 2014-01-12 08:00
author: engin.polat
comments: true
category: [XNA]
tags: [bool, class, const, constructor, content, Content.Load, draw, elapsed, elapsedgametime, FromMilliseconds, gameloop, GameTime, getstate, intersects, isfullscreen, loadcontent, nextdouble, prefferedbackbufferheight, prefferedbackbufferwidth, pressed, private, public, random, readonly, rectangle, sprite, spritebatch, spriteeffects, spritefont, state, static, switch, texture2d, TimeSpan, TimeSpan.Zero, totalgametime, touchcollection, touchlocation, touchlocationstate, touchpanel, unloadcontent, update, vector2, xml, XNA, xna game studio]
---
Bu yazımı okumadan önce <a href="/kategori/windows-phone" title="enginpolat.com : Windows Phone" target="_blank" rel="noopener">Windows Phone</a> ve <a href="/kategori/xna/" title="enginpolat.com : XNA" target="_blank" rel="noopener">XNA</a> konusundaki diğer makalelerimi okumanızı öneririm.

Önce görseller;

![Savaşa Hayır : Background](/assets/uploads/2014/01/Background.jpg)![Savaşa Hayır : Drop 1 0](/assets/uploads/2014/01/Drop1_0.png)![Savaşa Hayır : Drop 1 1](/assets/uploads/2014/01/Drop1_1.png)![Savaşa Hayır : Drop 2 0](/assets/uploads/2014/01/Drop2_0.png)![Savaşa Hayır : Drop 2 1](/assets/uploads/2014/01/Drop2_1.png)![Savaşa Hayır : Plane 0](/assets/uploads/2014/01/Plane0.png)![Savaşa Hayır : Plane 1](/assets/uploads/2014/01/Plane1.png)![Savaşa Hayır : Plane 2](/assets/uploads/2014/01/Plane2.png)![Savaşa Hayır : Plane 3](/assets/uploads/2014/01/Plane3.png)![Savaşa Hayır : Plane 4](/assets/uploads/2014/01/Plane4.png)![Savaşa Hayır : Plane 5](/assets/uploads/2014/01/Plane5.png)

İlk olarak *XNA Game Studio 4.0* grubundaki **Windows Phone Game** şablonundan *SavasaHayir* isimli projeyi oluşturalım;

![Windows Phone : XNA Game Project Template](/assets/uploads/2014/01/SavasaHayir-1.png)

*Game1.cs* dosyasının ismini *GameLoop.cs* olarak değiştirdikten sonra, *Plane* isminde yeni bir class ekleyelim;



public class Plane
{
    public Texture2D Texture;

    public int Location;

    public int Speed;
}</pre>

*Plane* sınıfı sayesinde, ekrana getireceğimiz uçakların telefon ekranındaki konumlarını, hızlarını ve görsellerini bileceğiz.

*Drop* isminde yeni bir class daha ekleyelim ve aşağıdaki kod parçası ile güncelleyelim;

<pre class="brush:csharp">public class Drop
{
    public bool IsBox;

    public bool IsParachute;

    public Vector2 Location;
}</pre>

*GameLoop* sınıfına geri dönelim ve sınıf seviyesindeki değişkenlere aşağıdakileri ekleyelim;

<pre class="brush:csharp">GraphicsDeviceManager graphics;
SpriteBatch spriteBatch;

Random r = new Random();

Texture2D BackgroundTexture;

Texture2D BoxTexture;
Texture2D BoxParachuteTexture;

Texture2D HumanTexture;
Texture2D HumanParachuteTexture;

Texture2D[] PlaneTextures = new Texture2D[6];

List&lt;Plane&gt; PlaneList = new List&lt;Plane&gt;();

List&lt;Drop&gt; DropList = new List&lt;Drop&gt;();

TimeSpan LastPlaneDate = TimeSpan.Zero;

int PlaneCount;
int DropCount;
int HelpCount;</pre>

Yukarıdaki kodlar için daha önce yazmış olduğum <a href="/kategori/windows-phone" title="enginpolat.com : Windows Phone" target="_blank" rel="noopener">Windows Phone</a> ve <a href="/kategori/xna/" title="enginpolat.com : XNA" target="_blank" rel="noopener">XNA</a> konusundaki diğer makalelerimi okumanızı öneririm.

*GameLoop* sınıfının **constructor**'ında aşağıdaki atama işlerini yapalım;

<pre class="brush:csharp">public GameLoop()
{
    graphics = new GraphicsDeviceManager(this);
    Content.RootDirectory = "Content";

    TargetElapsedTime = TimeSpan.FromTicks(333333);

    InactiveSleepTime = TimeSpan.FromSeconds(1);

    graphics.PreferredBackBufferWidth = 480;
    graphics.PreferredBackBufferHeight = 800;

    graphics.IsFullScreen = true;
}</pre>

**LoadContent** method'unda <a title="Texture2D class" href="http://msdn.microsoft.com/library/microsoft.xna.framework.graphics.texture2d" target="_blank" rel="noopener">Texture2D</a> tipindeki değişkenlerimize değer atayalım;

<pre class="brush:csharp">spriteBatch = new SpriteBatch(GraphicsDevice);

BackgroundTexture = Content.Load&lt;Texture2D&gt;("Background");

for (int iLoop = 0; iLoop < 6; iLoop++)
{
    PlaneTextures[iLoop] = Content.Load&lt;Texture2D&gt;("Plane" + iLoop);
}

BoxTexture = Content.Load&lt;Texture2D&gt;("Drop1_0");
BoxParachuteTexture = Content.Load&lt;Texture2D&gt;("Drop1_1");

HumanTexture = Content.Load&lt;Texture2D&gt;("Drop2_0");
HumanParachuteTexture = Content.Load&lt;Texture2D&gt;("Drop2_1");</pre>

**Update** method'unda *Plane* ve *Drop* listesindeki elemanların yerlerini güncelliyoruz;

</pre><pre class="brush:csharp">foreach (var plane in PlaneList)
{
    plane.Location += plane.Speed;
}

foreach (var drop in DropList)
{
    drop.Location.Y += 4;
}</pre>

Son uçak üretme zamanımızdan itibaren *5000ms* (*5sn*) geçtiyse yeni uçak üretme kodunu ekliyoruz;

<pre class="brush:csharp">LastPlaneDate += gameTime.ElapsedGameTime;

if (LastPlaneDate > TimeSpan.FromMilliseconds(5000))
{
    var plane = new Plane();

    plane.Texture = PlaneTextures[r.Next(0, 6)];

    plane.Speed = r.Next(3, 8);

    PlaneList.Add(plane);

    PlaneCount++;

    LastPlaneDate = TimeSpan.Zero;
}</pre>

**Windows Phone** oyunlarında, oyuncunun ekrana dokunduğu noktaların listesini <a title="TouchPanel class" href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touch.touchpanel" target="_blank" rel="noopener">TouchPanel</a> sınıfının *static* <a title="TouchPanel class GetState method" href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touch.touchpanel.getstate" target="_blank" rel="noopener">GetState</a> methodundan dönen <a title="TouchCollection Structure" href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touchcollection" target="_blank" rel="noopener">TouchCollection</a> ile alabilmekteyiz.

**TouchCollection** koleksiyonunun her bir elemanı <a title="TouchLocation structure" href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touchlocation" target="_blank" rel="noopener">TouchLocation</a> tipindedir, <a title="TouchLocation structure State property" href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touchlocation.state" target="_blank" rel="noopener">State</a> özelliğinin <a title="TouchLocationState Enumeration" href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.touchlocationstate" target="_blank" rel="noopener">TouchLocationState</a> enum'ından *Pressed* değerinde olduğunu kontrol ederek, ilgili noktaya dokunulduğu durumu yakalayabiliriz.

Eğer dokunulan nokta bir *Plane* ile kesişiyorsa, rastgele yeni bir *Drop* düşürebiliriz, *Drop* ile kesişiyorsa paraşütünün açılmasını sağlayabiliriz;

<pre class="brush:csharp">foreach (var tl in TouchPanel.GetState())
{
    if (tl.State == TouchLocationState.Pressed)
    {
        var touchArea = new Rectangle((int)tl.Position.X, (int)tl.Position.Y, 1, 1);

        foreach (var plane in PlaneList)
        {
            var planeArea = new Rectangle(plane.Location, 20, plane.Texture.Width, plane.Texture.Height);

            if (planeArea.Intersects(touchArea))
            {
                var drop = new Drop();

                drop.Location = new Vector2(tl.Position.X, 20);

                drop.IsBox = (r.Next(0, 2) == 0);

                DropList.Add(drop);

                DropCount++;

                return;
            }
        }

        foreach (var drop in DropList)
        {
            var dropArea = new Rectangle((int)drop.Location.X, (int)drop.Location.Y, 100, 200);

            if (!drop.IsParachute && dropArea.Intersects(touchArea))
            {
                drop.IsParachute = true;

                HelpCount++;

                return;
            }
        }
    }
}</pre>

Son olarak **Draw** method'unda elimizdeki *arkaplan görselini*, *ekrandaki uçakları*, paraşütü açılmış ve açılmamış nesneleri ekrana çizdireceğiz;

<pre class="brush:csharp">GraphicsDevice.Clear(Color.CornflowerBlue);

spriteBatch.Begin();

spriteBatch.Draw(BackgroundTexture, Vector2.Zero, Color.White);

foreach (var plane in PlaneList)
{
    spriteBatch.Draw(plane.Texture, new Vector2(plane.Location, 20), Color.White);
}

foreach (var drop in DropList)
{
    if (drop.IsBox && drop.IsParachute)
    {
        spriteBatch.Draw(BoxParachuteTexture, drop.Location, Color.White);
    }
    else if (drop.IsBox && !drop.IsParachute)
    {
        spriteBatch.Draw(BoxTexture, drop.Location, Color.White);
    }
    else if (!drop.IsBox && drop.IsParachute)
    {
        spriteBatch.Draw(HumanParachuteTexture, drop.Location, Color.White);
    }
    else
    {
        spriteBatch.Draw(HumanTexture, drop.Location, Color.White);
    }
}

spriteBatch.End();


Oyun'dan bir ekran görüntüsü;

![Savaşa Hayır : Screenshot](/assets/uploads/2014/01/SavasaHayir-2.jpg)

