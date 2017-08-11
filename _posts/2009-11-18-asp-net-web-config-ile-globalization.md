---
layout: post
title: "Asp.net'te web.config ile globalization"
date: 2009-11-18 11:44
author: engin.polat
comments: true
category: [Web]
tags: [.net, ASP.NET, aspnet, globalization, web.config]
---
**Web uygulamalarında**, geliştirme yaptığınız bilgisayarınızda **türkçe** karakterleri düzgün görüyorsanız, fakat uygulamayı sunucuya **publish** ettiğinizde **türkçe** karakterlerde bozulma oluşuyorsa (özellikle *ğ*, *ü*, *ö*, *ı*, *ş* karakterlerinde); sorun büyük ihtimalle sunucunun dil ayarlarından kaynaklanıyordur.

Sunucunun dil ayarları ile uğraşmak yerine, <code>web.config</code> dosyasında yapacağınız küçük bir değişiklik ile, bu sorunun üstesinden gelebilirsiniz.

Yapılması gereken, <code>System.Web</code> **node**' u içerisine;

<script src="https://gist.github.com/polatengin/3dc25b342e741fb833680eecbecb7014.js?file=web.config"></script>

tagını eklemek.