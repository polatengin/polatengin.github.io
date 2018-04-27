---
layout: post
title: "Windows 10 UWP uygulamasının Phone, Tablet veya Desktop cihazda çalıştığını bulmak"
date: 2015-12-04 14:00
author: engin.polat
comments: true
category: [Windows]
tags: [analyticsinfo, apiinformation, class, devicefamily, enum, isapicontractpresent, keyboardcapabilities, keyboardpresent, namespace, property, static, universal app, uwp, versioninfo, windows, windows10]
---
Eğer yazdığınız **Windows 10 UWP** uygulamasının hangi tip cihazda çalıştığını bulmanız gerekiyorsa, aşağıdaki fonksiyondan faydalanabilirsiniz;

<script src="https://gist.github.com/polatengin/1729f964672cacc68d85b6e0f73f6563.js?file=Detect.cs"></script>

Bu fonksiyonda <a href="http://msdn.microsoft.com/library/windows/apps/windows.system.profile" target="_blank" rel="noopener">Windows.System.Profile</a> **namespace**'inde bulunan <a href="http://msdn.microsoft.com/library/windows/apps/windows.system.profile.analyticsinfo" target="_blank" rel="noopener">AnalyticsInfo</a> sınıfının <a href="http://msdn.microsoft.com/library/windows/apps/windows.system.profile.analyticsinfo.versioninfo" target="_blank" rel="noopener">VersionInfo</a> **property**'sinin <a href="http://msdn.microsoft.com/library/windows/apps/windows.system.profile.analyticsversioninfo.devicefamily" target="_blank" rel="noopener">DeviceFamily</a> **property**'sinden ve <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.input" target="_blank" rel="noopener">Windows.Devices.Input</a> **namespace**'inde bulunan <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.input.keyboardcapabilities" target="_blank" rel="noopener">KeyboardCapabilities</a> sınıfının <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.input.keyboardcapabilities.keyboardpresent" target="_blank" rel="noopener">KeyboardPresent</a> **property**'sinden faydalanıyoruz.

*Kaynak: <a href="http://j4ni.com/blog/?p=260" target="_blank" rel="noopener">Figuring out your if your app is run on Phone, Tablet or Desktop</a>*

