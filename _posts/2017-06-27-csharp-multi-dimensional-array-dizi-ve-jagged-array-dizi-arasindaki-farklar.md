---
layout: post
title: "C# Multi-Dimensional Array (Dizi) ve Jagged Array (Dizi) arasındaki farklar"
date: 2017-06-27 12:15
author: engin.polat
comments: true
category: [C#]
tags: [csharp, array, jagged, multidimensional, new, int, getlength, method, class, index, rank, length, static, il, clr]
---
Birkaç hafta önce *email* üzerinden aldığım bir soruyu cevaplamaya çalışacağım.

*Soru şu;*

<mark><em>C#</em> <strong>Multi-Dimensional Array</strong> ve <strong>Jagged Array</strong> arasındaki farklar nedir?</mark>

Uzun yıllardır yazılım geliştirme yapıyorum ve deneyimlerime göre **Multi-Dimensional Array** (*Dizi*), **Jagged Array** (*Dizi*)'ye göre birçok avantaja sahip.

Öncelikle, **Multi-Dimensional Array** daha doğrusal ve basit bir hafıza yerleşimine (*memory map*) sahip.

**Jagged Array** ise, aslında *dizilerin dizisi* gibi bir modelde olduğu için birçok hafıza içi yönlendirmelere neden oluyor.

*Örneğin,*

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=multi-0.cs"></script>

kodu işletildiğinde, **CLR**, *(i x j)* kadar (yani *10 x 30 = 300*) öğeli bir dizi oluşturur.

*multi* değişkeninin <code>Length</code> özelliğine bakacak olursak, gerçekten *300* değerini görebiliriz.

Gene *multi* değişkeninin <code>Rank</code> özelliği, *2* değerine sahip olacak, çünkü *multi* değişkeni *2 boyutlu* bir dizi. *0* ve *1* boyutlarında eşit uzunlukta değerler var.

Hatta <code>GetLength()</code> methodunda *0* veya *1* değerini verecek olursak, *i* (veya *j*) uzunluklarını alabiliriz.

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=multi-1.cs"></script>

Doğal olarak, *multi* değişkeninin herhangi bir öğesine erişmek, { *1.rakam* x *i* + *2.rakam* } indexli elemana erişmek demek;

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=multi-2.cs"></script>

**Multi-Dimensional Array** yapılarında veriyi hafızada tutmak, erişmek ve güncellemek, nispeten kolay.

**Jagged Array** ise, doğrusal bir hafıza haritasına sahip olmadığı için, **Multi-Dimensional Array** yapılarının sahip olduğu birçok avantaja sahip değildir.

*Örneğin,*

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=jagged-0.cs"></script>

*jagged* değişkeninin <code>Rank</code> özelliği her zaman *1* değerine sahiptir.

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=jagged-1.cs"></script>

Bir değere erişmek için **Jagged Array** değişkenler, şu şekilde davranır;

<ul>
<li>Önce, <em>10</em> öğeli dizinin <em>3</em> indexli elemanını bul</li>
<li>Sonra, <em>30</em> öğeli bir dizi olan bu elemanın <em>6</em> indexli elemanını bul</li>
</ul>

Yani, bir elemana ulaşabilmek için, her zaman *2* adımlı yol izlemek gerekiyor.

Ayrıca, **Jagged Array** yapılarında iki ardışık satırın aynı sayıda öğeli dizi olması zorunlu değil.

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=jagged-2.cs"></script>

Yani yukarıdaki karşılaştırma <code>true</code> değer üretmeyebilir.

Benzetme yapmak gerekirse, **Multi-Dimensional Array**, bir tablo yapısına benzer, sütun sayısı ve satır sayısı tanımlanır, hücrelere erişilir.

*Örneğin;*

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=multi-3.cs"></script>

Bu kodu, *2 x 2* tabloya benzetebiliriz;

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=multi-4.cs"></script>

Halbuki **Jagged Array** yapılarında sütun sayıları, her satırda farklı olabilir.

*Örneğin;*

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=jagged-3.cs"></script>

Bu kod ise, aşağıdaki yapıyı oluşturur;

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=jagged-4.cs"></script>

**Performans**

Fakat **CLR**'ın gerçekleştirdiği çeşitli performans optimizasyonlarından dolayı, **Jagged Array** yapıları, **Multi-Dimensional Array** yapılarından daha performanslı çalışıyor.

*Örneğin,*

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=performance-0.cs"></script>

Bu methodlardan üretilen **IL** koduna bakacak olursak;

<script src="https://gist.github.com/polatengin/59ea9b882738262ef40e6cdd7119902d.js?file=performance-1.cs"></script>

Gördüğünüz gibi, **Multi-Dimensional Array** için üretilen **IL** kodu, **Jagged Array** için üretilen **IL** kodundan daha karmaşık ve doğal olarak çalıştırılması da daha uzun sürüyor.

<small>*Not : Bu makaleyi geliştirirken <a href="https://stackoverflow.com/questions/597720/what-are-the-differences-between-a-multidimensional-array-and-an-array-of-arrays" target="_blank" rel="noopener">Stackoverflow</a>'dan çok faydalandım*</small>
