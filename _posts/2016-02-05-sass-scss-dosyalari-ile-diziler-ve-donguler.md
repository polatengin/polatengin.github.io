---
layout: post
title: "SASS (scss dosyaları) ile diziler ve döngüler"
date: 2016-02-05 01:35
author: engin.polat
comments: true
category: [Web]
tags: [array, ASP.NET, aspnet, background, css, darken, dictionary, for, foreach, from, length, loop, sass, scss, style, stylesheet]
---
*Bu makaleyi okumadan önce <a href="/kategori/asp-net/" target="_blank" rel="noopener">Asp.Net Kategorisi</a>ndeki diğer makalelerimi ve <a href="http://www.enginpolat.com/sass-scss-dosyalari-nedir/" target="_blank" rel="noopener">SASS (scss dosyaları) nedir?</a> makalesini okumanızı tavsiye ederim.*

**SASS** dosyalarında birden fazla değişkenin bir **dizi** olarak ele alınmasını ve bu dizideki her eleman için bir **css** stili oluşmasını isteyebiliriz.

Örneğin **SASS** dosyamızda aşağıdaki değişkenleri tanımlamış olalım;



$Twitter: #41b7d8;
$Facebook: #3b5997;
$GooglePlus: #d64937;
$Linkedin: #0073b2;</pre>

**SASS** dosyalarında **liste** tipinde bir değişken tanımı yapmak için, değişkene değerleri virgüllerle ayırarak (*comma-seperated*) vermemiz lazım. *Örneğin*;

<pre class="brush:csharp">$SocialColors: $Twitter, $Facebook, $GooglePlus, $Linkedin;</pre>

Artık **@for** döngüsü yazarak *$SocialColors* dizisinin her bir elemanına erişebiliriz;

<pre class="brush:csharp">@for $i from 1 through length($SocialColours) {
    img-#{$i} {
        background: nth($SocialColors, $i);
    }
}</pre>

**@for** döngüsü ile döndüğümüz değişkenin kaçıncı elemanında olduğumuzu *#{$i}* kodu ile alabiliyoruz, herhangi bir dizinin istediğimiz sıradaki elemanını *nth(dizi-adi, sira)* kod parçası ile alabiliyoruz.

Yukarıdaki **SASS** kodunun css çıktısı aşağıdaki gibi olacaktır;

<pre class="brush:csharp">img-1 {
    background:#41b7d8
}
img-2 {
    background:#3b5997
}
img-3 {
    background:#d64937
}
img-4 {
    background:#0073b2
}</pre>

Peki, *img-1*, *img-2*, *img-3* isimli stiller değil de, *twitter*, *facebook*, *linkedin*, isimli stiller oluşturmak isteseydik?

**SASS** dosyalarında **Array** (*dizi*) yerine, **Dictionary** (*sözlük*) tipinde değişkenler de oluşturabiliriz. Böylece her eleman iki parçadan oluşacak, örneğin biri değişkenin adını, diğeri rengini içerebilir;

<pre class="brush:csharp">$Social:
    (Twitter, $Twitter),
    (Facebook, $Facebook),
    (GooglePlus, $GooglePlus),
    (Linkedin, $Linkedin);</pre>

**@each** döngüsü ile *$Social* değişkeninin her elemanına ulaşabilir, ulaştığımız elemanın ilk parçasına *$name* değişkeni, ikinci parçasına *$color* değişkeni aracılığıyla ulaşabiliriz;

<pre class="brush:csharp">@each $name, $color in $Social {
    .social-link-#{$name} {
        background-color: $color;
        color: darken($color, 35%);
    }
}</pre>

Değişkenin adını, **css** çıktısına eklemek için *#{}* kod parçasını kullandık.

Yukarıdaki **SASS** kodunun **css** çıktısı aşağıdaki gibi olacaktır;

<pre class="brush:csharp">.social-link-Twitter {
    background-color:#41b7d8;
    color:#114655;
}
.social-link-Facebook {
    background-color:#3b5997;
    color:#090d17;
}
.social-link-GooglePlus {
    background-color:#d64937;
    color:#4b160f;
}
.social-link-Linkedin {
    background-color:#0073b2;
    color:#000;
}</pre>

**darken()** methodunu da kullanarak yazı renginin *arkaplan* renginden *35%* daha **koyu** olmasını sağladık. Hatta **background-image** stiline **dizi** elemanının isminden değer vermek için aşağıdaki kodu kullanabiliriz;

<pre class="brush:csharp">background-image: url('/images/#{$name}.png');


*Kaynak : <a href="http://www.sassmeister.com/gist/9378629" target="_blank" rel="noopener">SASSMeister</a>*

