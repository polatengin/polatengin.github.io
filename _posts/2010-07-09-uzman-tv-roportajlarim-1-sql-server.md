---
layout: post
title: "Uzman TV Röportajlarım - 1 (Sql Server)"
date: 2010-07-09 13:49
author: engin.polat
comments: true
category: [Etkinlik]
tags: [access, db2, etkinliklerim, ibm, microsoft, mysql, oracle, röportaj, seminer, SQL, sql express, sql server, uzmantv]
---
<a href="http://www.uzmantv.com" target="_blank" rel="nofollow">Uzman TV</a> ile yaptığımız Sql röportajlarında bana sordukları sorular ve cevaplarım;

**SQL nasıl bir veritabanı dilidir? (SQL nasıl ortaya çıktı? Kim tarafında bulundu? Veritabanı nedir?)**



Önce veritabanı ne demektir, ondan bahsetmek lazım. Veritabanı, bilgisayar ortamında bir düzen ile saklanan, programatik erişim imkanı bulunan, yönetilebilir, güncellenebilir, birbirleri arasında ilişkiler tanımlanabilir, bilgiler kümesidir.

SQL, ilk olarak *IBM Research Center* tarafından *DB2* veritabanı ailesi için geliştirilmiştir. Daha sonra SQL dili, *ANSI* tarafından standartlaştırılmıştır.

Türkçe açılımı **Yapılandırılmış Sorgu Dili** anlamına gelmektedir. Verileri ve veri kümelerini **modellemek** ve **yönetmek** için kullanılır.

SQL, tanımlı anahtar kelimelerden oluşturulan sql cümleleri ile, veritabanına *kayıt ekleyebilir*, *güncelleyebilir*, *silebilir* veya varolan kayıtları *listeleyebilir*.

Microsoft Sql Server, Oracle ve hatta Access kendi SQL cümle yapısına yani diyalektiğine sahiptir.


**Hangi tür şirketler SQL’den yararlanabilir? (Veritabanı uygulamalarını tercih eden firmalar nelerdir? SQL kullanması gereken uygulamalar hangileri?)**


Günümüzde bilgisayar ve dolayısıyla yazılım kullanmayan, bunlara ihtiyaç olmayan iş kolu kalmadı. Ne kadar küçükte olsa, ne kadar büyükte olsa, her alandaki her firmanın mutlaka bilgisayar ve yazılım kullan birimleri vardır.

Genelde firmalar, kullandıkları bilgisayar programlarının verileri güvenli bir ortamda kaydetmesini, daha sonra aradığında bulabilmesini, gerekirse analiz edebilmesini, yaptığı analize ilişkin raporlar üretebilmesini beklemektedir.

Veritabanı uygulamaları kullanmadan böyle bir işlevselliği sağlayabilmek olanaksız olmasa da çok zor olacağından, hemen hemen tüm firmaların bir veritabanı yönetim sistemine ihtiyacı vardır diyebiliriz.

Bu açıdan bakacak olursak, ticari değer taşıyan hemen hemen tüm uygulamaların ve web sitelerinin veritabanına ihtiyacı vardır.


**Şirketler kendilerine uygun veritabanı uygulamasını nasıl seçmeli? (Küçük ve orta ölçekli şirketler açık yazılımlar mı tercih etmeli? Veritabanı desteği veren firmalar var mı?)**


Küçük ve orta şirketli firmalar genel de ücretsiz olan açık kaynak kodlu veritabanı yönetim sistemlerini tercih etmektedirler.

Daha büyük ölçekli firmalar ise, hem donanım, hem işletme, hem de personel maliyetlerini göze alabilerek, ücretli veritabanı yönetim sistemlerini tercih edebilirler.

Açık kaynak kodlu veritabanı yönetim sistemlerinin, genelde desteğini veren firma bulmak zordur. Örneğin, bugün piyasada MySql desteği veren firma bulmak hakikatten zordur.

Microsoft Sql Server, Oracle, IBM DB2 gibi veritabanı yönetim sistemlerinin ise, desteği üretici firmaların Türkiye acentelerinden edinilebilir.

Firmalar, Microsoft Sql Server’ın desteğini, Microsoft Türkiye’den, Oracle’ın desteğini Oracle Türkiye’den, IBM DB2’nun desteğini IBM Türkiye’den alabilirler.


**Veritabanı uygulamaları arasında ne tür farklar var? (MySQL, Windows SQL gibi programlar nasıl karşılaştırılmalı? Eksik ve fazlaları nasıl değerlendirilmeli?)**


Microsoft’un *Microsoft Sql Server* ve *Sql Express* uygulamaları, Oracle’ın *Oracle* uygulaması, IBM’in *DB2* uygulaması, gene Microsoft’un *Access* uygulaması ve açık kod olan *MySQL* uygulaması veritabanı yönetim sistemlerine örnektir.

Bu veritabanı yönetim sistemleri içinde ücretsiz olanlar vardır; Microsoft’un *Sql Express* versiyonu gibi. Bu ücretsiz veritabanı yönetim sistemleri genelde bazı kısıtlara sahiptirler. Örneğin, sunucunun hafızasının ve işlemcisinin sadece belli bir miktarını kullanabilirler, belli boyuta kadar veri saklayabilirler, gibi.

Ölçeklendirecek olursak, “büyük” ölçekli diyebileceğimiz Microsoft Sql Server, Oracle, IBM DB2 gibi veritabanı yönetim sistemleri, hem satın alma anlamında, hem de çalışmak için ihtiyaç duyduğu donanım ve yönetim için için gerekli personel maliyeti anlamında pahalıdır.

Bunların yanında MySql gibi, açık kaynaklı yazılımlar sayesinde, düşük maliyetli veritabanı yönetim sistemi sahibi olunabilir.


