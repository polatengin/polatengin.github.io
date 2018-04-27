---
layout: post
title: "Windows 10 UWP uygulaması içerisinde domain name uygunluk (availability) sorgulama"
date: 2017-12-17 12:00
author: engin.polat
comments: true
category: [Windows]
tags: [uwp, xaml, async, await, json, stackpanel, textbox, button, textblock, click, event, httpclient, deserializeobject]
---
<div class="alert alert-success" role="alert" style="margin: 10px 0px; display: block;">
Bu makalenin kodlarına <strong>Github</strong> üzerinde <a href="https://github.com/polatengin" class="alert-link" target="_blank" rel="noopener">polatengin</a> hesabımda yer alan <a href="https://github.com/polatengin/blog-codes/tree/master/windows-10-uwp-domain-name-availability-checker" class="alert-link" target="_blank" rel="noopener">DomainAvailabilityChecker</a> aracılığıyla erişebilirsiniz.
</div>

Gene mail ile aldığım bir soruyu cevaplayacağım.

Bir *alan adının* (**domain name**) satın almaya müsait olup olmadığını *Windows Desktop* uygulaması üzerinden anlamamız gerektiğinde *Windows 10* **UWP** platformunu kullanabiliriz.

Öncelikle alan adının uygunluğunu sorgulayacağımız bir API servisine ihtiyacımız var.

Ben bu makale için <a href="http://whoapi.com" target="_blank" rel="noopener">WHOAPI</a> tarafından ücretsiz sağlanan <a href="https://freedomainapi.com/free-domain-availability-api.html" target="_blank" rel="noopener">DomainName Availability</a> servisini kullanacağım (*Bir defaya mahsus **9$** para ödemeniz gerekiyor. Böylece dakikada 1 istek yapabilirsiniz*)

<a href="http://whoapi.com" target="_blank" rel="noopener">WHOAPI</a> üzerinde bir hesap oluşturduktan sonra hemen *Visual Studio 2017* açalım ve yeni bir **UWP** projesi oluşturalım;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/12/domain-name-availability-checker-0.png" />

Oluşturduğumuz projenin *MainPage.xaml* dosyasını açalım ve ekran tasarımını aşağıdaki kodlar ile güncelleyelim;

<script src="https://gist.github.com/polatengin/2702dc075e2add7ff2d30fbd50fd7e16.js?file=MainPage.xaml"></script>

Şimdi *MainPage.xaml.cs* dosyasını açmalı ve aşağıdaki <code>Button_Click()</code> methodunu yazmalıyız;

<script src="https://gist.github.com/polatengin/2702dc075e2add7ff2d30fbd50fd7e16.js?file=MainPage.xaml.cs"></script>

Böylece, ekrandaki <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.textbox" target="_blank" rel="noopener">TextBox</a> içerisine istediğimiz alan adını yazıp, *Getir* <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.button" target="_blank" rel="noopener">Button</a> nesnesine tıkladığımızda, <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.controls.textblock" target="_blank" rel="noopener">TextBlock</a> nesnesine *Bu alan adı müsait!* veya *Bu alan adı müsait değil!* yazacak;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/12/domain-name-availability-checker-1.png" />
