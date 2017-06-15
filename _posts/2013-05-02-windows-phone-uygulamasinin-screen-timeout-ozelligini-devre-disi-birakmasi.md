---
layout: post
title: "Windows Phone uygulamasının Screen TimeOut özelliğini devre dışı bırakması"
date: 2013-05-02 11:30
author: engin.polat
comments: true
category: [Programlama]
tags: [disable, enable, gamerservices, guide, isscreensaverenabled, screen, timeout, windows phone, windowsphone, wp8]
---
**Windows Phone** kullanıcıları telefonlarının **Screen TimeOut** sürelerini kendileri belirleyebilirler;

![](/assets/uploads/2013/04/DisableScreenTimeOut_0.png) ![](/assets/uploads/2013/04/DisableScreenTimeOut_1.png)

Bu ayar sayesinde, telefonu belli bir süre *kullanmadıklarında* ekranın otomatik olarak kapanması sağlanır. Özellikle *pil tüketimini azaltmak* ve telefonu tek sarj ile daha uzun kullanabilmek için bu ayar sıklıkla 1-2 dakika seviyelerine getirilir.

Fakat video izlerken, kitap/haber okurken ekranın 1-2 dakikada bir kapanması kullanıcı tarafından *hoş karşılanmayacaktır*.

**Windows Phone** uygulamanızda ekranın kendini otomatik olarak kapatmasını engellemek için aşağıdaki kod parçasını kullanabiliriz;



Guide.IsScreenSaverEnabled = false;


*XNA Framework* içerisinde yeralan <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.gamerservices.guide" title="MSDN : Guide Class" target="_blank">Guide</a> sınıfının <a href="http://msdn.microsoft.com/library/microsoft.xna.framework.gamerservices.guide.isscreensaverenabled" title="MSDN : Guide.IsScreenSaverEnabled Property" target="_blank">IsScreenSaverEnabled</a> property'sine *false* değeri verdiğimizde ekran otomatik olarak *kapanmayacaktır*.

