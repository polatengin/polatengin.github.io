---
layout: post
title: "SQL Agent Çalışma Durumu"
date: 2010-09-21 20:59
author: engin.polat
comments: true
category: [Programlama]
tags: [between retries, current_execution_status, executing, idle, msdb, name, performing completion actions, service, sp_help_job, SQL, sql agent, sql server, status, stored procedure, suspended, waiting for thread]
---
**SQL Server** servislerinden **SQL Agent** servisinin çalışıp çalışmadığını anlamamız gerektiği durumlarda <a href="http://msdn.microsoft.com/en-us/library/ms187112.aspx" target="_blank">msdb veritabanında</a> tanımlı <a href="http://msdn.microsoft.com/en-us/library/aa933458.aspx" target="_blank">sp_help_job</a> **stored procedure**'ünü kullanabiliriz;



EXEC msdb..sp_help_job


Sorgu sonucunda dönen sonuç kümesinden, *name* alanında **servisin ismi** yer alırken, *current_execution_status* alanında **servisin çalışma durumu** yer alır.

*Servisin çalışma durumunu* gösteren birden fazla değer olabilir;



*   1 : *(Executing)* Çalışıyor
*   2 : *(Waiting for thread)* Çalışmaya devam ediyor
*   3 : *(Between retries)* Tekrar deneniyor
*   4 : *(Idle)* Boşta
*   5 : *(Suspended)* Durdurulmuş
*   7 : *(Performing completion actions)* Tamamlama görevi sürdürülüyor

