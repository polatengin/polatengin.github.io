---
layout: post
title: "SQL Server'da o an çalışan sorguları listelemek"
date: 2009-11-13 11:43
author: engin.polat
comments: true
category: [Programlama]
tags: [code, source, SQL]
---
Merhaba ilk yazımda **SQL Server**'da o anda çalışan sorguların nasıl listeleneceğini göstereceğim.

Bunu yapabilmek için <code>sys.dm_exec_requests</code> **view**'una sorgu çekmek lazım.

<script src="https://gist.github.com/polatengin/01d25295b69fd7ff637a7f48ecfab7d6.js?file=query.sql"></script>

Kaynak : [sys.dm_exec_requests DMV (Dynamic Management View)](http://technet.microsoft.com/en-us/library/ms177648.aspx)

Kaynak : [DBALink](http://dbalink.wordpress.com/2009/11/12/quickie-how-to-view-currently-executing-queries-in-sql-server/) , [Brad Mc Gehee](http://twitter.com/bradmcgehee/status/5657906001)