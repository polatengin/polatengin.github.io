---
layout: post
title: "Windows 10 UWP uygulamalarında ekran nesnelerine stil vermek - Inline"
date: 2016-06-25 17:00
author: engin.polat
comments: true
category: [Universal App]
tags: [background, border, borderbrush, button, controls, foreground, mainpage, margin, padding, project, style, uwp, windows10, xaml]
---
**Windows 10 UWP** uygulaması geliştirirken ekranda göstereceğimiz nesnelerin varsayılandan **farklı** gözükmesini isteriz.

Bunun için istediğimiz nesnelerin *stillerini* (<a href="http://msdn.microsoft.com/library/system.windows.style" target="_blank">Style</a>) değiştirmemiz gerekir.

Hemen yeni bir proje oluşturalım ve stilleri nasıl değiştireceğimizi inceleyelim;

![](/assets/uploads/2016/06/style-ornek-inline-0.png)

Projeyi oluşturduktan sonra, **MainPage.xaml** dosyasını açalım ve içerisini aşağıdaki şekilde değiştirelim;

<script src="https://gist.github.com/polatengin/d664ccd8ec99c0c79f7f1dfd6de0a617.js?file=MainPage.xaml"></script>

Stilini değiştirmek istediğimiz nesnenin özelliklerini kullanarak farklı gözükmesini sağlayabiliyoruz. Örneğin, sayfaya bir <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.button" target="_blank">Button</a> nesnesi ekleyerek aşağıdaki özelliklerini değiştirebilir, ekranda varsayılan halinden farklı gözükmesini sağlayabiliriz;



*   Background
*   Foreground
*   BorderBrush
*   Margin
*   Padding

Sonuç aşağıdaki gibi olmalı;

![](/assets/uploads/2016/06/style-ornek-inline-1.png)

