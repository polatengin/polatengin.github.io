---
layout: post
title: "C# Sistem Olayları (SystemEvents)"
date: 2010-08-16 22:26
author: engin.polat
comments: true
category: [C#]
tags: [delegate, DisplaySettingsChanged, DisplaySettingsChanging, InstalledFontsChanged, Microsoft.Win32, SessionEnded, SessionEnding, SessionSwitch, SystemEvents, UserPreferenceChanged, UserPreferenceChanging]
---
C# ile geliştirdiğimiz uygulamalarda, **işletim sistemi** seviyesinde oluşan bazı **olayları yakalamamız** ve bu olaylarla ilgili kodlar yazmamız gerekebilir.

Örneğin, **kullanıcı Windows oturumunu kapatırken**, biz de uygulamamızı kapatmak veya şifre korumasını aktif hale getirmek isteyebiliriz.

Veya, **kullanıcı Windows oturumunu kapattığında** hala çalışmakta olan uygulamamızın belirli durumları loglamasını ve kullanıcı oturumunu geri açtığında bu logları kullanıcıya göstermeyi isteyebiliriz.

Kullanıcının, kendi ayarlarını değiştirmesinden, ekran çözünürlüğünü değiştirmesine kadar, çeşitli işletim sistemi olaylarını C# ile yakalayabilir ve ilgili olaylara kod yazabiliriz.

Öncelikle <a href="http://msdn.microsoft.com/library/microsoft.win32" target="_blank">Microsoft.Win32</a> **namespace**'ini kodumuzun **using** kısmına ekleyelim;



using Microsoft.Win32;</pre>

Daha sonra yapmamız gereken, <a href="http://msdn.microsoft.com/library/microsoft.win32.systemevents_events" target="_blank">SystemEvents</a> sınıfının **statik** *olaylarını* **delegate methodlar** sayesinde yakalamak.

Örneğin, **ekran ayarlarının değiştirilmesi** anında uygulamamızın belirli bir işi gerçekleştirmesini istiyorsak;

<pre class="brush:csharp">SystemEvents.DisplaySettingsChanging += delegate(object sender, EventArgs e) {
    Console.WriteLine("Windows Görüntü Çözünürlüğü değiştiriliyor");
};</pre>

Başka yakalayabileceğimiz olaylar;

**DisplaySettingsChanging : **Ekran özellikleri değiştirilirken
**DisplaySettingsChanged : **Ekran özellikleri değiştirildikten sonra
**InstalledFontsChanged : **İşletim Sisteminde kurulu fontlarda değişiklik olduğunda
**PaletteChanged : **Kullanıcı farklı bir palet kullanan başka bir uygulamaya geçtiğinde
**PowerModeChanged : **Kullanıcı oturumunu Suspend veya Resume yaptığında
**SessionEnding : **Kullanıcı oturumunu veya işletim sistemini kapatırken
**SessionEnded : **Kullanıcı oturumunu veya işletim sistemini kapattığında
**SessionSwitch : **Kullanıcı oturumunu değiştirirken
**TimeChanged : **Sistem saati değiştiğinde
**UserPreferenceChanging : **Kullanıcı ayarlarını değiştirirken
**UserPreferenceChanged : **Kullanıcı ayarlarını değiştirdiğinde

Örnek uygulamanın tüm kodları;

<pre class="brush:csharp">using System;
using Microsoft.Win32;

class Program
{
    static void Main(string[] args)
    {
        SystemEvents.DisplaySettingsChanging += delegate(object sender, EventArgs e) {
            Console.WriteLine("Windows Görüntü Çözünürlüğü değiştiriliyor");
        };

        SystemEvents.DisplaySettingsChanged += delegate(object sender, EventArgs e)
        {
            Console.WriteLine("Windows Görüntü Çözünürlüğü değiştirildi");
        };

        SystemEvents.InstalledFontsChanged += delegate(object sender, EventArgs e) {
            Console.WriteLine("Windows yüklü fon listesinde değişiklik var (ekleme veya silme)");
        };

        SystemEvents.SessionEnding += delegate(object sender, SessionEndingEventArgs e) {
            switch (e.Reason)
            {
                case SessionEndReasons.Logoff:
                    Console.WriteLine("Windows Kapatılıyor (LogOff)");
                    break;
                case SessionEndReasons.SystemShutdown:
                    Console.WriteLine("Windows Kapatılıyor (Shutdown)");
                    break;
            }
        };

        SystemEvents.SessionEnded += delegate(object sender, SessionEndedEventArgs e) {
            switch (e.Reason)
            {
                case SessionEndReasons.Logoff:
                    Console.WriteLine("Windows Kapatıldı (LogOff)");
                    break;
                case SessionEndReasons.SystemShutdown:
                    Console.WriteLine("Windows Kapatıldı (Shutdown)");
                    break;
            }
        };

        SystemEvents.SessionSwitch += delegate(object sender, SessionSwitchEventArgs e) {
            switch (e.Reason)
            {
                case SessionSwitchReason.SessionLock:
                    Console.WriteLine("Windows Kilitlendi (Windows Locked)");
                    break;
                case SessionSwitchReason.SessionUnlock:
                    Console.WriteLine("Windows Açıldı (Windows Unlocked)");
                    break;
            }
        };

        SystemEvents.UserPreferenceChanging += delegate(object sender, UserPreferenceChangingEventArgs e) {
            Console.WriteLine(e.Category.ToString() + " Ayarları Güncelleniyor");
        };

        SystemEvents.UserPreferenceChanged += delegate(object sender, UserPreferenceChangedEventArgs e) {
            Console.WriteLine(e.Category.ToString() + " Ayarları Güncellendi");
        };

        Console.ReadLine();
    }
}


