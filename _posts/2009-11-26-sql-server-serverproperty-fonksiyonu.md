---
layout: post
title: "Sql Server ServerProperty Fonksiyonu"
date: 2009-11-26 10:05
author: engin.polat
comments: true
category: [Programlama]
tags: [msdn, server, serverproperty, SQL]
---
Sql Server'ın çalıştığı sunucu ile ilgili özellik bilgilerine sorgu ile erişmek istediğimizde kullanabileceğimiz bir fonksiyon var;

**SERVERPROPERTY ( *propertyname *)**

Örnek;


SELECT
    SERVERPROPERTY('edition') AS SURUM,
    SERVERPROPERTY('productlevel') AS SEVIYE,
    SERVERPROPERTY('productversion') AS VERSIYON,
    SERVERPROPERTY('servername') AS SUNUCU_ADI

**SERVERPROPERTY** fonksiyonunun alabileceği tüm *propertyname* parametreleri ve açıklamaları için <a title="MSDN: Sql ServerProperty" href="http://msdn.microsoft.com/en-us/library/ms174396.aspx" target="_blank">şuradaki</a> MSDN sayfasına bakınız.

