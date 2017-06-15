---
layout: post
title: "Windows Phone 8 - XNA Oyunu / MiniCar"
date: 2015-01-22 15:45
author: engin.polat
comments: true
category: [C#]
tags: [bool, class, const, constructor, content, Content.Load, draw, elapsed, elapsedgametime, FromMilliseconds, gameloop, GameTime, getstate, intersects, isfullscreen, keyboardstate, loadcontent, prefferedbackbufferheight, prefferedbackbufferwidth, private, public, random, readonly, rectangle, SoundEffect, SoundEffectInstance, sprite, spritebatch, spritefont, state, static, texture2d, TimeSpan, TimeSpan.Zero, totalgametime, unloadcontent, update, vector2, XNA, xna game studio]
---
Bu yazımı okumadan önce <a title="enginpolat.com : Windows Phone" href="http://www.enginpolat.com/kategori/windows-phone" target="_blank">Windows Phone</a> ve <a title="enginpolat.com : XNA" href="http://www.enginpolat.com/kategori/xna/" target="_blank">XNA</a> konusundaki diğer makalelerimi okumanızı öneririm.

Önce görseller ve oyunun <a href="/assets/uploads/2015/01/BackgroundLoop.wav" target="_blank">arkaplan ses dosyası</a>;

![MiniCar : Background](/assets/uploads/2015/01/Background.jpg)![MiniCar : MainCar](/assets/uploads/2015/01/MainCar.png)![MiniCar : Car1](/assets/uploads/2015/01/Car1.png)![MiniCar : Car2](/assets/uploads/2015/01/Car2.png)![MiniCar : Car3](/assets/uploads/2015/01/Car3.png)![MiniCar : Car4](/assets/uploads/2015/01/Car4.png)![MiniCar : Car5](/assets/uploads/2015/01/Car5.png)![MiniCar : Car6](/assets/uploads/2015/01/Car6.png)![MiniCar : Car7](/assets/uploads/2015/01/Car7.png)![MiniCar : Car8](/assets/uploads/2015/01/Car8.png)

İlk olarak *XNA Game Studio 4.0* grubundaki **Windows Phone Game** şablonundan **MiniCarGame** isimli projeyi oluşturalım;

![Windows Phone : XNA Game Project Template](/assets/uploads/2014/02/MiniCarGame-1.png)

*Game1.cs* dosyasının ismini *GameLoop.cs* olarak değiştirdikten sonra, *EnemyCar* isminde yeni bir class ekleyelim;



public class EnemyCar
{
    public Texture2D Texture;

    public Vector2 Position;

    public float Velocity;

    public Rectangle Area;

    Random r = new Random();

    public EnemyCar(Texture2D CarTexture)
    {
        this.Texture = CarTexture;

        this.Position = new Vector2(r.Next(450, 850), 1);

        this.Velocity = (float)(r.NextDouble() * 4) + 3f;

        this.Area = new Rectangle((int)this.Position.X, (int)this.Position.Y, this.Texture.Width, this.Texture.Height);
    }
}</pre>

*EnemyCar* sınıfı sayesinde, ekrana getireceğimiz diğer araçların görsellerini, konumlarını, çarpışma testi yapabilmek için ekranda kapladığı alanı ve hızlarını bileceğiz.

*GameLoop* sınıfına geri dönelim ve sınıf seviyesindeki değişkenlere aşağıdakileri ekleyelim;

<pre class="brush:csharp">GraphicsDeviceManager graphics;
SpriteBatch spriteBatch;

const int PENCERE_GENISLIK = 800;
const int PENCERE_YUKSEKLIK = 480;

Texture2D BackgroundTexture1;
Texture2D BackgroundTexture2;

Vector2 BackgroundPosition1 = new Vector2(0, -PENCERE_YUKSEKLIK);
Vector2 BackgroundPosition2 = new Vector2(0, 0);

Texture2D MainCarTexture;
Vector2 MainCarPosition = new Vector2(300, 300);

float KatedilenMesafe = 0f;

Rectangle ScreenArea = new Rectangle(0, 0, PENCERE_GENISLIK, PENCERE_YUKSEKLIK);
Rectangle MainCarArea = new Rectangle(300, 300, 67, 134);

TimeSpan TotalElapsedTime;

List&lt;EnemyCar&gt; CarList = new List&lt;EnemyCar&gt;();

Random r = new Random();

Texture2D[] CarTextures = new Texture2D[8];</pre>

Klavyedeki hangi tuşlara basıldığını kontrol edebilmek için <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.keyboardstate" target="_blank">KeyboardState</a> değişkenlerimizi, arkaplanda sürekli tekrar eden ses çaldırmak için <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.audio.soundeffectinstance" target="_blank">SoundEffectInstance</a> değişkenimizi ve oyunun bittiğini takip edeceğimiz *bool* değişkeni de sınıf seviyesinde ekleyelim;

<pre class="brush:csharp">KeyboardState ks;
KeyboardState pks;

SoundEffectInstance BackgroundLoop;

bool IsGameOver = false;</pre>

İlk yapacağımız iş *GameLoop* sınıfının **constructor**'ında gerekli atamaları yapmak olacak;

<pre class="brush:csharp">public GameLoop()
{
    graphics = new GraphicsDeviceManager(this);
    Content.RootDirectory = "Content";

    graphics.PreferredBackBufferWidth = PENCERE_GENISLIK;
    graphics.PreferredBackBufferHeight = PENCERE_YUKSEKLIK;
    graphics.IsFullScreen = true;
}</pre>

*LoadContent()* methodunda değişkenlerimiz aracılığıyla ses ve resim dosyalarını hafızaya yüklüyoruz;

<pre class="brush:csharp">protected override void LoadContent()
{
    spriteBatch = new SpriteBatch(GraphicsDevice);

    BackgroundTexture1 = Content.Load&lt;Texture2D&gt;("BackgroundRoad");
    BackgroundTexture2 = BackgroundTexture1;
    MainCarTexture = Content.Load&lt;Texture2D&gt;("MainCar");

    MesafeFont = Content.Load&lt;SpriteFont&gt;("Verdana14");

    for (int i = 0; i < CarTextures.Length; i++)
    {
        CarTextures[i] = Content.Load&lt;Texture2D&lt;("Car" + (i + 2));
    }

    BackgroundLoop = Content.Load&lt;SoundEffect&gt;("BackgroundLoop").CreateInstance();

    GameOverFont = Content.Load&lt;SpriteFont&gt;("GameOverFont");

    BackgroundLoop.IsLooped = true;
    BackgroundLoop.Play();
}</pre>

*Update()* method'unda ilk olarak oyundan çıkma ve baştan başlama durumunu sağlayacak kodları yazıyoruz;

</pre><pre class="brush:csharp">ks = Keyboard.GetState();

if (ks.IsKeyDown(Keys.Escape))
{
    this.Exit();
}

if (IsGameOver && ks.IsKeyDown(Keys.Enter))
{
    IsGameOver = false;
    BackgroundLoop.Play();
    KatedilenMesafe = 0f;
    MainCarPosition = new Vector2(600, 600);
    MainCarArea.X = (int)MainCarPosition.X;
    MainCarArea.Y = (int)MainCarPosition.Y;
    CarList.Clear();
}</pre>

Eğer oyun sonlanmadıysa, klavyedeki tuşların durumuna göre arabamızı hareket ettiriyoruz, en son araba eklediğimiz zamandan itibaren belli bir sürenin üzerinde geçtiyse yeni EnemyCar ekliyoruz, EnemyCar listesindeki her bir arabayı hareket ettiriyoruz, yol görselini içeren arkaplanı hareket ettiriyoruz, katedilen mesafeyi güncelleyip, bizim arabamız ile diğer arabaların çarpışma testini yapıyoruz;

<pre class="brush:csharp">if (!IsGameOver)
{
    if (ks.IsKeyDown(Keys.Left))
    {
        MainCarPosition.X -= 3;
        MainCarArea.X -= 3;
    }
    if (ks.IsKeyDown(Keys.Right))
    {
        MainCarPosition.X += 3;
        MainCarArea.X += 3;
    }
    if (ks.IsKeyDown(Keys.Up))
    {
        MainCarPosition.Y -= 3;
        MainCarArea.Y -= 3;
    }
    if (ks.IsKeyDown(Keys.Down))
    {
        MainCarPosition.Y += 3;
        MainCarArea.Y += 3;
    }

    TotalElapsedTime += gameTime.ElapsedGameTime;

    if (TotalElapsedTime &gt; TimeSpan.FromMilliseconds(1500))
    {
        EnemyCar car = new EnemyCar(CarTextures[r.Next(0, 8)]);

        CarList.Add(car);

        TotalElapsedTime = TimeSpan.Zero;
    }

    foreach (EnemyCar car in CarList)
    {
        car.Position.Y += car.Velocity;
        car.Area.Y = (int)car.Position.Y;
    }

    BackgroundPosition1.Y += 2;
    BackgroundPosition2.Y += 2;

    if (BackgroundPosition2.Y &gt; PENCERE_YUKSEKLIK)
    {
        BackgroundPosition1.Y = -PENCERE_YUKSEKLIK;
        BackgroundPosition2.Y = 0;
    }

    KatedilenMesafe += 0.005f;

    foreach (EnemyCar car in CarList)
    {
        if (car.Area.Intersects(MainCarArea))
        {
            IsGameOver = true;
            BackgroundLoop.Stop();
        }
    }
}</pre>

Son olarak *Update()* methodunun son satırında *KeyboardState*'i pks değişkenine atyoruz;

<pre class="brush:csharp">pks = ks;</pre>

*Draw()* methodunda kendi arabamızı, diğer arabaları ve katettiğimiz mesafeyi ekrana çiziyoruz;

<pre class="brush:csharp">GraphicsDevice.Clear(Color.CornflowerBlue);

spriteBatch.Begin();

spriteBatch.Draw(BackgroundTexture1, BackgroundPosition1, Color.White);
spriteBatch.Draw(BackgroundTexture2, BackgroundPosition2, Color.White);

spriteBatch.Draw(MainCarTexture, MainCarPosition, Color.White);

spriteBatch.DrawString(MesafeFont, "Katedilen Mesafe: " + KatedilenMesafe.ToString("N2") + " km", new Vector2(51, 51), Color.Black);
spriteBatch.DrawString(MesafeFont, "Katedilen Mesafe: " + KatedilenMesafe.ToString("N2") + " km", new Vector2(50, 50), Color.White);

foreach (EnemyCar car in CarList)
{
    spriteBatch.Draw(car.Texture, car.Position, Color.White);
}

if (IsGameOver)
{
    spriteBatch.DrawString(GameOverFont, "GAME OVER", new Vector2(433, 353), Color.Yellow);
    spriteBatch.DrawString(GameOverFont, "GAME OVER", new Vector2(430, 350), Color.Red);
}

spriteBatch.End();


