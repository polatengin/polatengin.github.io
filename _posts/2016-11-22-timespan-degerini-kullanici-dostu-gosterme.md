---
layout: post
title: "TimeSpan değerini kullanıcı dostu gösterme"
date: 2016-11-22 15:00
author: engin.polat
comments: true
category: [C#]
tags: [timespan, extensionmethod]
---
<a href="https://msdn.microsoft.com/library/system.timespan" title="TimeSpan struct" target="_blank">TimeSpan</a> sınıfı ile iki zaman arasında (<a href="https://msdn.microsoft.com/library/system.datetime" target="_blank">DateTime</a> *instance*) ne kadar süre geçtiğini hesaplayabiliyor, tutabiliyoruz.

**TimeSpan** sınıfı, aşağıdaki özellikleri (*property*) aracılığıyla bize iki tarih arasındaki sürenin ne kadar olduğunu söyleyebiliyor;

<ul>
    <li><a target="_blank" href="https://msdn.microsoft.com/library/system.timespan/milliseconds">Milliseconds</a></li>
    <li><a target="_blank" href="https://msdn.microsoft.com/library/system.timespan/seconds">Seconds</a></li>
    <li><a target="_blank" href="https://msdn.microsoft.com/library/system.timespan/minutes">Minutes</a></li>
    <li><a target="_blank" href="https://msdn.microsoft.com/library/system.timespan/hours">Hours</a></li>
    <li><a target="_blank" href="https://msdn.microsoft.com/library/system.timespan/days">Days</a></li>
</ul>

Eğer iki tarih arasında geçen süreyi aşağıdaki formatta ekranda göstermemiz gerekiyorsa;

<mark>"4 gün, 23 saat ve 35 dakika"</mark>

ne yazık ki *TimeSpan* sınıfının değerini bu şekilde formatlayabileceğimiz bir fonksiyonu bulunmuyor.

*ExtensionMethod*'ları kullanarak biz böyle bir formatlayıcı yazabiliriz.

Hemen **Visual Studio** editörümüzü açalım ve *File* &rarr; *New Project* &rarr; *Console Application* projesi oluşturalım.

Yeni oluşturulan projeye <code>ExtensionMethods.cs</code> isimli yeni bir *class* ekleyelim ve içine aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/b520219ca899ff34491ab735d19bbada.js?file=ExtensionMethods.cs"></script>

Böylece istediğimiz herhangi bir sınıf içerisinde aşağıdaki gibi kod yazıp **TimeSpan** değerini *kullanıcı-dostu* bir şekilde ekranda gösterebiliriz;

<script src="https://gist.github.com/polatengin/b520219ca899ff34491ab735d19bbada.js?file=Program.cs"></script>

Bu uygulamanın çıktısı aşağıdaki gibi gözükmeli;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/11/TimeSpanToUserFriendlyString.png" />
