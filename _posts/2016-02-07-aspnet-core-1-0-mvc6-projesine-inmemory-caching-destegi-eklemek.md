---
layout: post
title: "AspNet Core 1.0 MVC6 projesine InMemory Caching desteği eklemek"
date: 2016-02-07 14:30
author: engin.polat
comments: true
category: [AspNet]
tags: [action, addcaching, addmvc, aspnet, aspnetcore, cache, code, command, command prompt, configure, configureservices, console, constructor, controller, datetime, dependencies, dnu, dnx, fromminutes, IEnumerable, imemorycache, iservicecollection, linux, localhost, maproute, memorycacheentryoptions, mvc, namespace, out, project.json, restore, return, set, setabsoluteexpiration, startup.cs, template, terminal, TimeSpan, trygetvalue, usemvc, using, visual studio code, web, windows, yo]
---
*Bu makaleyi okumadan önce <a href="http://www.enginpolat.com/kategori/asp-net/" target="_blank">Asp.Net Kategorisi</a>ndeki diğer makalelerimi okumanızı tavsiye ederim.*

**Caching** (*önbellekleme*) sayesinde elde etmesi uzun sürecek verilere çok daha **hızlı** bir şekilde ulaşabiliriz.

Hemen yeni bir **Asp.Net Core 1.0 MVC 6** projesi oluşturalım ve **InMemory Caching** ekleyelim.

Öncelikle örnek projeyi oluşturmak istediğimiz dizine **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinden gidiyoruz ve aşağıdaki kodları çalıştırıyoruz;



yo aspnet
// Empty Application seçeneğini seçiyoruz
// Projeye inmemorycaching ismini veriyoruz

cd inmemorycaching
code .</pre>

**Visual Studio Code** açıldıktan sonra *project.json* dosyasını açıyor ve içindeki **dependencies** kısmına aşağıdaki satırı ekliyoruz;

<pre class="brush:csharp">"Microsoft.AspNet.Mvc": "6.0.0-rc1-final"</pre>

Böylece **Empty Application** tipindeki **AspNet Core** uygulamamıza **MVC 6** paketini kullanacağımızı söylemiş olduk. Fakat paket henüz projemizin olduğu dizine indirilmedi. Bunun için **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinde aşağıdaki kodu çalıştırıyoruz;

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

İlk **action** methodumuzu yazmak için projenin olduğu dizinde **Controllers** dizini oluşturalım. Bunun için aşağıdaki komutları **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinde çalıştırabiliriz;

<pre class="brush:csharp">mkdir Controllers</pre>

**Visual Studio Code** editörüne dönerek **Controllers** dizininde *HomeController.cs* dosyasını oluşturuyoruz ve içerisine **Index()** methodunu aşağıdaki gibi yazıyoruz;

<pre class="brush:csharp">using Microsoft.AspNet.Mvc;

namespace inmemorycaching.Controllers
{
    public class HomeController : Controller
    {
        public string Index()
        {
            return "";
        }
    }
}</pre>

Bu noktaya kadar *http://localhost:5000* adresine girdiğimizde boş bir sayfa ile karşılaşacağımız uygulamayı hazırladık.

*project.json* dosyasını açalım ve **dependencies** kısmına aşağıdaki paketi ekleyelim;

<pre class="brush:csharp">"Microsoft.Extensions.Caching.Memory": "1.0.0-rc1-final"</pre>

**Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinde aşağıdaki kodu çalıştıralım;

<pre class="brush:csharp">dnu restore</pre>

Artık projemizde **caching** (*önbellekleme*) yapabiliriz. Öncelikle *Startup.cs* dosyasını tekrar açalım ve *ConfigureServices()* methodunun içini aşağıdaki gibi değiştirelim;

<pre class="brush:csharp">services.AddCaching().AddMvc();</pre>

Şimdi *HomeController.cs* dosyasını açıp aşağıdaki şekilde güncelleyebiliriz;

<pre class="brush:csharp">public class HomeController : Controller
{
    private IMemoryCache cache;

    public HomeController(IMemoryCache _cache)
    {
        cache = _cache;
    }

    public string Index()
    {
        var start = DateTime.Now;

        IEnumerable&lt;int&gt; rakamlar;

        if(!cache.TryGetValue("Rakamlar", out rakamlar))
        {
            rakamlar = Enumerable.Range(1, 10000);

            cache.Set("Rakamlar", rakamlar);
        }

        return $"10.000 öğeli listenin elde edilme süresi : {(DateTime.Now - start).TotalMilliseconds} ms.";
    }
}</pre>

Öncelikle *HomeController* sınıfı içinde <a href="http://docs.asp.net/projects/api/en/latest/autoapi/Microsoft/Extensions/Caching/Memory/IMemoryCache/index.html#imemorycache-interface" target="_blank">IMemoryCache</a> tipinde *cache* değişkenini tanımladık.

*using kısmına Microsoft.Extensions.Caching.Memory namespace'ini eklemeyi unutmamalıyız.*

*HomeController* sınıfının **constructor**'ında **IMemoryCache** tipinde bir parametre aldık ve *cache* değişkeninde sakladık.

*Index()* **action** methodunda içerisinde *10.000* adet rakam saklayacağımız değişkenimizi tanımlıyoruz.

*cache* değişkeninin <a href="http://docs.asp.net/projects/api/en/latest/autoapi/Microsoft/Extensions/Caching/Memory/IMemoryCache/index.html#meth-Microsoft.Extensions.Caching.Memory.IMemoryCache.TryGetValue" target="_blank">TryGetValue()</a> methodu aracılığı ile liste değişkenini **cache**'teki liste ile doldurmaya çalışıyoruz.

Eğer dolduramazsak, *cache*'e *10.000* rakamlı değişkeni ekliyoruz.

*Index()* action method'unun başında ve sonunda aldığımız iki zaman değişkeni aracılığı ile arada geçen zamanı hesaplıyoruz ve ekranda gösteriyoruz.

*http://localhost:5000* adresine ilk ziyaretimizde *10.000* elemanlı diziye yaklaşık *6 saniye* içerisinde ulaşabildiğimizi görüyoruz.

![](/assets/uploads/2016/02/in-memory-cache-1.png)

Takip eden ziyaretlerimizde ise *0 milisaniye* içerisinde aynı diziye ulaşabiliyoruz;

![](/assets/uploads/2016/02/in-memory-cache-2.png)

**IMemoryCache** *interface*'inde tanımlı olan <a href="http://docs.asp.net/projects/api/en/latest/autoapi/Microsoft/Extensions/Caching/Memory/IMemoryCache/index.html#meth-Microsoft.Extensions.Caching.Memory.IMemoryCache.Set" target="_blank">Set()</a> methodu ile **cache**'e eklediğimiz nesnenin belli bir süre sonra otomatik olarak **cache**'ten silinmesini istiyorsak, <a href="http://docs.asp.net/projects/api/en/latest/autoapi/Microsoft/Extensions/Caching/Memory/MemoryCacheEntryOptions/index.html#Microsoft.Extensions.Caching.Memory.MemoryCacheEntryOptions" target="_blank">MemoryCacheEntryOptions</a> sınıfından yeni bir **instance** çıkartıp, <a href="http://docs.asp.net/projects/api/en/latest/autoapi/Microsoft/Extensions/Caching/Memory/MemoryCacheEntryExtensions/index.html?highlight=setabsoluteexpiration#meth-Microsoft.Extensions.Caching.Memory.MemoryCacheEntryExtensions.SetAbsoluteExpiration" target="_blank">SetAbsoluteExpiration()</a> methoduna istediğimiz süreyi <a href="http://msdn.microsoft.com/library/system.timespan" target="_blank">TimeSpan</a> tipinde vermeliyiz;

<pre class="brush:csharp">cache.Set("Rakamlar", rakamlar, new MemoryCacheEntryOptions().SetAbsoluteExpiration(TimeSpan.FromMinutes(30)));


