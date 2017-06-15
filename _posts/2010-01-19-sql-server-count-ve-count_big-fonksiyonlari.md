---
layout: post
title: "Sql Server COUNT ve COUNT_BIG Fonksiyonları"
date: 2010-01-19 15:28
author: engin.polat
comments: true
category: [Programlama]
tags: [bigint, code, count, count_big, function, int, source, SQL, sql server]
---
*COUNT()* sistem fonksiyonu, parametre olarak aldığı alandaki satır sayısını *INT* tipinde geri döndürür.

*COUNT_BIG()* sistem fonksiyonunun *COUNT()* fonksiyonundan farkı, elde ettiği sonucu *BIGINT* tipinde geri döndürmesidir.

*INT* veritipinin sınırları : -2^31 (**-2,147,483,648**) - 2^31-1 (**2,147,483,647**)

*BIGINT* veritipinin sınırları : -2^63 (**-9,223,372,036,854,775,808**) - 2^63-1 (**9,223,372,036,854,775,807**)

Eğer elde edeceğiniz sonucun *INT* veritipinin sınırlarına sığmayacağını düşünüyorsanız, yapmanız gereken *COUNT_BIG()* fonksiyonunu kullanmaktır.

