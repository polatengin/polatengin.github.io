---
layout: post
title: "Windows Phone 8 seçili temayı ve tema renklerini bulma"
date: 2013-08-07 10:00
author: engin.polat
comments: true
category: [Programlama]
tags: [application, collapsed, Color, phoneaccentbrush, phoneaccentcolor, phonebackgroundcolor, phonedarkthemevisibility, phonelightthemevisibility, resource, visibility, windows phone, windowsphone, wp7, wp8]
---
**Windows Phone 7** ve **Windows Phone 8**, 2 adet *arkaplan* renk seçeneği (koyu ve açık) ve 20 adet *vurgu* renk seçeneği (<a href="http://www.enginpolat.com/windows-phone-8-tema-renkleri/" title="Windows Phone 8 Tema Renkleri" target="_blank">Windows Phone 8 Tema Renkleri</a>) ile birlikte geliyor.

![](/assets/uploads/2013/08/Theme-1.png)

Uygulama içerisinden kullanıcının **tema** (*arkaplan* ve *vurgu* renk) tercihini bulmamız gerekebilir.

<a href="http://msdn.microsoft.com/library/system.windows.application.current" title="Application.Current Property" target="_blank">Application.Current</a> altında yeralan *static* <a href="http://msdn.microsoft.com/library/system.windows.application.resources" title="Application.Resources Property" target="_blank">Resources</a> özelliği aracılığı ile renk değerlerine ulaşabiliriz;



var lightThemeVisibility = (Visibility)Application.Current.Resources["PhoneLightThemeVisibility"];

var darkThemeVisibility = (Visibility)Application.Current.Resources["PhoneDarkThemeVisibility"];

var backgroundColor = (Color)Application.Current.Resources["PhoneBackgroundColor"];

var accentBrush = (SolidColorBrush)Resources["PhoneAccentBrush"];

var accentColor = (Color)Application.Current.Resources["PhoneAccentColor"];


