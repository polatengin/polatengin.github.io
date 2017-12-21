---
layout: post
title: "Asp.Net Core üzerinde SignalR kullanımı"
date: 2016-09-09 14:20
author: engin.polat
comments: true
category: [Web]
tags: [aspnetcore, browser, clients, command prompt, config, contentroot, coreclr, dependencies, dotnet, edge, html, hub, iapplicationbuilder, iis, iservicecollection, javascript, jquery, kestrel, nuget, packageSources, project.json, restore, signalr, usestaticfiles, webhostbuilder, websocket, wwwroot]
---
<div class="alert alert-success" role="alert" style="margin: 10px 0px; display: block;">
Bu makalenin kodlarına <strong>Github</strong> üzerinde <a href="https://github.com/polatengin" class="alert-link" target="_blank">polatengin</a> hesabımda yer alan <a href="https://github.com/polatengin/blog-codes/tree/master/dotnet-core-signalr" class="alert-link" target="_blank">Asp.Net Core SignalR</a> aracılığıyla erişebilirsiniz.
</div>

Sevgili arkadaşım <a href="http://www.borakasmer.com" target="_blank">Bora Kaşmer</a> yeni yapacağı bir proje ile ilgili konuşurken **Asp.Net Core** üzerinde **SignalR** çalıştırmak istediğini söyledi, ben de bu makaleyi yazdım :)

Bu makalede adım adım ilerleyerek, **dotnet CLI** ile projeyi oluşturacak, **Visual Studio Code** ile geliştirecek ve **Microsoft Edge** tarayıcısı ile test edeceğiz.

*Öncelikle, eğer bilgisayarınızda <a href="https://www.microsoft.com/net" target="_blank">.Net Core</a> yüklü değilse yüklemeniz gerekiyor.*

Hemen proje için yeni bir dizin oluşturalım ve *Command Prompt* açarak **dotnet new** komutu ile projeyi oluşturalım;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/dotnet-core-signalr-0.png" />

Projeyi oluşturduğumuz dizinde **Program.cs** ve **project.json** dosyaları oluşmuş olmalı.

Eğer **SignalR** ve **.Net Core** birlikte kullanmak istiyorsak, bu makalenin yazıldığı tarihte yayınlanmamış olan en yeni **Nuget** paketlerini kullanmalıyız. Bunun için gecelik derlenen paketlere erişebilmemiz lazım. Projeye **Nuget.config** isimli bir dosya ekleyelim ve içerisine aşağıdaki **Nuget** kaynaklarını yazalım;

<script src="https://gist.github.com/polatengin/1ec1f103e04cce2ef6bb865f3a90d30c.js?file=nuget.config"></script>

Artık **project.json** dosyasını açarak, **dependencies** kısmının içerisine aşağıdaki paketleri yazabiliriz;

<script src="https://gist.github.com/polatengin/1ec1f103e04cce2ef6bb865f3a90d30c.js?file=project.json"></script>

Paketleri indirmek için *Command Prompt* içerisinde **dotnet restore** komutunu çalıştırmamız lazım;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/dotnet-core-signalr-1.png" />

Şimdi *Program.cs* dosyasını açalım ve *Main()* method'unun içerisini aşağıdaki şekilde değiştirelim;

<script src="https://gist.github.com/polatengin/1ec1f103e04cce2ef6bb865f3a90d30c.js?file=Program-Main.cs"></script>

*Program.cs* dosyasının using kısmına aşağıdaki tanımlamaları da eklememiz gerekiyor;

<script src="https://gist.github.com/polatengin/1ec1f103e04cce2ef6bb865f3a90d30c.js?file=Program-Usings.cs"></script>

Satır satır inceleyecek olursak, öncelikle *Application Server* olarak **IIS** değil, **Kestrel** kullanacağımızı tanımlıyoruz, *html*, *js*, *css*, *jpg* gibi *static* dosyaların **wwwroot** dizininde olacağını tanımlıyoruz, uygulamanın açılışı esnasında yapılacak işleri **Startup** isimli *class* içerisine yazacağımızı tanımlıyoruz ve son olarak uygulamayı çalıştırmaya başlıyoruz.

Projeyi oluşturduğumuz dizinde **Startup.cs** isimli bir dosya oluşturalım ve içerisine aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/1ec1f103e04cce2ef6bb865f3a90d30c.js?file=Startup.cs"></script>

Böylece, **WebSocket** ve **SignalR** kullanacağımızı **.Net Core** uygulamamızda tanımlamış olduk.

Bir **SignalR Hub**'ı oluşturmak için projeyi oluşturduğumuz dizine *ChatHub.cs* isimli bir dosya ekleyelim ve içine aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/1ec1f103e04cce2ef6bb865f3a90d30c.js?file=ChatHub.cs"></script>

Artık proje dizininde **wwwroot** isimli yeni bir dizin oluşturarak içine *index.html* dosyasını ekleyebiliriz, *index.html* dosyasının içine aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/1ec1f103e04cce2ef6bb865f3a90d30c.js?file=Index.html"></script>

Basitçe, mesajların sayfada görüntülenebilmesi için bir textarea, mesaj göndermek için bir text ve bir button ekledik. Javascript ile buton'a her tıklandığında SignalR Hub'ına mesajın gönderilmesini, SignalR Hub'ından gelen mesajların da textarea içerisinde gösterilmesini sağladık.

*Command Prompt* açarak **dotnet run** komutunu çalıştıralım;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/dotnet-core-signalr-2.png" />

*Command Prompt* penceresini kapatmadan, iki farklı **Microsoft Edge** tarayıcı açarak uygulamayı *http://localhost:5000/index.html* adresinden test edebiliriz;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/09/dotnet-core-signalr-3.gif" />

Projenin kodlarını <a href="https://github.com/polatengin" target="_blank">Github</a> hesabım üzerinden <a href="https://github.com/polatengin/blog-codes/tree/master/dotnet-core-signalr" target="_blank">dotnet-core-signalr</a> dizininde bulabilirsiniz.