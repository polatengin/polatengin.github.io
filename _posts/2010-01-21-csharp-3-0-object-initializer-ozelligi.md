---
layout: post
title: "C# 3.0 Object Initializer Özelliği"
date: 2010-01-21 13:01
author: engin.polat
comments: true
category: [C#]
tags: [class, code, constructor, csharp, initializer, method, object, source]
---
C# 3.0 **object initialize** etmek için kodda kısaltma sağlayacak bir yenilik sunuyor. Hemen hergün aşağıdaki gibi kod yazmamız gerekmez mi?


Personel UygulamaGelistirici = new Personel();
UygulamaGelistirici.Id = 42;
UygulamaGelistirici.AdSoyad = "Engin Polat";
UygulamaGelistirici.Birim = "NTV - Yeni Medya";</pre>
*Personel* sınıfından yeni bir örnek oluşturduktan sonra, sınıfın özelliklerinden ihtiyacımız olanlara atamalar yapmaya başlarız.

Eğer *Personel* sınıfının **constructor**'ı olsaydı ve bu özelliklerin atamalarını yapsaydı, tek bir satırda, hem *Personel* sınıfının yeni bir örneğini *UygulamaGelistirici* değişkenine oluşturmuş, hem de bazı özelliklerin değerlerini atamış olabilirdik.

Fakat, *Personel* sınıfının **constructor**'ını yazamadığımız durumlarda veya **constructor**'da parametreler ile almak için çok fazla özellik olduğu durumlarda bu yöntemi kullanamayız.

**C# 3.0** ile birlikte **Object Initializer** denilen yeni bir kodlama tekniği tanıtıldı.

Hemen yukarıdaki örneği bu teknik ile yazalım;
<pre class="brush:csharp">Personel UygulamaGelistirici = new Personel() { Id = 42, AdSoyad = "Engin Polat", Birim = "NTV - Yeni Medya" };</pre>
Gördüğünüz gibi, kodlama bizim için kolaylaşıyor.

**Object Initializer** içerisinde sadece özelliklere atama yapabiliyoruz, **method çağrımı** vs. yapılamıyor.

Eğer sınıfın özellikleri başka sınıflardan örnekler istiyorsa, **Object Initializer** nasıl yazabiliriz? Aşağıdaki gibi yazabiliriz;
<pre class="brush:csharp">VeritabaniSorgulayici dbSorgu = new VeritabaniSorgulayici() {
    Connection = new SqlConnection("..ConnectionString.."),
    Command = new SqlCommand("..Sorgu..")
};


