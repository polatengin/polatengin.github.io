---
layout: post
title: "Bu kodda ne yanlış var? – 6"
date: 2010-09-03 16:17
author: engin.polat
comments: true
category: [C#]
tags: [analiz, bknyv, distinct, from, full join, join, select, SQL, veritabanı]
---
Bir kitabevi için **web uygulaması** geliştiriyorsunuz. Yaptığınız **analize** dayanarak, uygulamanın veritabanını aşağıdaki gibi tasarladınız;

![Bu kodda ne yanlış var? - 6 / Veritabanı Modeli](/assets/uploads/2010/09/BKNYV-6.png "Bu kodda ne yanlış var? - 6 / Veritabanı Modeli")

Veritabanı modelinize göre, her kitabın *sıfır veya daha fazla* yazarı olabilir, her yazarın *sıfır veya daha fazla* kitabı olabilir.

**Toplam Kitap Adedi** ve **Toplam Yazar Adedi** sorularına cevap verebilmek için, aşağıdaki sorguyu yazdınız;



SELECT DISTINCT
    COUNT(Yazarlar.YazarID) AS ToplamYazarAdedi,
    COUNT(Kitaplar.KitapID) AS ToplamKitapAdedi
FROM
    Yazarlar
    FULL JOIN YazarKitaplari YK ON Yazarlar.YazarID = YK.YazarID
    FULL JOIN Kitaplar ON YK.KitapID = Kitaplar.KitapID


Problem, rakamların *beklediğinizden yüksek* çıkması.

Sizce **problem nedir** ve **nasıl düzeltebiliriz**?

