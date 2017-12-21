---
layout: post
title: "Windows 10 UWP uygulamasının kendini kapatıp tekrar başlatması (Restart)"
date: 2017-08-06 12:00
author: engin.polat
comments: true
category: [Windows]
tags: [coreapplication, exit, grid, textblock, rowdefinition, columndefinition, listview, datatemplate, itemtemplate, image, button, itemssource, observablecollection, keyvaluepair, onnavigatedto, bitmapimage, requestrestartasync, async, await, onactivated, launchactivatedeventargs, arguments, frame, navigate]
---
<div class="alert alert-success" role="alert" style="margin: 10px 0px; display: block;">
Bu makalenin kodlarına <strong>Github</strong> üzerinde <a href="https://github.com/polatengin" class="alert-link" target="_blank">polatengin</a> hesabımda yer alan <a href="https://github.com/polatengin/blog-codes/tree/master/windows-10-uwp-restart-project" class="alert-link" target="_blank">Windows 10 UWP Restart Project</a> aracılığıyla erişebilirsiniz.
</div>

Birçok uygulama için kendini kapatıp tekrar başlatma (özellikle de değiştirilen bir ayarı veya lisansı güncelleyerek başlatma) sıklıkla ihtiyaç duyulan bir özelliktir.

**Windows 10 UWP** uygulamalarını kapatmak için *Windows.ApplicationModel.Core* namespace'inde yeralan <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication" target="_blank">CoreApplication</a> sınıfının <code>Exit()</code> methodunu çağırmamız yeterli.

Fakat uygulamanın tekrar başlatılmasını kullanıcıdan beklemek zorunda kalıyoruz. Daha iyi bir kullanım deneyimi için aslında uygulamanın kendisini kapatıp tekrar başlatabilmesi lazım.

**Windows 10 UWP** projelerinde, uygulamanın kendini kapatıp tekrar başlatabilmesini sağlamak, aslında çok kolay.

<mark><strong>Önemli not :</strong> Bu özelliğin çalışması için bilgisayarda <em>Windows 10 Build 16226</em> veya sonrası kurulu olmalı</mark>

Hemen yeni bir **Visual Studio** açalım ve **Windows 10 UWP** projesi oluşturalım, ben bu makalede projeme *RestartProject* ismini verdim.

<img class="lazy img-responsive" data-src="/assets/uploads/2017/08/restart-0.png" />

Öncelikle *MainPage.xaml* dosyasını açalım ve aşağıdaki şekilde güncelleyelim;

<script src="https://gist.github.com/polatengin/757a31eaa27549023ba0713a09c040b1.js?file=MainPage.xaml"></script>

Şimdi *MainPage.xaml.cs* dosyasını açalım ve aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/757a31eaa27549023ba0713a09c040b1.js?file=MainPage.xaml.cs"></script>

*Bu seçim ile yeniden başlat* butonuna tıklandığı zaman, <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.core.coreapplication" target="_blank">CoreApplication</a> sınıfında yeralan <code>RequestRestartAsync()</code> methodunu çağırıyoruz.

<code>RequestRestartAsync()</code> methodu parametre alabiliyor ve bu parametreyi, uygulama baştan başlatıldığı zaman *App.xaml.cs* dosyasında yeralan <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.application" target="_blank">OnActivated()</a> methoduna gönderiyor.

Projede yeralan *App.xaml.cs* dosyasını açalım ve aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/757a31eaa27549023ba0713a09c040b1.js?file=App.xaml.cs"></script>

Böylece ekrandaki listeden seçili olan öğreyi uygulama kapanıp tekrar açılırken parametre olarak kullanıyoruz. Uygulama tekrar başladığı zaman seçili olan öğe seçili olarak başlatılıyor.

Örnek kullanım alanları;

<ul>
<li>Tema seçimi</li>
<li>Yeni versiyon güncellemesi</li>
<li>Ayar değişikliği</li>
<li>vs</li>
</ul>

<img class="lazy img-responsive" data-src="/assets/uploads/2017/08/restart-1.png" />

<small>Bu makale <a href="https://blogs.windows.com/buildingapps/2017/07/28/restart-app-programmatically/" target="_blank">How to Restart your App Programmatically</a> makalesi baz alınarak yazılmıştır :)</small>
