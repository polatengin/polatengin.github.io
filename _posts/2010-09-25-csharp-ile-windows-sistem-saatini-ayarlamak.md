---
layout: post
title: "C# ile Windows Sistem Saatini Ayarlamak"
date: 2010-09-25 08:28
author: engin.polat
comments: true
category: [C#]
tags: [dllimport, extern, function, kernel32.dll, p/invoke, platform invocation services, setsystemtime, sistem saati, static, struct, System.Runtime.InteropServices, systemtime, using, windows api]
---
Bazı windows uygulamalarının veya servislerinin *Windows sistem saatini* **değiştirmesi** gerekebilir.

C# ile geliştirdiğiniz *uygulamalarda veya servislerde* sistem saatini, basit bir **Windows API** çağrısı yaparak **değiştirebilirsiniz**.

Bu makale ile, <a href="http://msdn.microsoft.com/en-us/library/ms724950.aspx" target="_blank" rel="noopener">SYSTEMTIME</a> yapısını ve <a href="http://msdn.microsoft.com/en-us/library/ms724942.aspx" target="_blank" rel="noopener">SetSystemTime</a> fonksiyonunu nasıl **tanımlayacağınızı** ve **kullanacağınızı** anlatacağım.

**SetSystemTime** fonksiyonu bir **Windows API** çağrısıdır ve işletim sisteminin **tarih/saat** bilgisini **değiştirmek** için kullanılır.

**kernel32.dll** içerisinde tanımlanmış bu **Windows API** fonksiyonu, C# ile **Platform Invocation Services** *(P/Invoke)* çağrısı yapılarak kullanılabilir.

Öncelikle kod dosyamızın üstünde bulunan **using** kısmına <a href="http://msdn.microsoft.com/library/system.runtime.interopservices" target="_blank" rel="noopener">System.Runtime.InteropServices</a> **namespace**'ini ekleyelim;



using System.Runtime.InteropServices;</pre>

**Class** seviyesinde aşağıdaki tanımlama ile **SetSystemTime** fonksiyonunun **kernel32.dll** içerisinde yer aldığını, parametrelerini ve geri dönüş tipini uygulamamıza bildirmiş oluyoruz;

<pre class="brush:csharp">[DllImport("kernel32.dll")]
public extern static uint SetSystemTime(ref SYSTEMTIME lpSystemTime);</pre>

**SetSystemTime** fonksiyonu **SYSTEMTIME** tipinde bir parametre alıyor. **SYSTEMTIME** *struct* yapısını da uygulamamıza tanımlamamız gerekiyor;

<pre class="brush:csharp">[StructLayout(LayoutKind.Sequential)]
public struct SYSTEMTIME
{
    public short Year;
    public short Month;
    public short DayOfWeek;
    public short Day;
    public short Hour;
    public short Minute;
    public short Second;
    public short Milliseconds;
}</pre>

Artık istediğimiz kod bloğunda ilgili **fonksiyon çağrısını** yaparak, *sistem saatini ayarlayabiliriz*;

<pre class="brush:csharp">SYSTEMTIME zaman = new SYSTEMTIME();
zaman.Day = 25;
zaman.Month = 9;
zaman.Year = 2010;
zaman.Hour = 14;
zaman.Minute = 45;
SetSystemTime(ref zaman);


