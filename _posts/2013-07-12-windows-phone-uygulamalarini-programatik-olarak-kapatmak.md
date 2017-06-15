---
layout: post
title: "Windows Phone uygulamalarını programatik olarak kapatmak"
date: 2013-07-12 13:25
author: engin.polat
comments: true
category: [Windows]
tags: [application, back, terminate, windows phone, windowsphone, wp8]
---
**Windows Phone** uygulamalarını programatik olarak kapatmak sıklıkla ihtiyaç duyacağımız bir şey *değildir*. Seyrekte olsa uygulamanızı *programatik* olarak sonlandırmak isteyebilirsiniz.

Özellikle *bankacılık* uygulaması gibi *yüksek güvenlik* gerektiren uygulamalarda, uygulamanın tamamen kapatıldığından *emin* olmanız gerekebilir.



Application.Current.Terminate();


Bu kod parçası sayesinde uygulamanızı komple kapatacaksınız. **Back** butonuna basarak uygulamanıza geri dönemeyeceksiniz.

