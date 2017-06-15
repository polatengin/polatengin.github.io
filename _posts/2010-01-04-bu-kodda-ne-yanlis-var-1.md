---
layout: post
title: "Bu kodda ne yanlış var? - 1"
date: 2010-01-04 13:00
author: engin.polat
comments: true
category: [Programlama]
tags: [bknyv, code, hata, procedure, source, SQL, table]
---
Database'de şu scripti çalıştıralım;


CREATE TABLE T_PERSONEL
(
  ADSOYAD VARCHAR(50),
  DOGUM_TARIHI SMALLDATETIME
)

INSERT INTO T_PERSONEL VALUES ('Engin POLAT',  '1981-01-12')
INSERT INTO T_PERSONEL VALUES ('Emre ERKAN', '1979-03-14')
INSERT INTO T_PERSONEL VALUES ('Ozan ÇAĞLARGİL',  '1982-09-27')
INSERT INTO T_PERSONEL VALUES ('Fatih DURGUT',  '1978-06-23')
INSERT INTO T_PERSONEL VALUES ('Burhan İNEGÖL',  '1980-11-08')</pre>
Aşağıdaki stored procedure'i yazalım.
<pre class="brush:sql">CREATE PROCEDURE PR_PERSONEL_LISTE
(
  @SIRALAMA INT
)
AS
BEGIN
  SELECT ADSOYAD, DOGUM_TARIHI FROM T_PERSONEL
  ORDER BY
    CASE @SIRALAMA
      WHEN 1 THEN DOGUM_TARIHI
      WHEN 2 THEN ADSOYAD
    END
END

Bu procedure'ü 1 parametresi vererek çalıştırıyoruz, ve beklediğimiz sonucu alamıyoruz.

Nerede hata yaptık? (İpucu; parametre olarak 2 vermeyi deneyin)

Yorumlarınızı bekliyorum...

