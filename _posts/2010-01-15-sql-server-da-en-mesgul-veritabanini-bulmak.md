---
layout: post
title: "Sql Server'da En Meşgul Veritabanını Bulmak"
date: 2010-01-15 11:56
author: engin.polat
comments: true
category: [Programlama]
tags: [code, cross join, db_name, dmv, join, logical_read, logical_write, source, SQL, sql server, sql_handle]
---
Geçenlerde bir öğrencimin sorusu üzerine **Sql Server'da en meşgul veritabanını nasıl bulabiliriz**, sorusuna cevap arayacağız.

En meşgul veritabanı, muhtemelen **en çok disk operasyonu** yapan veritabanıdır diye düşünerek, en çok disk aktivitesinde bulunan veritabanını yakalamaya çalışmalıyız.

Sql Server ile ilgili aradığımız birçok sorunun cevabını **DMV**'lerde olduğu için, öncelikle **logical_read** ve **logical_write** miktarlarını veren **DMV** bulmalıyız.

MSDN'de <a title="MSDN: SYS.DM_EXEC_QUERY_STATS" href="http://msdn.microsoft.com/en-us/library/ms189741.aspx" target="_blank" rel="noopener">şu sayfadan</a> detaylı bilgiye ulaşabileceğiniz *SYS.DM_EXEC_QUERY_STATS*, ihtiyacımız olan *TOTAL_LOGICAL_READS*, *TOTAL_LOGICAL_WRITES*, *SQL_HANDLE* isminde üç kolona sahip.

*SQL_HANDLE* kolonunda yer alan veriyi, veritabanını bulmak için kullanabiliriz. Yapmamız gereken *SYS.DM_EXEC_SQL_TEXT* **DMF**'i ile *CROSS JOIN* işlemine tabi tutarak, *DBID* kolonuna erişmek. Böylece *DB_NAME* **sistem fonksiyonu** sayesinde veritabanının ismine ulaşabiliriz.



SELECT
    SUM(EQS.TOTAL_LOGICAL_READS) AS TOPLAM_OKUMA,
    SUM(EQS.TOTAL_LOGICAL_WRITES) AS TOPLAM_YAZMA,
    ISNULL(DB_NAME(EST.DBID), 'AdhocSQL') AS VERITABANI
FROM
    SYS.DM_EXEC_QUERY_STATS AS EQS
    CROSS APPLY SYS.DM_EXEC_SQL_TEXT(EQS.SQL_HANDLE) AS EST
GROUP BY
    DB_NAME(EST.DBID)


