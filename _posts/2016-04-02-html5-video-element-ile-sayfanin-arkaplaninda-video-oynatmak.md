---
layout: post
title: "HTML5 video element ile sayfanın arkaplanında video oynatmak"
date: 2016-04-02 13:20
author: engin.polat
comments: true
category: [AspNet]
tags: [body, charset, controls, doctype, document, function, head, height, html, html5, javascript, lang, loop, margin, meta, muted, OnLoad, onresize, overflow, padding, querySelector, script, source, style, video, width, window]
---
Son zamanlarda internette çeşitli sitelerin sayfalarının arkaplanlarını video haline getirdiklerini görüyoruz, örneğin;

<a href="http://y.co" target="_blank">![](/assets/uploads/2016/04/html5-video-background-0.jpg)</a>

Bu makalede bir web sayfasının arkaplanını **video** haline getireceğiz. Öncelikle yeni bir **html** sayfası oluşturalım;

<script src="https://gist.github.com/polatengin/04603b1e70d5811f6cfb650527c0310f.js?file=Index-Before.html"></script>

Sayfanın *&lt;body&gt;&lt;/body&gt;* taglarının arasına **video** elementimizi ekleyelim;

<script src="https://gist.github.com/polatengin/04603b1e70d5811f6cfb650527c0310f.js?file=Index-Video.html"></script>

Artık sayfada **video** elementimiz gözükecek, hatta video sonuna kadar oynadıktan sonra başa dönecek ve sessiz başlatılacak, fakat istediğimiz gibi sayfanın arkaplanını henüz kaplamıyor. *&lt;head&gt;&lt;/head&gt;* elementi içerisine *&lt;style&gt;&lt;/style&gt;* elementi ekleyelim ve aşağıdaki stili tanımlayalım;

<script src="https://gist.github.com/polatengin/04603b1e70d5811f6cfb650527c0310f.js?file=style.css"></script>

Son olarak *&lt;head&gt;&lt;/head&gt;* elementi içerisine *&lt;script&gt;&lt;/script&gt;* elementi aracılığıyla aşağıdaki **javascript** kodunu ekleyelim ve böylece tarayıcının boyutlandırıldığı durumlarda sayfanın arkaplan video'sunu sayfanın içine tam sığacak şekilde boyutlandıralım;

<script src="https://gist.github.com/polatengin/04603b1e70d5811f6cfb650527c0310f.js?file=Index.js"></script>

Bu durumda sayfamızın arkaplanında tam ekran video oynayacak, istersek sayfaya *butonlar*, *menüler*, *başlıklar*, *yazı alanları*, *linkler* ekleyebileceğiz;

![](/assets/uploads/2016/04/html5-video-background-1.png)