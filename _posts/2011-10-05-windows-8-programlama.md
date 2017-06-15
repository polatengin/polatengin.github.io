---
layout: post
title: "Windows 8 Programlama"
date: 2011-10-05 11:11
author: engin.polat
comments: true
category: [C#]
tags: [MetroUI, windows8]
---
<a href="http://www.microsoft.com/presspass/features/2011/jun11/06-01corporatenews.aspx" title="Windows 8" target="_blank">Windows 8</a> henüz piyasa sürülmeden (aslında *Beta sürümü* bile çıkmadan) hayatımıza girmeye başladı.

<a href="http://www.enginpolat.com/etiket/windows8/" title="Windows 8 Programlama" target="_blank">Windows 8 Programlama</a> başlığı altında **Windows 8** üzerinde (özellikle **Metro Style**) uygulama geliştirme tecrübelerimi paylaşıyor olacağım.

Bu yazıyı yazdığım gün **Windows 8**'in **Geliştiricilere Özel** sürümleri *ücretsiz* olarak *Microsoft*'un kendi sitesinden indirilebiliyor;

<a href="http://wdp.dlws.microsoft.com/WDPDL/9B8DFDFF736C5B1DBF956B89D8A9D4FD925DACD2/WindowsDeveloperPreview-64bit-English-Developer.iso" target="_blank">Windows Developer Preview with developer tools English, 64-bit (x64)</a> *(4.8 GB)*

<a href="http://wdp.dlws.microsoft.com/WDPDL/9B8DFDFF736C5B1DBF956B89D8A9D4FD925DACD2/WindowsDeveloperPreview-64bit-English.iso" target="_blank">Windows Developer Preview English, 64-bit (x64)</a> *(3.6 GB)*

<a href="http://wdp.dlws.microsoft.com/WDPDL/9B8DFDFF736C5B1DBF956B89D8A9D4FD925DACD2/WindowsDeveloperPreview-32bit-English.iso" target="_blank">Windows Developer Preview English, 32-bit (x86)</a> *(2.8 GB)*

**Sistem Gereksinimleri**

**Windows Developer Preview**, Windows Vista ve Windows 7 çalıştırdığınız tüm bilgisayarlarda performans kaybı olmadan çalışacaktır;


*   1 GHz veya daha hızlı 32-bit (x86) / 64-bit (x64) işlemci
*   1 GB RAM (32-bit) veya 2 GB RAM (64-bit)
*   16 GB hard disk alanı (32-bit) veya 20 GB hard disk alanı (64-bit)
*   DirectX 9 veya üstü destekli ekran kartı
*   MetroUI Style uygulamaları çalıştırabilmek için en az 1024 X 768 ekran çözünürlüğü

Ben temiz bir bilgisayara **Windows Developer Preview with developer tools English, 64-bit (x64)** versiyonunu kurduktan sonra **MSDN** üyelerine açık olan **Visual Studio 2011 Ultimate Edition**'ı da kurdum.

Böylece *Windows*'un üzerine kurulu gelen **Visual Studio 2011 Express Edition**'da henüz oluşturamadığımız proje şablonlarını da görebilmiş oldum.

<a href="http://www.enginpolat.com/etiket/windows8/" title="Windows 8 Programlama" target="_blank">Windows 8 Programlama</a> makalelerimde yazacağım uygulamalar için *Express Edition* yeterli olacak.

