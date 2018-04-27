---
layout: post
title: "XNA oyunlarında saniyedeki kare sayısını (FPS) hesaplamak"
date: 2011-07-15 20:32
author: engin.polat
comments: true
category: [XNA]
tags: [bool, Color, content, Content.Load, double, draw, drawstring, fps, frame per second, GameTime, int, iskeydown, iskeyup, Keyboard.GetState, keyboardstate, loadcontent, milliseconds, spritebatch, spritefont, totalgametime, update, vector2, XNA, xna game studio]
---
Hemen her oyun’da, *saniyede çizilen ekran sayısı* (**FPS** - **Frame Per Second**) bilgisi *oyun penceresinde* gösterilir.

***FPS nedir?***

**FPS**, *oyunun bir saniye içerisinde oyun penceresine çizebildiği ekran sayısıdır*. Bizim animasyon olarak gördüğümüz akışlar aslında ardı ardına hızlı bir şekilde çizilen tek kare resimlerdir.

*Sinema filmleri bile aslında ekranda sırayla gösterilen tek kare resimlerden oluşmaktadır.*

İnsan gözü, *saniye 25 kare*’den büyük hızlarda tek kare resimleri, bir **akış** olarak algılar.

**XNA Framework**, *saniyede 60 kare* ekran çizmeye çalışır.

***Oyunlarımızda FPS nasıl hesaplarız?***

Formül aslında basit, <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.game.draw" target="_blank" rel="noopener">Draw()</a> method’unda bir değişkenin değerini *1 arttıracağız*. <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.game.update" target="_blank" rel="noopener">Update()</a> method’unda her saniye geçişinde değişkeni *sıfırlayacağız*.

***FPS bilgisini ekranda nasıl gösteririz?***

<a href="http://msdn.microsoft.com/library/microsoft.xna.framework.game.draw" target="_blank" rel="noopener">Draw()</a> method’unda değişkenin değerini ekranda gösterirsek, bir saniye içerisinde kaç defa <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.game.update" target="_blank" rel="noopener">Update()</a> method’unun çalıştırıldığını, yani *saniyedeki ekran sayısını* (**FPS**) göstermiş oluruz.

Şimdi yazacağımız örnek projede, klavyeden *boşluk* (*space*) tuşuna basıldığında **FPS** bilgisini ekranda göstereceğiz, tekrar basıldığında gizleyeceğiz.

***Örnek proje***

Öncelikle sınıf seviyesinde değişkenlerimizi oluşturalım;



int SaniyedeKareSayisi = 0;
double FPS = 0;
bool DetayGoster = false;
KeyboardState pks;</pre>

**Update()** method’unda **FPS** hesaplayalım;

<pre class="brush:csharp">KeyboardState ks = Keyboard.GetState();

if (pks.IsKeyDown(Keys.Space) &amp;&amp; ks.IsKeyUp(Keys.Space))
{
    DetayGoster = !DetayGoster;
}

if (DetayGoster &amp;&amp; gameTime.TotalGameTime.Milliseconds == 0)
{
    FPS = SaniyedeKareSayisi;
    SaniyedeKareSayisi = 0;
}

pks = ks;</pre>

Oyun penceresinde yazı gösterebilmek için, <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.graphics.spritefont" target="_blank" rel="noopener">SpriteFont</a> sınıfından bir değişkene ihtiyacımız olacak.

<pre class="brush:csharp">SpriteFont Arial;</pre>

**Content** projemize *Arial* isminde bir **SpriteFont** dosyası ekleyelim.

![XNA Oyun Programlama - FPS Hesaplama / SpriteFont Ekleme Dialog Kutusu](/assets/uploads/2011/07/AddSpriteFontDialog.png "XNA Oyun Programlama - FPS Hesaplama / SpriteFont Ekleme Dialog Kutusu")

<pre class="brush:xml">&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;XnaContent xmlns:Graphics="Microsoft.Xna.Framework.Content.Pipeline.Graphics"&gt;
  &lt;Asset Type="Graphics:FontDescription"&gt;
    &lt;FontName&gt;Arial&lt;/FontName&gt;
    &lt;Size&gt;24&lt;/Size&gt;
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

<a href="http://msdn.microsoft.com/library/microsoft.xna.framework.game.loadcontent" target="_blank" rel="noopener">LoadContent()</a> method’unda Arial değişkenimize değer atayalım;

<pre class="brush:csharp">Arial = Content.Load("Arial");</pre>

**Draw()** method’unda hesaplanan **FPS** bilgisini ekranda gösterelim;

<pre class="brush:csharp">spriteBatch.Begin();

if (DetayGoster)
{
    SaniyedeKareSayisi++;

    spriteBatch.DrawString(Arial, "FPS : " + FPS.ToString(), new Vector2(50, 50), Color.Black);
}

spriteBatch.End();


Artık oyun penceremizde *saniyedeki ekran sayısını* (**FPS**) gösterebiliriz.

![XNA Oyun Programlama - FPS Hesaplama Sonucu](/assets/uploads/2011/07/FPSGameScreen.png "XNA Oyun Programlama - FPS Hesaplama Sonucu")

<a href="/assets/uploads/2011/07/FPSOrnek.rar" target="_blank" rel="noopener">Oyunun kodlarını</a> indirmek için tıklayınız.

