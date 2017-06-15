---
layout: post
title: "SQL Server'da o an çalışan sorguları listelemek"
date: 2009-11-13 11:43
author: engin.polat
comments: true
category: [Programlama]
tags: [code, source, SQL]
---
Merhaba ilk yazımda SQL Server'da o anda çalışan sorguların nasıl listeleneceğini göstereceğim.

Bunu yapabilmek için sys.dm_exec_requests view'una sorgu çekmek lazım.


SELECT
    db.name,
    er.session_id,
    er.transaction_id,
    er.start_time,
    er.status,
    er.command,
    er.wait_time
FROM
    sys.dm_exec_requests AS er
    JOIN sys.sysdatabases AS db ON er.database_id = db.dbid
WHERE
    er.status = 'running'

Kaynak : [sys.dm_exec_requests DMV (Dynamic Management View)](http://technet.microsoft.com/en-us/library/ms177648.aspx)

Kaynak : [DBALink](http://dbalink.wordpress.com/2009/11/12/quickie-how-to-view-currently-executing-queries-in-sql-server/) , [Brad Mc Gehee](http://twitter.com/bradmcgehee/status/5657906001)

