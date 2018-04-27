---
layout: post
title: "Asp.Net Core uygulamalarında Google reCaptcha kullanımı"
date: 2016-09-17 08:50
author: engin.polat
comments: true
category: [Web]
tags: [action, addmodelerror, addmvc, aspnet, aspnetcore, async, await, captcha, command prompt, connection, controller, data, dependencies, deserializeobject, dotnet, Form, formurlencodedcontent, google, html, html5, httpclient, httpcontext, httppost, iactionresult, iapplicationbuilder, iservicecollection, isvalid, json, jsonconvert, keyvaluepair, linux, macos, maproute, method, modelstate, mvc, post, postasync, project.json, readasstringasync, recaptcha, remoteipaddress, request, template, terminal, usemvc, view, web, windows, yeoman, yo]
---
Bu makalede <a href="http://www.google.com/recaptcha" target="_blank" rel="noopener">Google reCaptcha</a> servisini **Asp.Net Core** uygulamasında nasıl kullanacağımızı adım adım inceleyeceğiz.

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/recaptcha-0.gif" />

Öncelikle <a href="http://www.google.com/recaptcha/admin" target="_blank" rel="noopener">Google reCaptcha Admin</a> sayfasında *site ismi*, *adresi* gibi bilgileri girerek yeni bir kayıt oluşturmamız ve eğer bilgisayarınızda <a href="https://www.microsoft.com/net" target="_blank" rel="noopener">.Net Core</a> yüklü değilse yüklememiz gerekiyor.

Örnek projeyi oluşturmak istediğimiz dizine **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinden gidiyoruz ve aşağıdaki kodları çalıştırıyoruz;

<script src="https://gist.github.com/polatengin/555832931701237bb2761616692713f8.js?file=yo.cmd"></script>

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/recaptcha-1.png" />

Proje tipi olarak **Empty Web Application**, proje ismi olarakta *asp-net-core-google-recaptcha* belirleyelim.

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/recaptcha-2.png" />

**project.json** dosyasını açarak, **dependencies** kısmının içerisine aşağıdaki paketleri yazalım;

<script src="https://gist.github.com/polatengin/555832931701237bb2761616692713f8.js?file=dependencies.js"></script>

Paketleri indirmek için *Command Prompt* içerisinde **dotnet restore** komutunu çalıştırmamız lazım;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/recaptcha-3.png" />

Şimdi *Startup.cs* dosyasını açalım, *Configure()* ve *ConfigureServices()* method'larının içerisini aşağıdaki şekilde değiştirelim;

<script src="https://gist.github.com/polatengin/555832931701237bb2761616692713f8.js?file=Startup.cs"></script>

Şimdi, projenin *root* dizininde **Controllers** dizini oluşturalım, içerisine *HomeController.cs* dosyası ekleyelim ve aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/555832931701237bb2761616692713f8.js?file=HomeController-Index.cs"></script>

Artık, projenin *root* dizininde *Views/Home* dizini oluşturup, içerisine **Index.cshtml** dosyası ekleyebilir, aşağıdaki kodları yazabiliriz;

<script src="https://gist.github.com/polatengin/555832931701237bb2761616692713f8.js?file=Index.cshtml"></script>

**Html** kodları içerisindeki **g-recaptcha** *css* *class*'ına sahip olan elementin **data-sitekey** attribute değeri **Google reCaptcha Admin** konsolunda oluşturduğumuz kaydın **SiteKey** alanında yazan değer olmalı.

Kullanıcının kendini doğruladığını sunucu üzerinde de kontrol etmemiz gerekiyor, bunun için, HomeController.cs dosyasını açalım ve aşağıdaki kodları ekleyelim;

<script src="https://gist.github.com/polatengin/555832931701237bb2761616692713f8.js?file=HomeController-HttpPostIndex-CheckCaptcha.cs"></script>

**secret** parametresi için, **Google reCaptcha Admin** konsolunda üretilen **Secret Key** alanının değerini kullanmamız gerekiyor.

*Command Prompt* açarak **dotnet run** komutunu yazalım ve uygulamanın çalıştığını görelim;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/recaptcha-4.png" />

Artık **Microsoft Edge** tarayıcısını açabilir, *http://localhost:5000* adresinden sayfayı görebiliriz;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/recaptcha-5.png" />

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/recaptcha-6.png" />

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/recaptcha-7.png" />

Eğer **Google reCaptcha** için *Ben robot değilim* adımını yapmazsak, "*Captcha doğrulanmamış*", yanlış doğrularsak, "*Captcha yanlış doğrulanmış*" adımları gerçekleşecek.

Tüm adımları doğru gerçekleştirirsek, "*Herşey doğru*" adımına gelecek.