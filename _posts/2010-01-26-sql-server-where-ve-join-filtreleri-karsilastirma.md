---
layout: post
title: "Sql Server Where ve Join Filtreleri Karşılaştırma"
date: 2010-01-26 21:44
author: engin.polat
comments: true
category: [Programlama]
tags: [bilgisayar programcılığı, comparison, cpu, database, filter, hafıza, join, karşılaştırma, memory, performance, performans, query, select, sorgu, sql server, veritabanı, where]
---
**Bilgisayar Programcılığı** dünyasında genellikle bir işi yapmanın birden fazla yolu vardır. Özellikle veritabanı tarafında bu yollar daha da fazla olabilir. **Uygulama Geliştiriciler** olarak yeni bir kod parçası yazacağımız zaman, genellikle bu yollardan en çok kullandığımız bir tanesini seçeriz ve onu kullanırız.

Ne var ki, seçtiğimiz yol herzaman en doğru yol olmayabilir. **Sql**'de **join**'li sorgulama yaparken, **filtreleme** için kullandığımız yöntem de bunlardan biri olabilir.

Bu yazımda **join**'li sorgularda filtreleme için seçebileceğimiz iki yolu karşılaştıracağım. Karşılaştırma yapmak için kendi bilgisayarımda kurulu olan **Sql Server 2008** üzerinde **AdventureWorkd2008 R2** veritabanını kullandım.

Eğer birden fazla tablonun **join**'ler ile ilişkilendirildiği bir sorgu yazıyorsak, sonuç kümesini filtreleme için kullanabileceğimiz iki yöntem vardır;

***WHERE Filtreleme***

Sonuç kümesinde olmasını/olmamasını istediğimiz kayıtları sorgunun *WHERE* cümlesinde tanımlarız. Şablon;


SELECT
    [TABLE1.ALANADLARI],
    [TABLE2.ALANADLARI]
FROM
    [TABLE1]
    JOIN [TABLE2] ON [TABLE1.ALAN1] = [TABLE2.ALAN1]
WHERE
    [TABLE1.ALAN2] = DEGER AND
    [TABLE2.ALAN2] = DEGER</pre>
***JOIN Filtreleme***

Sonuç kümesinde olmasını/olmamasını istediğimiz kayıtları sorgunun *JOIN* cümlelerinde tanımlarız. Şablon;
<pre class="brush:sql">SELECT
    [TABLE1.ALANADLARI],
    [TABLE2.ALANADLARI]
FROM
    [TABLE1]
    JOIN [TABLE2] ON [TABLE1.ALAN1] = [TABLE2.ALAN1] AND [TABLE1.ALAN2] = DEGER AND [TABLE2.ALAN2] = DEGER</pre>
**AdventureWorks2008 R2** veritabanında aşağıdaki iki sorguyu çalıştırdıktan sonra, performans analizini yapalım;

**WHERE Filtreleme**
<pre class="brush:sql">SELECT
    *
FROM
    Sales.SalesOrderHeader AS SOH WITH (NOLOCK)
    JOIN Sales.SalesOrderDetail AS SOD WITH (NOLOCK) ON SOH.SalesOrderID = SOD.SalesOrderID
    JOIN Sales.SalesOrderHeaderSalesReason AS SOHSR WITH (NOLOCK) ON SOHSR.SalesOrderID = SOH.SalesOrderID
    JOIN Sales.SalesReason AS SR WITH (NOLOCK) ON SOHSR.SalesReasonID = SR.SalesReasonID
WHERE
    SOH.CustomerID &gt; 15000 AND
    SOD.LineTotal &gt; 2000 AND
    SR.SalesReasonID &gt; 5</pre>
**JOIN Filtreleme**
<pre class="brush:sql">SELECT
    *
FROM
    Sales.SalesOrderHeader AS SOH WITH (NOLOCK)
    JOIN Sales.SalesOrderDetail AS SOD WITH (NOLOCK) ON SOH.SalesOrderID = SOD.SalesOrderID AND SOH.CustomerID &gt; 15000 AND SOD.LineTotal &gt; 2000
    JOIN Sales.SalesOrderHeaderSalesReason AS SOHSR WITH (NOLOCK) ON SOHSR.SalesOrderID = SOH.SalesOrderID
    JOIN Sales.SalesReason AS SR WITH (NOLOCK) ON SOHSR.SalesReasonID = SR.SalesReasonID AND SR.SalesReasonID &gt; 5</pre>
Her iki sorgu da çalıştıktan sonra **1321** satır geri döndürdü. Performans incelemesini üç alanda yapacağız;


*   **CPU** Kullanımı
*   **Disk** Kullanımı
*   **Hafıza** Kullanımı
Bu üç performans kriteri için verileri  *SYS.SYSPROCESSES* **DMV**'sinden alabiliriz. *SYS.SYSPROCESSES* için detaylı bilgiye **MSDN**'deki şu <a title="MSDN: SYS.SYSPROCESSES" href="http://msdn.microsoft.com/en-us/library/ms179881.aspx" target="_blank">makaleden</a> ulaşabilirsiniz. Aşağıda ilgili üç performans kriteri için verileri elde edebileceğimiz sorgu var;
<pre class="brush:sql">SELECT
    DB_NAME(SP.DBID) AS VERITABANI,
    EST.TEXT AS SORGU,
    CPU,
    PHYSICAL_IO AS DISK_OKUMA,
    MEMUSAGE AS HAFIZA_KULLANIM
FROM
    SYS.SYSPROCESSES AS SP
    CROSS APPLY SYS.DM_EXEC_SQL_TEXT(SP.SQL_HANDLE) AS EST

Bu sorguyu çalıştırdıktan sonra benim test bilgisayarımda şu verileri elde ettim;


*   *VERITABANI :* **AdventureWorks2008R2**
*   *CPU :* **1965**
*   *DISK_OKUMA :* **211**
*   *HAFIZA_KULLANIM :* **2**


*   *VERITABANI :* **AdventureWorks2008R2**
*   *CPU :* **156**
*   *DISK_OKUMA :* **0**
*   *HAFIZA_KULLANIM :* **2**
Gördüğünüz gibi kaynak kullanımı açısından (özellikle **Disk Okuma** ve **CPU Kullanımı** açısından) **JOIN Filtreleme**, **WHERE Filtreleme**den daha avantajlı.

**JOIN Filtreleme** tabloları eşlerken filtrelenmiş verileri kullanıyor, **WHERE Filtreleme** ise, önce tabloları eşleştiriyor sonra filtreliyor. Özellikle çok kayıt bulunan/bulunacak olan tablolarınıza sorgu yazarken, JOIN Filtreleme'yi kullanmanızı tavsiye ederim.

