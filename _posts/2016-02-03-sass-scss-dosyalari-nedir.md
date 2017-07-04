---
layout: post
title: "SASS (scss dosyaları) nedir?"
date: 2016-02-03 11:55
author: engin.polat
comments: true
category: [Web]
tags: [article, backgroundcolor, body, button, Color, command, compile, css, darken, font, h1, head, header, html, http-server, include, index, install, json, less, lighten, localhost, mixin, node-sass, nodejs, npm, package, padding, sass, scss, style, stylesheet, terminal, visual studio code, web, web app]
---
**Web tabanlı** uygulamalarda **html** sayfalarını göze daha hoş gözükür hale getirmek ve kullanılabilirliği artırmak için **css stillerini** kullanırız.

**Web tabanlı** uygulama geliştirirken genelde uygulamaya özel *renkler*, *fontlar*, *görseller*, vs kullanırız. Bu *renkleri*, *fontları*, *görselleri*, vs **css dosyalarının** içerisinde sürekli kullanmamız gerekir.

Örneğin, uygulamamızda linklerin *kırmızı* gözükmesini istiyorsak **css dosyasına** uygun stili yazarız, butonların da *kırmızı* gözükmesi gerekirse, **css dosyasına** yeni bir stil ekleyerek gene *kırmızı* rengi kullanmamız gerekir.

Yukarıdaki örnekten devam edecek olursak, *kırmızı* renk ve tonları **css dosyalarında** belki onlarca defa kullanılmış olacak.

Eğer uygulamanın *kırmızı* değil, *mavi* tema ile gözükmesini istersek **css dosyalarını** açıp, *kırmızı* renk kodlarını *mavi* ile değiştirmemiz, *kırmızı* rengin tonlarına karşılık gelen *mavi* tonlarını bulup **css dosyalarındaki** stilleri güncellememiz gerekecek.

Eğer **css** dosyasının başında **değişkenler**, **fonksiyonlar** tanımlayabilseydik ve stillerde bu değişkenleri, fonksiyonları kullanabilseydik, değişiklikleri *çok daha kolay* yapabilecektik.

<a href="http://sass-lang.com/" target="_blank">SASS</a> ve <a href="http://lesscss.org/" target="_blank">LESS</a>, tam olarak bu sorunu çözmeye çalışıyorlar.

Bu makalede **SASS**'ın nasıl çalıştığını inceleyeceğiz, hemen örnek projemizi oluşturmak istediğimiz dizini **Visual Studio Code** ile açıyoruz ve içerisinde *index.html* ve *package.json* dosyalarını oluşturuyoruz;

*index.html* dosyasının içeriği;


&lt;html&gt;
    &lt;head&gt;
        &lt;link rel="stylesheet" href="css/style.css" /&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;header&gt;
            &lt;h1&gt;Örnekler ile SASS&lt;/h1&gt;
        &lt;/header&gt;
        &lt;article&gt;
            &lt;p&gt;Bu örnekte SASS'ın nasıl kullanıldığını inceliyoruz&lt;/p&gt;
        &lt;/article&gt;
    &lt;/body&gt;
&lt;/html&gt;</pre>

*package.json* dosyasının içeriği;
<pre class="brush:csharp">{
    "name": "polatengin-sass-ornek",
    "description": "SASS Örnek Projesi",
    "version": "1.0.0",
    "private": true
}</pre>

*Eğer daha önce kurulumunu yapmadıysak <a href="https://www.npmjs.com/package/node-sass" target="_blank">node-sass</a> paketini <a href="https://www.npmjs.com/" target="_blank">npm</a> üzerinden kurmamız gerekiyor. Eğer aşağıdaki komutu daha önce çalıştırdıysanız, tekrar çalıştırmaya gerek yok.*

<pre class="brush:csharp">npm install -g node-sass</pre>

*package.json* dosyasına eklenebilecek **scripts** bölümü ile **npm** aracının birden fazla *komutu*, *parametreleri* ile birlikte bir defada çalıştırmasını sağlayabiliriz, aşağıdaki **scripts** parçasını ekleyelim;

<pre class="brush:csharp">"scripts": {
    "build-sass": "node-sass --include-path scss scss/main.scss css/style.css"
}</pre>

Böylece *npm run build-sass* komutunu çalıştırabileceğiz ve **node-sass** bizim için *scss/main.scss* dosyasını derleyip, *css/style.css* adı ile kaydedecek. Denemek için hemen **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinden gidelim ve aşağıdaki kodu çalıştıralım;

<pre class="brush:csharp">npm run build-sass</pre>

Projemizin olduğu dizinde **css** dizininin oluşturulduğunu ve içerisine **style.css** dosyasının eklendiğini görebiliriz, henüz *scss/main.scss* dosyası boş olduğu için *css/style.css* dosyasının içerisi de boş.

**html** dosyasını tarayıcıda açıp içeriğini görebilmek için bir **web server**'a ihtiyacımız olacaktır, eğer bilgisayarınıza daha önce bir **web server** kurmadıysanız, **npm** üzerinden <a href="https://www.npmjs.com/package/http-server" target="_blank">http-server</a> **web server**'ını kurabiliriz;

<pre class="brush:csharp">npm install -g http-server</pre>

*Eğer daha önce yukarıdaki kodu çalıştırdıysanız, tekrar çalıştırmanıza gerek yok.*

Artık aşağıdaki komutu çalıştırarak **http-server** *web server*'ını çalıştırabiliriz;

<pre class="brush:csharp">http-server</pre>

İstediğimiz tarayıcıyı açarak *http://localhost:8080* adresine gidersek, aşağıdaki ekranı görmemiz lazım;

![](/assets/uploads/2016/02/sass-1.png)

*index.html* dosyasında *css/style.css* dosyasını **link** elementi ile eklediğimiz için şu anda *scss/main.scss* dosyasına **SASS** kodlarını yazmaya başlayabiliriz.

*scss/main.scss* dosyasını açalım ve **değişkenlerimizi** tanımlayalım;

<pre class="brush:csharp">$arkaplan: #03a9f4;
$yazi: #9c27b0;
$yazi-tipi: "Helvetica";</pre>

*Değişkenlerimizin* isimlerini **$** işareti ile başlatıyoruz, böylece **SASS** derleyici **css** dosyasını oluşturacağı zaman, **$** işareti ile başlayan isimlerin değişken olduğunu anlayabiliyor. Değişkenleri kullanmak için *main.scss* dosyasına aşağıdaki kodları ekleyelim;

<pre class="brush:csharp">body {
    background-color: $arkaplan;
}
header {
    color: $yazi;
    font-family: $yazi-tipi;
    margin-left: 10px;
}
article {
    color: $yazi;
    font-family: $yazi-tipi;
    padding: 15px;
}</pre>

Böylece **body** elementinin **background-color** özelliği *$arkaplan* değişkeninin değerine, **header** elementinin **color** özelliği *$yazi* değişkeninin değerine, **font-family** özelliği *$yazi-tipi* değişkeninin değerine, **margin-left** özelliği sabit 15px değerine, **article** elementinin **color** özelliği *$yazi* değişkeninin değerine, **font-family** özelliği *$yazi-tipi* değişkeninin değerine, **padding** özelliği sabit 15px değerine sahip olacak.

**http-server** *web server*'ını kapatalım, önce **SASS** dosyasını **css** dosyasına dönüştürelim (*derleyelim*) ve **http-server** *web server*'ını tekrar çalıştıralım;

<pre class="brush:csharp">npm run build-sass

http-server</pre>

![](/assets/uploads/2016/02/sass-2.png)

*css/style.css* dosyasını açarsak, içerisinde aşağıdaki stillerin tanımlı olduğunu görebiliriz;

<pre class="brush:csharp">body {
    background-color: #03a9f4;
}
header {
    color: #9c27b0;
    font-family: "Helvetica";
    margin-left: 10px;
}
article {
    color: #9c27b0;
    font-family: "Helvetica";
    padding: 15px;
}</pre>

**SASS** dosyalarında öntanımlı bazı **fonksiyonları** da kullanabiliriz, örneğin yukarıdaki örnekte yeralan **article** elementinin *arkaplan* renginin sayfanın *arkaplan* renginden biraz daha **açık** bir renge sahip olmasını istiyorsak, **article** elementinin *stil*'ine aşağıdaki kodu ekleyebiliriz;

<pre class="brush:csharp">background-color: lighten($arkaplan, 15%);</pre>

Böylece **article** elementinin **background-color** özelliği, *$arkaplan* değişkeninin değerinin *%15* daha açık rengine sahip olacak. **lighten()** fonksiyonu *ilk parametresinde* renk değerini, *ikinci parametresinde* açık hale getirme miktarını alır.

Benzer şekilde **darken()** fonksiyonu *ilk parametresinde* aldığı renk değerini *ikinci parametresinde* aldığı miktar kadar koyu hale getirebilir.

**http-server** *web server*'ını kapatalım, önce **SASS** dosyasını **css** dosyasına dönüştürelim (*derleyelim*) ve **http-server** *web server*'ını tekrar çalıştıralım;

<pre class="brush:csharp">npm run build-sass

http-server</pre>

![](/assets/uploads/2016/02/sass-3.png)

*css/style.css* dosyasını açarsak, içerisinde aşağıdaki stillerin tanımlı olduğunu görebiliriz;

<pre class="brush:csharp">body {
    background-color: #03a9f4;
}
header {
    color: #9c27b0;
    font-family: "Helvetica";
    margin-left: 10px;
}
article {
    color: #9c27b0;
    background-color: #47c4fd;
    font-family: "Helvetica";
    padding: 15px;
}</pre>

Yukarıdaki *scss/main.scss* dosyasında hem **header** hem de **article** elementinin **color** ve **font-family** özelliklerinin olduğunu ve *aynı değerlere* sahip olduklarını görüyoruz. **SASS** dosyalarında tanımlayabileceğimiz **@mixin** değişkenleri sayesinde birden fazla stil özelliğine tek bir değişkende birleştirebilir, istediğimiz yerde **@import** tanımlaması ile kullanabiliriz;

<pre class="brush:csharp">@mixin renk-font {
    color: $yazi;
    font-family: $yazi-tipi;
}
header {
    @include renk-font;
    margin-left: 10px;
}
article {
    @include renk-font;
    background-color: lighten($arkaplan, 15%);
    padding: 15px;
}</pre>

**http-server** *web server*'ını kapatalım, önce **SASS** dosyasını **css** dosyasına dönüştürelim (*derleyelim*) ve **http-server** *web server*'ını tekrar çalıştıralım;

<pre class="brush:csharp">npm run build-sass

http-server</pre>

![](/assets/uploads/2016/02/sass-3.png)

*css/style.css* dosyasını açarsak, içerisinde aşağıdaki stillerin tanımlı olduğunu görebiliriz;

<pre class="brush:csharp">body {
    background-color: #03a9f4;
}
header {
    color: #9c27b0;
    font-family: "Helvetica";
    margin-left: 10px;
}
article {
    color: #9c27b0;
    font-family: "Helvetica";
    background-color: #47c4fd;
    padding: 15px;
}</pre>

Hatta, istersek **@mixin** değişkenlerinin *parametre*(ler) almasını da sağlayabiliriz;

<pre class="brush:csharp">@mixin renk-font($renk) {
    color: $renk;
    font-family: $yazi-tipi;
}</pre>

**@include** ile stillere eklediğimiz yerleri de aşağıdaki gibi değiştirelim;

<pre class="brush:csharp">header {
    @include renk-font($yazi);
    margin-left: 10px;
}
article {
    @include renk-font(darken($arkaplan, 15%));
    background-color: lighten($arkaplan, 15%);
    padding: 15px;
}</pre>

Böylece *renk-font* isimli **@mixin** değişkenimiz *$renk* parametresi ile aldığı renk bilgisini kullanacak. **header** elementinde *$yazi* değişkenini kullanıyoruz, **article** elementinde **darken()** methoduna *$arkaplan* değişkeninin değerini vererek oluşan rengi kullanıyoruz.

**http-server** *web server*'ını kapatalım, önce **SASS** dosyasını **css** dosyasına dönüştürelim (*derleyelim*) ve **http-server** *web server*'ını tekrar çalıştıralım;

<pre class="brush:csharp">npm run build-sass

http-server</pre>

![](/assets/uploads/2016/02/sass-4.png)

*css/style.css* dosyasını açarsak, içerisinde aşağıdaki stillerin tanımlı olduğunu görebiliriz;

<pre class="brush:csharp">body {
    background-color: #03a9f4;
}
header {
    color: #9c27b0;
    font-family: "Helvetica";
    margin-left: 10px;
}
article {
    color: #0275a8;
    font-family: "Helvetica";
    background-color: #47c4fd;
    padding: 15px;
}


