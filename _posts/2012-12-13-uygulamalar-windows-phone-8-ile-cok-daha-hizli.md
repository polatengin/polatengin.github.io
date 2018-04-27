---
layout: post
title: "Uygulamalar Windows Phone 8 ile (çok) daha hızlı"
date: 2012-12-13 10:14
author: engin.polat
comments: true
category: [Programlama]
tags: [.net, arm, async, await, bcl, cloud, compact framework, compile, coreclr, csharp, framework, garbage collector, microsoft, nuget, precompile, task parallel library, tpl, windows phone, wp8]
---
*Windows Phone 7.X* kullanıcılarının en çok şikayet ettiği konulardan biri uygulamaların yeterince hızlı başlatılamaması idi. *Microsoft*, **Windows Phone 8** tanıtımından beri yayınlanan bildirilerde uygulama başlangıç sürelerinin yaklaşık *yarı yarıya* azaldığını söylüyor.

Hızlı başlangıç süreleri, az pil tüketimi ve toplamda performans konularını inceleyelim;

**.Net Framework, CoreCLR ve Garbage Collector**

**Windows Phone 8** ile birlikte en güncel versiyon olan **.Net Framework 4.5** geliyor. Framework'te yapılan *(hemen hemen)* tüm güncellemeler ve iyileştirmelerden hem uygulama geliştirici hem de son kullanıcı olarak faydalanabiliyoruz.

Ayrıca **Windows Phone 8**, öncüllerinden farklı olarak *.Net Compact Framework* yerine *CoreCLR* motoru içeriyor.

**CoreCLR** *.Net Framework 4.5 CLR* ile *(hemen hemen)* aynı özellikleri ve optimizasyonları içerir, *.Net Compact Framework*'ten çok daha verimli ve daha hızlıdır.

Özellikle **Garbage Collector** performansı hissedilebilir şekilde arttırılmıştır. Oyunlar gibi saniyedeki işlem adedi yüksek olan uygulamalarda **Garbage Collector**'daki performans artışı uygulamanın toplam performansına büyük etki eder.

**Async Framework**

*.Net Framework 4.5*'teki en önemli yeni gelişme **C# 5** ve **VB.Net 11** tarafından tanıtılan yeni **asenkron programlama** modelidir.

*CoreCLR* ve *.Net Framework* kütüphanelerinde yapılan güncellemeler ile birlikte *Windows Phone 8* **asenkron programlama** modelinin tüm nimetlerinden faydalanabiliyor.

**Windows Phone 8** cihazların çok çekirdekli işlemciye sahip olması, *async*, *await* anahtar kelimelerinin ve *Task Parallel Library* kullanımının uygulamaların başlangıç ve kullanım hızlarının artmasına katkısı büyük.

Asenkron kütüphanelerin *(hemen hemen)* tamamı **.Net Framework** içerisine gömülmüş durumda. Fakat bazı kütüphanelere async desteğinin (özellikle *System.Net* namespace'i altındakiler) **NuGet** aracılığı ile indirilmesi gerekiyor.

*Microsoft.Bcl.Async* paketini *NuGet* üzerinden indirebilirsiniz. Daha ayrıntılı bilgi için MSDN'deki <a href="http://blogs.msdn.com/b/bclteam/archive/2012/10/19/using-async-await-without-net-framework-4-5.aspx" title="BCL Blog" target="_blank" rel="noopener">BCL Blog</a> makalesini okumanızı tavsiye ederim.

**Cloud Derleyici ile çok daha hızlı kod**

*Windows Phone 8*'de yüksek performans ve pil ömründen tasarruf için çok daha uygun olan yeni bir kod oluşturma yaklaşımı benimsenmiş.

Uygulamaları son kullanıcı cihazlara indirilmeden önce **Windows Phone Store** tarafından yüksek kalitede *ARM* koduna derleniyorlar.

Bu sayede *Windows Phone 7.X* cihazlar için uygulamanın her çalıştırılması esnasında yapılan derleme işlemi, *Windows Phone 8* cihazlar için gerçekleştirilmiyor.

CPU yükünü artıran ve pil tüketimine olumsuz etkisi bulunan bu işlemin aradan çıkartılmış olması **Windows Phone 8** cihazlarda uygulamaların daha hızlı başlatılmasını ve pil tüketimlerinin azalmasını sağlamış.

Microsoft **pre-compile** *(ön-derleme)* sürecini son kullanıcı cihazdan alarak **Washington Columbia nehri** üzerine kurdukları bir jeneratör aracılığı ile beslenen bir sisteme devretmiş durumda.

*Not : Cep telefonu pili yerine enerjinin bir nehirden sağlanması iyi düşünülmüş.*

