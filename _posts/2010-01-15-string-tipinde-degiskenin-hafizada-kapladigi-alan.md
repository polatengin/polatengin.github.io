---
layout: post
title: "String tipinde değişkenin hafızada kapladığı alan"
date: 2010-01-15 16:14
author: engin.polat
comments: true
category: [C#]
tags: [code, csharp, encoding, GetByteCount, source, string, utf-8]
---
Hangi .Net yazılımcısına sorsanız, *string* tipinde değişkenin hafızada kapladığı yeri hesaplamak için, **karakter sayısını 2 ile çarpmak** gerektiğini söyler (**UTF-8** kodlama).

Genel olarak kabul gören bu hesaplama yöntemi, birçok durumda gerçeğe çok yakın sonuç üretir. Fakat **sonuç tam olarak doğru değildir**.

**UTF-8 (Unicode Transformation Format)** hakkında daha fazla bilgiyi **Wikipedia**'da yeralan <a title="Wikipedia: UTF-8" href="http://en.wikipedia.org/wiki/UTF-8" target="_blank">şu makale</a>'den edinebilirsiniz.

Peki **string** değişkenin hafızada kapladığı alanı tam olarak nasıl hesaplayacağız?



string OrnekString = "ἄλφα βῆτα γάμμα δέλτα deneme test";
MessageBox.Show("Uzunluk * 2: " + OrnekString.Length * 2 + " Byte");
MessageBox.Show("Gerçek uzunluk: " + Encoding.UTF8.GetByteCount(OrnekString).ToString() + " Byte");


*OrnekString.Length * 2*: **66 Byte** değerini üretirken,

*Encoding.UTF8.GetByteCount(OrnekString)*: **53 Byte** değerini üretmiştir.

**String** değişkenlerin hafızada kapladığı alanı tam olarak hesaplamanız gerektiği durumlarda, *Encoding.UTF8.GetByteCount()* fonksiyonunu kullanmanızı öneririm.

