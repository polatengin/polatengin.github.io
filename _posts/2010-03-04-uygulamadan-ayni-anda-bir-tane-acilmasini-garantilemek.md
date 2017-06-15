---
layout: post
title: "Uygulamadan aynı anda bir tane açılmasını garantilemek"
date: 2010-03-04 10:00
author: engin.polat
comments: true
category: [C#]
tags: [application, channel, communication, cross-process, csharp, iletişim, mutex, process]
---
Yazdığımız uygulamalardan aynı anda **sadece bir tane** açık olmasını isteyebiliriz. Bunu garantilemek için, yapmamız gereken **process'ler arası iletişim kanalı** oluşturmak ve kullanmak olmalıdır.

**C#** dilinde process'ler arası iletişim (cross-process communication) *Mutex* sınıfı ile sağlanır.

*Mutex* sınıfının kullanımını hemen bir örnek ile inceleyelim;


[STAThread]
static void Main()
{
    bool AcikUygulamaVar = false;
    Mutex m = new Mutex(true, "UygulamanınAdı", out AcikUygulamaVar);
    if (AcikUygulamaVar)
    {
        Application.EnableVisualStyles();
        Application.SetCompatibleTextRenderingDefault(false);
        Application.Run(new MainForm());
    }
    else
    {
        MessageBox.Show("Uygulamadan aynı anda bir tane açabilirsiniz!");
    }
}

*Mutex* sınıfı ile ilgili daha detaylı bilgiye **MSDN**'deki şu <a title="MSDN: Mutex" href="http://msdn.microsoft.com/en-us/library/system.threading.mutex.aspx" target="_blank">makaleden</a> ulaşabilirsiniz.

