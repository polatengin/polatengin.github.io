---
layout: post
title: "XNA ile Karakter Hareketi"
date: 2011-07-11 22:32
author: engin.polat
comments: true
category: [XNA]
tags: [Color, content, Content.Load, draw, getstate, graphics, graphicsdevice, GraphicsDeviceManager, iskeydown, Keyboard.GetState, keyboardstate, loadcontent, PreferredBackBufferHeight, PreferredBackBufferWidth, rectangle, sprite, spritebatch, texture2d, unloadcontent, update, vector2, XNA, xna game studio]
---
Bu yazımı okumadan önce <a href="/kategori/xna/" target="_blank" rel="noopener">XNA ile Oyun Programlama</a> konulu diğer yazılarımı okumanızı tavsiye ederim.

Her oyunda bir **ana karakter** vardır ve biz oyuncular olarak, bu ana karakteri *mouse*/*klavye*/*joystik* aracılığıyla **oyun evreninde** kontrol ederiz.

Bu yazımda önce bir oyun evreni **oluşturacak**, sonra da ana oyun karakterini bu evrende **hareket ettireceğiz**.

Önce oyunda kullanacağımız görselleri bilgisayarımıza indirelim;

<a href="/assets/uploads/2011/07/Cim.png">![XNA ile Oyun Programlama - Karakter Hareket Çim ArkaPlan](/assets/uploads/2011/07/Cim-150x150.png "XNA ile Oyun Programlama - Karakter Hareket Çim ArkaPlan")</a> <a href="/assets/uploads/2011/07/KarakterSprite.png">![XNA ile Oyun Programlama - Karakter Hareket Sprite](/assets/uploads/2011/07/KarakterSprite-150x128.png "XNA ile Oyun Programlama - Karakter Hareket Sprite")</a>

Öncelikle *arkaplan* ve *ana karakterimiz* için sınıf seviyesinde değişkenlerimizi oluşturalım;



Texture2D KarakterSprite;
Texture2D ArkaplanCim;</pre>

Klavye bilgisini alabilmek için <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.input.keyboardstate" target="_blank" rel="noopener">KeyboardState</a> sınıfından bir değişken ekleyelim;

<pre class="brush:csharp">KeyboardState ks;</pre>

<a href="http://msdn.microsoft.com/library/microsoft.xna.framework.vector2" target="_blank" rel="noopener">Vector2</a> sınıfından bir değişken ile, ana karakterimizin oyun penceresinde konumunu tutalım;

<pre class="brush:csharp">Vector2 KarakterKonum;</pre>

Oyun sınıfının **constructor**'ında (*Game1* ismini **GameLoop** olarak değiştirelim) *KarakterKonum* değişkenine başlangıç değerini verelim;

<pre class="brush:csharp">public GameLoop()
{
    graphics = new GraphicsDeviceManager(this);
    Content.RootDirectory = "Content";

    KarakterKonum = new Vector2(50, 50);
}</pre>

**LoadContent()** method'unda *ArkaplanCim* ve *KarakterSprite* değişkenlerine değer atayalım;

<pre class="brush:csharp">protected override void LoadContent()
{
    spriteBatch = new SpriteBatch(GraphicsDevice);

    KarakterSprite = Content.Load&lt;Texture2D&gt;("KarakterSprite");
    ArkaplanCim = Content.Load&lt;Texture2D&gt;("Cim");
}</pre>

*KarakterSprite* görselinde, karakterimizin dört yöne yapacağı hareketlerin tek tek görüntüleri yer alıyor.

Karakterimize **yürüme efekti** vermek için, aslında **birden fazla** görselden oluşan **tek bir** görsel kullanıyoruz. (*Böylece hafızaya tek bir görsel yüklendiği için hafıza kullanımını az tutmuş oluyoruz*)

Sırayla görselin *herbir parçasını* ekranda karakterimiz olarak çizdiğimizde, karaktere **yürüme efektini** vermiş oluyoruz.

Bir **Sprite**'ın bir parçasını ekrana çizdirmek için, <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.graphics.spritebatch" target="_blank" rel="noopener">SpriteBatch</a> sınıfının <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.graphics.spritebatch.draw" target="_blank" rel="noopener">Draw()</a> method'undan faydalanırız;

<pre class="brush:csharp">SpriteBatch.Draw(Texture2D, Vector2, Rectangle, Color);</pre>

Bu method'un parametreleri;



*   **Texture2D**, ekrana çizdireceğimiz görselin bulunduğu görseli yüklediğimiz değişken
*   **Vector2**, görselin ekranda çizileceği konum
*   **Rectangle**, görselin ekrana çizilecek parçası (Left-Top-Width-Height isminde dört özelliği vardır)
*   **Color**, görsele uygulanacak baskın renk değişkeni

Sınıf seviyesine aşağıdaki değişkenleri ekleyerek devam edelim;

<pre class="brush:csharp">Rectangle Arkaplan;
Rectangle Karakter;

int Kare = 0;

int Yon = 0;</pre>

**GameLoop** sınıfının **constructor**'ına;

<pre class="brush:csharp">Arkaplan = new Rectangle(0, 0, graphics.PreferredBackBufferWidth, graphics.PreferredBackBufferHeight);</pre>

ekleyelim. Böylece, arkaplan görselinin çizileceği alanı tanımlamış olduk.

Oyun kodlarımızın en önemli iki methodundan biri, **Update()** method'udur;

<pre class="brush:csharp">ks = Keyboard.GetState();

if (ks.IsKeyDown(Keys.Escape))
{
    this.Exit();
}

if (ks.IsKeyDown(Keys.Down))
{
    Yon = 0;
    Kare++;
    KarakterKonum.Y += 3;
}
else if (ks.IsKeyDown(Keys.Up))
{
    Yon = 1;
    Kare++;
    KarakterKonum.Y -= 3;
}
else if (ks.IsKeyDown(Keys.Left))
{
    Yon = 2;
    Kare++;
    KarakterKonum.X -= 3;
}
else if (ks.IsKeyDown(Keys.Right))
{
    Yon = 3;
    Kare++;
    KarakterKonum.X += 3;
}

if (Kare > 5)
{
    Kare = 0;
}</pre>

Her bir yön tuşuna basıldığında *Yon* değişkenini farklı bir değere atadık. Ayrıca *Kare* değişkeninin değerini de bir artırdık.

*KarakterSprite* görselinde karakter'in **yürüme efekti** için yana doğru 6 görsel kullanıldığını görüyoruz. Kare değişkeni 5 değerinden büyük bir değere ulaştığında 0 değerine eşitleyip değişkeni sıfırlamış oluyoruz.

Her yön tuşuna basıldığında *Yon* değişkenine verdiğimiz değer, *KarakterSprite* görselinde ilgili tuşa ait yönün yukarıdan aşağıya sıra numarası aynı zamanda.

Son adımda, **Draw()** method'unu yazıyoruz;

<pre class="brush:csharp">GraphicsDevice.Clear(Color.CornflowerBlue);

Karakter = new Rectangle(Kare * 24, Yon * 32, 24, 32);

spriteBatch.Begin();

spriteBatch.Draw(ArkaplanCim, Arkaplan, Color.White);
spriteBatch.Draw(KarakterSprite, KarakterKonum, Karakter, Color.White);

spriteBatch.End();


Öncelikle <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.rectangle" target="_blank" rel="noopener">Rectangle</a> tipinde *Karakter* değişkenine, *KarakterSprite* değişkeninin hangi **parçasını** ekrana çizmek istediğimizi belirteceğimiz değeri atıyoruz.

Sonra *arkaplan* ve *karakterimizi* oyun penceresine **çizdiriyoruz**.

![XNA ile Oyun Programlama - Karakter Hareket Oyun Ekranı](/assets/uploads/2011/07/XNAKarakterHareket.png "XNA ile Oyun Programlama - Karakter Hareket Oyun Ekranı")

<a href="/assets/uploads/2011/07/KarakterHareket.rar" target="_blank" rel="noopener">Oyunun kodlarını</a> indirmek için tıklayınız.

