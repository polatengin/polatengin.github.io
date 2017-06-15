---
layout: post
title: "ASP.NET 4.0 SEO Geliştirmeleri"
date: 2010-01-12 11:37
author: engin.polat
comments: true
category: [AspNet]
tags: [aspnet, crawler, description, http, keywords, redirect, response, seo, url routing]
---
**Search Engine Optimization (Arama Motoru Optimizasyonu)**, internette yayınlanan her site için çok önemlidir. Günümüzde sitelerin trafiklerinin büyük oranı arama motorlarından gelmektedir. Web sitelerinin arama sonuçlarında daha iyi yer edinmeleri alacakları trafik açısından gittikçe daha önemli hale gelmektedir.

Web sitenizin SEO-Uyumluluğunu <a title="Google Analytics" href="http://www.google.com/analytics" target="_blank">Google Analytics</a> ile kolaylıkla ölçebilirsiniz.

**ASP.NET 4.0 SEO Geliştirmeleri**

ASP.NET 4.0 SEO uyumluluğu ile ilgili olarak bir dizi yenilik-geliştirme ile birlikte geliyor. Bunlardan bazıları;


*   Yeni Page.MetaKeywords ve Page.MetaDescription özellikleri
*   ASP.NET Web Forms'ta yeni gelen URL Yönlendirme (URL Routing) desteği
*   Yeni Response.RedirectPermanent() methodu
Bu özellikleri inceleyelim;

***Page.MetaKeywords and Page.MetaDescription Özellikleri***

Arama motorlarının **crawler** dediği programcıklar, sitenizi indekslerken, *&lt;head&gt;* tagı içerisinde yeralan *&lt;meta name="keywords"&gt;* ve *&lt;meta name="description"&gt;* taglarını kullanarak sitenizi kategorize eder.


&lt;head runat="server"&gt;
    &lt;title&gt;Örnek Sayfa&lt;/title&gt;
    &lt;meta name="keywords" content="aspnet, engin polat, geliştirme, framework" /&gt;
    &lt;meta name="description" content="ASP.NET 4.0 ile yeni gelen özellikler" /&gt;
&lt;/head&gt;</pre>
ASP.NET 4.0'dan önce, bu taglara programatik olarak erişmek mümkün değildi. ASP.NET 4.0 ile birlikte aşağıdaki kodları yazabiliyoruz;
<pre class="brush:csharp">public void Page_Load(object sender, EventArgs e)
{
    Page.Title = "Örnek Sayfa";

    Page.MetaKeywords = "aspnet, engin polat, geliştirme, framework";
    Page.MetaDescription = "ASP.NET 4.0 ile yeni gelen özellikler";
}</pre>
<pre class="brush:php">&lt;%@ Page Title="Örnek Sayfa"
    Keywords = "aspnet, engin polat, geliştirme, framework"
    Description = "ASP.NET 4.0 ile yeni gelen özellikler"
    CodeBehind = "OrnekSayfa.aspx.cs"
    Inherits = "OrnekWebSitesi.OrnekSayfa" %&gt;

Yukarıdaki kodlar sayesinde *Page* sınıfının *Keyword* ve *Description* özelliklerine programatik olarak erişmek mümkündür.

***ASP.NET Web Formlarında URL Yönlendirme (URL Routing)***

**URL Yönlendirme** özelliği ilk olarak ASP.NET 3.5 SP1 ile gelmişti ve ASP.NET MVC ile zaten kullanabiliyorduk. URL Yönlendirme özelliği sayesinde, web uygulamasına gelecek tüm isteklerin fiziksel dosyalara gelmesi zorunluluğu ortadan kalkıyor. Artık aşağıdakiler gibi **Arama Motoru Uyumlu (SEO - Friendly)** URL'ler tanımlayabiliyoruz;

*http://www.orneksite.com/sayfa.aspx?id=5*
yerine
*http://www.orneksite.com/sayfa/hakkinda*

veya

*http://www.orneksite.com/urunler.aspx?kategori=yazilim*
yerine
*http://www.orneksite.com/urunler/yazilim*

ASP.NET 4.0 URL Yönlendirme (URL Routing) ile ilgili detaylı bir yazıyı yakında yayınlayacağım.

***Response.RedirectPermanent() methodu***

Web uygulamalarımızda, belli durumlarda akışı başka bir sayfaya yönlendirmek sıklıkla yaptığımız birşeydir. ASP.NET ile genellikle *Response.Redirect()* method'unu kullanırız. Aslında *Response.Redirect()* method'unun yaptığı şey, browser'a **HTTP 302 (Temporary Redirect - Geçici Yönlendirme)** sonucu döndürmektir. Böylece browser yönlendirmek istenen sayfadan akışa devam eder.

Arama motorlarının sayfaları indexlemeye yarayan crawler uygulamaları, bir sayfadan diğerine geçici olarak yönlendirme olduğunu gördüğünde (HTTP 302 mesajı) **akışa yeni sayfadan devam etmez**. Bu da sitenizde bulunmasına rağmen indexlenmeyen sayfalar oluşmasına yol açar.

ASP.NET 4.0 ile birlikte *Response.RedirectPermanent()* method'u geliyor. Bu method çağırıldığında, browser'a HTTP 302 mesajı yerine **HTTP 301 (Moved Permanently - Kalıcı Olarak Taşındı)** mesajı döndürür. Crawler'lar, HTTP 301 mesajı gördüklerinde akışa yeni sayfadan devam ettikleri için, **web sitesinin tamamı indexlenecektir**.

*Response.Redirect("YeniSayfa.aspx"); // HTTP 302 mesajı ile YeniSayfa.aspx'ten akış devam eder. Crawler indexlemez.*

*Response.RedirectPermanent("YeniSayfa.aspx"); // HTTP 301 mesajı ile YeniSayfa.aspx'ten akış devam eder. Crawler indexler.*

**ASP.NET MVC** ile kullanılmak üzere *Response.RedirectToRoutePermanent()* methodu geliyor.

*Response.RedirectToRoute("Urunler-Listele", new { kategori = "yazilim" }); // HTTP 302 mesajı döner. Crawler indexlemez.*

yerine

*Response.RedirectToRoutePermanent("Urunler-Listele", new { kategori = "yazilim" }); // HTTP 301 mesajı döner. Crawler indexler.*

Sonuç olarak, ASP.NET 4.0 Arama Motoru Dostu ( SEO - Friendly ) uygulama yazmayı kolaylaştıran araçlara sahip olarak geliyor.

