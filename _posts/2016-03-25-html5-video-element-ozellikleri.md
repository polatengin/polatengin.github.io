---
layout: post
title: "HTML5 video element özellikleri"
date: 2016-03-25 10:40
author: engin.polat
comments: true
category: [AspNet]
tags: [autoplay, charset, controls, doctype, height, html, html5, loop, meta, metadata, muted, poster, preload, source, src, type, video, width]
---
Web sayfalarında *multimedia* oynatmak için **HTML5** ile yeni birkaç element ve *Javascript API* hayatımıza girdi.

Bu makalede **HTML5** ile yeni gelen *&lt;video&gt;* element'ini inceleyeceğiz. Hemen yeni bir **html** sayfası oluşturalım ve <a href="http://www.w3schools.com/tags/tag_video.asp" target="_blank">video</a> elementini incelemeye başlayalım.

**Visual Studio Code** editörünü açalım ve istediğimiz dizinde *video.html* dosyasını oluşturalım, içerisine en temel **HTML5** kodlarını aşağıdaki gibi ekleyelim;

<script src="https://gist.github.com/polatengin/e09a8034085e7a67142aab3ad5edda53.js?file=video-before.html"></script>

Öncelikle &lt;body&gt;&lt;/body&gt; tagları arasına yeni bir &lt;video&gt;&lt;/video&gt; element ekliyoruz. Sayfayı kaydedip tarayıcıda açtığımızda ekranda herhangi bir şey görmüyoruz, çünkü hiçbir özellik verilmemiş olan video elementi ekranda gözükmez.

Basitçe **video** elementine *src* attribute tanımlayarak sayfada *video*'nun görüntülenmesini sağlayabiliriz, örneğin;

<script src="https://gist.github.com/polatengin/e09a8034085e7a67142aab3ad5edda53.js?file=video-after.html"></script>

Sayfayı tarayıcıda açtığımız zaman, *video*'nun orjinal boyutlarında siyah bir dörtgen görmemiz lazım;

![](/assets/uploads/2016/03/html5video-0.png)

Fakat bu noktada **video**'yu *başlatmak*, *durdurmak*, *ses seviyesini değiştirmek* gibi şeyleri yapamıyoruz. Eğer **video** elementine *controls* attribute ekleyecek olursak, **video**'yu başlatabileceğimiz, durdurabileceğimiz, ilerlemesini takip edebileceğimiz çeşitli butonlar video'nun altına eklenecek, örneğin;

<script src="https://gist.github.com/polatengin/e09a8034085e7a67142aab3ad5edda53.js?file=video-controls.html"></script>

![](/assets/uploads/2016/03/html5video-1.png)

Farklı tarayıcılar farklı video formatlarını desteklerler, yukarıdaki örnekte olduğu gibi eğer sadece *mp4* formatını kullanacak olursak bazı kullanıcılar video'yu izleyemeyecekler.

Sayfada **video** elementinin *src* attribute'ünü kullanmak yerine, *source* elementinden birkaç tane kullanabiliriz, böylece birden fazla formatta aynı video'yu video elementine ekleyebiliriz, örneğin;

<script src="https://gist.github.com/polatengin/e09a8034085e7a67142aab3ad5edda53.js?file=video-sources.html"></script>

Artık *mp4*, *webm* ve *ogg* formatlarından birini destekleyen tüm tarayıcılarda videomuz oynatılabilecek. **video** element içerisine istediğimiz kadar format için istediğimiz kadar source element ekleyebiliriz.

Eğer **video**'nun orjinal boyutlarında değil, bizim istediğimiz boyutlarda ekranda görüntülenmesini istiyorsak, yapmamız gereken video elementine *width* ve *height* özelliklerini vermek olacak, örneğin;

<script src="https://gist.github.com/polatengin/e09a8034085e7a67142aab3ad5edda53.js?file=video-size.html"></script>

![](/assets/uploads/2016/03/html5video-2.png)

Eğer video'nun orjinal boyutları ile orantılı boyut belirlersek, video ilgili alanda gösterilir, eğer orantılı boyut belirlemezsek, video ilgili alanın ortasına gelecek şekilde boyutlandırılır, soldan-sağdan veya üstten-alttan kalan boşluklar siyah renk ile doldurulur.

Birçok tarayıcı, sayfadaki video elementinde bulunan video'yu önceden yüklemeye başlar, böylece video oynatılacağı zaman kullanıcı bir miktar yüklenene kadar beklemek zorunda kalmaz.

İstersek bu özelliğin farklı şekilde davranmasını video elementinin *preload* özelliğine vereceğimiz değer ile sağlayabiliriz.

***preload="none"***

<script src="https://gist.github.com/polatengin/e09a8034085e7a67142aab3ad5edda53.js?file=video-preload-none.html"></script>

Bu durumda, video başlatılana kadar ekranda hiç yer kaplamayacak, siyah arkaplan gözükmeyecek, video uzunluğu dakika/saniye cinsinden bilinmeyecek. Video başlatıldığında video'nun boyutu bulunacak ve boyutu kadar yer kaplamaya başlayacak.

Mobil cihazlarda görüntülenecek video'lar için tavsiye edilen özellik budur. CSS ile video'nun görüntüleneceği alana stil verip, video başlatılana kadar hiç yüklenmemesi sağlanabilir.

***preload="metadata"***

<script src="https://gist.github.com/polatengin/e09a8034085e7a67142aab3ad5edda53.js?file=video-preload-metadata.html"></script>

Bu durumda, video'nun ne kadar büyük olduğu bilgisi otomatik olarak okunur ve gerekli alanı kaplamaya başlar. İstersek CSS ile stil verebiliriz, vermesek bile en azından video alanı, dakika/saniye cinsinden uzunluğu sayfada gözükür.

İstersek *autoplay* özelliğini kullanarak, video'nun sayfa açıldığında otomatik olarak oynatılmaya başlanmasını da sağlayabiliriz, örneğin;

<script src="https://gist.github.com/polatengin/e09a8034085e7a67142aab3ad5edda53.js?file=video-autoplay.html"></script>

Ayrıca *loop* özelliğini kullanarak, video'nun sonuna gelindiğinde otomatik olarak başa dönerek tekrar oynatılmasını sağlayabiliriz, örneğin;

<script src="https://gist.github.com/polatengin/e09a8034085e7a67142aab3ad5edda53.js?file=video-loop.html"></script>

Eğer video alanının video oynatılana kadar siyah kalmasını istemiyorsak, *poster* özelliğini kullanabiliriz, örneğin;

<script src="https://gist.github.com/polatengin/e09a8034085e7a67142aab3ad5edda53.js?file=video-poster.html"></script>

![](/assets/uploads/2016/03/html5video-poster.png)

Eğer video'nun sessiz oynatılmasını istiyorsak, *muted* özelliğini kullanabiliriz, örneğin;

<script src="https://gist.github.com/polatengin/e09a8034085e7a67142aab3ad5edda53.js?file=video-muted.html"></script>

Böylece, kullanıcı video'nun sesini açmadıkça, video sessiz olarak oynatılacaktır.

