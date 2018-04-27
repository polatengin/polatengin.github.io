---
layout: post
title: "C# Diskteki Boş Alan Miktarını Bulmak"
date: 2010-09-06 21:24
author: engin.polat
comments: true
category: [C#]
tags: [availablefreespace, byte, driveformat, driveinfo, extensionmethod, foreach, getdrives, gigabyte, isready, kilobyte, megabyte, name, petabyte, static, terabyte, totalfreespace, totalsize]
---
Yazdığımız uygulamalar veya windows service'lerde, bilgisayarın disklerindeki **boş alan miktarını** bulmamız ve bu miktara göre çeşitli **karar mekanizmalarını çalıştırmamız** gerekebilir.

Yapmamız gereken ilk iş, *bilgisayara bağlı* bulunan **disklerin listesine** erişmek.

<a href="http://msdn.microsoft.com/library/system.io.driveinfo" target="_blank" rel="noopener">DriveInfo</a> sınıfının <a href="http://msdn.microsoft.com/library/system.io.driveinfo.getdrives" target="_blank" rel="noopener">GetDrives()</a> methodundan geriye, detaylı bilgilerine erişebileceğimiz **disklerin listesi** döner.

Basit bir foreach döngüsü ile bu liste üzerinden tüm disklere erişebiliriz;



foreach (DriveInfo disk in DriveInfo.GetDrives())
{
}</pre>

Döngü içerisinde, **disk'in adına** ulaşmak için <a href="http://msdn.microsoft.com/library/system.io.driveinfo" target="_blank" rel="noopener">DriveInfo</a> sınıfının <a href="http://msdn.microsoft.com/library/system.io.driveinfo.name" target="_blank" rel="noopener">Name</a> özelliğini kullanırız.

[C# ile bilgisayarınızdaki diskleri listelemek](http://www.enginpolat.com/csharp-ile-bilgisayarinizdaki-diskleri-listelemek/) yazımda yazdığım şekilde, <a href="http://msdn.microsoft.com/library/system.io.driveinfo" target="_blank" rel="noopener">DriveInfo</a> sınıfının <a href="http://msdn.microsoft.com/library/system.io.driveinfo.isready" target="_blank" rel="noopener">IsReady</a> özelliği ile diskin kullanılabilir olduğunu kontrol ederiz.

Son olarak;

<a href="http://msdn.microsoft.com/library/system.io.driveinfo.driveformat" target="_blank" rel="noopener">DriveFormat</a> özelliği ile diskin **Dosya Sistemi Formatını** *(File System Format)*
<a href="http://msdn.microsoft.com/library/system.io.driveinfo.availablefreespace" target="_blank" rel="noopener">AvailableFreeSpace</a> özelliği ile **diskin boş alan miktarını** *(byte cinsinden)*
<a href="http://msdn.microsoft.com/library/system.io.driveinfo.totalfreespace" target="_blank" rel="noopener">TotalFreeSpace</a> özelliği ile diskin **toplam boş alan miktarını** *(byte cinsinden)*
<a href="http://msdn.microsoft.com/library/system.io.driveinfo.totalsize" target="_blank" rel="noopener">TotalSize</a> özelliği ile diskin **toplam kapasitesini** *(byte cinsinden)*

öğrenebiliriz.

<pre class="brush:csharp">using System;
using System.IO;

public static class Program
{
    public static void Main(string[] args)
    {
        foreach (DriveInfo disk in DriveInfo.GetDrives())
        {
            Console.WriteLine("Disk: {0}", disk.Name);

            if (disk.IsReady)
            {
                Console.WriteLine("Toplam Alan:\t\t{0}", disk.TotalSize.FormatDosyaBoyutu());
                Console.WriteLine("Boş Alan Miktarı:\t{0}", disk.AvailableFreeSpace.FormatDosyaBoyutu());
            }

            Console.WriteLine("**********");
        }

        Console.ReadLine();
    }
}</pre>

*Boş Alan Miktarı* bilgisi ekrana **byte** cinsinden sayı olarak yazılacağı için pek okunaklı değildir.

[C# Windows tarzı dosya boyutu formatlayıcı](http://www.enginpolat.com/csharp-windows-tarzi-dosya-boyutu-formatlayici/) yazımda yazdığım *dosya boyutu formatlayıcı* kodunu da ekleyelim;

<pre class="brush:csharp">public enum Boyutlar
{
    byte,
    kilobyte,
    megabyte,
    gigabyte,
    terabyte,
    petabyte
}

public static string FormatDosyaBoyutu(this long DosyaBoyutu)
{
    Boyutlar BoyutTanim = Boyutlar.byte;

    while (Math.Round((decimal)DosyaBoyutu) >= 1000)
    {
        DosyaBoyutu /= 1024;
        BoyutTanim++;
    }

    return string.Format("{0}\t{1}", DosyaBoyutu.ToString("f2"), BoyutTanim);
}</pre>

Böylece örnek kodun tamamı;

<pre class="brush:csharp">using System;
using System.IO;

public static class Program
{
    public static void Main(string[] args)
    {
        foreach (DriveInfo disk in DriveInfo.GetDrives())
        {
            Console.WriteLine("Disk: {0}", disk.Name);

            if (disk.IsReady)
            {
                Console.WriteLine("Toplam Alan:\t\t{0}", disk.TotalSize.FormatDosyaBoyutu());
                Console.WriteLine("Boş Alan Miktarı:\t{0}", disk.AvailableFreeSpace.FormatDosyaBoyutu());
            }

            Console.WriteLine("**********");
        }

        Console.ReadLine();
    }

    public enum Boyutlar
    {
        byte,
        kilobyte,
        megabyte,
        gigabyte,
        terabyte,
        petabyte
    }

    public static string FormatDosyaBoyutu(this long DosyaBoyutu)
    {
        Boyutlar BoyutTanim = Boyutlar.byte;

        while (Math.Round((decimal)DosyaBoyutu) >= 1000)
        {
            DosyaBoyutu /= 1024;
            BoyutTanim++;
        }

        return string.Format("{0}\t{1}", DosyaBoyutu.ToString("f2"), BoyutTanim);
    }
}


Yukarıdaki kodun çıktısı aşağıdaki *gibi* olacaktır;

![Boş Alan Hesaplayıcı](/assets/uploads/2010/09/BosAlanHesaplayici.png "Boş Alan Hesaplayıcı")

