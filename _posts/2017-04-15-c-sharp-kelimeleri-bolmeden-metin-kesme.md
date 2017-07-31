---
layout: post
title: "C# kelimeleri bölmeden metin kesme"
date: 2017-04-15 22:30
author: engin.polat
comments: true
category: [C#]
tags: [string, extensionmethod, static, class, readonly, hashset, char, return, this, isnullorwhitespace, contains, substring]
---
Bu makalede <strong>C#</strong> ile geliştirdiğimiz projede yeralan bir <code>string</code> değişkenin içerisindeki *metni* keseceğiz (*örneğin ilk 50 karakter gibi*) fakat <em>kesme işlemi bir kelimenin ortasına denk geliyorsa kelimenin ortadan bölünmesini engelleyeceğiz</em>.

Bu işlemi yapmak için <a href="https://msdn.microsoft.com/library/system.string" target="_blank">string</a> tipine bir **ExtensionMethod** yazacağız.

*Not : <a href="/etiketler/#extensionmethod-ref" target="_blank">ExtensionMethod</a>'lar ile ilgili diğer makalelerimi okuyabilirsiniz.*

İnternette yaptığım küçük araştırmada bile bir sürü kaynağa denk geldim, birçoğundan esinlenerek bulduğum benim çözümüm ise şöyle oldu;

<script src="https://gist.github.com/polatengin/9e91f72496de6e1ae041704cf1900465.js?file=string-extension.cs"></script>