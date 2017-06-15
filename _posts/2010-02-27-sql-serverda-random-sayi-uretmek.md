---
layout: post
title: "Sql Server'da Random Sayı Üretmek"
date: 2010-02-27 11:15
author: engin.polat
comments: true
category: [Programlama]
tags: [convert, float, int, rand, random, seed, select, smallint, SQL, sql server, tinyint]
---
**C#** tarafında rastgele sayıya ihtiyacımız olduğunda *Random* class'ından yeni bir nesne üretip kullanabiliyoruz. Eğer rastgele sayıya **Sql** tarafında ihtiyacımız olursa yapmamız gereken, *RAND()* fonksiyonunu kullanmaktır.

*RAND()* fonksiyonu ile ilgili detaylı bilgiye **MSDN**'de yeralan şu <a title="MSDN: RAND()" href="http://msdn.microsoft.com/en-us/library/ms177610.aspx" target="_blank">makale</a>den ulaşabilirsiniz.

*RAND([seed])* fonksiyonu parametre olarak **seed** değeri alabilir ve geriye **float** tipinde sonuç döner.

*seed* parametresi *int*, *smallint* veya *tinyint* tipinde olabilir.

*RAND()* fonksiyonu aynı *seed* değeri ile her çalıştırıldığında aynı "**rastgele**" sayıyı döndürür. Eğer *seed* verilmezse, **Sql Server** rastgele bir *seed* değeri atayarak, "**rastgele**" sayı oluşturur.

Eğer *RAND()* fonksiyonundan *float* tipinde noktalı sayı değil, *int* tipinde tamsayı dönmesini istiyorsak, basit bir *convert* işlemine tabi tutabiliriz;


SELECT CONVERT(INT, RAND() * 100)


