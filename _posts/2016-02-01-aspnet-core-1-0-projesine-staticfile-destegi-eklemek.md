---
layout: post
title: "AspNet Core 1.0 projesine StaticFile desteği eklemek"
date: 2016-02-01 09:30
author: engin.polat
comments: true
category: [AspNet]
tags: [aspnet, aspnetcore, command prompt, configure, css, dnu, dnx, html, iapplicationbuilder, javascript, jpg, linux, localhost, macos, png, project.json, restore, startup.cs, staticfiles, terminal, usestaticfiles, visual studio code, web, windows]
---
*Bu makaleyi okumadan önce <a href="http://www.enginpolat.com/kategori/asp-net/" target="_blank">Asp.Net Kategorisi</a>ndeki diğer makalelerimi okumanızı tavsiye ederim.*

**AspNet Core 1.0** projelerinde eğer *html*, *js*, *css*, *jpg*, *png* gibi dosyalar kullanacaksanız bu makalede anlatıldığı gibi **StaticFile** desteğini projenize eklemeniz gerekmektedir.

Eğer **StaticFile** desteğini projeye eklemezseniz *html*, *js*, *css*, *jpg*, *png* gibi uzantılara sahip dosyaları tarayıcılarda görüntüleyemeyeceksiniz.

Hemen *örnek proje* oluşturacağımız dizine **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinden gidiyoruz ve aşağıdaki kodları çalıştırıyoruz;



yo aspnet
// Empty Application seçeneğini seçiyoruz
// Projeye aspnetcorestaticfile ismini veriyoruz

cd aspnetcorestaticfile
code .</pre>

![](/assets/uploads/2016/02/staticfile-1.png)

**Visual Studio Code** açıldıktan sonra **wwwroot** dizinine *index.html* dosyasını ekliyoruz ve içerisine *Merhaba Dünya!* yazıyoruz.

![](/assets/uploads/2016/02/staticfile-2.png)

**Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) penceresine dönüp aşağıdaki kodu çalıştırıyoruz;

<pre class="brush:csharp">dnx web</pre>

![](/assets/uploads/2016/02/staticfile-4.png)

İstediğimiz tarayıcıyı kullanarak *http://localhost:5000/index.html* adresine gittiğimizde karşımıza hiçbirşey *gelmediğini* görüyoruz.

Az önce *index.html* dosyasını oluşturduk, fakat *index.html* dosyasının içeriğine ulaşamadık. Bunun sebebi **AspNet Core 1.0** biz **StaticFile** desteğini ekleyene kadar *wwwroot* dizinindeki dosyaları servis etmez.

Hemen *project.json* dosyasını açıyoruz ve **dependencies** kısmına aşağıdaki satırı ekliyoruz;

<pre class="brush:csharp">"Microsoft.AspNet.StaticFiles": "1.0.0-rc1-final"</pre>

**Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) penceresine dönüp aşağıdaki kodu çalıştırıyoruz;

<pre class="brush:csharp">dnu restore</pre>

![](/assets/uploads/2016/02/staticfile-3.png)

Böylece **StaticFile** servis etmek için gerekli *paket* projemizin olduğu dizine indirilmiş oldu.

*Startup.cs* dosyasını açıp, **Configure()** method'unu aşağıdaki şekilde değiştiriyoruz;

<pre class="brush:csharp">public void Configure(IApplicationBuilder app)
{
    app.UseIISPlatformHandler();

    app.UseStaticFiles();
}</pre>

Tekrar **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) penceresine dönüp aşağıdaki kodu çalıştırıyoruz;

<pre class="brush:csharp">dnx web


İstediğimiz tarayıcıyı kullanarak *http://localhost:5000/index.html* adresine gittiğimizde, artık Merhaba Dünya! yazısını görebiliriz.

![](/assets/uploads/2016/02/staticfile-5.png)

Eğer **AspNet Core 1.0** uygulamalarımızda *html*, *js*, *css*, *jpg*, *png* gibi dosyaları kullanmak istiyorsak, **StaticFile** desteğini projemize eklememiz gerekiyor.

