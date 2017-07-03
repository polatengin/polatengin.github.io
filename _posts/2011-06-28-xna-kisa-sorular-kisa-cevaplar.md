---
layout: post
title: "XNA - Kısa sorular, Kısa cevaplar"
date: 2011-06-28 10:54
author: engin.polat
comments: true
category: [XNA]
tags: [class, GameTime, GraphicsDeviceManager, initialize, IsActive, isfullscreen, IsMouseVisible, mouse, PreferredBackBufferHeight, PreferredBackBufferWidth, protected, public, ToggleFullScreen, update, void, Window.Title, XNA, xna game studio]
---
***Mouse ikonumu bulamıyorum?***

Evet, varsayılan olarak **XNA**, **oyun penceresi** içerisinde **mouse** ikonunu gizler. Eğer mouse’u görmek istiyorsanız;



this.IsMouseVisible = true;</pre>

kodunu eklemeniz gerekir.

***Oyunu farklı çözünürlükte çalıştırmak istiyorum***

**XNA ile oyun geliştirmeye** çalışan her programcının çok kısa süre sonra merak ettiği bir sorudur bu.

*Çözüm;*

<pre class="”brush:csharp”">public Game1()
{
    graphics = new GraphicsDeviceManager(this);

    Content.RootDirectory = "Content";

    /// Oyun penceresinin çözünürlüğünü 1920x1080 ayarlar
    this.graphics.PreferredBackBufferWidth = 1920;
    this.graphics.PreferredBackBufferHeight = 1080;
}</pre>

*Not : Bu konu ile ilgili <a href="http://www.enginpolat.com/xna-oyun-ekraninin-boyutlarini-belirlemek/" target="_blank">XNA - Oyun ekranının boyutlarını belirlemek</a> yazımı okumanızı tavsiye ederim.*

***Oyunumu tam ekran oynatmak istiyorum***

Çözünürlüğü değiştirdikten hemen sonra, **tam ekran** oyun nasıl oynatılır? sorusu gelir;

<pre class="”brush:csharp”">protected override void Initialize()
{
    /// Eğer tam ekran değilse, tam ekran moduna geç!
    if (!graphics.IsFullScreen)
    {
        graphics.ToggleFullScreen();
    }

    base.Initialize();
}</pre>

*Not : Bu konu ile ilgili <a href="http://www.enginpolat.com/xna-oyun-ekraninin-boyutlarini-belirlemek/" target="_blank">XNA - Oyun ekranının boyutlarını belirlemek</a> yazımı okumanızı tavsiye ederim.*

***Oyun penceremin aktif olup/olmadığını nasıl anlarım?***

Windows oyunları o anda çalışan *tek uygulama* olmayabilirler. Oyuncular, oyun oynarken, email adreslerini kontrol etmek, internette bir kelime araştırmak veya diğer oyuncular ile farklı ortamlarda sohbet etmek isteyebilirler.

Oyun penceresinden başka bir uygulamaya geçtiklerinde (yani oyun penceresi **focus** kaybettiğinde) oynadıkları oyunun durmasını (**pause** moduna geçmesini) isterler.

Oyun penceresinin **Active** veya **InActive** olduğunu kontrol etmemiz, **Active** değilse, **Pause** moduna geçmemiz gerekmektedir;

*Not : Bu konu ile ilgili <a href="http://www.enginpolat.com/xna-oyunu-canakkale-gecilmez-1/" target="_blank">XNA Oyunu / Çanakkale Geçilmez - 1</a> yazımı okumanızı tavsiye ederim.*

<pre class="”brush:csharp”">protected override void Update(GameTime gameTime)
{
    if (this.IsActive)
    {
        /// Sadece oyun penceresi aktif iken yapılması gereken işleri
        /// buraya yazıyoruz

        /// Joystik, klavye, mouse hareketlerini algılamak
        /// Yapay zeka görevlerini yürütmek gibi
    }

    base.Update(gameTime);
}</pre>

***Oyun penceresinin başlığını nasıl değiştiririm?***

<pre class="”brush:csharp”">protected override void Initialize()
{
    this.Window.Title = "Oyun oynamak içindir!";

    base.Initialize();
}


