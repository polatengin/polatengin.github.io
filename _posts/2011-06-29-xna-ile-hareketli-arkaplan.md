---
layout: post
title: "XNA ile Hareketli Arkaplan"
date: 2011-06-29 08:45
author: engin.polat
comments: true
category: [XNA]
tags: [begin, class, Color, const, constructor, draw, end, graphicsdevice, instance, iskeydown, LeftShift, position, PreferredBackBufferHeight, PreferredBackBufferWidth, public, readonly, RightShift, size, spritebatch, texture2d, update, vector2, XNA, xna game studio]
---
Bu yazımı okumadan önce <a href="/kategori/xna/" target="_blank">XNA ile Oyun Programlama</a> kategorisindeki diğer makalelerimi okumanızı tavsiye ederim.

Birçok oyunda *arkaplan görselinin* yavaşça **kaydığını** görmüşüzdür. Bu tarz bir etkiyi kendi oyunlarımızda nasıl sağlayacağımızı bu yazımda inceliyor olacağım.

Her zamanki gibi öncelikle görselleri paylaşarak başlıyorum;

<a href="/assets/uploads/2011/06/Uzay.png">![XNA ile Oyun Programlama - Uzay Arkaplan Resmi](/assets/uploads/2011/06/Uzay-300x150.png "XNA ile Oyun Programlama - Uzay Arkaplan Resmi")</a> <a href="/assets/uploads/2011/06/Ucak.png">![XNA ile Oyun Programlama - Uçak Resmi](/assets/uploads/2011/06/Ucak.png "XNA ile Oyun Programlama - Uçak Resmi")</a>

Öncelikle sınıf seviyesinde birkaç değişken/sabit (**readonly**, **const**) ile oyun penceremizin *özelliklerini* ayarlayalım;



private const int PENCERE_GENISLIK = 800;
private const int PENCERE_YUKSEKLIK = 600;

private readonly Color PENCERE_ARKAPLAN = Color.Black;</pre>

Oyun sınıfının **constructor**'ında ilgili *sabitleri* kullanalım;

<pre class="brush:csharp">graphics.PreferredBackBufferWidth = PENCERE_GENISLIK;
graphics.PreferredBackBufferHeight = PENCERE_YUKSEKLIK;</pre>

Oyun projemize, **Uzay** ve **Ucak** isimli iki tane *sınıf* (**class**) ekleyelim. Böylece arkaplan'da kayacak uzay görseli ile ilgili işleri **Uzay** sınıfında, klavye ile yöneteceğimiz uçak ile ilgili işleri de **Ucak** sınıfında gerçekleştirebileceğiz.

*Ucak.cs* dosyasında yeralan **Ucak** sınıfının yapacağı işler çok basit;

<pre class="brush:csharp">public class Ucak
{
    public Vector2 Position;
    public readonly Vector2 Size;

    public Texture2D Texture { get; private set; }

    public Ucak(Texture2D Texture)
    {
        this.Texture = Texture;
        this.Size = new Vector2(Texture.Width, Texture.Height);
    }
}</pre>

*Uzay.cs* dosyasında yeralan **Uzay** sınıfı ise, kendi **Update()** ve **Draw()** method'larına sahip olacak.** Draw()** method'unda sürekli arkaplan görselini kaydırarak oyun penceresine çizdirecek.

Bunu yapabilmek için, **SpriteBatch** sınıfından bir instance'a ihtiyaç duyacağız.

**Uzay** sınıfının **constructor**'ında ihtiyacımız olacak **SpriteBatch** tipinden bir parametre alacak ve sınıf seviyesinde bir değişkende saklayacağız;

<pre class="brush:csharp">public class Uzay
{
    private readonly Texture2D _Texture;
    private readonly Texture2D _TextureSecond;

    private float _Position = 0f;

    private readonly int _Width;

    private readonly SpriteBatch _SpriteBatch;

    public Uzay(Texture2D Texture, SpriteBatch SpriteBatch)
    {
        this._SpriteBatch = SpriteBatch;

        this._Texture = Texture;
        this._TextureSecond = Texture;

        this._Width = _Texture.Width;

        this._Position = 0;
    }

    public void Update()
    {
        _Position -= 0.5f;

        if (_Position < -_Width)
        {
            _Position += _Width;
        }
    }

    public void Draw()
    {
        _SpriteBatch.Draw(_Texture, new Vector2(_Position, 0), Color.White);
        _SpriteBatch.Draw(_TextureSecond, new Vector2(_Position + _Width, 0), Color.White);
    }
}</pre>

*Uzay* sınıfının **Update()** method'unda, arkaplan görselini sürekli *0.5* birim sola kaydırıyoruz.

*Not : Arkaplan görseli kaydıkça ekrandan dışarı çıkıyor olacak, arkaplansız kalmamak için aslında ekrana yanyana iki tane arkaplan görseli çizdiriyoruz.*

Gelelim bu sınıflardan değişkenlerimizi oluşturmaya ve oyun sınıfımıza *eklemeye*;

</pre><pre class="brush:csharp">private Uzay Arkaplan;
private Ucak SavasUcagi;

protected override void LoadContent()
{
    spriteBatch = new SpriteBatch(GraphicsDevice);

    Arkaplan = new Uzay(Content.Load&lt;Texture2D&gt;("Uzay"), spriteBatch);
    SavasUcagi = new Ucak(Content.Load&lt;Texture2D&gt;("Ucak"));
    SavasUcagi.Position = new Vector2(50, PENCERE_YUKSEKLIK / 2);
}</pre>

Oyunumuzun **Update()** method'unda, *klavye tuş vuruş durumlarına* göre uçağımızı kontrol ediyor olacağız. Ayrıca *Arkaplan* değişkeninde bulunan *Uzay sınıfının* **instance**'ından **Update()** method'unu çağırıyor olacağız. Böylece arkaplan görseli *0.5 birim* sola kaymış olacak ve oyun penceresine yeni yerinde çizilecek.

<pre class="brush:csharp">protected override void Update(GameTime gameTime)
{
    KeyboardState ks = Keyboard.GetState();

    if (ks.IsKeyDown(Keys.Escape))
        this.Exit();

    if (ks.IsKeyDown(Keys.Left))
        SavasUcagi.Position.X -= (ks.IsKeyDown(Keys.LeftShift) || ks.IsKeyDown(Keys.RightShift)) ? 6 : 3;

    if (ks.IsKeyDown(Keys.Right))
        SavasUcagi.Position.X += (ks.IsKeyDown(Keys.LeftShift) || ks.IsKeyDown(Keys.RightShift)) ? 6 : 3;

    if (ks.IsKeyDown(Keys.Up))
        SavasUcagi.Position.Y -= 3;

    if (ks.IsKeyDown(Keys.Down))
        SavasUcagi.Position.Y += 3;

    if (SavasUcagi.Position.X < 0)
        SavasUcagi.Position.X = 0;

    if (SavasUcagi.Position.X > PENCERE_GENISLIK - SavasUcagi.Size.X)
        SavasUcagi.Position.X = PENCERE_GENISLIK - SavasUcagi.Size.X;

    if (SavasUcagi.Position.Y < 0)
        SavasUcagi.Position.Y = 0;

    if (SavasUcagi.Position.Y > PENCERE_YUKSEKLIK - SavasUcagi.Size.Y)
        SavasUcagi.Position.Y = PENCERE_YUKSEKLIK - SavasUcagi.Size.Y;

    Arkaplan.Update();

    base.Update(gameTime);
}</pre>

Uçağı *sağa/sola* yönetmek için kullandığımız ok tuşlarına (**Left** - **Right**) basılırken, *Shift* tuşlarından birine (**LeftShift** - **RightShift**) basılıyorsa, uçağı normalin iki katı hızlı ilerletiyoruz (*3 birim yerine 6 birim*)

Son olarak, **Draw()** method'unda uçağı ekrana çizdirecek ve *Uzay sınıfının* **instance**'ının (*Arkaplan değişkeni*) **Draw()** method'unu çağıracağız;

<pre class="brush:csharp">protected override void Draw(GameTime gameTime)
{
    GraphicsDevice.Clear(PENCERE_ARKAPLAN);

    spriteBatch.Begin();

    Arkaplan.Draw();
    spriteBatch.Draw(SavasUcagi.Texture, SavasUcagi.Position, Color.White);

    spriteBatch.End();

    base.Draw(gameTime);
}


Sonuç olarak, yukarıdaki kodları yazdıktan sonra oyun projemizi başlatırsak;

![XNA ile Oyun Programlama - Hareketli Arka Plan Ekran Görüntüsü](/assets/uploads/2011/06/HareketliArkaPlan.jpg "XNA ile Oyun Programlama - Hareketli Arka Plan Ekran Görüntüsü")

Hareketli ArkaPlan oyun projemizin kodlarını <a href="/assets/uploads/2011/06/HareketliArkaPlan.rar" target="_blank">buradan</a> indirebilirsiniz.

