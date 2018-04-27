---
layout: post
title: "C# WMI Örnekler - 1"
date: 2010-10-31 16:08
author: engin.polat
comments: true
category: [C#]
tags: [batterylifepercent, batteryliferemaining, console, ManagementObject, ManagementObjectSearcher, msdn, MSNdis_80211_ReceivedSignalStrength, Ndis80211ReceivedSignalStrength, powerstatus, systeminformation, technet, wifi, win32_process, win32_processor, win32_service, win32_share, WMI]
---
Bilgisayardaki **Paylaşılan Dizinleri** listelemek için; (<a href="http://msdn.microsoft.com/library/aa394435.aspx" target="_blank" rel="noopener">*Win32_Share*</a> sınıfını kullanır)



ManagementObjectSearcher mos = new ManagementObjectSearcher("select * from win32_share");
foreach (ManagementObject mo in mos.Get())
{
    Console.WriteLine("Dizin : {0}", mo["Name"]);
}</pre>

Bilgisayarda **Elle Başlatılan ve Çalışan Servisleri** listelemek için; (<a href="http://msdn.microsoft.com/library/aa394418.aspx" target="_blank" rel="noopener">*Win32_Service*</a> sınıfını kullanır)

<pre class="brush:csharp">ManagementObjectSearcher mos = new ManagementObjectSearcher("Select * from Win32_Service Where State='Running' AND StartMode='Manual'");
foreach (ManagementObject mo in mos.Get())
{
    Console.WriteLine("Servis : {0}", mo["Name"]);
}</pre>

Bilgisayarda o anda **Çalışmakta olan Process**'leri listelemek için; (<a href="http://msdn.microsoft.com/library/aa394372.aspx" target="_blank" rel="noopener">*Win32_Process*</a> sınıfını kullanır)

<pre class="brush:csharp">ManagementObjectSearcher mos = new ManagementObjectSearcher("Select * from Win32_Process");
foreach (ManagementObject mo in mos.Get())
{
    Console.WriteLine("Process : {0}", mo["Name"]);
}</pre>

Bilgisayarda bulunan **İşlemcileri (CPU)** listelemek için; (<a href="http://msdn.microsoft.com/library/aa394373.aspx" target="_blank" rel="noopener">*Win32_Processor*</a> sınıfını kullanır)

<pre class="brush:csharp">ManagementObjectSearcher mos = new ManagementObjectSearcher("Select * from Win32_Processor");
foreach (ManagementObject mo in mos.Get())
{
    Console.WriteLine("Process : {0}", mo["Name"]);
}</pre>

**Win32 sınıflarının tamamına ve özelliklerine** *MSDN*'deki <a href="http://msdn.microsoft.com/library/aa394084.aspx" target="_blank" rel="noopener">*Win32 Classes*</a> sayfasından ulaşabilirsiniz.

Bilgisayarın **WIFI sinyal seviyesini** göstermek için; (<a href="http://blogs.technet.com/b/heyscriptingguy/archive/2007/03/22/how-can-i-determine-the-signal-strength-of-a-wireless-connection.aspx" target="_blank" rel="noopener">*Technet*</a>'teki makaleden alıntıdır.)

<pre class="brush:csharp">ManagementObjectSearcher mos = new ManagementObjectSearcher(@"root\WMI", "select * from MSNdis_80211_ReceivedSignalStrength");
foreach (ManagementObject mo in mos.Get())
{
    Console.WriteLine("", mo["Ndis80211ReceivedSignalStrength"]);
}</pre>

Notebook'ta **Kalan Pil Süresini** göstermek için; (<a href="http://msdn.microsoft.com/library/system.windows.forms.systeminformation" target="_blank" rel="noopener">*SystemInformation*</a> sınıfını kullanır)

<pre class="brush:csharp">Console.WriteLine("Kalan pil yüzdesi : {0}", SystemInformation.PowerStatus.BatteryLifePercent);

Console.WriteLine("Kalan pil süresi : {0}", SystemInformation.PowerStatus.BatteryLifeRemaining);


