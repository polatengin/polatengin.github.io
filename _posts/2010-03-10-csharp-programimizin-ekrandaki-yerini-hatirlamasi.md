---
layout: post
title: "C# Programımızın Ekrandaki Yerini Hatırlaması"
date: 2010-03-10 08:30
author: engin.polat
comments: true
category: [C#]
tags: [base, class, Form, location, OnClosing, OnLoad, override, properties, save, screen, settings, size, virtual, workingarea]
---
**C#** ile yazdığınız uygulamanın her açılışta bir önceki kapatıldığı yerde açılmasını isteyebilirsiniz.

Aslında gayet basit olan bu işi yaparken düşünmemiz gereken bazı **detaylar** var. Mesela;

*Ya uygulama kapatıldıktan sonra kullanıcı windows'un çözünürlüğünü değiştirdiyse?*

*Kullanıcı birden fazla monitör kullanıyorsa, ve uygulama kapatıldıktan sonra monitörlerin ayarlarını değiştirdiyse?*

Hem bu noktaları gözönünde bulunduracak, hem de kolay şekilde programlanacak bir çözümü aşağıda kodladım;

Öncelikle formumuz kapatılırken, tam olarak bulunduğu noktayı bir yere **kaydetsin**. Bunu uygulamanın *Settings* penceresine iki tane özellik ekleyerek yapalım;

**FormLocation** ve **FormSize**

Formumuzun **base class**'ı olan **Form** *class*'ından gelen **OnClosing** *virtual* method'unu *override* edelim;



protected override void OnClosing(CancelEventArgs e)
{
    Properties.Settings.Default.FormLocation = this.Location;
    Properties.Settings.Default.FormSize = this.Size;
    Properties.Settings.Default.Save();

    base.OnClosing(e);
}</pre>

Uygulamamızın **Settings** penceresinden eklediğimiz **property**'lere

<pre class="brush:csharp">Properties.Settings.Default</pre>

ile ulaşabiliriz.

Şimdi, form'umuzun base'den gelen **OnLoad** *virtual* **method**'unu *override* edelim ve açıldığında eski yerine konumlanmasını sağlayalım;

<pre class="brush:csharp">protected override void OnLoad(EventArgs e)
{
    base.OnLoad(e);

    Point konum = Properties.Settings.Default.FormLocation;
    Size boyut = Properties.Settings.Default.FormSize;

    bool isOnScreen = false; /// Formun gözükür olup-olmadığını kontrol edelim
    foreach (Screen screen in Screen.AllScreens)
        if (screen.WorkingArea.Contains(konum))
            isOnScreen = true;

    if (!isOnScreen) ///Eğer formumuz görünür değilse, görünür yapalım
        this.SetDesktopLocation(Screen.PrimaryScreen.WorkingArea.Left, Screen.PrimaryScreen.WorkingArea.Top);

    if (boyut.Width &lt; 10 || boyut.Height &lt; 10) /// Formun boyutları çok küçükse, normal hale geri getirelim
        this.Size = new Size(300, 300);
}


Yukarıdaki kod parçalarını sizler de **kendi uygulamalarınızda** kullanabilirsiniz.

