---
layout: post
title: "UWP uygulamasında ölçeklendirme (Scaling)"
date: 2017-05-16 12:30
author: engin.polat
comments: true
category: [C#]
tags: [uwp, scaling]
---
<div class="alert alert-success" role="alert" style="margin: 10px 0px; display: block;"> Bu makalenin kodlarına <strong>Github</strong> üzerinde <a href="https://github.com/polatengin" class="alert-link" target="_blank" rel="noopener">polatengin</a> hesabımda yer alan <a href="https://github.com/polatengin/blog-codes/tree/master/windows-10-uwp-scaling-project" class="alert-link" target="_blank" rel="noopener">Windows 10 UWP Scaling Project</a> aracılığıyla erişebilirsiniz.</div>

*Yazılım Mimarı* olarak, çeşitli projelerine yardımcı olduğum bir müşteride **UWP** uygulamalarının birinde nesneleri çeşitli sebeplerden dolayı ölçeklendirmemiz gerekti.

*Ölçeklendirme* (**Scaling**) işini yazılımsal yapmamız gerekiyordu.

İnternette yaptığım araştırmalar sonucunda *en verimli* yolun **XAML Binding**'ler ile olduğunu buldum.

Böylece ölçeklendirme işini ekran kartının işlemcisine (**GPU**) bırakabiliyoruz. Bilgisayarın işlemcisi (**CPU**) ise bizim asıl yapmasını istediğimiz işler için müsait kalıyor, örneğin, *veritabanı işlemleri*, *web servis işlemleri*, vs.

Hemen yeni bir **Blank App (Universal Windows)** projesi oluşturalım;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/05/uwp-scaling-0.png" width="600" height="338" />

*MainPage.xaml* dosyasını açalım ve içerisine aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/43b218cb312f528ab34cd132e3b7a77b.js?file=MainPage.xaml"></script>

Bu ekranda dikkat etmemiz gereken birkaç nokta var,

<ul>
<li>
<a href="https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.slider" target="_blank" rel="noopener">Slider</a> nesnesi ile, ekrandaki <a href="https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.grid" target="_blank" rel="noopener">Grid</a> nesnesini hangi oranda ölçeklendireceğimizi belirliyoruz
</li>

<li>
<a href="https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.grid" target="_blank" rel="noopener">Grid</a> nesnesinin <code>RenderTransform</code> özelliği ve <a href="https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.media.scaletransform" target="_blank" rel="noopener">ScaleTransform</a> sınıflarını kullanıyoruz
</li>

<li>
<a href="https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.grid" target="_blank" rel="noopener">Grid</a> nesnesinin <code>ScaleX</code> ve <code>ScaleY</code> özelliklerini <a href="https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.slider" target="_blank" rel="noopener">Slider</a> nesnesinin <code>Value</code> özelliğine bağlıyoruz
</li>

<li>
<a href="https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.grid" target="_blank" rel="noopener">Grid</a> içerisine koyduğumuz tüm nesneler, <a href="https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.grid" target="_blank" rel="noopener">Grid</a> ile birlikte otomatik olarak ölçeklendirilecekler
</li>
</ul>

Uygulamayı çalıştırıp kullandığımızda aşağıdaki gibi bir sonuç elde etmemiz lazım;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/05/uwp-scaling-1.gif" width="600" height="308" />
