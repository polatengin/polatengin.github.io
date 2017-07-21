---
layout: post
title: "C# for ve foreach döngüsü arasındaki farklar"
date: 2017-06-20 12:30
author: engin.polat
comments: true
category: [C#]
tags: [for, foreach, performance, loop, variable, iteration]
---
Bu makalede <strong>C#</strong> ile <code>for</code> ve <code>foreach</code> döngüleri arasındaki farkları inceleyeceğiz.

Böylece <a href="https://github.com/polatengin/polatengin.github.io/issues/1" target="_blank">#1</a> numaralı istek makaleyi yazmış olacağım :)

<em>Not : <a href="https://github.com/polatengin/polatengin.github.io/issues" target="_blank">Issues</a> sayfasında varolan makale isteklerini görebileceğinizi, hatta <a href="https://github.com/polatengin/polatengin.github.io/issues/new" target="_blank">yeni makale isteğinde</a> bulunabileceğinizi biliyor muydunuz?</em>

Öncelikle **for** ve **foreach** döngülerini **C#** programlama dilinde nasıl kullanıyoruz, nasıl yazıyoruz, hemen hatırlayalım;

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=for-loop.cs"></script>

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=foreach-loop.cs"></script>

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=foreach-variable-readonly.cs"></script>

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=for-loop-to-array-1.cs"></script>

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=for-loop-to-array-2.cs"></script>

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=for-loop-to-array-3.cs"></script>
