---
layout: post
title: "Asp.Net Core web uygulamalarinda HTTPS adreslere yönlendirme"
date: 2018-02-03 16:15
author: engin.polat
comments: true
category: [Web]
tags: [http, https, aspnetcore, action, controller, attribute, filters, requirehttps, configure, iservicecollection, configureservices, mvcoptions, iactionresult, view, iapplicationbuilder, userewriter, rewriteoptions, addredirecttohttps]
---
Bir **Asp.Net Core** web uygulamasında, **HTTP** adresleri engellemek ve **HTTPS** adresleri kullanmak isteyebiliriz.

**Action** methodların üzerine, **Controller** sınıflarının üzerine veya **GlobalFilters** listesine ekleyebildiğimiz <a href="https://docs.microsoft.com/en-us/dotnet/api/Microsoft.AspNetCore.Mvc.RequireHttpsAttribute" target="_blank">RequireHttpsAttribute</a> sınıfı sayesinde, web uygulamamızdaki adreslerin **HTTP** üzerinden erişilmesini *engelleyebiliyoruz*.

<script src="https://gist.github.com/polatengin/db8f5c184e3c555e0c3401a9bc6506fb.js?file=RequireHttpsAttribute.cs"></script>

<div class="well well-sm"><strong>Uyarı</strong><br />Yukarıdaki kod parçaları, <strong>HTTP</strong> üzerinden gelecek tüm istekleri engeller. Böylece <strong>HTTP</strong> protokolü üzerinden gelen istekler işlenmemiş olur. Aslında yapmamız gereken, <strong>HTTP</strong> istekleri <strong>HTTPS</strong> adreslere yönlendirmek olmalı. Yani istekler işlenmeyecek şekilde engellenmez, <strong>HTTPS</strong> protokolünü kullanan adresler üzerinden cevaplanır</div>

<strong>HTTP</strong> protokolü üzerinden gelen istekleri <strong>HTTPS</strong> protokolü üzerinden çalışan adreslere yönlendirmek için aşağıdaki kodu kullanabiliriz;

<script src="https://gist.github.com/polatengin/db8f5c184e3c555e0c3401a9bc6506fb.js?file=Configure.cs"></script>

<a href="https://docs.microsoft.com/en-us/aspnet/core/fundamentals/startup#the-configure-method" target="_blank">Configure()</a> methodu içerisinde çağırdığımız <code>UseRewrite(options)</code> methodu ile, **HTTP** istekleri **HTTPS** adreslere dönüştürebiliyoruz.
