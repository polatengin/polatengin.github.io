---
layout: post
title: "@@IDENTITY, SCOPE_IDENTITY() ve IDENT_CURRENT() arasındaki farklar"
date: 2009-12-02 16:04
author: engin.polat
comments: true
category: [Programlama]
tags: [create, drop, identity, ident_current, insert, scope_identity, SQL, table, trigger]
---
Sql Server'da Identity kolon içeren tablolar ile çalışırken, yeni üretilen identity değerine ihtiyacımız olur.

**@@IDENTITY**, **SCOPE_IDENTITY()** ve **IDENT_CURRENT()** aynı işi farklı yöntemlerle yapar; son üretilen identity değerini döndürmek.

**SELECT <span style="color: #ff00ff;">@@IDENTITY</span>**
Açılmış olan bağlantıda son üretilen identity değerini döndürür. @@IDENTITY tablo ve scope bakmaksızın, connection'da üretilen son identity'yi verir. Dikkat : Eğer Insert yaptığınız tablo'da Trigger varsa, yanlış identity alabilirsiniz.

**SELECT <span style="color: #ff00ff;">SCOPE_IDENTITY()</span>**
Açılmış olan bağlantıda ve sorgunun çalıştığı scope'ta son üretilen identity'yi döndürür. Trigger kullanılan tablolarda @@IDENTITY yerine SCOPE_IDENTITY() kullanılması tavsiye edilir.

**SELECT <span style="color: #ff00ff;">IDENT_CURRENT</span>(*tablename*)**
Bağlantı ve scope bakmaksızın, parametre olarak verilen tabloda üretilen son identity değerini döndürür.

Örnek;


CREATE TABLE TEST_TABLO_1
(
    ID INT NOT NULL IDENTITY (1, 1),
    ACIKLAMA VARCHAR(500) NULL,
    BILGI VARCHAR(1000) NULL
)

CREATE TABLE TEST_TABLO_2
(
    ID INT NOT NULL IDENTITY (1, 1),
    ACIKLAMA VARCHAR(500) NULL,
    EKSTRA_BILGI VARCHAR(1000) NULL
)

GO

CREATE TRIGGER TRG_TEST ON TEST_TABLO_1
FOR INSERT
AS
INSERT INTO TEST_TABLO_2
    (ACIKLAMA, EKSTRA_BILGI)
VALUES
    ('Açıklama', 'Extra Bilgi')

GO

INSERT INTO TEST_TABLO_2 (ACIKLAMA, EKSTRA_BILGI) VALUES ('DENEME', 'TEST1')
INSERT INTO TEST_TABLO_2 (ACIKLAMA, EKSTRA_BILGI) VALUES ('DENEME', 'TEST2')
INSERT INTO TEST_TABLO_2 (ACIKLAMA, EKSTRA_BILGI) VALUES ('DENEME', 'TEST3')
INSERT INTO TEST_TABLO_2 (ACIKLAMA, EKSTRA_BILGI) VALUES ('DENEME', 'TEST4')

INSERT INTO TEST_TABLO_1 (ACIKLAMA, BILGI) VALUES ('DENEME', 'TEST1')

SELECT @@IDENTITY
UNION ALL
SELECT SCOPE_IDENTITY()
UNION ALL
SELECT IDENT_CURRENT('TEST_TABLO_1')

GO

DROP TRIGGER TRG_TEST
DROP TABLE TEST_TABLO_1
DROP TABLE TEST_TABLO_2

Sorgunun çıktısı;

![IDENTITY_SCOPE_IDENTITY_IDENT_CURRENT](/assets/uploads/2009/12/IDENTITY_SCOPE_IDENTITY_IDENT_CURRENT.png "IDENTITY_SCOPE_IDENTITY_IDENT_CURRENT")

Gördüğünüz gibi, **SELECT <span style="color: #ff00ff;">@@IDENTITY</span>** çalışan Trigger'dan etkilenerek yanlış sonucu döndürmüştür.

**TEST_TABLO_2**'ye ilk eklediğimiz kayıtta, identity olarak 5 aldık.

**SELECT **<span style="color: #ff00ff;">**SCOPE_IDENTITY()**</span> ise, doğru değer (1) döndürdü.

