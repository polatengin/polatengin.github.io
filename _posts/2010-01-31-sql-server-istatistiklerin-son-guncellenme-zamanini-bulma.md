---
layout: post
title: "Sql Server İstatistiklerin Son Güncellenme Zamanını Bulma"
date: 2010-01-31 08:54
author: engin.polat
comments: true
category: [Programlama]
tags: [data, database administrator, index, istatistik, query plan, son güncelleme, SQL, sql server, statistics, table, update, veritabanı yöneticisi, with fullscan]
---
**İstatistikler**, verinin veritabanı nesnelerinde (**tablo**, **index**, vs) nasıl dağıldığı bilgisini içerdiği için, veritabanında en önemli nesnelerden biridir.

**Veritabanı Yöneticilerinin** (**Database Administrators**) eskimiş istatistiklerden şikayetlerini çok duydum. Yapılması gereken istatistikleri güncellemektir.

Eğer bir tablodaki indexlere ait istatistiklerin son güncelleme zamanını öğrenmek istiyorsanız, aşağıdaki **sql sorgusunu** çalıştırabilirsiniz;


SELECT
    NAME AS INDEX_ADI,
    STATS_DATE(OBJECT_ID, INDEX_ID) AS SON_GUNCELLEME
FROM
    SYS.INDEXES
WHERE
    OBJECT_ID = OBJECT_ID('HumanResources.Department')</pre>
Eğer tüm **indexler** için aynı bilgiyi almak istiyorsanız, *WHERE* filtresini kaldırmanız yeterli.

Benim test bilgisayarımda aldığım sonuç;

`*PK_Department_DepartmenID* **2010-01-20 15:30:17:200**
*AK_Department_Name* **2010-01-20 15:30:26:053**`

Eğer istatistiklerinizin zamanı geçmiş olduğunu düşünüyorsanız ve güncellemek istiyorsanız, aşağıdaki **sql komutunu** çalıştırabilirsiniz;

<pre class="brush:sql">UPDATE STATISTICS HumanResources.Department</pre>

Bu komutu çalıştırdığınızda ilgili tablonun istatistik verilerinin güncellendiğini göreceksiniz. Eğer komutu *WITH FULLSCAN* komutu ile birlikte çalıştırırsanız, tablodaki tüm kayıtlar baştan taranacak ve istatistik baştan oluşturulacaktır.

<pre class="brush:sql">UPDATE STATISTICS HumanResources.Department
WITH FULLSCAN


***Dikkat :** İstatistikleri güncellemek için yukarıdaki komutları, sadece istatistiklerinizin gerçekten eskimiş olduğuna inandığınızda, sorgularınız için oluşturulan query plan'ların hatalı olduğunu gördüğünüzde ve sql server'ın yoğun olmadığı zamanlarda çalıştırmanızı tavsiye ederim.*

Kendi test bilgisayarımda, istatistik güncelleme komutunu çalıştırdıktan sonra, aşağıdaki sonuçları elde ettim;

`*PK_Department_DepartmenID* **2010-01-30 21:10:06:560**
*AK_Department_Name* **2010-01-30 21:10:06:594**`

Gördüğünüz gibi, ilgili tablodaki indexlerin istatistikleri güncellendi.

