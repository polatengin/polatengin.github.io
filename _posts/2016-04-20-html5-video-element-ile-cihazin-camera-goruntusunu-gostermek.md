---
layout: post
title: "HTML5 video element ile cihazın Camera görüntüsünü göstermek"
date: 2016-04-20 13:35
author: engin.polat
comments: true
category: [AspNet]
tags: [api, autoplay, body, camera, createobjecturl, css, css3, document, getelementbyid, getusermedia, head, html, html5, javascript, mandatory, minheight, minwidth, navigator, stop, stream, video]
---
**HTML5** ile birlikte gelen **video** element içerisinde <a href="http://www.w3.org/TR/mediacapture-streams/" target="_blank">navigator.getUserMedia</a> *API* method'u sayesinde **Javascript** aracılığı ile cihazın **Camera** görüntüsünü gösterebiliyoruz.

Bu makale ile adım adım ilerleyerek, cihazın **Camera** gösüntüsünü **video** element içerisinde gösteren bir sayfa oluşturacağız, hemen yeni bir **html** dosyası oluşturalım ve içine aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/104d28edab721668a7315bc27943ae0a.js?file=Index-Before.html"></script>

Sayfaya bir **video** element ekleyeceğiz, **Javascript** aracılığı ile cihazın **Camera** görüntüsünü alacak, **video** element içerisinde göstereceğiz. Bunun için aşağıdaki kodları *&lt;body&gt;&lt;/body&gt;* element içerisine ekleyelim;

<script src="https://gist.github.com/polatengin/104d28edab721668a7315bc27943ae0a.js?file=Index-Video.html"></script>

Böylece, sayfa açıldığında <a href="http://www.w3schools.com/jsref/obj_navigator.asp" target="_blank">navigator</a> nesnesinin <a href="https://developer.mozilla.org/en-US/docs/Web/API/Navigator/getUserMedia" target="_blank">getUserMedia</a> method'unu kullanarak cihazın **Camera** görüntüsüne ulaşmayı deniyoruz.

*Not : Eğer audio filtresine false değeri yerine true değeri verirsek sesleri de almaya başlarız.*

Eğer **camera**'ya başarılı bir şekilde erişebilirsek, *window.URL.createObjectURL()* methodu ile **Camera**'nın görüntüsünü istediğimiz **video** element içerisinde oynatmaya başlayabiliyoruz.

Sayfa ilk açıldığında kullanıcıdan **Camera**'ya erişmek için izin istenir.

![](/assets/uploads/2016/04/html5-video-camera-0.png)

Gerekli izin verildikten sonra **Camera** görüntüsü, ilgili **video** element içerisinde oynatılmaya başlanır.

![](/assets/uploads/2016/04/html5-video-camera-1.png)

Eğer **Camera** görüntüsünü durdurmak istiyorsak, *stream*'in *stop()* methodunu çağırmamız yeterli.

Ayrıca, **CSS3** stillerini kullanarak **Camera** görüntüsü üzerine **efekt**'ler de uygulayabiliriz. Bakınız, <a href="http://www.enginpolat.com/html5-video-element-css3-ile-efekt-uygulamak/" target="_blank">HTML5 video element CSS3 ile efekt uygulamak</a>

Eğer **Camera** görüntüsünün çözünürlüğünü değiştirmek istersek, *navigator.getUserMedia()* methodunun ilk parametresinde basitçe *video: true* yazmak yerine, istediğimiz çözünürlüğü aşağıdaki gibi belirtiyoruz;

<script src="https://gist.github.com/polatengin/104d28edab721668a7315bc27943ae0a.js?file=Index-Video-Parameters.js"></script>

