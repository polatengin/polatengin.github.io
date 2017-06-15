---
layout: post
title: "ASP.NET MVC ile resim içerisine metin gömme (Steganography)"
date: 2016-10-01 12:20
author: engin.polat
comments: true
category: [AspNet]
tags: [ASP.NET, aspnet, file, html, html5, input, mvc, steganography, type, visual studio, youtube]
---
Aldığım ilginç bir maili cevaplarken internette **Steganography** diye birşeye denk geldim. Bir resmin **pixel**lerinin renk değerlerini bir metni veya dosyayı içerecek şekilde değiştirmeye ve böylece resim ile birlikte gizlice metin veya dosya transfer etme anlamına geliyor.

Aşağıdaki <a href="https://www.youtube.com/watch?v=bTZZsgtJhSE" target="_blank">youtube video</a>'sunda **Visual Studio** içerisinde bir **ASP.NET MVC** projesi oluşturacak, dosya *upload* edecek bir **html** sayfası oluşturacak, *upload* edilen resmin içerisine istediğimiz metni gizleyeceğiz.

<div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="https://www.youtube.com/embed/bTZZsgtJhSE" frameborder="0" allowfullscreen></iframe></div>

Öncelikle *Index.cshtml* içerisine aşağıdaki **html** kodlarını yazalım;

<script src="https://gist.github.com/polatengin/a6ebd8a3a695f7de71232ba4bbd197b0.js?file=Index.cshtml"></script>

*HomeController.cs* dosyasına aşağıda kodlarını bulacağınız *Index()* **action** ekleyelim;

<script src="https://gist.github.com/polatengin/a6ebd8a3a695f7de71232ba4bbd197b0.js?file=HomeController-Index.cs"></script>

**Video**'da kullandığım *PowerPoint* sunumuna aşağıdan erişebilirsiniz.

<div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="https://www.slideshare.net/slideshow/embed_code/67346823" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>