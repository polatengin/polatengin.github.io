---
layout: post
title: "Sql Server 2008'de Çoklu Insert İşlemi"
date: 2010-01-19 14:56
author: engin.polat
comments: true
category: [Programlama]
tags: [adventureworks, code, coklu insert, insert, multiple insert, source, SQL, sql server, table value constructor]
---
**Sql Server 2008** ile birlikte **Çoklu Insert (Multiple Insert)** özelliği de hayatımıza giriyor.

**Microsoft** bu özelliğin altında yatan tekniğe, "**Table Value Costructor**" adını vermiş.

**Çoklu Insert (Multiple Insert)** özelliği sayesinde **Insert** yapan **DML** cümlelerinde, birden fazla satırı işleme tabi tutabiliyoruz.

**AdventureWorks 2008** veritabanında bulunan *HumanResources.Department* tablosunda bu özelliği nasıl kullanabileceğimizi bir örnek ile inceleyelim;



INSERT INTO
    HumanResources.Department
VALUES
    ('İnsan Kaynakları', 'IK', GETDATE()),
    ('Bilgi İşlem', 'IT', GETDATE()),
    ('Muhasebe', 'MUH', GETDATE()),
    ('Finans', 'FIN', GETDATE()),
    ('Lojistik', 'LOJ', GETDATE()),
    ('Kalite ve Eğitim', 'KVE', GETDATE())


