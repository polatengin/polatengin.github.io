---
layout: post
title: "Sql Server'da Hash işlemi"
date: 2010-01-13 16:02
author: engin.polat
comments: true
category: [Programlama]
tags: [hash, hashbytes, insert, md5, procedure, select, SQL, sql server, varbinary, varchar]
---
Uygulamalarımızda verileri **hash**'lemeye her zaman ihtiyaç duyarız. Verileri hash'lemek için kullanabileceğimiz birçok araç vardır.

Eğer veriyi veritabanı katmanında (**Sql Server**) hash'lemek istiyorsak, **MSDN**'de <a title="MSDN: HASHBYTES" href="http://msdn.microsoft.com/en-us/library/ms174415.aspx" target="_blank">şu sayfada</a> bulunan makalede okuyabileceğiniz gibi *HASHBYTES* fonksiyonu ile  yapabiliriz.

*HASHBYTES* fonksiyonu iki parametre alır;

***Algoritma:*** Hash'leme algoritması. Alabileceği değerler; *MD2*, *MD4*, *MD5*, *SHA*, *SHA1*

***Veri:*** Hash işlemine tabi tutulacak veri

*HASHBYTES* fonksiyonu geriye *VarBinary(8000)* tipinde değer döndürür.

*MD5* algoritması ile hash işlemi yapan örnek kod;


SELECT
    KULLANICI_KODU,
    KULLANICI_ADI,
    HASHBYTES('MD5', KULLANICI_SIFRE) AS KULLANICI_SIFRE
FROM
    T_KULLANICI WITH (NOLOCK)</pre>
<pre class="brush:sql">CREATE PROCEDURE PR_KULLANICI_EKLE
(
    @KULLANICI_KODU VARCHAR(5),
    @KULLANICI_ADI VARCHAR(50),
    @KULLANICI_SIFRE VARCHAR(15)
)
AS
INSERT INTO T_KULLANICI
    (KULLANICI_KODU, KULLANICI_ADI, KULLANICI_SIFRE, KAYIT_TARIHI)
VALUES
    (@KULLANICI_KODU, @KULLANICI_ADI, HASHBYTES('MD5', @KULLANICI_SIFRE), GETDATE())

SELECT SCOPE_IDENTITY()</pre>
<pre class="brush:sql">CREATE PROCEDURE PR_KULLANICI_LOGIN
(
    @KULLANICI_ADI VARCHAR(50),
    @KULLANICI_SIFRE VARCHAR(15)
)
AS
SELECT
    KULLANICI_KODU,
    KULLANICI_ADI,
    HASHBYTES('MD5', KULLANICI_SIFRE) AS KULLANICI_SIFRE
FROM
    T_KULLANICI WITH (NOLOCK)
WHERE
    KULLANICI_ADI = @KULLANICI_ADI AND
    KULLANICI_SIFRE = HASHBYTES('MD5', @KULLANICI_SIFRE)

Güvenlik ihtiyaçlarından ötürü kıymetli bilgilerin network'ten ulaşılmasını önlemek için, veriyi taşımadan önce **hash**'lemek isteyebilirsiniz. *HASHBYTES* fonksiyonu bu işin son derece kullanışlı gözüküyor.

***Not :** Yazıyı yazdıktan sonra gördüm ki, Emre Ayrılmaz <a title="Emre Ayrilmaz: HashBytes" href="http://www.ayrilmaz.com/Home/Post/hashbytes-ile-veri-katmaninda-hash-islemi.aspx" target="_blank">şuradaki</a> makalesinde aynı konuyu işlemiş, okunmasında fayda var.*

