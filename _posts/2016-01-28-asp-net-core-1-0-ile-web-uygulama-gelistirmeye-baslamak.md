---
layout: post
title: "Asp.Net Core 1.0 ile web uygulama geliştirmeye başlamak"
date: 2016-01-28 11:40
author: engin.polat
comments: true
category: [AspNet]
tags: [aspnet, aspnetcore, command prompt, cross-platform, dnu, dnx, linux, localhost, macos, nodejs, npm, project.json, request, response, restore, startup.cs, terminal, visual studio code, windows, yeoman, yo]
---
Yeni adı ile **Asp.Net Core 1.0** (eski adı *Asp.Net 5*) üzerinde geliştirdiğimiz web uygulamaları hem **Windows** hem **MacOS** işletim sisteminde hem de **Linux** işletim sisteminde çalıştırılabiliyor. **Cross-Platform** denilen bu tarz uygulamaları genelde **cross-platform** araçlar ile geliştiririz.

*Microsoft*, **Asp.Net Core 1.0** ile web uygulamaları geliştirebilmemiz için ücretsiz olarak **Visual Studio Code** aracını da sağlıyor ve **Visual Studio Code** *cross-platform* çalışabilen bir uygulama geliştirme aracıdır.

Bu makale ile **Visual Studio Code** kullanarak **Asp.Net Core 1.0** projeleri nasıl oluşturulur inceleyeceğiz ve ilk *Merhaba Dünya* uygulamamızı oluşturacağız.

Öncelikle **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) penceresi açıyoruz;

![](/assets/uploads/2016/01/aspnetcore-1.png)

Projeyi oluşturmak istediğimiz dizine giderek komut satırına



yo aspnet</pre>

yazarak çalıştırıyoruz. Böylece <a href="http://yeoman.io/" target="_blank">Yeoman</a> kullanarak <a href="https://github.com/omnisharp/generator-aspnet" target="_blank">Asp.Net Core 1.0</a> projesi oluşturacağız.

![](/assets/uploads/2016/01/aspnetcore-2.png)

Eğer bilgisayarda **Yeoman** kurulu değilse yukarıdaki kod çalışmayacaktır. Öncelikle **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) penceresi içerisinde aşağıdaki kodu çalıştırarak **yo** aracını kurabilirsiniz;

<pre class="brush:csharp">npm install -g yo</pre>

Eğer bilgisayarda **npm** kurulu değilse, <a href="https://nodejs.org" target="_blank">Node.js</a> anasayfasından indirerek kurabilirsiniz.

**Yeoman** *aspnet* komutunu çalıştırırken bize ne tip bir proje oluşturmak istediğimizi sorar, listeden **Empty Application** seçeneğini seçebiliriz.

![](/assets/uploads/2016/01/aspnetcore-3.png)

**Yeoman** çalışmaya devam ederken projemize vermek istediğimiz ismi sorar, bu makalede ben *aspnetcoreornek* ismini verdim;

![](/assets/uploads/2016/01/aspnetcore-4.png)

Böylece **Yeoman** projeyi istediğimiz dizinde oluşturmuş oldu.

![](/assets/uploads/2016/01/aspnetcore-5.png)

Komut satırında projenin dizinine giderek

<pre class="brush:csharp">dnu restore</pre>

komutunu çalıştırıyoruz. Böylece projedeki *project.json* dosyasında tanımlı olan paketler proje dizinine indiriliyor. Eğer bu komutu çalıştırmazsak, uygulamanın ihtiyaç duyduğu paketler eksik olacak ve *uygulama çalışmayacak*.

![](/assets/uploads/2016/01/aspnetcore-6.png)

Proje kodlarını açmak için bir editöre ihtiyacımız var. **Visual Studio Code** *cross-platform* **Asp.Net** projeleri geliştirmek için gene *cross-platform* geliştirilmiş bir araç.

<pre class="brush:csharp">code .</pre>

komutunu çalıştırarak proje dizinini **Visual Studio Code** ile açıyoruz;

![](/assets/uploads/2016/01/aspnetcore-7.png)

**Visual Studio Code** açıldığında soldaki panelde proje dizininde yeralan dosyalar listeleniyor.

![](/assets/uploads/2016/01/aspnetcore-9.png)

*project.json* dosyası içerisine bakarsak, projenin çalışabilmek için ihtiyaç duyduğu paketlerin listesini görebiliriz.

![](/assets/uploads/2016/01/aspnetcore-10.png)

Aynı şekilde *Startup.cs* dosyasını açacak olursak, gelen her **request** için yapılacak işleri görebiliriz. **Empty Application** projesi oluşturduğumuzdan gelen her **request** için geriye *Hello World!* döndürülüyor;

![](/assets/uploads/2016/01/aspnetcore-12.png)

Projeyi bir tarayıcı içerisinde görmek istiyorsak projenin dizininde

<pre class="brush:csharp">dnx web


komutunu çalıştırmalıyız. Böylece *http://localhost:5000* adresi üzerinde proje çalışmaya başlayacak.

![](/assets/uploads/2016/01/aspnetcore-11.png)

**Microsoft Edge**, **Internet Explorer**, **Google Chrome**, **Mozilla Firefox**, **Safari**, **Opera**, vs gibi bir tarayıcıyı açıp adres satırına *http://localhost:5000* yazacak olursak *Hello World!* cevabının görüntülendiğini görebiliriz;

![](/assets/uploads/2016/01/aspnetcore-13.png)

Aslında gelen her request için *Hello World!* sonucunu döndürdüğümüzden, *http://localhost:5000* ile başlayan hangi adrese gidersek gidelim hep aynı *Hello World!* sonucunu göreceğiz;

![](/assets/uploads/2016/01/aspnetcore-8.png)

