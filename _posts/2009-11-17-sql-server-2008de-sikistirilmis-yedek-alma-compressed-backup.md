---
layout: post
title: "Sql Server 2008'de sıkıştırılmış yedek alma (compressed backup)"
date: 2009-11-17 09:27
author: engin.polat
comments: true
category: [Programlama]
tags: [backup, code, compare, compress, compression, source, SQL]
---
Sql Server 2008 ile birlikte gelen güzel bir yenilikten bahsetmek istiyorum, backup sırasında sıkıştırma (backup with compression).

Bu özelliği test etmek için, Sql Server 2008 R2 kurulu makinama AdventureWorks 2008R2 veritabanını yükledim.

Yükleme işleminden hemen sonra, şu sql cümlesi ile veritabanının backup'ını aldım;


BACKUP DATABASE
  AdventureWorks2008R2
TO DISK = 'C:\EnginPOLAT\AdventureWorks2008R2_Backup.bak'
WITH
  NOFORMAT,
  INIT,
  SKIP,
  NOREWIND,
  NOUNLOAD,
  STATS = 10</pre>
Karşılaştırma yapabilmek ve COMPRESSION anahtar kelimesini denemek için, bir de şu sql cümlesi ile yedek aldım;
<pre class="brush:sql">BACKUP DATABASE
  AdventureWorks2008R2
TO DISK = 'C:\EnginPOLAT\AdventureWorks2008R2_Backup.bak'
WITH
  COMPRESSION,
  NOFORMAT,
  INIT,
  SKIP,
  NOREWIND,
  NOUNLOAD,
  STATS = 10</pre>
Gördüğünüz gibi, sıkıştırma özelliğini kullanmak için, backup script'inin options parçasına (WITH anahtar kelimesinden sonra gelen kısım), COMPRESSION anahtar kelimesini eklemek yeterli.

Şimdi gelelim karşılaştırmalara;

**Orjinal boyut** : 200.192 KB (Data) + 38.912 KB (Log)

**Backup işlemi (Normal) sonucu oluşan dosya** : 186.461 KB

**Backup işlemi (Compression) sonucu oluşan dosya** : 44.507 KB

**Normal backup'a göre sıkıştırma oranı** : *%77*

Backup alma süreleri açısından karşılaştırma,

**Backup işlemi (Normal)** : 7.505 saniye (24.018 MB / saniye)

**Backup işlemi (Compression)** : 4.521 saniye (39.862 MB / saniye)

**Hız artışı** : *%40*

Ne yazık ki, CPU kullanım oranlarını ölçemedim. Eğer ölçebilen varsa, yorumlarınızı duymak isterim.

MSDN'de yeralan <a title="MSDN: Backup Compression" href="http://msdn.microsoft.com/en-us/library/bb933863.aspx" target="_blank">şu sayfada</a> yazdığına göre, backup işlemine compression eklemek, CPU kullanımında önemli bir artışa yol açarmış.

Varsayılan olarak alınacak tüm backup'larda sıkıştırma özelliğini açmak istersek;
<pre class="brush:sql">EXEC sp_configure 'backup compression default', '1';
RECONFIGURE WITH OVERRIDE

script'ini çalıştırmak yeterli.

Kaynak : <a title="Technet: Backup Compression Default Option" href="http://technet.microsoft.com/en-us/library/bb677250.aspx" target="_blank">Technet</a>, <a title="MSDN: Backup Compression" href="http://msdn.microsoft.com/en-us/library/bb933863.aspx" target="_blank">MSDN</a>
