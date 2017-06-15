---
layout: post
title: "Sql Server veritabanında en büyük 10 tablo"
date: 2010-07-26 14:49
author: engin.polat
comments: true
category: [Programlama]
tags: [convert, execute, insert, procedure, query, replace, select, sp_MSforeachtable, sp_spaceused, SQL, sql server, table]
---
**Sql Server**'da belli bir veritabanında **en büyük** tabloları bulmak için aşağıdaki sorguyu çalıştırabiliriz;



DECLARE @TabloBoyutlari TABLE (TabloAdi VARCHAR(50), SatirSayisi INT, AyrilmisAlan VARCHAR(50), KullanilanAlan VARCHAR(50), IndexBoyu VARCHAR(50), KullanilmayanAlan VARCHAR(50))

INSERT INTO @TabloBoyutlari
EXECUTE sp_MSforeachtable 'sp_spaceused [?]'

SELECT TOP 10 * FROM @TabloBoyutlari ORDER BY CONVERT(INT, REPLACE(AyrilmisAlan, ' KB', '')) DESC


Bu sorgu sayesinde ilgili veritabanındaki tabloların,


*   **Tablo Adı**
*   **Satır Sayısı**
*   MDF dosyasında ilgili tablo için **ayrılmış alanın boyutu**
*   MDF dosyasında ilgili tablo için ayrılmış alanın **kullanılan boyutu**
*   MDF dosyasında ilgili tablonun **indexleri için ayrılmış alan**
*   MDF dosyasında ilgili tablo için **kullanılmayan alan**
bilgilerine ulaşabiliriz.

İlgili tablo için aşağıdaki eşitlik **her zaman doğrudur**;

*Kullanılan Alanı + Index Alanı + Kullanılmayan Alanı = Ayrılmış Alan*

Benim bilgisayarımdaki *AdventureWorks2008R2* örnek veritabanında yukarıdaki sorguyu çalıştırdığımda, şöyle bir sonuç alıyorum;

![Sql Server - Veritabanında en büyük 10 tablo](/assets/uploads/2010/07/SqlServerEnBuyuk10Tablo.png "SqlServerEnBuyuk10Tablo")

