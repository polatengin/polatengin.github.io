---
layout: post
title: "AspNet Core 1.0 projesine MVC 6 eklemek"
date: 2016-01-30 14:50
author: engin.polat
comments: true
category: [Web]
tags: [action, addmvc, aspnet, aspnetcore, code, command prompt, configure, configureservices, controller, dependencies, dnu, dnx, html, iactionresult, linux, macos, maproute, mvc, restore, startup.cs, terminal, usemvc, view, visual studio code, web, windows, yeoman]
---
*Bu makaleyi okumadan önce <a href="http://www.enginpolat.com/asp-net-core-1-0-ile-web-uygulama-gelistirmeye-baslamak/" target="_blank">Asp.Net Core 1.0 ile web uygulama geliştirmeye başlamak</a> makalesini okumanızı tavsiye ederim.*

Projeyi oluşturmak istediğimiz dizine **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinden gidiyoruz ve aşağıdaki kodları çalıştırıyoruz;



yo aspnet
// Empty Application seçeneğini seçiyoruz
// Projeye aspnetcoremvc6 ismini veriyoruz

// Proje oluşturulduktan sonra
cd aspnetcoremvc6
code .</pre>

**Visual Studio Code** açıldıktan sonra *project.json* dosyasını açıyor ve içindeki **dependencies** kısmına aşağıdaki satırı ekliyoruz;

<pre class="brush:csharp">"Microsoft.AspNet.Mvc": "6.0.0-rc1-final"</pre>

Böylece **Empty Application** tipindeki **AspNet Core** uygulamamıza **Mvc 6** paketini kullanacağımızı söylemiş olduk. Fakat paket henüz projemizin olduğu dizine indirilmedi. Bunun için **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinde aşağıdaki kodu çalıştırıyoruz;

<pre class="brush:csharp">dnu restore</pre>

Artık *Startup.cs* dosyasını açabilir ve projemizde **Mvc** kullanmaya başlayabiliriz. Öncelikle **ConfigureServices()** methodu içerisinde uygulamamıza **Mvc**'yi tanıtıyoruz;

<pre class="brush:csharp">public void ConfigureServices(IServiceCollection services)
{
    services.AddMvc();
}</pre>

Bu noktada **Configure()** methodu içerisinde **Mvc**'yi kullanabilir, yapılandırabiliriz;

<pre class="brush:csharp">app.UseMvc(routes =>
{
    routes.MapRoute(
        name: "default",
        template: "{controller=Home}/{action=Index}"
    );
});</pre>

**AspNet Core 1.0** üzerinde geliştirdiğimiz projemizde artık **MVC 6** yapılandırıldı.

İlk sayfamızı ekrana getirmek için projenin olduğu dizinde **Controllers** ve **Views** isminde iki dizin oluşturalım. Bunun için aşağıdaki komutları **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinde çalıştırabiliriz;

<pre class="brush:csharp">mkdir Controllers
mkdir Views</pre>

**Visual Studio Code** editörüne dönerek **Controllers** dizininde *HomeController.cs* dosyasını oluşturuyoruz ve içerisine **Index()** methodunu aşağıdaki gibi yazıyoruz;

<pre class="brush:csharp">using Microsoft.AspNet.Mvc;

namespace aspnetcoremvc6.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}</pre>

Artık **Views** dizininde **Home** dizinini oluşturup içerisine **Index.cshtml** dosyasını koyabiliriz. **Index.cshtml** dosyasının içerisine aşağıdaki **HTML** kodlarını yazıyoruz;

<pre class="brush:xml">&lt;html&gt;
    &lt;head&gt;
        &lt;title&gt;AspNetCore ve Mvc&lt;/title&gt;
    &lt;/head&gt;
    &lt;body&gt;
        Merhaba Dünya
    &lt;/body&gt;
&lt;/html&gt;</pre>

Böylece **Windows**, **Linux**, **MacOS** üzerinde yayınlanabilecek şekilde **AspNet Core 1.0** üzerinde çalışan ve **Mvc6** kullanan projemiz hazır hale geldi.

Projeyi çalıştırmak için **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinde aşağıdaki komutu çalıştırıyoruz;

<pre class="brush:csharp">dnx web


![](/assets/uploads/2016/01/aspnetcore-mvc.png)

