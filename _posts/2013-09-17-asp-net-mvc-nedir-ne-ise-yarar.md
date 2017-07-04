---
layout: post
title: "ASP.NET MVC Nedir, Ne İşe Yarar?"
date: 2013-09-17 08:30
author: engin.polat
comments: true
category: [Web]
tags: [aspnet, controller, css3, design pattern, framework, html5, microsoft, model, mvc, pattern, request, response, routing, seo, test, test driven development, view, viewmodel]
---
*ASP.NET MVC*, **MVC pattern**'ini *ASP.NET*'e eklemek için *Microsoft*'un geliştirdiği framework'tür. *ASP.NET MVC*'nin ne olduğunu anlamak için öncelikle *MVC*'nin ne olduğunu incelemekte fayda var.

*MVC*, uygulama geliştirmede (özellikle web uygulaması geliştirmede) önemli yere sahip mimari desenlerden biridir. Günümüzde MVC denince akla **Microsoft**'un geliştirdiği **ASP.NET MVC Framework** gelmektedir, oysa 1979 yılından beri (Microsoft 1975 yılında kurulmuştur) yazılım dünyasında yer almaktadır.

*MVC*, *Model*, *View*, *Controller* kelimelerinin baş harflerinden oluşur ve her kelime **MVC**'nin farklı bir katmanını ifade eder.

![](/assets/uploads/2013/09/MVC-0.png)

**Model**
MVC dünyasında model uygulama verisinin veya durumunun saklandığı yerdir, genellikle veritabanı veya xml/json dosyası formatındadır.

*Model*, veri katmanını (database, xml, json dosyası, vb.) uygulamadan izole eder, böylece diğer katmanlarda veri katmanının neresi olduğunun bilinmesine gerek kalmaz.

Model katmanı sıklıkla *Entity Framework*, *Nhibernate*, *LLBLGen*, vb. gibi araçlar kullanılarak oluşturulur.

**View**
*View*, istemcinin gördüğü arayüzü içeren katmandır, genellikle *Model* katmanındaki verinin kullanılması ile oluşturulur. *View* katmanının *Model* ve *Controller* katmanlarından ayrılması ile arayüz değişikliklerinin uygulamanın diğer katmanlarını değiştirmeye gerek kalmadan yapılabilmesi sağlanmıştır.

*View* katmanında **HTML5** ve **CSS3** gibi son versiyon teknolojiler kullanmak mümkündür. *HTML5* ve *CSS3* ile masaüstü ve mobil tarayıcılarda çalışabilen uygulamalar geliştirmek çok kolaylaşmıştır.

**Controller**
*Controller*, istemciden gelen isteği işlemek, *Model* ve *View* katmanları arasında köprü olmak gibi görevleri yerine getirir. Controller içerisinde bir veya daha fazla **Action** olabilir, genellikle her *Action* bir web sayfası üretmek için kullanılır.

![](/assets/uploads/2013/09/MVC-1.png)

MVC'nin diğer bir önemli yapıtaşı *Routing* mekanizmasıdır.

**Routing**
*Routing*, istemci'nin uygulamaya yaptığı isteği uygun *Controller* ve *Action*'a yönlendiren yapıdır. İstemci, isteği uygulamanın belli bir adresine gönderir, *routing mekanizması* sayesinde ilgili adres için en uygun *Controller* ve içerisindeki *Action* tespit edilir ve çalıştırılır.

**Neden ASP.NET MVC tercih etmeliyim?**
*MVC* ile istemci'nin isteğine karşılık üretilen çıktı üzerinde çok büyük kontrol imkanı vardır. Bu sayede her alanına müdahele edebildiğimiz ve isteğe en uygun çıktının üretilebilmesi sağlanmıştır.

*MVC* ile tekrar kullanılabilir (**reusable**) kod üretmek mümkündür. MVC'nin katmanları birbirinden ayrıldığı için her bir katmanın başka projelerde kullanılabilmesi sağlanmıştır.

*MVC* ile istemci'nin istek göndereceği adresler üzerinde çok büyük kontrol imkanı vardır. Bu sayede adres'in içerik ile tam bir ilişki içerisinde olması sağlanmıştır. Arama motorları için adres-içerik ilişkisi önemli olduğu için uygulamanın bulunabilirliğine katkısı yüksektir.

*MVC* ile test edilebilir uygulamalar geliştirme çok kolaylaşmıştır. Katmanların birbirinden ayrı olması ve **Test Driven Development** yapmayı kolaylaştırıcı mimarisi sayesinde test edilebilir uygulama geliştirilebilmesi sağlanmıştır.

**Sonuç**
*MVC* uzun yıllardır bir çok framework'te ve programlama dilinde kullanılmış (*Java*, *PHP*, vb.) ve olgunlaşmış bir desendir. **ASP.NET MVC** sayesinde .Net framework dilleri ile *MVC* pattern kullanılarak hızlı çalışan, test edilebilir, tekrar kullanılabilir parçaları olabilen web uygulamaları geliştirilebilmesi sağlanmıştır.

