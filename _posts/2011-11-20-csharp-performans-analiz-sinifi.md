---
layout: post
title: "C# Performans Analiz Sınıfı"
date: 2011-11-20 19:45
author: engin.polat
comments: true
category: [C#]
tags: [action, elapsed, for, method, new, performance, performans, private, public, return, startnew, static, stopwatch, ticks, TimeSpan, void]
---
Geliştirmekte olduğumuz uygulamalarda **performans analizi** yapmak için genellikle <a href="http://msdn.microsoft.com/library/system.diagnostics.stopwatch" title="Stopwatch Class">Stopwatch</a> sınıfını kullanırız.

Aşağıdaki sınıf'ı kullanarak uygulamanın *her method*'unu kolay analiz edebiliriz;



public class PerformansAnaliz
{
    public TimeSpan ToplamSure { get; private set; }
    public TimeSpan OrtalamaSure { get; private set; }

    public static PerformansAnaliz Yeni()
    {
        return new PerformansAnaliz();
    }

    public void Olcumle(Action Method, int TekrarAdet = 1)
    {
        var sw = Stopwatch.StartNew();
        for (int iLoop = 0; iLoop < TekrarAdet; iLoop++)
        {
            Method();
        }
        sw.Stop();
        OrtalamaSure = new TimeSpan(sw.Elapsed.Ticks / TekrarAdet);
        ToplamSure = sw.Elapsed;
    }
}</pre>


