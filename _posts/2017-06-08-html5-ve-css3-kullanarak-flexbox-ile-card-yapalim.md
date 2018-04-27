---
layout: post
title: "HTML5 ve CSS3 kullanarak (Flexbox ile) Card yapalım"
date: 2017-06-08 16:30
author: engin.polat
comments: true
category: [Web]
tags: [html5, css3, flexbox, card]
---
Bu makalede aşağıdaki görselde de görebileceğiniz kartlardan yapacağız. Kartları sadece **HTML5** ve **CSS3** kullanarak kodlayacağız.

Böylece <a href="https://github.com/polatengin/polatengin.github.io/issues/3" target="_blank" rel="noopener">#3</a> numaralı *istek makale* kapanmış olacak :)

<em>Not : <a href="https://github.com/polatengin/polatengin.github.io/issues" target="_blank" rel="noopener">Issues</a> sayfasında varolan makale isteklerini görebileceğinizi, hatta <a href="https://github.com/polatengin/polatengin.github.io/issues/new" target="_blank" rel="noopener">yeni makale isteğinde</a> bulunabileceğinizi biliyor muydunuz?</em>

<img class="lazy img-responsive" data-src="/assets/uploads/2017/06/flexbox-0.png" width="723" height="567" />

Öncelikle projeyi kendi bilgisayarımızda oluşturabilmek için <a href="nodejs.org" target="_blank" rel="noopener">nodejs.org</a> adresinden en güncel **NodeJs** kurulumunu indirelim ve bilgisayarımıza kuralım.

Kurulum bittikten sonra hemen projemiz için yeni bir dizin oluşturalım, **Command Prompt** penceresi açalım ve aşağıdaki komutu çalıştıralım;

<script src="https://gist.github.com/polatengin/961fc44835c97c317899ea2a1dc28aee.js?file=http-server.cmd"></script>

<img class="lazy img-responsive" data-src="/assets/uploads/2017/06/flexbox-2.png" width="610" height="270" />

Eğer bilgisayarınıza daha önce *http-server* **npm** paketini kurmadıysanız öncelikle aşağıdaki komutu çalıştırarak *http-server* paketini kurmanız gerekiyor;

<script src="https://gist.github.com/polatengin/961fc44835c97c317899ea2a1dc28aee.js?file=npm-install.cmd"></script>

Proje için oluşturduğumuz dizinde bir *index.html* bir de *index.css* dosyası oluşturalım, *index.html* dosyası içerisine aşağıdaki **html** kodlarını yazalım;

<script src="https://gist.github.com/polatengin/961fc44835c97c317899ea2a1dc28aee.js?file=card.html"></script>

**Card** nesnemizin parçaları;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/06/flexbox-1.png" width="430" height="234" />

Şimdi *index.css* dosyasını açarak stil vermeye başlayabiliriz.

İlk olarak **body** elementinin **font**'unu *Segoe UI* yapalım ve <code>http://localhost:8080/</code> adresini açalım ve aşağıdaki gibi bir sayfa gördüğümüzden emin olalım;

<script src="https://gist.github.com/polatengin/961fc44835c97c317899ea2a1dc28aee.js?file=style-body.css"></script>

<img class="lazy img-responsive" data-src="/assets/uploads/2017/06/flexbox-3.png" width="166" height="115" />

Şimdi *index.css* dosyasına aşağıdaki kodu ekleyelim;

<script src="https://gist.github.com/polatengin/961fc44835c97c317899ea2a1dc28aee.js?file=style-card.css"></script>

Eklediğimiz <code>.card</code> **css class**'ı sayesinde bütün **card** nesnesini genişliği *150px* olan bir çerçeve içerisine almış olduk;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/06/flexbox-4.png" width="228" height="103" />

Sırada başlığı düzeltmek var, *index.css* dosyasını açalım ve aşağıdaki kodu ekleyelim;

<script src="https://gist.github.com/polatengin/961fc44835c97c317899ea2a1dc28aee.js?file=style-card-header.css"></script>

Böylece artık sayfamız aşağıdaki şekilde gözükmeye başlamalı;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/06/flexbox-5.png" width="228" height="112" />

Sırada, **card** nesnesinin asıl parçası var, hemen *index.css* dosyasını açalım ve aşağıdaki kodları ekleyelim;

<script src="https://gist.github.com/polatengin/961fc44835c97c317899ea2a1dc28aee.js?file=style-card-main.css"></script>

Böylece artık sayfamız aşağıdaki şekilde gözükmeye başlamalı;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/06/flexbox-6.png" width="228" height="157" />

Son olarak, *icon* ve *açıklama* alanının stilini de ekleyelim;

<script src="https://gist.github.com/polatengin/961fc44835c97c317899ea2a1dc28aee.js?file=style-icon-description.css"></script>

Böylece artık sayfamız aşağıdaki şekilde gözükmeye başlamalı;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/06/flexbox-7.png" width="228" height="174" />

Bütün *index.css* dosyası aşağıdaki gibi olmalı;

<script src="https://gist.github.com/polatengin/961fc44835c97c317899ea2a1dc28aee.js?file=index.css"></script>

Tüm **Material Icon** listesini <a href="https://material.io/icons/" target="_blank" rel="noopener">Material Icons</a> sayfasında bulabilirsiniz. Değişik *renkler* ve değişik *icon*'lar ile sizler de istediğiniz gibi bir **card** tasarımı yapabilirsiniz.

<em><small>Not : Bu makalenin orjinalini <a href="https://hackernoon.com/build-a-minimalist-html-card-in-just-53-lines-of-code-with-flexbox-b40801927eb5" target="_blank" rel="noopener">Build a Minimalist HTML Card in just 53 lines of code (with Flexbox)</a> adresinden okuyabilirsiniz</small></em>