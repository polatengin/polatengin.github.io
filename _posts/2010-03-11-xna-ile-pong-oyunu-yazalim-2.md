---
layout: post
title: "XNA ile Pong oyunu yazalım – 2"
date: 2010-03-11 10:00
author: engin.polat
comments: true
category: [XNA]
tags: [content, CreateInstance, draw, drawstring, islooped, method, play, ses, sound, SoundEffect, SoundEffectInstance, spritefont, update, volume, XNA]
---
[XNA ile Pong oyunu yazalım - 1](http://www.enginpolat.com/xna-ile-pong-oyunu-yazalim-1/) yazıma bu yazı ile devam ediyorum.

**XNA** ile ekrana yazı yazdırmak için öncelikle *Content* projesi içerisinde bir **spritefont** dosyası oluşturmalıyız.

**Pong** projesi için ben *Arial.spritefont* ismini verdiğim dosyayı oluşturdum, "yorum satırları kaldırılmış halini" aşağıdaki gibi düzenledim;



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

Gördüğünüz gibi, **font** dosyası aslında font'un özelliklerini yazdığımız bir **Xml** dosyası.

*GameLoop* sınıfının değişkenlerine *Arial* font dosyamızı yükleyeceğimiz değişkeni de ekleyelim;

<pre class="brush:csharp">SpriteFont Arial;</pre>

*LoadContent()* method'unda *Arial.spritefont* dosyasını *Arial* değişkenine yükleyelim;

<pre class="brush:csharp">Arial = Content.Load&lt;SpriteFont&gt;("Arial");</pre>

Şimdi *Draw()* **method**'una aşağıdaki kodları ekleyerek, oyuncuların skorlarını **ekrana yazdıralım**;

<pre class="brush:csharp">spriteBatch.DrawString(Arial, "Oyuncu 1 : " + Oyuncu1Skor, new Vector2((float)(PENCERE_GENISLIK * 0.05), 30), Color.Yellow);
spriteBatch.DrawString(Arial, "Oyuncu 2 : " + Oyuncu2Skor, new Vector2((float)(PENCERE_GENISLIK * 0.80), 30), Color.Yellow);</pre>

Bu kod parçası ile, spriteBatch değişkeninde yeralan *DrawString()* method'unu kullandık. *DrawString()* method'unun parametrelerine bakacak olursak;


*   Birinci parametre olarak, spritefont tipinde bir değişken alır
*   İkinci parametre, ekrana yazdırmak istediğimiz yazıdır
*   Üçüncü parametre olarak Vector2 tipinde yazıyı nereye yazacağımız bilgisini ister
*   Son olarak, yazının rengini verdiğimiz dördüncü parametre vardır
Biz, Pong oyununda ilk oyuncunun skorunu ekranın %5 kadar içine, ikinci oyuncunun skorunu ise ekranın %20 kadar içine yazdırdık.

Gelelim, oyunda ses çıkartmaya;

Öncelikle **wav** formatında iki ses dosyasını **Content** içerisine sürükleyip bırakalım.

**Class** seviyesindeki değişkenlere iki tane daha ekleyelim;

<pre class="brush:csharp">SoundEffectInstance ArkaplanSes;
SoundEffectInstance SkorSes;</pre>

*LoadContent()* method'unda bu değişkenlerin değerlerini atayalım;

<pre class="brush:csharp">ArkaplanSes = Content.Load&lt;SoundEffect&gt;("Pong").CreateInstance();
SkorSes = Content.Load&lt;SoundEffect&gt;("recycle").CreateInstance();</pre>

Gördüğünüz gibi, *SoundEffectInstance* tipinde iki değişken tanımladık. Bu değişkenlere *Content* içindeki ses dosyalarını yüklerken, *SoundEffect* tipinin *CreateInstance()* **method**'unu kullandık.

Böylece ses değişkenlerimiz **kullanıma hazır** hale geldi.

*LoadContent()* method'una aşağıdaki kodları da ekleyerek, arkaplanda çalacak ses değişkeninin sesini %20 oranına düşürelim ve **loop** olmasını sağlayalım (Böylece ses dosyasının sonuna geldiğinde başa dönüp çalmaya devam edecek).

Son olarak *Play()* methodu ile, ses dosyasını çalmaya başlayalım;

<pre class="brush:csharp">ArkaplanSes.Volume = 0.2f;
ArkaplanSes.IsLooped = true;
ArkaplanSes.Play();</pre>

*Update()* method'unda oyuncuların skor kazandığı kodlara aşağıdaki satırı da ekleyelim;

<pre class="brush:csharp">SkorSes.Play();


Böylece oyuncular skor yaptıkça, SkorSes değişkeninde yüklü olan ses dosyası çalınacak.

İşte Pong oyunundan ekran görüntüsü. Oyunun kaynak kodlarını <a title="enginpolat.com : XNA ile Pong oyunu yazalım - 2 / Kodlar" href="/assets/uploads/2010/03/XNA_Pong.rar" target="_blank">buradan</a> indirebilirsiniz.

<a href="/assets/uploads/2010/03/XNA_Pong.png">![XNA Pong oyunun bitmiş hali](/assets/uploads/2010/03/XNA_Pong.png "XNA_Pong")</a>

