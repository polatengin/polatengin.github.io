---
layout: post
title: "Sql Server SET NOCOUNT komutu"
date: 2010-01-30 18:35
author: engin.polat
comments: true
category: [Programlama]
tags: [command, rowcount, satır sayısı, set nocount, SQL, sql server]
---
**Sql Server**'da her sorgu çalıştırdığımızda, sorgu sonucu, etkilenen satır sayısı ile birlikte, sorguyu çalıştıran uygulamaya geri gönderilir.

Bazı durumlarda bu bilgi işimize yarasa bile, genellikle kullanmayız.

**Sql Server**'ın bu bilgiyi hesaplamasını ve uygulamaya geri göndermesini engelleyerek, çok ufakta olsa kazanç sağlayabiliriz.

Yapmamız gereken, sorgudan önce aşağıdaki komutu çalıştırmak olacaktır;


SET NOCOUNT ON

**Sql Server** sadece ilgili sorgu için, etkilenen satır sayısını hesaplama işlemini yapmayacaktır.

