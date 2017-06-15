---
layout: post
title: "C# ile bilgisayarınızdaki diskleri listelemek"
date: 2010-08-25 21:43
author: engin.polat
comments: true
category: [C#]
tags: [class, dosya sistemi, driveinfo, drivetype, file system, fixed, getdrives, isready, method, name, removable, system.io, volumelabel]
---
**.Net 2.0** ile birlikte <a href="http://msdn.microsoft.com/library/system.io" target="_blank">System.IO</a> namespace'inde bulunan birçok eksiklik giderilmiştir. Özellikle **Windows'un Dosya Sistemine** erişmek için yeni *sınıflar* ve *methodlar* eklenmiştir.

<a href="http://msdn.microsoft.com/library/system.io.driveinfo" target="_blank">DriveInfo</a> sınıfında yapılan bir geliştirme sayesinde *sistemde kurulu disklere erişebilir*, *disklerin tiplerini sorgulayabilir*, *kapasitelerini* ve *boş alan miktarını* öğrenebiliriz.

Örneğin, sistemdeki diskleri **listelemek** için;



DriveInfo[] diskler = DriveInfo.GetDrives();
foreach (DriveInfo disk in diskler)
{
    string diskAdi = disk.IsReady ? String.Format(" - {0}", disk.VolumeLabel) : null;
    Console.WriteLine( "{0} - {1}{2}", disk.Name, disk.DriveType, diskAdi);
}




>C:\ – Fixed – Sistem
D:\ – Fixed – Dosyalar
E:\ – CDRom
F:\ – CDRom
G:\ – Removable
H:\ – Removable
T:\ – Fixed – Temp
Y:\ – Fixed – Yedekler



<a href="http://msdn.microsoft.com/library/system.io.driveinfo.isready" target="_blank">IsReady</a> property'si sayesinde disk'in o anda sistemde **kullanılabilir** olup olmadığını kontrol ediyoruz. Örneğin, içinde CD **olmayan** CD okuyucu için, disk'in etiketini almaya **çalışmıyoruz**. Uygulamamızın **hata ile karşılaşmaması** için, bu dikkat etmemiz gereken bir nokta.

<a href="http://msdn.microsoft.com/library/system.io.driveinfo.name" target="_blank">Name</a> ve <a href="http://msdn.microsoft.com/library/system.io.driveinfo.drivetype" target="_blank">DriveType</a> özellikleri, diskin hazır olduğu durumlardan bağımsız olarak, her zaman kullanılabilir durumdadır.

