---
layout: post
title: "C# Rezerve Methodlar - Reserved Methods"
date: 2010-01-21 09:22
author: engin.polat
comments: true
category: [C#]
tags: [class, compile, csharp, destructor, event, ildasm, indexer, property, reserved methods, rezerve methodlar, struct]
---
C# dilinin bazı yetenekleri, aslında uygulama geliştiricilerin göremedikleri method'lardan gelmektedir.

Eğer geliştirdiğiniz uygulamanın assembly'lerini **ILDASM** tool'u ile açıp incelerseniz, bu method çağrılarını görebilirsiniz.

Eğer bilerek veya yanlışlıkla bu method'lardan birisi ile aynı isme sahip method oluşturmaya çalışırsanız, **derleme anında** (**compile-time**) hata alırsınız.

Bu rezerve method isimlerini inceleyelim;

***Özellikler (Properties) için Rezerve Methodlar;***

**Class** veya **Struct**'larınıza eklediğiniz özellikler, derleme zamanında

*T add_{OzellikAdi}*
* void set_{OzellikAdi}(T value)*

şablonunda iki method'a dönüştürülür. **Class** veya **Struct**'ınıza bu şablona uyan method ekleyemezsiniz.

***Indexer'lar için Rezerve Methodlar;***

Indexer'larınız derleme zamanında

*T get_Item(Parametre)*
* void set_Item(Parametre, T value)*

şablonunda iki method'a dönüştürülür.

***Yıkıcılar (Destructors) için Rezerve Methodlar;***

**Class** veya **Struct**'ınıza eklediğiniz *Destructor* kodu derleme zamanında

*void Finalize()*

method'una dönüştürülür. **Class** veya **Struct**'ınıza *Finalize()* method'u eklemeye çalıştığınızda **derleme zamanında** uyarı alırsınız.

***Olaylar (Events) için Rezerve Methodlar;***

Olaylarınız için derleme zamanında kodunuza

*void add_{EventAdi}(T callback)*
* void remove_{EventAdi}(T callback)*

methodları eklenir.

