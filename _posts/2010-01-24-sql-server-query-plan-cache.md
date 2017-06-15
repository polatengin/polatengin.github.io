---
layout: post
title: "Sql Server Query Plan Cache"
date: 2010-01-24 13:16
author: engin.polat
comments: true
category: [Programlama]
tags: [cache, compile, database, dbcc, index, önbellek, parse, query, query plan, query plan cache, query processor, SQL, sql server, statistics, table, veritabanı]
---
**Sql Server**'da çalıştırılan her sorgu, aslında çalıştırılmadan önce **derleme** (**compile**) işlemine tabi tutulur. Bu derleme işlemi sonucunda Sql Server **query plan** denilen çıktıyı üretir.

**Query Plan**, **query processor**'e (sorguyu işleyen birim), sorgunun ihtiyaç duyduğu veriler için veritabanında bulunan **tablo** ve **index**'lere fiziksel olarak nasıl erişebileceğini söyler.

Fakat, **query plan** elde etmek için yapılan bu derleme işlemi, bazı sorgular için **çok pahalı** olabilir.

Sql Server, aynı sql sorgusunun defalarca çalıştırıldığı durumlarda, **derleme** işleminin yükünü azaltmak için, **query plan cache** denilen hafıza bölgesinde **query plan**'ları önbellekler.

**Query plan cache**, önbellekleyeceği sorguları basit bir **hash tablo**'da saklar. Hash tablo'nun iki alanı vardır, birinde sql sorgusunun kendisini, diğerinde derleme sonucu ortaya çıkan **query plan**'ı saklar.

**Sql Server**, yeni bir sorgu çalıştıracağı zaman, ilk önce **query plan cache**'te sorgunun **query plan**'ı var mı diye bakar. Eğer bulursa, daha önce önbelleklenmiş bu **query plan**'ı kullanır. Bulamazsa, ilk önce sorguyu yazım denetimine tabi tutar, sonra sorguyu derler ve oluşan **query plan**'ı bu listeye ekler.

**Query plan cache**'in getirdiği performans artışını ölçmek için, öncelikle Sql Server'daki query plan cache'i boşaltacağız;



DBCC FREEPROCCACHE</pre>

***Dikkat :** Bu komutu kullandığınızda, Sql Server üzerinde bulunan tüm query plan cache silinir. Veritabanı veya belli bir sorgu için temizleme mümkün değildir. Bu komutun Canlı Veritabanında (Production Database) kullanılmaması önerilir.*

Şimdi Sql Server'ın **sorguyu inceleme** ve **derleme** işlemi için ne kadar vakit harcadığını bulmamız lazım. Yapmamız gereken, sorguyu çalıştırmadan önce aşağıdaki komutu çalıştırmak;

<pre class="brush:sql">SET STATISTICS TIME ON</pre>

Şimdi sorgumuzu çalıştırabiliriz. Ben Sql Server 2008 için hazırlanmış örnek veritabanında (AdventureWorks 2008R2) aşağıdaki sorguyu çalıştırıyorum;

<pre class="brush:sql">SELECT * FROM HumanResources.Employee WHERE BusinessEntityId IN (1, 2);</pre>

Sorgu sonucu;

<pre class="brush:html">SQL Server parse and compile time:
    CPU time = 0 ms, elapsed time = 12 ms.

(2 row(s) affected)

SQL Server Execution Times:
    CPU time = 0 ms,  elapsed time = 1 ms.</pre>

Gördüğünüz gibi, sorgunun **parse** ve **compile** işlemine tabi tutulması *12 ms.* sürdü. Sorgunun çalıştırılması ise *1 ms.* sürdü.

Aynı sorguyu tekrar çalıştırırsak, elde edeceğimiz sonuç;

<pre class="brush:html">SQL Server parse and compile time:
    CPU time = 0 ms, elapsed time = 1 ms.

(2 row(s) affected)

SQL Server Execution Times:
    CPU time = 0 ms,  elapsed time = 1 ms.


**Query plan cache** sayesinde, **parse** ve **compile** işlemi *12 ms.* yerine *1 ms.* sürdü.

***Not :** Sql Server'ın istatistik toplarken ulaşabileceği en düşük kesinlik süresi 1 ms.'dir. 1 ms.'den kısa süren işler için bile Sql Server 1 ms. raporlar.*

