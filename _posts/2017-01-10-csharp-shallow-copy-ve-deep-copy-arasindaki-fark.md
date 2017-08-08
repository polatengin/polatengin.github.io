---
layout: post
title: "C# Shallow Copy ve Deep Copy arasındaki fark"
date: 2017-01-10 22:30
author: engin.polat
comments: true
category: [C#]
tags: [csharp, shallow, deep, copy, class, primitive, memberwiseclone, return, memorystream, binaryformatter, serialize, position, deserialize]
---
Bazı durumlarda **C#** projemizde elimizdeki değişkenin bir kopyasını çıkarmamız gerekir.

Örneğin, ekrandaki *fatura*'nın veya *müşterinin* aynısından oluşturalım ama *Adı*, *Adresi*, gibi alanların değerlerini değiştirelim sadece.

Bu tip senaryolarda karşımıza iki seçenek çıkıyor; *Basit Kopya* (**Shallow Copy**) ve *Derin Kopya* (**Deep Copy**)

**Shallow Copy**, ilgili değişkenin sadece **primitive** tiplerdeki özelliklerinin değerlerini kopyalar, **custom** tiplerdeki özelliklerini kopyalamaz.

Senaryomuzda aşağıdaki sınıflar yer alsın;

<script src="https://gist.github.com/polatengin/ad81243bd18a5a42c441cc8ddcbedd1f.js?file=DataModel.cs"></script>

Eğer <code>Customer</code> sınıfından bir değişkenin kopyasını çıkartmak istersek, aynı tipte yeni bir değişken oluşturup özelliklerin değerlerini atayabiliriz;

<script src="https://gist.github.com/polatengin/ad81243bd18a5a42c441cc8ddcbedd1f.js?file=DataModel-Copy1.cs"></script>

Bir sınıfın çok fazla özelliği olduğu durumda bu yol pek verimli olmayacaktır. Sınıfa eklenecek yeni özellikler (*PhoneNumber*, *Status*, vs) için kopyalama yaptığımız her yerde güncelleme yapmamız da gerekecek.

**Shallow Copy** ile bu sorunu şöyle aşabiliyoruz;

<script src="https://gist.github.com/polatengin/ad81243bd18a5a42c441cc8ddcbedd1f.js?file=DataModelWithShallowCopy.cs"></script>

Gördüğünüz gibi <code>Customer</code> sınıfına <code>ShallowCopy()</code> isimli bir method ekledik ve içerisinde <code>this.MemberwiseClon();</code> methodunu çağırdık, <code>Customer</code> sınıfına dönüştürüp geri döndürdük.

Kullanımı;

<script src="https://gist.github.com/polatengin/ad81243bd18a5a42c441cc8ddcbedd1f.js?file=DataModel-Copy2.cs"></script>

Fakat bu senaryoda sadece **primitive** tiplerin (**string**, **int**, **bool**, vs) yeni değişkene kopyalanmasını sağlayabildik.

*Custom* tiplerin (*Address*, *ShoppingCart*, vs) yeni değişkende değerleri orjinal değişkendeki değerlerin referansları olacaktır.

*Yani, kopyaladığımız değişkende bir değişiklik yaparsak orjinal değişkendeki değerde değişir.*

<mark><em>Aslında değişmez, iki değerinde hafızadaki adresi aynı olacağı için (referans) birinde değişiklik yapınca diğeri de aynı hafıza alanından değişen değeri okuyacak</em></mark>

Elimizdeki değişkenin tamamen yepyeni bir kopyasını çıkartmak istiyorsak, **Deep Copy** yöntemlerini kullanmalıyız.

Örneğin;

<script src="https://gist.github.com/polatengin/ad81243bd18a5a42c441cc8ddcbedd1f.js?file=DataModelWithDeepCopy.cs"></script>

Kullanım örneği;

<script src="https://gist.github.com/polatengin/ad81243bd18a5a42c441cc8ddcbedd1f.js?file=DataModel-Copy3.cs"></script>

Bu durumda *newCustomer* değişkeni *customer* değişkeninin birebir kopyası olacak. Herhangi bir değeri değiştirilecek olursa *customer* değişkeni bundan etkinlenmeyecek.

Öncelikle <code>MemoryStream</code> kullanarak kopyalama için hafızada bir alan oluşturuyoruz, <code>BinaryFormatter</code> ile bu alana elimizdeki değişkeni *serilize* ediyoruz.

Son olarak aynı alanın başına gidip tekrar <code>Customer</code> sınıfına dönüştürüp geri döndürüyoruz.

Böylece istediğimiz değişkenlerin kopyalarını oluşturabiliriz.