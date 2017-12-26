---
layout: post
title: "Angular ile sayfanın en altına geldiğini anlamak (Sonsuz -infinite- scroll)"
date: 2017-09-10 12:00
author: engin.polat
comments: true
category: [Web]
tags: [html5, angular, scroll, infinite, window, command prompt, terminal, javascript, ng, new, window, scroll, event, attach, innerHeight, document, documentElement, offsetHeight, body, scrollHeight, clientHeight, math, max, component, selector, export, class, addEventListener, function]
---
<mark><em>Bu makaleyi okumadan önce <a href="/etiketler/#angular-ref" target="_blank">Angular</a> etiketindeki diğer makalelerimi okumanızı tavsiye ederim.</em></mark>

Bazı web sitelerinde sitenin en altına indiğinizde yeni verilerin otomatik olarak yüklendiğini farketmişsinizdir.

Örneğin, <a href="https://facebook.com" target="_blank">facebook</a>, <a href="https://twitter.com" target="_blank">twitter</a> gibi uygulamalar sayfanın en altına gittiğinizde yeni post'ları sayfaya yükler.

**Angular** ile geliştirdiğimiz uygulamada biz de aynı şekilde sayfanın en altına geldiğimizde daha fazla veri yüklenmesini veya bir sonraki haberin sayfaya getirilmesini sağlayabiliriz.

Bunun için öncelikle bir **Angular** projesi oluşturmamız lazım, hemen **Command Prompt** (*Windows*) veya **Terminal** (*MacOs*, *Linux*) penceresi açalım ve aşağıdaki komutu girelim;

<script src="https://gist.github.com/polatengin/313a5d84fc428046b8be6947beda9405.js?file=angular-command.ps1"></script>

Sayfanın en altına kaydırıldığımızı anlayabilmek için <mark>javascript</mark> aracılığıyla erişebileceğimiz <code>window</code> nesnesinin <code>scroll</code> *event*'ine *attach*'lanmamız lazım.

Yapmamız gereken ilk iş, sayfanın yüksekliğini elde etmek. Bunun için, eğer <code>window</code> nesnesinin <code>innerHeight</code> özelliği varsa bu özelliğin değerini, yoksa, <code>document</code> nesnesinin <code>documentElement</code> özelliğinin <code>offsetHeight</code> değerini okumalıyız.

İkinci adımda, <code>document</code> nesnesinin <code>body</code> özelliğinde ve <code>documentElement</code> özelliğinde bulunan <code>scrollHeight</code>, <code>offsetHeight</code>, <code>clientHeight</code> özelliklerinden değeri en büyük olanı alıyoruz.

Artık tek yapmamız gereken, o anda <code>scroll</code>'un bulunduğu pozisyonu, sayfanın yüksekliği ile karşılaştırmak ve sayfanın el altına gelip gelmediğimizi bu karşılaştırmadan elde etmek.

Eğer bu kodları herhangi bir **Angular Component** *class*'ının **constructor**'ına yazacak olursak ilgili sayfada *scroll*'un en alta geldiği anı tespit edebiliriz.

Örneğin;

<script src="https://gist.github.com/polatengin/313a5d84fc428046b8be6947beda9405.js?file=app.component.ts"></script>
