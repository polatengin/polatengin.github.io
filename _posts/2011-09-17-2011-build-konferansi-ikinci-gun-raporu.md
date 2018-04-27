---
layout: post
title: "2011 Build Konferansı İkinci Gün Raporu"
date: 2011-09-17 08:54
author: engin.polat
comments: true
category: [Genel]
tags: [azure, build konferans, css, Daron Yöndem, debug, html, javascript, microsoft, minify, performans, team foundation service, tfs, visual studio, websocket, windows8]
---
Blog'umun **200. yazısını** beni kırmayarak sevgili **Daron Yöndem** yazdı. Aslında tek bir yazı yazacaktı, fakat **Microsoft**'un <a href="http://www.buildwindows.com/" target="_blank" rel="noopener">Build Konferans</a>'ına katıldığı için bir yazı serisine dönüştü. Hergün izlenimlerini  sizlerle paylaşıyor olacağım. Yazıların orjinallerini <a href="http://daron.yondem.com" target="_blank" rel="noopener">Daron Yöndem</a>'in kendi blog'undan da takip edebilirsiniz. Ayrıca **twitter**'dan da takip etmenizi öneririm; <a href="http://twitter.com/daronyondem" title="Twitter / Daron Yöndem" target="_blank" rel="noopener">@daronyondem</a>

Söz Daron'da...<!--more-->

İtiraf etmek gerekirse her konferansta olduğu gibi :) Build'in de ikinci günü ilk güne kıyasla sönük geçti. Sabah başlayan **Keynote Windows Server 8**, **Azure**, **ASP.NET 4.5** etrafında şekillendi. Windows Server 8 tarafında ben biraz esnedim açıkçası :) Eminim ki *ITPro* tarafında olanlar için, sistem uzmanları için heyecanlandırıcı birşeyler vardır ama bana biraz uzak bu konular. Ben hemen **ASP.NET 4.5** tarafındaki birkaç nokta ile başlayyım gördüklerimi anlatmaya.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_2_01.jpg "Microsoft Build Konferans")

İlk dikkatimi çeken debugging tarafında aslında Visual Studio'nun sonraki sürümü ile alaklı bir nokta oldu. Görsel arayüz, arayüze ait çalışma zamanında yaratılmış HTML ve bu HTML'in yaratılmasını sağlayan arka plandaki kod, hepsi birbiri ile ilişkili bir şekilde navige edilebiliyor. Yani görsel "render" edilmiş HTML arayüzde bir nesneye tıklandığında onun yine render edilmiş HTML'deki tagi seçilip sonra da o tagin yaratılmasına neden olan arka plandaki kod otomatik olarak seçili geliyor. Bu neyin neden var olan hale geldiği gibi soruların çok hızlı cevaplanabilmesini sağlıyor.

**Otomatik JavaScript ve CSS Minification**

Bu gerçekten çok zekice ve güzel bir özellik! Artık projelerinizde CSS'lerinizi ve JavaScript dosyalarınızı bir klasöre toplar ve bu klasörün bir CSS veya JavaScript klasörü olduğunu belirtirseniz ASP.NET tüm CSS'leri ve JavaScript tek bir dosya haline getirim tek bir request ile istemciye gönderilebilmesini sağlamakla kalmıyor bir de bu kodları minimize edip (içlerindeki boşlukları vs çıkarmak gibi) performansın artmasını sağlıyor. Tüm bu mekanizmanın otomatik çalışıyor olması gerçekten muhteşem!

**WebSockets**

**Keynote** esnasında bu konunun çok derinlerine inilmese de **WebSockets** desteğinin **ASP.NET 4.5**'te çok önemli bir yerinin olduğunun defalarca altı çizildi.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_2_02.jpg "Microsoft Build Konferans")

**Socketler** zaten bildiğim şeyler, işte tam onların Web'den kullanılabilir halleri ve sunucu ayağı **ASP.NET** ile beraber hazır olarak geliyor.

**Team Foundation Service on Azure**

**TFS Hosted** olarak da adlandırabileceğimiz TFS'in Microsoft tarafından bir servis olarak sunulması modeli **Azure** üzerinden gerçekleştiriliyor. Şu an için <a href="http://www.buildwindows.com/" target="_blank" rel="noopener">Build Konferansına</a> katılan herkese birer hesap verildi. Yakın gelecekte genel bir betanın açılabileceğini tahmin ediyorum.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_2_03.jpg "Microsoft Build Konferans")

Böylece yukarıda gördüğünüz ve etkinliğin ilk günü her katılımcıya dağıtılan süprizi de öğrenmiş olduk :) Bu sürpriz **TFS on Azure** hesaplarının erişim bilgilerini içeriyormuş :)

**Duyurulan başka neler var!**

Gün boyunca duyurulan fakat çok detayına girilmeyen birkaç daha oldu. Onları da hemen aşağıda listeliyim :)



*   <a href="http://www.asp.net/mvc/mvc4" target="_blank" rel="noopener">ASP.NET MVC 4 Developer Preview</a>
*   <a href="http://go.microsoft.com/fwlink/?LinkId=228707" target="_blank" rel="noopener">ASP.NET 4.5 Developer Preview</a>
*   <a href="http://go.microsoft.com/fwlink/?LinkId=225709" target="_blank" rel="noopener">Visual Studio 2011 Developer Preview</a>
*   <a href="http://go.microsoft.com/fwlink/?LinkId=225714" target="_blank" rel="noopener">Team Foundation Server 2011</a>

İşte ikinci gün de böyle geçti. Konferansın üçüncü gününde herhangi bir Keynote vs yok. O nedenle herhangi bir ek duyuru da beklemiyorum. Özetle artık heyecanlı günleri geride bıraktık :) Bundan sonra eldekilere bakacağız. Yeterince malzeme var gibi inceleyecek.

Görüşmek üzere!

