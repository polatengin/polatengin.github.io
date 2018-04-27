---
layout: post
title: "C# ile Form'a gölge efekti verelim ve titreme sorununu düzeltelim"
date: 2010-07-22 16:48
author: engin.polat
comments: true
category: [C#]
tags: [ClassStyle, CreateParams, csharp, DoubleBuffered, ExStyle, Form, FormBorderStyle, gölge form, override, shadow form]
---
**Windows Forms** uygulamalarında **Form**'un gölge efektine sahip olmasını istiyorsak, öncelikle <a href="http://msdn.microsoft.com/library/system.windows.forms.form" target="_blank" rel="noopener">Form</a>'un <a href="http://msdn.microsoft.com/library/system.windows.forms.form.formborderstyle" target="_blank" rel="noopener">FormBorderStyle</a> özelliğini <a href="http://msdn.microsoft.com/library/system.windows.forms.formborderstyle" target="_blank" rel="noopener">None</a> yapmalıyız.



this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;</pre>

*Form* sınıfının <a href="http://msdn.microsoft.com/library/system.windows.forms.form.createparams" target="_blank" rel="noopener">CreateParams</a> özelliğini **override** etmemiz gerekiyor. *CreateParams* özelliği geriye <a href="http://msdn.microsoft.com/library/system.windows.forms.createparams" target="_blank" rel="noopener">CreateParams</a> tipinde bir nesne döndürür.

<pre class="brush:csharp">protected override CreateParams CreateParams
{
    get
    {
        CreateParams cp = base.CreateParams;

        cp.ClassStyle |= 0x20000;

        return cp;
    }
}</pre>

*CreateParams* sınıfının <a href="http://msdn.microsoft.com/library/system.windows.forms.createparams.classstyle" target="_blank" rel="noopener">ClassStyle</a> özelliğine *0x20000* değerini ekliyoruz. Böylece formumuz çalışmaya başladığında etrafında gölge gözüküyor.

![Gölgeli Form](/assets/uploads/2010/07/GolgeliForm.png "GolgeliForm")

**Form** üzerine çok fazla kontrol eklediğimizde, özellikle eğer kontroller hafızada çok yer kaplayan 3.parti kontrollerden ise; formumuzda **titreme** diyebileceğimiz bir *efekt* oluşmaya başlar.

Çoğu zaman bu durum rahatsızlık oluşturma derecesine kadar varır.

Bu sorunu çözmek için, kontrollerin <a href="http://msdn.microsoft.com/library/system.windows.forms.control.doublebuffered" target="_blank" rel="noopener">DoubleBuffered</a> özelliğini *true* değerine ayarlamamız gerekmektedir.

Fakat *DoubleBuffered* özelliği *Form* sınıfının değil *Control* sınıfının bir özelliği olduğundan dolayı, Form'un *titremesini* gidermek için kullanamayız.

*Form* sınıfının *CreateParams* özelliğinde bu sorunu da çözebiliriz;

<pre class="brush:csharp">protected override CreateParams CreateParams
{
    get
    {
        CreateParams cp = base.CreateParams;

        cp.ExStyle |= 0x02000000;

        return cp;
    }
}</pre>

Bu sefer *CreateParams* sınıfının <a href="http://msdn.microsoft.com/library/system.windows.forms.createparams.exstyle" target="_blank" rel="noopener">ExStyle</a> özelliğine *0x02000000* değerini eklememiz gerekiyor.

Örnek uygulamanın tüm kodu;

<pre class="brush:csharp">protected override CreateParams CreateParams
{
    get
    {
        CreateParams cp = base.CreateParams;

        cp.ClassStyle |= 0x20000;

        cp.ExStyle |= 0x02000000;

        return cp;
    }
}


