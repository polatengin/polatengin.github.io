---
layout: post
title: "Page CodeBehind dosyasını Universal App Shared Project içerisinde kullanmak"
date: 2014-06-25 09:00
author: engin.polat
comments: true
category: [Windows]
tags: [app.xaml, codebehind, shared project, universal app, windows store, windowsphone, xaml, xaml.cs]
---
**Universal App** projesi oluşturduktan sonra *Solution Explorer* içerisine bakacak olursanız *[ProjectName].Shared* isimli bir projenin daha yer aldığını görürsünüz.

**Shared Project** içerisinde hem *Windows Store*, hem de *Windows Phone* projelerinizde ortak olarak kullanacağınız dosyaları barındırabiliyorsunuz.

Örneğin, *App.xaml* ve *App.xaml.cs* dosyaları *Shared Project* içerisinde oluşturuluyor ve hem *Windows Store* hem de *Windows Phone* projeleri tarafından ortak kullanılıyor.

*Shared Project* içerisinde *Assets* isminde bir dizin oluşturabilir ve iki projede de ortak kullanacağımız görsel dosyalarını, ses dosyalarını tek bir yerden yönetebiliriz.

Hatta *Pages* isminde bir dizin içerisinde, iki projede de ortak olacak ekranları oluşturabiliriz.

Bazı durumlarda bir ekranın her iki projede de *aynı şekilde gözükmesini* ama *farklı davranmasını* isteyebiliriz. Bu durumda ilgili ekranın **xaml** uzantılı dosyasını *Shared Project* içerisine, **xaml.cs** (*CodeBehind*) dosyalarını ise her projenin içerisine ayrı ayrı koyabiliriz.

Tam tersi durum da söz konusu olabilir, bir ekranın iki projede de farklı gözükmesini ama aynı şekilde davranmasını isteyebiliriz. Bu durumda da ilgili ekranın **xaml** uzantılı dosyalarını her projenin içerisinde, **xaml.cs** uzantılı (*CodeBehind*) dosyasını da *Shared Project* içerisinde oluşturabiliriz.

*Shared Project* içerisinde yer alan kod dosyalarında platform'a özel değişiklik yapmamız gerekiyorsa aşağıdaki örnekte gözüktüğü gibi kontroller yapabilmemiz mümkün;



#if WINDOWS_PHONE_APP
//Windows Phone platformunda çalışacak kodlar
#endif

#if WINDOWS_APP
//Windows platformunda çalışacak kodlar
#endif


![](/assets/uploads/2014/06/UniversalSharedProject.png)

