---
layout: post
title: "Sql Server 2008 MERGE Operatörü"
date: 2010-01-19 16:04
author: engin.polat
comments: true
category: [Programlama]
tags: [datawarehouse, if, insert, merge, olap, oltp, operatör, SQL, sql server, update]
---
**Sql Server 2008** ile hayatımıza yeni bir operatör geldi : *MERGE*.

*MERGE* Operatörü koşullu olarak *INSERT* ve *UPDATE* yerine geçen bir operatördür.

İşlem yapmak istediğiniz kaydın varlığına bağlı olarak *INSERT* veya *UPDATE* işlemlerinden birisini gerçekleştirir.

Eskiden bu işi gerçekleştirmek için, her satır için çalışan bir döngü içerisinde satırın varlığını kontrol ettirdiğimiz *IF* kontrolü olurdu, ya *INSERT* cümlesini ya da *UPDATE* cümlesini çalıştırırdık.

*MERGE* operatörünün ana kullanım alanı **DataWarehouse**'lar olacaktır.

**OLTP** mimarisinde veritabanınız içinde bulunan verilerinizin, **OLAP** mimarisinde veritabanınıza işlemek istediğinizde, varolan satırları *UPDATE* etmek, varolmayan satırları *INSERT* etmek istersiniz.

*MERGE* operatörü, bu karmaşık yapının oldukça basitleşmesini sağlıyor.

**Kullanım şablonu**;



MERGE INTO Tablo
USING (SELECT Cümlesi)
    WHEN MATCHED THEN
        UPDATE Cümlesi
    WHEN NOT MATCHED THEN
        INSERT Cümlesi</pre>

**AdventureWorks 2008** veritabanında bulunan *Production.UnitMeasure* tablosunda bu özelliği nasıl kullanabileceğimizi bir örnek ile inceleyelim;

<pre class="brush:sql">MERGE Production.UnitMeasure AS T
USING (SELECT 'KG', 'Kilogram') AS S (UnitMeasureCode, Name) ON (T.UnitMeasureCode = S.UnitMeasureCode)
    WHEN MATCHED THEN
        UPDATE SET Name = S.Name
    WHEN NOT MATCHED THEN
        INSERT (UnitMeasureCode, Name) VALUES (S.UnitMeasureCode, S.Name)


