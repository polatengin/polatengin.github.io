---
layout: post
title: "HTML5 sayfasında canvas ve javascript kullanarak çizim alanı oluşturma"
date: 2016-05-08 22:50
author: engin.polat
comments: true
category: [Web]
tags: [addeventlistener, beginpath, canvas, clientx, clienty, doctype, document, event, getboundingclientrect, getcontext, getelementbyid, html, html5, javascript, lineto, mouse, mousedown, mousemove, mouseup, moveto, stroke]
---
Bir **html** sayfasında <a href="http://www.w3schools.com/HTML/html5_canvas.asp" target="_blank">canvas</a> elementi ve **javascript** kullanarak, *mouse* ile çizim yapabileceğimiz bir alan oluşturabiliriz. Örneğin, web sayfası üzerinde kullanıcının imzasını atabileceği bir alan oluşturabilmek mümkün.

Hemen yeni bir **html** dosyası oluşturalım ve aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/2b26204152753feef99f60979efeb93c.js?file=Index.html"></script>

Böylece sayfa üzerinde *400px x 400px* alanında oluşturduğumuz **canvas** elementi üzerine **mouse** kullanarak çizim yapabileceğiz.

![](/assets/uploads/2016/05/html5-canvas-ile-cizim.png)

