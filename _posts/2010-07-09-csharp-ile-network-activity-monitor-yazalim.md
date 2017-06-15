---
layout: post
title: "C# ile Network Activity Monitor yazalım"
date: 2010-07-09 12:03
author: engin.polat
comments: true
category: [C#]
tags: [bytes received, bytes sent, class, csharp, delegate method, event, Network Interface, NetworkAvailabilityChanged, NetworkChange, PerformanceCounter, PerformanceCounterCategory, static, System.Diagnostics, timer]
---
Bilgisayarın network aktivitesini ölçmemiz gerektiğinde, bu görevi gerçekleştirecek bir yazılım geliştirebiliriz.

Yapmamız gereken Windows'un **Performance Counter** listesinden doğru sayaçları okumak. Bu yazımda böyle bir uygulama geliştireceğim.

Öncelikle bilgisayarda bulunan **ağ arayüzlerinin** listesini alalım;



string[] NetworkAdapter = new PerformanceCounterCategory("Network Interface").GetInstanceNames(); /// ağ arayüzlerinin listesi</pre>

Şimdi <a href="http://msdn.microsoft.com/library/system.diagnostics" target="_blank">System.Diagnostics</a> namespace'inde yeralan <a href="http://msdn.microsoft.com/library/system.diagnostics.performancecounter.aspx" target="_blank">PerformanceCounter</a> sınıfından yeni bir örnek çıkartıp, doğru sayaçlardan bilgi okuyabiliriz.

Bilgisayarın ağ üzerinden yaptığı *download* ve *upload* miktarını ölçmek için, **Network Interface** isimli *Performance Counter*'ın **Bytes Received** ve **Bytes Sent** isimli sayaçlarını kullanacağız.

<pre class="brush:csharp">PerformanceCounter Download = new PerformanceCounter("Network Interface", "Bytes Received/sec", NetworkAdapter[1]);
PerformanceCounter Upload = new PerformanceCounter("Network Interface", "Bytes Sent/sec", NetworkAdapter[1]);</pre>

<a href="http://msdn.microsoft.com/library/system.net.networkinformation.networkchange" target="_blank">NetworkChange</a> sınıfının static üyelerinden <a href="http://msdn.microsoft.com/library/system.net.networkinformation.networkchange.networkavailabilitychanged" target="_blank">NetworkAvailabilityChanged</a> *event*'ine bir **delegate method** atayarak, bilgisayarın ağ bağlantı durumunda değişiklik olunca farketmesini sağlayabiliriz.

Yazdığımız uygulamada her 10 saniye'de bir bilgisayarın download ve upload miktarını ekrana yazacak olalım;

<pre class="brush:csharp">Timer t = new Timer(10000); /// 10 saniye

NetworkChange.NetworkAvailabilityChanged += delegate(object _sender, NetworkAvailabilityEventArgs _e) { /// network durumu değiştiğinde
    if (_e.IsAvailable) /// eğer network ulaşılabilir duruma geldi ise
    {
        t.Start(); ///başla
    }
    else
    {
        t.Stop(); /// dur
    }
};</pre>

<a href="http://msdn.microsoft.com/library/system.timers.timer" target="_blank">Timer</a> nesnesinin <a href="http://msdn.microsoft.com/library/system.timers.timer.elapsed" target="_blank">Elapsed</a> *event*'inde de ekrana download ve upload miktarı bilgilerini yazacağız;

<pre class="brush:csharp">t.Elapsed += delegate(object _sender, ElapsedEventArgs _e) {
    Console.WriteLine("Download : {0} kb.\t\tUpload : {1} kb.", Download.NextValue(), Upload.NextValue()); /// ekrana download & upload miktarını yaz
};</pre>

Örnek uygulamanın tüm kodu;

<pre class="brush:csharp">using System;
using System.Net.NetworkInformation;
using System.Timers;
using System.Diagnostics;

class Program
{
    static void Main(string[] args)
    {
        string[] NetworkAdapter = new PerformanceCounterCategory("Network Interface").GetInstanceNames(); /// network kartlarının listesi

        PerformanceCounter Download = new PerformanceCounter("Network Interface", "Bytes Received/sec", NetworkAdapter[1]);
        PerformanceCounter Upload = new PerformanceCounter("Network Interface", "Bytes Sent/sec", NetworkAdapter[1]);

        Timer t = new Timer(10000); /// 10 saniye
        t.Elapsed += delegate(object _sender, ElapsedEventArgs _e) {
            Console.WriteLine("Download : {0} kb.\t\tUpload : {1} kb.", Download.NextValue(), Upload.NextValue()); /// ekrana download & upload miktarını yaz
        };

        NetworkChange.NetworkAvailabilityChanged += delegate(object _sender, NetworkAvailabilityEventArgs _e) { /// network durumu değiştiğinde
            if (_e.IsAvailable) /// eğer network ulaşılabilir duruma geldi ise
            {
                t.Start(); ///başla
            }
            else
            {
                t.Stop(); /// dur
            }
        };

        t.Start();

        Console.ReadLine();
    }
}


