---
layout: post
title: "Silverlight 4 TextTrimming özelliği"
date: 2009-11-25 09:45
author: engin.polat
comments: true
category: [Programlama]
tags: [silverlight, text trimming, web]
---
Silverlight 3 ve öncesi versiyonlarda, yazı alanına sığmayan metinleri, üç nokta ekleyerek trim etmek için, kendi kontrolümüzü yazmamız gerekiyordu.

Mesela, elimizde şöyle uzun bir yazı olsun;

**Silverlight helps you create rich web applications that run on Mac OS, Windows, and Linux. Welcome to a new level of engaging, rich, safe, secure, and scalable cross-platform experience.**

Bu yazıyı, 250px'lik bir metin alanında göstermemiz lazım, ama sığmayan kısımları yanyana üç nokta ile göstermemiz gerekiyor.

**Silverlight helps you create rich web applications ...**

Silverlight 4 versiyonundan önce, bu isteğimizi yerine getirmek için, kendi TextBlock kontrolümüzü yazmamız gerekirdi.

Silverlight 4 versiyonla birlikte ise, TextBlock kontrolünün TextTrimming="WordEllipsis" özelliğini kullanabiliyoruz.

**Örnek kod:**


&lt;TextBlock FontSize="16" TextTrimming="WordEllipsis" Width="250"
Text="Silverlight helps you create rich web applications that run on Mac OS, Windows, and Linux. Welcome to a new level of engaging, rich, safe, secure, and scalable cross-platform experience." /&gt;


