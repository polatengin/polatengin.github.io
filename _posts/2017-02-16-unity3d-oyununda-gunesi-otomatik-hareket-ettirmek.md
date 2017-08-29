---
layout: post
title: "Unity3D oyununda güneşi otomatik hareket ettirmek"
date: 2017-02-16 22:30
author: engin.polat
comments: true
category: [Unity3D]
tags: [csharp, directional light, rotation, script, hierarchy, assets, inspector, component, monobehaviour, private, update, float, time, deltatime, transform, rotate]
---
Bu makalede **Unity3D** oyun sahnesinde yer alan güneşi nasıl otomatik hareket ettireceğimizi inceleyeceğiz.

**Unity3D** oyununda sahnenin aydınlanmasını sağlayan ışık kaynağı *yani güneş* aslında sahnede yeralan <code>Directional Light</code> nesnesidir.

Bu makalede <code>Directional Light</code> nesnesini **gündüz** ve **geceyi** oluşturacak şekilde nasıl hareket ettireceğimizi göreceğiz.

Hemen **Unity3D** açalım ve yeni bir proje oluşturalım (ben projeye *GunesDogudanDogarBatidanBatar* ismini verdim)

<img class="lazy img-responsive" data-src="/assets/uploads/2017/02/unity3d-gunes-0.png" alt="Unity3D oyun projesi oluşturma" />

Eğer <code>Directional Light</code> nesnesini **Hierarchy** panelinden seçip, <code>Rotation</code> değerleri ile oynayarak döndürecek olursak, sahnemizin **gündüz** / **gece** geçişleri gibi **aydınlanıp** / **karardığını** görebiliriz.

<img class="lazy img-responsive" data-src="/assets/uploads/2017/02/unity3d-gunes-1.gif" width="600" height="400" alt="Unity3D oyun projesinde Directional Light ile güneş yapma" />

Yapmamız gereken, bir <code>C# Script</code> oluşturup, <code>Directional Light</code> nesnesine atamak ve bu dönüşü programatik olarak yaptırmak;

Hemen **Hierarchy** panelinde <code>Directional Light</code> seçili iken **Inspector** panelinde <code>Add Component</code> &rarr; <code>New Script</code> &rarr; *SunController.cs* yazıp <code>Enter</code> tuşuna basalım.

Yeni oluşturduğumuz *SunController.cs* dosyasını açalım ve içine aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/809c12813c134cf873be1e37bc46829a.js?file=SunController.cs"></script>

Böylece oyun başladığı andan itibaren *güneş* (<code>Directional Light</code>) otomatik olarak dönmeye ve **gece** / **gündüz** etkisi oluşturmaya başlayacak.

<mark>Gece ve gündüz geçişinin hızı ile oynamak isterseniz koddaki <em>0.01f</em> değeri ile oynamanız gerekiyor</mark>

<small>Not: Bu makaleyi yazarken internette yaptığım araştırmalardan ve bulduğum kod örneklerinden, yöntemlerden de faydalandım :)</small>