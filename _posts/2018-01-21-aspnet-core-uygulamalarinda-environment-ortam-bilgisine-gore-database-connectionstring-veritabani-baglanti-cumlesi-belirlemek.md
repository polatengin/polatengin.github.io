---
layout: post
title: "Asp.Net Core uygulamalarında Environment (Ortam) bilgisine göre Database ConnectionString (Veritabanı Bağlantı Cümlesi) belirlemek"
date: 2018-01-21 14:00
author: engin.polat
comments: true
category: [Web]
tags: [aspnetcore, database, connectionstring, environment, development, test, staging, production, dbcontext, dbset, configureservices, iservicecollection, adddbcontextpool, sqlconnectionstringbuilder, configuration, getconnectionstring, initialcatalog, isdevelopment, usesqlserver, appsettings]
---
Geçen yıl geliştirmeye başladığımız *birkaç bin adam/gün* sürecek koca bir *ERP* uygulamasında, **Web API** projesinin yayınlandığı ortama göre **Database ConnectionString**'e (*Veritabanı Bağlantı Cümlesi*) sahip olması gerekiyordu.

Örneğin, **ConnectionString**, *Development* ortamında **Development** veritabanını, *Test* ortamında **Test** veritabanını, *Staging* ortamında **Staging** veritabanını, *Production* ortamında **Production** veritabanını göstermeliydi.

Eğer **Asp.Net Core Web API** uygulamasının, çalıştığı ortama göre (*Environment*) otomatik olarak **ConnectionString** bilgisini belirlemesini sağlayabilirsem, uygulamanın çeşitli ortamlara yayılması gerektiğinde, **ConnectionString**'i güncelleme derdinden kurtulabilirdim.

Hatta, her *developer*ın bilgisayarının isminin de **ConnectionString**'te olmasını sağlayabilirsem, aynı anda geliştirme yapan birden fazla *developer*'ın, birbirlerinin veritabanı değişikliklerinden etkilenmesini de engelleyebilirdim.

Bunu gerçekleştirmek için, öncelikle projede yeni bir *AppDataContext.cs* dosyası oluşturdum ve <a href="https://www.nuget.org/packages/Microsoft.EntityFrameworkCore/" target="_blank">Microsoft.EntityFrameworkCore</a> kütüphanesini kullanarak veritabanını ve tabloları modelledim;

<script src="https://gist.github.com/polatengin/464d78a39de20e32bd4c33f62b847bbf.js?file=AppDataContext.cs"></script>

*Startup.cs* dosyasında yer alan *ConfigureServices()* methoduna aşağıdaki kodları yazdım;

<script src="https://gist.github.com/polatengin/464d78a39de20e32bd4c33f62b847bbf.js?file=ConfigureServices.cs"></script>

<code>AddDbContextPool()</code> methodu sayesinde, uygulamada *AppDataContext* sınıfı her gerektiğinde (**Dependency Injection** ve **IoC** - **Inversion of Control** yöntemleri ile) sağlanacak olan *AppDataContext* değişkenini yapılandırdım.

Burada dikkat edilmesi gereken nokta, <code>SqlConnectionStringBuilder</code> sınıfı sayesinde, varolan *ConnectionString* bilgisini değiştirip, yenisini oluşturabiliyoruz.

*Environment* bilgilerini kullanıp, hatta <code>IsDevelopment()</code> methodu ile gerekirse *developer* bilgisayarının ismini de kullanıp, yeni *ConnectionString* ürettim ve bu *ConnectionString*'i <code>UseSqlServer()</code> methodu içerisinde kullandım.

Böylece farklı ortamlarda (*Environment*) **ConnectionString** aşağıdakiler gibi oldu;

<ul>
<li><em>Database_Production</em></li>
<li><em>Database_Test</em></li>
<li><em>Database_Staging</em></li>
<li><em>Database_Development_Ahmet</em></li>
<li><em>Database_Development_Mehmet</em></li>
<li><em>Database_Development_Ayse</em></li>
</ul>

Son olarak, *AppConnectionString* değişkenini, *appsettings.json* dosyası içerisinde aşağıdaki gibi tanımladım;

<script src="https://gist.github.com/polatengin/464d78a39de20e32bd4c33f62b847bbf.js?file=appsettings.json"></script>

<small><em>Not : Bu makaleyi yazarken <a href="https://dasmulli.blog/2018/01/18/auto-modifying-connection-strings-based-on-the-environment/" target="_blank">Martin Ullrich</a>'in makalesinden de faydalandım</em></small>