---
layout: post
title: "Sql Server CSV (Comma Seperated Value) çıktı üretme"
date: 2009-11-27 10:05
author: engin.polat
comments: true
category: [Programlama]
tags: [code, csv, for xml, output, query, source, SQL, sql server, substring, table]
---
Özellikle katalog tablolarının CSV çıktılarına sıklıkla ihtiyaç duyarız. Aşağıdaki sql script'ini kullanarak, siz de tablolarınızdan CSV çıktı alabilirsiniz.

Öncelikle tablomuzun orjinal haline bakalım;


SELECT Name
FROM HumanResources.Shift WITH (NOLOCK)</pre>
![sql-csv-output_1](/assets/uploads/2009/11/sql-csv-output_1.png "sql-csv-output_1")
  
    
Şimdi öyle bir sql sorgusu yazacağız ki, çıktımız şu şekilde olacak;

`Day, Evening, Night`

<pre class="brush:sql">SELECT
    SUBSTRING((
        SELECT ', ' + Name
        FROM HumanResources.Shift WITH (NOLOCK)
        FOR XML PATH('')
    ), 3, 8000) AS CSV</pre>

Sorguyu FOR XML anahtar kelimeleri ile çalıştırdığımıza ve PATH olarak '' (boş string) verdiğimize dikkat edin.

<pre class="brush:sql">SELECT ', ' + Name
FROM HumanResources.Shift WITH (NOLOCK)
FOR XML PATH('')


Böylece aşağıdaki sonucu elde etmiş olduk;

![sql-csv-output_2](/assets/uploads/2009/11/sql-csv-output_2.png "sql-csv-output_2")

Son olarak, sql sorgusunu SUBSTRING fonksiyonu içerisine koyduk, böylece baştaki virgül ve boşluk karakterlerinden (", ") kurtulmuş olduk.

![sql-csv-output_3](/assets/uploads/2009/11/sql-csv-output_3.png "sql-csv-output_3")

