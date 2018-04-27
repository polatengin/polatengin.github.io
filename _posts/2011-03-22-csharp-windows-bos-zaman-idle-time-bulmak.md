---
layout: post
title: "C# Windows'un Boş Zamanını (Idle Time) Bulmak"
date: 2011-03-22 18:00
author: engin.polat
comments: true
category: [C#]
tags: [class, console, Environment.TickCount, FromMilliseconds, GetLastInputInfo, LastInputInfo, Marshal, struct, System.Runtime, System.Runtime.InteropServices, System.Timers, timer, TimeSpan, TimeSpan.Zero]
---
Yazdığınız bir uygulamanın **vakit alıcı bazı işlerini**, Windows'un **kullanılmadığı** zamanlarda gerçekleştirmek isteyebilirsiniz.

Yapmamız gereken, uygulamamızın, Windows'un kullanılmadığı zamanı **anlayabileceği** ve **sayabileceği** bir yönteme sahip olmasını sağlamak.

Böylece Windows belirli bir süre boyunca kullanılmadığında, uygulamamızın **çeşitli görevleri başlatmasını** sağlayabiliriz.

Windows'un **kullanılmadığı süreyi** ölçmek için, öncelikle **son kullanıldığı zamanı** bulmamız gerekmektedir.

İlk olarak, kodumuzun *using* kısmına <a href="http://msdn.microsoft.com/library/system" target="_blank" rel="noopener">System</a> , <a href="http://msdn.microsoft.com/library/system.runtime.interopservices" target="_blank" rel="noopener">System.Runtime.InteropServices</a> ve <a href="http://msdn.microsoft.com/library/system.timers" target="_blank" rel="noopener">System.Timers</a> *namespace*'lerini ekleyelim.

**System.Runtime.InteropServices** namespace'i [Windows API](http://en.wikipedia.org/wiki/Windows_API)'lerini uygulamamıza eklememize yarayan sınıfları barındırmaktadır.

[GetLastInputInfo](http://msdn.microsoft.com/library/ms646302.aspx) methodunu uygulamamıza ekleyebiliriz.

**GetLastInputInfo** method'u sayesinde ihtiyacımız olan, Windows'un **son kullanılma zamanını** alabileceğiz.



[DllImport("user32.dll")]
static extern bool GetLastInputInfo(ref LastInputInfo plii);</pre>

*Toplam Kullanılma Zamanından*, *Son Kullanılma Zamanını* çıkarttığımızda, *Windows'un Kullanılmadığı Boş Zamanı* bulmuş olacağız.

<pre class="brush:csharp">TimeSpan.FromMilliseconds(Environment.TickCount - info.dwTime)</pre>

**GetLastInputInfo** method'u parametre olarak <a href="http://msdn.microsoft.com/library/ms646272.aspx" target="_blank" rel="noopener">LastInputInfo</a> tipinde bir **struct** istemektedir.

<pre class="brush:csharp">public struct LastInputInfo
{
    public uint cbSize;
    public uint dwTime;
}</pre>

Uygulamamızın başlangıcında bir <a href="http://msdn.microsoft.com/library/system.timers.timer" target="_blank" rel="noopener">Timer</a> oluşturuyoruz ve <a href="http://msdn.microsoft.com/library/system.timers.timer.elapsed" target="_blank" rel="noopener">Elapsed</a> olayında, Windows'un kullanılmadığı süreyi ekrana yazdırıyoruz.

Örnek uygulamanın tüm kodu;

<pre class="brush:csharp">using System;
using System.Runtime.InteropServices;
using System.Timers;

public struct LastInputInfo
{
    public uint cbSize;
    public uint dwTime;
}

public class Program
{
    [DllImport("user32.dll")]
    static extern bool GetLastInputInfo(ref LastInputInfo plii);

    static LastInputInfo info = new LastInputInfo();

    public static TimeSpan GetInactiveTime()
    {
        if (GetLastInputInfo(ref info))
            return TimeSpan.FromMilliseconds(Environment.TickCount - info.dwTime);
        else
            return TimeSpan.Zero;
    }

    static void Main(string[] args)
    {
        info.cbSize = (uint)Marshal.SizeOf(info);

        Timer t = new Timer(1000);
        t.Start();
        t.Elapsed += delegate { Console.WriteLine(GetInactiveTime().ToString()); };

        Console.ReadLine();
    }
}


