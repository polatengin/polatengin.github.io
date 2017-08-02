---
layout: post
title: "ASP.NET Core projelerinde Kestrel adresini belirleme"
date: 2016-06-12 12:45
author: engin.polat
comments: true
category: [Web]
tags: [ASP.NET, aspnet, aspnetcore, build, code, command prompt, dotnet, iis, kestrel, localhost, main method, run, static, terminal, usestartup, useurls, visual studio code, webhostbuilder, yo]
---
*Bu makaleyi okumadan önce <a href="/kategori/asp-net/" target="_blank">Asp.Net Kategorisi</a>ndeki diğer makalelerimi okumanızı tavsiye ederim.*

**AspNet Core 1.0** projelerinde Kestrel Application Server'ın çalışacağı adresi değiştirmek isteyebilirsiniz.

Hemen *örnek proje* oluşturacağımız dizine **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinden gidiyoruz ve aşağıdaki kodları çalıştırıyoruz;

<script src="https://gist.github.com/polatengin/2d09105fe046f5205da5cbd127251569.js?file=yo.cmd"></script>

Yeni oluşturduğumuz projeyi çalıştırmak için aşağıdaki komutu çalıştırmamız yeterli;

***dotnet run***

Proje *http://localhost:5000* adresinden çalışmaya başlayacak, istediğimiz tarayıcıyı açarak *http://localhost:5000* adresi aracılığıyla projeyi kullanabileceğiz.

**Program.cs** dosyası içerisinde yeralan **Main()** methoduna aşağıdaki kod parçasını ekleyecek olursak projenin çalıştırılacağı adresleri değiştirebiliriz;

<script src="https://gist.github.com/polatengin/2d09105fe046f5205da5cbd127251569.js?file=Program-UseUrl.cs"></script>

*Main()* methodu aşağıdaki gibi bir hale gelmiş olmalı;

<script src="https://gist.github.com/polatengin/2d09105fe046f5205da5cbd127251569.js?file=Program-Main.cs"></script>