---
layout: post
title: "XNA - Başlangıç"
date: 2010-02-18 17:46
author: engin.polat
comments: true
category: [XNA]
tags: [class, draw, gameloop, loadcontent, main method, solution explorer, unloadcontent, update, visual studio 2008, windows game, XNA]
---
**XNA** serimizin ikinci yazısında, **Visual Studio 2008**'lerimizi açıyoruz ve yeni bir **Windows Game** projesi oluşturuyoruz.

**Solution Explorer**'a baktığımızda, proje içindeki dosyaları görüyoruz.

<a href="/assets/uploads/2010/02/XNA_Ornek_1.png">![XNA Projesi Solution Explorer Penceresi](/assets/uploads/2010/02/XNA_Ornek_1.png "XNA Projesi Solution Explorer Penceresi")</a>

XNA Oyununu çalıştırdığımızda, başlangıç noktası olarak **Program.cs**'deki *Program* class'ının *static void Main()* methodu çalıştırılır.

*Main()* method'unun yaptığı iş basittir;



static void Main(string[] args)
{
    using (GameLoop game = new GameLoop())
    {
        game.Run();
    }
}</pre>

*GameLoop* class'ından instance oluşturup, *Run()* method'unu çağırır.

*GameLoop* class'ına bakarsak;

<pre class="brush:csharp">public class GameLoop : Microsoft.Xna.Framework.Game
{
    GraphicsDeviceManager graphics;
    SpriteBatch spriteBatch;

    public GameLoop()
    {
        graphics = new GraphicsDeviceManager(this);
        Content.RootDirectory = "Content";
    }

    protected override void Initialize()
    {
        base.Initialize();
    }

    protected override void LoadContent()
    {
        spriteBatch = new SpriteBatch(GraphicsDevice);
    }

    protected override void UnloadContent()
    {
    }

    protected override void Update(GameTime gameTime)
    {
        if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed)
            this.Exit();

        base.Update(gameTime);
    }

    protected override void Draw(GameTime gameTime)
    {
        GraphicsDevice.Clear(Color.CornflowerBlue);

        base.Draw(gameTime);
    }
}


*LoadContent()* method'u oyunda kullanacağımız grafikleri - sesleri - vs. hafızaya yüklediğimiz yerdir.

*UnloadContent()* method'u ise, *LoadContent()* method'unda yüklediğimiz kaynakları hafızadan sildiğimiz yerdir.

Oyun çalıştığı zaman *LoadContent()* method'u bir defa çalıştırılır. Oyun'dan çıkılırken de *UnloadContent()* method'u bir defa çalıştırılır.

*Update()* method'u, ekrana çizilecek nesnelerin, konum-boy-saydamlık-vs. değerlerinin hesaplandığı yerdir.

*Draw()* method'u ise, nesnelerin ekrana çizim işlemlerinin gerçekleştirildiği yerdir.

.Net Framework sabit olarak **saniyede 60 kare** çizim yapmayı hedefler. *Update()* ve *Draw()* method'larının **saniyede 60 kere** çalıştırılmasını beklemeliyiz.

