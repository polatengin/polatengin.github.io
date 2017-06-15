---
layout: post
title: "HTML5 video element CSS3 ile efekt uygulamak"
date: 2016-04-15 14:25
author: engin.polat
comments: true
category: [AspNet]
tags: [blur, body, brightness, class, contrast, controls, css, css3, filter, grayscale, head, html, html5, hue-rotate, invert, saturate, sepia, style, video]
---
**HTML5** ile gelen *&lt;video&gt;&lt;/video&gt;* elementine **CSS3** ile stil uygulayarak *efekt* uygulayabiliyoruz. Örneğin, **video** element içerisinde oynayan videoyu siyah-beyaz yapmak, renk doygunluğu ile oynamak, flu hale getirmek, renkleri ters çevirmek, vs gibi efektler rahatlıkla programlanabiliyor.

Bu makalede yeni bir **HTML5** sayfası oluşturarak, oynayan video'ya nasıl **efekt** verebileceğimizi göreceğiz.

Öncelikle yeni bir **html** sayfası oluşturalım;

<script src="https://gist.github.com/polatengin/b2765dfafc82678e23114f3cf2680668.js?file=index.html"></script>

Sayfanın *&lt;body&gt;&lt;/body&gt;* taglarının arasına **video** elementimizi ekleyelim;

<script src="https://gist.github.com/polatengin/b2765dfafc82678e23114f3cf2680668.js?file=video.html"></script>

Şimdi, *&lt;head&gt;&lt;/head&gt;* taglarının arasına yeni bir *&lt;style&gt;&lt;/style&gt;* element ekleyelim ve içerisine aşağıdaki stilleri yazalım;

<script src="https://gist.github.com/polatengin/b2765dfafc82678e23114f3cf2680668.js?file=style.css"></script>

Artık **video** elementine hangi efekti uygulamak istiyorsak, ilgili **css class**'ını uygulamamız yeterli, örneğin;

<script src="https://gist.github.com/polatengin/b2765dfafc82678e23114f3cf2680668.js?file=video-blur-css.html"></script>

![](/assets/uploads/2016/04/html5-css3-video-element-effects.png)

