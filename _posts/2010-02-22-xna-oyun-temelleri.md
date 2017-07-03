---
layout: post
title: "XNA - Oyun Temelleri"
date: 2010-02-22 17:52
author: engin.polat
comments: true
category: [XNA]
tags: [constructor, content, draw, getstate, iskeydown, keyboard, keyboardstate, loadcontent, location, rectangle, spritebatch, texture2d, update, vector2, XNA, xna game studio]
---
**XNA** ile oyun geliştirmeye başlamadan önce, ekrana nasıl çizim yapabileceğimizi öğrenmemiz gerekiyor.

***Not :** Buradan ileriye devam etmeden önce <a title="enginpolat.com : XNA - Başlangıç" href="http://www.enginpolat.com/xna-baslangic/" target="_blank">XNA - Başlangıç</a> yazımı okumanızı tavsiye ederim.*

Öncelikle, ihtiyacımız olacak iki görseli bilgisayarınıza kopyalamanız gerekiyor;

<a href="/assets/uploads/2010/02/fil.jpg">![Fil Resmi - Arkaplan olarak kullanılacak](/assets/uploads/2010/02/fil-150x150.jpg "fil")</a> <a href="/assets/uploads/2010/02/ari.png">![Arı Resmi](/assets/uploads/2010/02/ari.png "ari")</a>

*Solution Explorer*'da *Content* üzerine sağ tuşla tıklayarak *ari.png* ve *fil.png* dosyalarını projeye ekleyelim.

*GameLoop.cs* dosyamızda class seviyesinde *Texture2D* tipinde iki değişken oluşturalım;


Texture2D ArkaPlan;
Texture2D Ari;</pre>
Daha sonra bu değişkenlere resimleri yükleyeceğiz. Aynı yere bir tane de *Rectangle* tipinde değişken oluşturalım.
<pre class="brush:csharp">Rectangle OyunPencere;</pre>
Bu değişkene ekranımızın boyutlarını yüklüyor olacağız.

*LoadContent()* method'unda bu değişkenlerin değerlerini atayalım;
<pre class="brush:csharp">OyunPencere = new Rectangle(0, 0, graphics.GraphicsDevice.Viewport.Width, graphics.GraphicsDevice.Viewport.Height);
ArkaPlan = Content.Load&lt;Texture2D&gt;("fil");
Ari = Content.Load&lt;Texture2D&gt;("ari");</pre>
*GameLoop* class'ının **constructor**'ında oyunumuzun başlığını değiştirebiliriz;
<pre class="brush:csharp">public GameLoop()
{
    this.Window.Title = "XNA - Oyun Temelleri";
    graphics = new GraphicsDeviceManager(this);
    Content.RootDirectory = "Content";
}</pre>
*Draw()* method'unda resimlerin ekrana çizim işlerini yapacağız. Çizime işlemlerini *Begin()* ve *End()* methodları arasında yapmamız gerekiyor;
<pre class="brush:csharp">spriteBatch.Begin(SpriteBlendMode.AlphaBlend);
spriteBatch.Draw(ArkaPlan, OyunPencere, Color.White);
spriteBatch.Draw(Ari, Vector2D.Zero, Color.White);
spriteBatch.End();</pre>
Bu durumda uygulamayı çalıştırırsak, karşımıza şöyle bir ekran gelir;

<a href="/assets/uploads/2010/02/XNA_OyunTemelleri_1.png">![XNA Oyun Temelleri](/assets/uploads/2010/02/XNA_OyunTemelleri_1.png "XNA OyunTemelleri")</a>

Şimdi arı resmini, klavye tuşlarını kullanarak ekranda hareket ettirelim. Öncelikle arı'nın ekrandaki konumunu tutan bir değişkene ihtiyacımız var, class seviyesindeki değişkenlere ekleyelim;
<pre class="brush:csharp">Vector2 Location = Vector2.Zero;</pre>
*Draw()* methodunda ari resmini çizdiğimiz satırı güncelleyelim;
<pre class="brush:csharp">spriteBatch.Draw(Ari, Location, Color.White);</pre>
Son olarak *Update()* method'umuzu güncelleyelim;
<pre class="brush:csharp">protected override void Update(GameTime gameTime)
{
    KeyboardState ks = Keyboard.GetState();

    if (ks.IsKeyDown(Keys.Escape))
        this.Exit();

    if (ks.IsKeyDown(Keys.Up))
        Location.Y -= 3;
    if (ks.IsKeyDown(Keys.Down))
        Location.Y += 3;
    if (ks.IsKeyDown(Keys.Left))
        Location.X -= 3;
    if (ks.IsKeyDown(Keys.Right))
        Location.X += 3;

    base.Update(gameTime);
}

Gördüğünüz gibi, klavyede o anda basılı tuşları *Keyboard.GetState()* ile *ks* değişkenine yüklüyoruz, sonra basit karşılaştırmalar ile *Location* değişkenimizin *X* ve *Y* değerlerini değiştiriyoruz.

*Draw()* method'unda ari'yi çizeceğimiz yer olarak *Location* değişkenini verdiğimiz için, klavyeyi kullanarak ari'yi hareket ettirebildiğimizi görüyoruz.

<a href="/assets/uploads/2010/02/XNA_OyunTemelleri_2.png">![XNA Oyun Temelleri](/assets/uploads/2010/02/XNA_OyunTemelleri_2.png "XNA Oyun Temelleri")</a>

Oyunun kaynak kodlarını <a title="enginpolat.com : XNA Temelleri" href="/assets/uploads/2010/02/XNA_OyunTemelleri.rar" target="_blank">buradan</a> indirebilirsiniz.

