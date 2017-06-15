---
layout: post
title: ".Net Framework'te Timer Class'ları Arasındaki Farklar"
date: 2009-12-12 08:50
author: engin.polat
comments: true
category: [C#]
tags: [callback, csharp, System.Threading.Timer, System.Timers.Timer, System.Windows.Forms.Timer, timer, TimerCallback]
---
BilgeAdam'da öğrencilerime WinForms anlatırken, kafalarının çok karıştığı konulardan biri de Timer nesnesidir.

Daha doğrusu Timer nesneleridir demeliyim. Çünkü .Net Framework'te Timer ismine sahip tam 3 tane class var;


*   System.Timers.Timer
*   System.Threading.Timer
*   System.Windows.Forms.Timer
<a title="MSDN: System.Timers.Timer" href="http://msdn.microsoft.com/en-us/library/system.timers.timer.aspx" target="_blank">***System.Timers.Timer***</a>

Özellikle Multi-Threaded uygulamalarda tercih edilir. Thread-safe olduğu için, birden çok thread'den erişilebilir.


System.Timers.Timer t = new System.Timers.Timer(5000);
t.Elapsed += delegate(object _s, System.Timers.ElapsedEventArgs _e)
{
    MessageBox.Show("5 saniye geçti!..");
    t.Stop();
};
t.Start();</pre>
<a title="MSDN: System.Threading.Timer" href="http://msdn.microsoft.com/en-us/library/system.threading.timer.aspx" target="_blank">***System.Threading.Timer***</a>

TimerCallBack delegate kullanarak, atanmış metodu çalıştırabilir. Metod, framework tarafından oluşturulan başka bir thread'de çalışır.

Timer nesnesi oluşturulduğu anda, çalışmaya başlar ve scope'tan çıkana kadar da çalışır. Durdurmak veya Başlatmak mümkün değildir.

Aşağıdaki örnekte 2.parametre (null), Callback method'a aktarılacak parametreyi gösterir.

3.parametre (1000), Timer nesnesi başlatılmadan önce beklenecek süreyi gösterir.
<pre class="brush:csharp">System.Threading.Timer t = new System.Threading.Timer(new System.Threading.TimerCallback(TimerTest), null, 1000, 5000);</pre>
<pre class="brush:csharp">private void TimerTest(object state)
{
    MessageBox.Show("5 saniye geçti!..");
}</pre>
<a title="MSDN: System.Windows.Forms.Timer" href="http://msdn.microsoft.com/en-us/library/system.windows.forms.timer.aspx" target="_blank">***System.Windows.Forms.Timer***</a>

Toolbox'ta gördüğümüz nesnedir. Windows Form ile aynı thread'de ve senkron olarak çalışır, böylece hiçbir UI operasyonunu bölmez.
<pre class="brush:csharp">System.Windows.Forms.Timer t = new System.Windows.Forms.Timer();
t.Interval = 5000;
t.Start();
t.Tick += delegate(object _s, EventArgs _e)
{
    MessageBox.Show("5 saniye geçti!..");
    t.Stop();
};

Daha ayrıntılı bilgi için MSDN'deki <a title="MSDN: Comparing the Timer Classes" href="http://msdn.microsoft.com/en-us/magazine/cc164015.aspx" target="_blank">şu makale</a>yi okuyabilirsiniz.

