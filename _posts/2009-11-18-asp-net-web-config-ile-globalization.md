---
layout: post
title: "Asp.net'te web.config ile globalization"
date: 2009-11-18 11:44
author: engin.polat
comments: true
category: [AspNet]
tags: [.net, ASP.NET, aspnet, globalization, web.config]
---
Web uygulamalarında, geliştirme yaptığınız bilgisayarınızda türkçe karakterleri düzgün görüyorsanız, fakat uygulamayı sunucuya publish ettiğinizde türkçe karakterlerde bozulma oluşuyorsa (özellikle ğ,ü,ö,ı,ş karakterlerinde); sorun büyük ihtimalle sunucunun dil ayarlarından kaynaklanıyordur.

Sunucunun dil ayarları ile uğraşmak yerine, web.config dosyasında yapacağınız küçük bir değişiklik ile, bu sorunun üstesinden gelebilirsiniz.

Yapılması gereken, System.Web node' u içerisine;



&lt;globalization fileEncoding="iso-8859-9" responseEncoding="iso-8859-9" /&gt;


tagını eklemek.

