---
layout: post
title: "Sql Server 2008 Except ve Intersect Anahtar Kelimeleri"
date: 2011-05-03 08:45
author: engin.polat
comments: true
category: [Programlama]
tags: [char, create, except, from, int, intersect, merge, not null, null, select, smalldatetime, SQL, sql server, t-sql, table, varchar]
---
**Sql Server 2008**, *T-SQL diline* yapılmış birkaç ek geliştirme ile birlikte geldi. Daha önce yazdığım şu makaleden [SQL Server 2008 MERGE operatörü](http://www.enginpolat.com/sql-server-2008-merge-operatoru/) hakkında bilgi alabilirsiniz.

Bugün yazacağım yazı ile [EXCEPT](http://msdn.microsoft.com/en-us/library/ms188055.aspx) ve [INTERSECT](http://msdn.microsoft.com/en-us/library/ms188055.aspx) operatörlerini inceleyeceğim.

Hem **EXCEPT**, hem de **INTERSECT** operatörü iki farklı sorgunun *karşılaştırılması* ve bir sonuç kümesi döndürülmesi ilkesi ile çalışır.

![t-sql intersect ve except](/assets/uploads/2011/05/intersect_except.png "t-sql intersect ve except")

**EXCEPT** anahtar kelimesi ile, bir sorgunun sonuç kümesinde *olan*, fakat diğer sorgunun sonuç kümesinde kesinlikle *olmayan* kayıtları buluruz.

*TABLO1'de bulunup, TABLO2'de bulunmayan kayıtlar*


SELECT * FROM TABLO1
EXCEPT
SELECT * FROM TABLO2</pre>

*TABLO2'de bulunup, TABLO1'de bulunmayan kayıtlar*
<pre class="brush:sql">SELECT * FROM TABLO2
EXCEPT
SELECT * FROM TABLO1</pre>

**INTERSECT** anahtar kelimesi ile ise, her iki sorgunun sonuç kümesinde de kesinlikle *olan* kayıtları bulabiliriz.

*Hem TABLO1'de bulunup, hem de TABLO2'de bulunan kayıtlar*
<pre class="brush:sql">SELECT * FROM TABLO1
INTERSECT
SELECT * FROM TABLO2</pre>

Bir örnek ile daha iyi anlaşılacak. Öncelikle *Personel* ve *Stajer* tablolarımızı oluşturalım.

<pre class="brush:sql">CREATE TABLE dbo.Personel
(
    ID INT NOT NULL IDENTITY,
    AdSoyad VARCHAR(100) NOT NULL,
    SicilNo CHAR(6) NOT NULL,
    EMail VARCHAR(100) NOT NULL,
    IseGirisTarihi SMALLDATETIME NOT NULL,
    YoneticiID INT NOT NULL,
    DepartmanID NOT NULL
)</pre>

<pre class="brush:sql">CREATE TABLE dbo.Stajer
(
    ID INT NOT NULL IDENTITY,
    AdSoyad VARCHAR(100) NOT NULL,
    StajerNo CHAR(6) NOT NULL,
    EMail VARCHAR(100) NOT NULL,
    StajBaslangicTarihi SMALLDATETIME NOT NULL,
    YoneticiID INT NOT NULL,
    StajDepartmanID NOT NULL
)</pre>

İlk olarak, *staj yapmamış personel'in adını* seçeceğimiz sorguyu yazalım;

<pre class="brush:sql">SELECT AdSoyad FROM dbo.Personel
EXCEPT
SELECT AdSoyad FROM dbo.Stajer</pre>

İkinci olarak, *işe başlamamış olan stajer'lerin adını* seçeceğimiz sorguyu yazalım;

<pre class="brush:sql">SELECT AdSoyad FROM dbo.Stajer
EXCEPT
SELECT AdSoyad FROM dbo.Personel</pre>

Son olarak, *hem staj yapıp, hem de işe başlamış olan personel'in adını* seçeceğimiz sorguyu yazalım;

<pre class="brush:sql">SELECT AdSoyad FROM dbo.Personel
INTERSECT
SELECT AdSoyad FROM dbo.Stajer


