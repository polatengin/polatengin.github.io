---
layout: post
title: "Windows Phone 8 uygulaması için Splash Screen hazırlamak"
date: 2013-12-12 19:00
author: engin.polat
comments: true
category: [C#]
tags: [1080p, 720p, performance, performans, proje, project, screen, splash, windows phone, wp7, wp8, wvga, wxga]
---
Eğer *Windows Phone 7* için uygulama geliştirdiyseniz zaten **Splash Screen** sayfalarına aşinasınızdır. Genellikle uygulamanın logosunu içeren **jpg** formatında olan resim, *uygulama açılırken* ekrana gelir ve *tamamen hafızaya yüklendiğinde* otomatik olarak kaldırılırdı.

Performans'ta yapılan çok ciddi iyileştirmeler sayesinde **Windows Phone 8** uygulamalarının *Splash Screen* ihtiyacı ortadan kalktı ve **Windows Phone 7** proje şablonlarının bir parçası olan *Splash Screen*, **Windows Phone 8** proje şablonlarından kaldırıldı.

Eğer projenizde **Splash Screen** ihtiyacınız varsa, *Assets* klasörüne *SplashScreenImage.jpg* isimli, **768 x 1280** boyutlarında bir resim eklemeniz yeterli.

Fakat uygulamanızın tüm ekran çözünürlüklerinde *Splash Screen* resmini doğru göstermesini istiyorsanız, 3 farklı boyutlarda resim daha eklemeniz gerekli.



*   **480 × 800** ekran çözünürlüğü için; *SplashScreenImage.screen-WVGA.jpg*
*   **768 × 1280** ekran çözünürlüğü için; *SplashScreenImage.screen-WXGA.jpg*
*   **720 × 1280** ekran çözünürlüğü için; *SplashScreenImage.screen-720p.jpg*

Eğer uygulamanız **1080p** çözünürlükte bir cihazda açılıyorsa, **720p** resmi kullanılacaktır.

