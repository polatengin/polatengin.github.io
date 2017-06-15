---
layout: post
title: "Microsoft Web katmanlarının tarihçesine bir bakış"
date: 2017-03-04 15:00
author: engin.polat
comments: true
category: [AspNet]
tags: []
---
**Asp.Net Core**, *Microsoft*'un önceki web frameworklerinden çok farklı. Neden **.Net Core**'a ihtiyaç duyulduğunu ve geliştirildiğini anlamak için, daha önce nelere sahip olduğumuzu ve son **15** yılda *web geliştirme dünyası*nın nasıl değiştiğini görmemiz gerekiyor.

Bu makalede, **Microsoft**'un web uygulamaları geliştirebilmemiz için bize sağladığı *framework*'leri sırasıyla inceleyeceğiz.

<h4>Asp.Net Web Forms</h4>

**Asp.Net Web Forms** *2002*'de **.Net Framework**'ün ilk sürümüyle birlikte piyasaya sürüldü.

İki farklı *geliştirici grubuna* hitap etmesi amaçlandı.

Birinci grupta, statik **HTML** ile dinamik sunucu taraflı kodların (genellikle *VBScript*) bir karışımıyla zaten web uygulamaları geliştiren **ASP** (*Active Server Pages*) geliştiricileri vardı.

İkinci grup, pazardaki değişiklikler nedeniyle web geliştirme dünyasına yaklaşmaya zorlanan çok sayıda masaüstü (*WinForms*) uygulama geliştiricisinden oluşuyordu ve bu geliştiriciler genellikle **HTML** yazmayı bilmiyorlardı. Ekran tasarımını, nesneleri *IDE*'nin (**Visual Studio**) tasarımcı yüzeyine sürükleyerek yapıyorlardı.

**Asp.Net Web Forms** her iki gruba da hitap edecek şekilde tasarlandı.

Zengin özelliklere sahip ve kolay öğrenilebilir *Olay Tabanlı Programlama* (**Event Based Programming**) modeli sayesinde birçok yeni geliştiricinin kolaylıkla web uygulamaları oluşturmasına yardımcı oldu.

Yıllar geçtikçe web uygulamaları geliştirirken ihtiyaç duyduklarımız çok değişti. Bu yeni değişikliklere hızlı ayak uyduran birçok *araç*-*framework*-*platform* doğdu ve bunları kullanan geliştiriciler işlerini daha **verimli** gerçekleştirdiler.

Örneğin, üretilen **HTML** üzerinde daha fazla kontrole sahip olmak, **Ajax** ve **Javascript** kütüphanelerini daha yaygın kullanmak ve (*responsive* tasarımlar sayesinde) **mobil** cihazlarda da çalışır uygulamalar geliştirmek istediler. Ancak **Asp.Net Web Forms**'un bu gelişmelere ayak uydurması zordu, çünkü;

* *System.Web.dll* ile yoğun biçimde birleşmiş olan devasa, monolitik bir yapısı vardı

* **Visual Studio**'ya dayanan programlama modeli göz önüne alındığında, **Asp.Net Web Forms**'un sürüm döngüsü *IDE* ve **.Net Framework** ile bağlantılıydı, bu nedenle güncellemeler arasında aylar-yıllar geçiyordu

* *Internet Information Services* (**IIS**), işletim sisteminin bir parçası olduğu için yeni özellikler eklemek veya güncellemek daha da zordu

<h4>Asp.Net MVC</h4>

Söz konusu sorunları çözmek için **2009**'da *Microsoft* **Asp.Net MVC** adıyla yeni bir **web framework** yayımladı.

*Business* ve *Presentation* katmanları arasında net bir ayrım bırakmak için **Model-View-Controller** (*MVC*) **Design Pattern**'ine dayanıyordu ve *HTML* çıktısı üzerinde tam hakimiyet sağlıyordu.

Ancak, **Asp.Net MVC**, yavaş yayın döngüsün sorununu çözüyor ve **HTML** biçimlendirme soyutlamasını kaldırıyor olsa da, hala **.Net Framework** ve *System.Web.dll* üzerinde bağımlılıklar içeriyordu ve hala **IIS**'e ve **Windows**'a sıkı bir şekilde bağımlıydı.

<h4>Asp.Net Web API</h4>

Zamanla, yeni bir web programlama modeli ortaya çıktı;

Verileri sunucu tarafında işleyip tamamen *render* edilmiş sayfayı tarayıcıya göndermek yerine,

Çoğunlukla *Ajax* istekleri ile sadece gereken veriyi sunucudan alıp, *client* tarafında **Javascript** ile render etme (**Single Page Applications** - *SPA*)

**Microsoft**, daha önce **Windows Communication Foundation** (*WCF*) için geliştirdiği kütüphanenin daha hafif ve web uyumlu bir sürümünü uygulamak zorundaydı, bu çalışmadan **Asp.Net Web API** ortaya çıktı.

**Asp.Net Web API** büyük olasılıkla **WCF** ekibi tarafından geliştirildi ve **Asp.Net** ekibi tarafından geliştirilmediğinden, *System.Web.dll* ve *IIS* gibi bağımlılıkları yoktu.

Böylece **Asp.Net Web API**, *System.Web.dll*, *IIS*, *Windows* gibi daha büyük parçalardan bağımsız, daha küçük bir **framework** haline geldi.

<h4>OWIN ve Katana</h4>

Yukarıda incelediğimiz tüm **framework** ve **kütüphanelerin** farklı tip işletim sistemlerinde, farklı tip uygulama sunucularında çalışması gerektiğinde sıkıntılar baş gösteriyordu.

Çünkü, belli bir tip uygulama sunucusunda çalışacak şekilde yazılan uygulama başka bir tip uygulama sunucusunda çalışmıyordu.

**.Net topluluğundan** bir grup geliştirici bu sorunu ortadan kaldırmak için **Open Web Interfaces for .Net** (*OWIN*) adı altında standartlar bütünü oluşturulmasına öncü oldular.

*Microsoft*, **Katana** adında **OWIN** uyumlu bir web sunucusu yayınladı. Bununla birlikte, bazı sorunlar hala devam etti.

**Asp.Net MVC**, *System.Web.dll* bağımlılığından dolayı, **Katana** içinde çalışmıyordu. Ayrıca, farklı takımlar tarafından ve farklı zamanlarda geliştirilen bu **framework**lerin farklı programlama modelleri vardı.

Örneğin, **Asp.Net MVC** ve **Asp.Net Web API** *Dependency Injection* (**DI**) destekliyordu, ancak farklı şekillerde.

Geliştiriciler aynı uygulama içinde **MVC** ve **Web API** birlikte kullanmak istediyse, bunları iki kez uygulamak zorundaydılar.

<h4>Asp.Net Core</h4>

Her yeni *framework* ile **.Net Framework**'ün potansiyeli daha da gelişti, fakat pek çok konu hala çözülmeyi bekliyordu;

* Windows olmayan bir sistemde **.Net** uygulamaları çalıştırılamaz.

* Bağımlılıklar, **.Net** uygulamalarını, yüzlerce uygulamanın tek bir makinede çalıştığı ve çok hızlı ölçeklendirilmesi gereken **bulut** gibi yüksek yoğunluklu senaryolara daha az uygun hale getiriyor.

* **.Net** proje sisteminin karmaşıklığı, **Visual Studio**'nun dışında **.Net** uygulamalarının geliştirilmesini zorlaştırıyor.

Olası çözümün, sıfırdan başlamak, **Asp.Net Framework**'ün, tamamen modüler olacak şekilde yeniden tasarlamak olduğu açıktı.

Ayrıca, **cross-platform** olması büyük bir artı olacaktı.

Bu sebeplerden dolayı *Microsoft*, **.Net Core** adını verdiği yepyeni bir **framework** geliştirdi ve **Asp.Net Core** adı ile de yepyeni bir *web framework*'ü yayınladı.