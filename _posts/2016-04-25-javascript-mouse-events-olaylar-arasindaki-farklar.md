---
layout: post
title: "Javascript Mouse Events (Olaylar) arasındaki farklar"
date: 2016-04-25 18:50
author: engin.polat
comments: true
category: [AspNet]
tags: [button, event, html, javascript, mouse, mouseclick, mousedown, mouseenter, mouseleave, mousemove, mouseout, mouseover, mouseup, olay, parameter]
---
**HTML** sayfalarında **mouse** ile ilgili çeşitli *events* (*olaylar*) yakalayabilir ve **Mouse**'un durumuna göre çalışacak kodlar yazabiliriz.

Fakat **mouse** ile ilgili birden fazla *events* (*olaylar*) mevcut ve aralarındaki farkları bilmekte fayda var.

Aşağıdaki liste ile **mouse** *events* (*olaylar*) arasındaki farkları görebilirsiniz;

**mousedown**
*Mouse* butonlarından birine basıldığında gerçekleşir. Parametrede yer alan *button* özelliği eğer 0 ise sol buton, 1 ise orta buton, 2 ise sağ buton basılmıştır.

**mouseup**
Basılan *Mouse* butonu bırakıldığında gerçekleşir.

**mouseclick**
*Mouse* butonuna basılması ve bırakılması durumunda gerçekleşir.

**mouseenter**
*Mouse*, bir *Html* elementin üzerine geldiğinde gerçekleşir.

**mouseleave** / **mouseout**
*Mouse*, bir *Html* elementin üzerinden çıktığında gerçekleşir. Html element, başka bir element içeriyorsa, *mouseleave* event (olay) içerilen elementin üzerine geldiğinde gerçekleşmez, *mouseout* event (olay) gerçekleşir.

**mouseover** / **mousemove**
*Mouse*, bir *Html* elementin üzerinden geçerken gerçekleşir. Eğer *Html* element başka bir elementin içindeyse veya içerisinde başka elementler varsa da *mouseover* event (olay) gerçekleşir. *Mouse* ilgili elementin üzerinde gezdikçe *mouseover* event (olay) sadece bir defa gerçekleşir, *mousemove* event (olay) her seferinde gerçekleşir.