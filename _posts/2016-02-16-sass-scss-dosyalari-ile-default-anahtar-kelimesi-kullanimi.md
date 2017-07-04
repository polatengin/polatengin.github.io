---
layout: post
title: "SASS (scss dosyaları) ile !default anahtar kelimesi kullanımı"
date: 2016-02-16 12:35
author: engin.polat
comments: true
category: [Web]
tags: [background, backgroundcolor, content, default, documentation, sass, scss, variable]
---
<a href="http://sass-lang.com" target="_blank">SASS</a> Dokümantasyonunda <a href="http://sass-lang.com/documentation/file.SASS_REFERENCE.html#variable_defaults_" target="_blank">Variable Defaults: !default</a> alanında yazana göre;

*You can assign to variables if they aren’t already assigned by adding the !default flag to the end of the value. This means that if the variable has already been assigned to, it won’t be re-assigned, but if it doesn’t have a value yet, it will be given one.*

yani, *!default anahtar kelimesi ile biten bir değişken tanımı varsa ve o ana kadar o değişken daha önce tanımlanmadıysa tanımlanır ve değer ataması yapılır, daha önce tanımlandıysa görmezden gelinir*

Hemen bir örnek ile inceleyelim;



$ornek: 'ilk içerik';

$ornek: 'ikinci içerik' !default;

#main {
    content: $ornek;
}</pre>

Yukarıdaki **SASS** (*scss dosyası*) çıktısı aşağıdaki gibi olacaktır;

<pre class="brush:css">#main {
    content: 'ilk içerik';
}</pre>

Aynı şekilde

<pre class="brush:css">$renk: red;

$renk: blue !default;

#main {
    background-color: $renk;
}</pre>

**SASS** (*scss dosyası*) çıktısı aşağıdaki gibi olacaktır;

<pre class="brush:css">#main {
    background-color: red;
}


