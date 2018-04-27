---
layout: post
title: "Sql Server Tablonun Kolonunun İsmini Değiştirmek"
date: 2010-03-02 12:00
author: engin.polat
comments: true
category: [Programlama]
tags: [column, database, exec, index, microsoft, msdn, rename, sp_rename, stored procedure]
---
Neden olduğunu anlayamadığım bir sebepten dolayı **Microsoft** tablodaki bir kolonun ismini değiştirmek için bir **tool** sunmuyor.

Peki bir kolonun ismini değiştirmek istersek ne yapmalıyız?

**MSDN**'de yer alan şu <a title="MSDN : sp_rename" href="http://msdn.microsoft.com/en-us/library/ms188351.aspx" target="_blank" rel="noopener">makale</a>de anlatıldığı gibi, *sp_rename* **stored procedure**'ünü kullanabiliriz.

Örneğin;


EXEC sp_rename 'TabloAdi.KolonAdi', 'YeniKolonAdi', 'COLUMN';

Üçüncü parametrenin alabileceği diğer değerler;

﻿***COLUMN :** Bir kolonun yeniden isimlendirileceğini belirtir
**DATABASE :** Veritabanının yeniden isimlendirileceği durumda kullanılır
**INDEX :** Kullanıcının oluşturduğu index yeniden isimlendirileceğinde kullanılır*

