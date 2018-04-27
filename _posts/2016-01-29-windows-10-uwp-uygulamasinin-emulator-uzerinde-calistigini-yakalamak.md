---
layout: post
title: "Windows 10 UWP uygulamasının Emulator üzerinde çalıştığını yakalamak"
date: 2016-01-29 13:40
author: engin.polat
comments: true
category: [Windows]
tags: [class, easclientdeviceinformation, emulator, exchangeactivesyncprovisioning, security, static, systemfirmwareversion, systemhardwareversion, systemproductname, systemsku, windows, windows phone emulator]
---
Eğer yazdığımız uygulamanın **emulator** üzerinde mi yoksa *gerçek cihazda* mı çalıştığını anlamak istiyorsak *Windows.Security.ExchangeActiveSyncProvisioning* **namespace**'inde yeralan <a href="http://msdn.microsoft.com/library/windows/apps/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation" target="_blank" rel="noopener">EasClientDeviceInformation</a> sınıfından faydalanabiliriz.



var deviceInfo = new EasClientDeviceInformation();</pre>

Eğer yukarıdaki kodu emulator üzerinde çalıştıracak olursak



*   <a href="http://msdn.microsoft.com/library/windows/apps/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.systemfirmwareversion" target="_blank" rel="noopener">SystemFirmwareVersion</a> özelliğinde *0*
*   <a href="http://msdn.microsoft.com/library/windows/apps/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.systemhardwareversion" target="_blank" rel="noopener">SystemHardwareVersion</a> özelliğinde *0*
*   <a href="http://msdn.microsoft.com/library/windows/apps/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.systemproductname" target="_blank" rel="noopener">SystemProductName</a> özelliğinde *Virtual*
*   <a href="http://msdn.microsoft.com/library/windows/apps/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.systemsku" target="_blank" rel="noopener">SystemSku</a> özelliğinde *Microsoft Virtual*

değerleri olacak. Eğer aynı kodu gerçek cihaz üzerinde çalıştıracak olursak aynı *property*'lerde cihaza göre farklı değerler olacak.

**EasClientDeviceInformation** sınıfını kullanarak uygulamanın çalıştığı cihazın emulator veya gerçek cihaz olduğunu aşağıdaki koddaki gibi anlayabiliriz;

<pre class="brush:csharp">public static class DeviceInfo
{
    private static EasClientDeviceInformation deviceInfo = new EasClientDeviceInformation();

    public static bool IsRunningOnEmulator
    {
        get
        {
            return (deviceInfo.SystemProductName == "Virtual");
        }
    }
}</pre>

Aşağıdaki gibi kullanabiliriz;

<pre class="brush:csharp">if (DeviceInfo.IsRunningOnEmulator)  
{
    // TODO : Emulator üzerinde çalışıyor
}


*Kaynak : <a href="http://igrali.com/2014/07/17/get-device-information-windows-phone-8-1-winrt/" target="_blank" rel="noopener">Get device information on Windows</a>*

