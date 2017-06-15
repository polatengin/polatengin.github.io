---
layout: post
title: "XNA ile Video Oynatmak"
date: 2011-07-01 08:30
author: engin.polat
comments: true
category: [C#]
tags: [Content.Load, contentpipeline, draw, GetTexture, instance, loadcontent, media, method, play, spritebatch, texture2d, vector2, video, video format, videoplayer, XNA]
---
Bu yazıyı okumadan önce <a href="http://www.enginpolat.com/kategori/xna" target="_blank">XNA ile Oyun Programlama</a> kategorisindeki diğer yazılarımı okumanızı *tavsiye ederim*.

Belli bir seviyenin üstündeki her oyunda, *oyunu tanıtan*, *oyuna alışmanızı sağlayan*, *oyunun hikayesini anlatan* veya *bölümler arasında bilgi veren* **videolar** vardır.

Oyunun kullanıcılarına, oyunun konusunu okumaları için sayfalarca **yazı** vermektense, **kısa bir video** ile anlatmak *her zaman* daha iyidir.

***XNA ile bir video nasıl oynatılır?***

Öncelikle oyunumuza ekleyeceğimiz video'nun **formatına** dikkat etmemiz gerekiyor. Varsayılan olarak, <a href="http://blogs.msdn.com/b/xna/archive/2006/08/29/730168.aspx" target="_blank">XNA Content Pipeline</a> sadece **WMV** formatındaki videoları **destekler**.

![XNA ile Oyun Programlama - Content Pipeline Desteklenen Video Formatları](/assets/uploads/2011/06/VideoFormatlari.png "XNA ile Oyun Programlama - Content Pipeline Desteklenen Video Formatları")

Bir video'yu oyun penceresinde **oynatmak** için, öncelikle <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.media.video" target="_blank">Video</a> sınıfından bir **instance**'a oynatacağımız *video*'yu yüklememiz lazım.

Daha sonra, **XNA Framework** ile birlikte gelen <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.media.videoplayer" target="_blank">VideoPlayer</a> sınıfından bir **instance** ile, yüklediğimiz *video*'yu oynatmaya başlayabiliriz.

**Sınıf seviyesinde** iki değişken tanımlayarak işe başlıyoruz;



Video v;
VideoPlayer vp;</pre>

<a href="http://msdn.microsoft.com/library/microsoft.xna.framework.game.loadcontent" target="_blank">LoadContent()</a> method'unda değişkenlerimize *değer atamalarını* yapıyoruz;

<pre class="brush:csharp">v = Content.Load&lt;Video&gt;("OyunBaslangicVideo");
vp = new VideoPlayer();

vp.Play(v);</pre>

**VideoPlayer** tipindeki değişkenin <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.media.videoplayer.play" target="_blank">Play()</a> method'unu çağırarak *video* dosyamızın **oynatılmasını** sağlıyoruz.

Artık tek yapmamız gereken, <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.game.draw" target="_blank">Draw()</a> method'unda, oynatılan *video*'yu **kare kare** oyun penceresine çizmek;

<pre class="brush:csharp">spriteBatch.Begin();

spriteBatch.Draw(vp.GetTexture(), Vector2.Zero, Color.Blue);

spriteBatch.End();


**XNA**, **VideoPlayer** sınıfının <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.media.videoplayer.gettexture" target="_blank">GetTexture()</a> method'u ile oynatılan video'nun o anki karesini <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.graphics.texture2d" target="_blank">Texture2D</a> tipinde kullanmamızı sağlar.

<a href="http://msdn.microsoft.com/library/microsoft.xna.framework.graphics.spritebatch" target="_blank">SpriteBatch</a> sınıfının <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.graphics.spritebatch.draw" target="_blank">Draw()</a> method'u sayesinde ilgili video karesini oyun penceresine *çizebiliriz*.

