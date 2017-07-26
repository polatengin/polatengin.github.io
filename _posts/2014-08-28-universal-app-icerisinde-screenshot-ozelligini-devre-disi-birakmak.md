---
layout: post
title: "Universal App içerisinde ScreenShot özelliğini devre dışı bırakmak"
date: 2014-08-28 13:00
author: engin.polat
comments: true
category: [Windows]
tags: [applicationview, camera, getforcurrentview, isscreencaptureenabled, power, screenshot, search, start, universal app, volume, windows phone emulator, uwp]
---
**Windows Phone 8.1** kullanıcıları *[POWER]* ve *[VOLUME UP]* tuşlarına aynı anda basarak o anda kullanmakta oldukları uygulamanın ekran görüntüsünü çekebilirler.

Eğer uygulamanızın ekran görüntüsünün çekilmesini istemiyorsanız, **Universal App** projenizde ilgili ekranın açılışına aşağıdaki kod parçasını ekleyebilir ve ekran görüntüsü çekme özelliğini *devre dışı* bırakabilirsiniz;



ApplicationView.GetForCurrentView().IsScreenCaptureEnabled = false;


Böylece ilgili ekranın görüntüsü alınmak istendiği zaman aşağıda görebileceğiniz gibi **Cannot capture protected content** mesajı kullanıcıya gösterilecek ve ekran görüntüsü alınmayacaktır.

![](/assets/uploads/2014/08/Screenshot-0.png)

Bu kodu **Windows Phone Emulator** içerisinde test etmek için uygulamanız emulator içerisinde açıkken *F9* ve *F12* tuşlarına aynı anda basın.

Bazı önemli emulator kısayolları;

**F2 : ***START*
**F3 : ***SEARCH*
**F6 : ***CAMERA HALF*
**F7 : ***CAMERA FULL*
**F9 : ***VOLUME UP*
**F10 : ***VOLUME DOWN*
**F12 : ***POWER*

