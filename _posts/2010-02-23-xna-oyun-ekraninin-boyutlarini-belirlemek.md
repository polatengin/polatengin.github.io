---
layout: post
title: "XNA - Oyun ekranının boyutlarını belirlemek"
date: 2010-02-23 18:53
author: engin.polat
comments: true
category: [XNA]
tags: [backbufferheight, backbufferwidth, constructor, fullscreen, game, graphics, isfullscreen, oyun, prefferedbackbufferheight, prefferedbackbufferwidth, XNA]
---
**XNA** ile geliştirdiğiniz oyunlar varsayılan olarak **800 x 600** boyutlarında bir pencerede oynatılır.

Eğer siz bu pencereyi boyutlandırmak ve hatta **Tam Ekran** seçeneği eklemek isterseniz yapmanız gereken, oyun sınıfınızın **constructor**'ına aşağıdaki kodları eklemektir;



graphics.PreferredBackBufferWidth = 1024; /// Oyun penceresinin genişliği
graphics.PreferredBackBufferHeight = 768; /// Oyun penceresinin yüksekliği
graphics.IsFullScreen = true; /// Oyun pencerede mi oynatılacak, yoksa tam ekran mı olacak</pre>

Bu kodları <a title="enginpolat.com : XNA - Oyun Temelleri" href="/xna-oyun-temelleri/" target="_blank" rel="noopener">XNA - Oyun Temelleri</a> yazımda yaptığımız oyuna uygularsak;

<pre class="brush:csharp">public GameLoop()
{
    this.Window.Title = "XNA - Oyun Temelleri";
    graphics = new GraphicsDeviceManager(this);
    graphics.PreferredBackBufferWidth = 1024;
    graphics.PreferredBackBufferHeight = 768;
    graphics.IsFullScreen = true;
    Content.RootDirectory = "Content";
}


