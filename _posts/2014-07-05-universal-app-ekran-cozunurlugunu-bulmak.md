---
layout: post
title: "Universal App ekran çözünürlüğünü bulmak"
date: 2014-07-05 11:55
author: engin.polat
comments: true
category: [Universal App]
tags: [bounds, displayinformation, getforcurrentview, height, messagedialog, rawpixelsperviewpixel, showasync, string.format, universal app, width, windows phone, windows store, windows.graphics.display, windows8, wp8]
---
**Windows Store** ve **Windows Phone** için tek bir uygulama geliştiriyorsunuz (*Universal App*) ve uygulamanın çalıştığı cihazın ekran çözünürlüğünü bulmanız gerekiyor.

Öncelikle <a href="http://msdn.microsoft.com/library/windows.graphics.display" title="Windows.Graphics.Display namespace" target="_blank">Windows.Graphics.Display</a> *namespace*'inde yeralan <a href="http://msdn.microsoft.com/library/windows.graphics.display.displayinformation" title="DisplayInformation class" target="_blank">DisplayInformation</a> sınıfının <a href="http://msdn.microsoft.com/library/windows.graphics.display.displayinformation.rawpixelsperviewpixel" title="DisplayInformation.RawPixelsPerViewPixel property" target="_blank">RawPixelsPerViewPixel</a> *property*'sinin değerini okuyalım;



var rawPixelPerView = DisplayInformation.GetForCurrentView().RawPixelsPerViewPixel;</pre>

Şimdi ekran *genişliği* ve *yüksekliği* bilgilerini okuyarak yukarıda bulduğumuz değişken ile çarparak ekran çözünürlüğünü hesaplayabiliriz;

<pre class="brush:csharp">var width = Window.Current.Bounds.Width * rawPixelPerView;
var height = Window.Current.Bounds.Height * rawPixelPerView;</pre>

Hesapladığımız ekran çözünürlüğünü bir <a href="http://msdn.microsoft.com/library/Windows/apps/windows.ui.popups.messagedialog" title="MessageDialog class" target="_blank">MessageDialog</a> aracılığı ile kullanıcıya göstermek için <a href="http://msdn.microsoft.com/library/Windows/apps/windows.ui.popups.messagedialog.showasync" title="MessageDialog.ShowAsync method" target="_blank">ShowAsync()</a> methodunu kullanıyoruz;

<pre class="brush:csharp">var dialog = new MessageDialog(string.Format("Çözünürlük: {0} * {1}", width, height);
dialog.ShowAsync();


