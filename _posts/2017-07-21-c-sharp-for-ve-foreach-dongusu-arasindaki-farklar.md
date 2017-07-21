---
layout: post
title: "C# for ve foreach döngüsü arasındaki farklar"
date: 2017-07-21 22:30
author: engin.polat
comments: true
category: [C#]
tags: [for, foreach, performance, loop, variable, iteration, perfomans]
---
Bu makalede <strong>C#</strong> ile <code>for</code> ve <code>foreach</code> döngüleri arasındaki farkları inceleyeceğiz.

Böylece <a href="https://github.com/polatengin/polatengin.github.io/issues/1" target="_blank">#1</a> numaralı istek makaleyi yazmış olacağım :)

<em>Not : <a href="https://github.com/polatengin/polatengin.github.io/issues" target="_blank">Issues</a> sayfasında varolan makale isteklerini görebileceğinizi, hatta <a href="https://github.com/polatengin/polatengin.github.io/issues/new" target="_blank">yeni makale isteğinde</a> bulunabileceğinizi biliyor muydunuz?</em>

Öncelikle **for** ve **foreach** döngülerini **C#** programlama dilinde nasıl kullanıyoruz, nasıl yazıyoruz, hemen hatırlayalım;

<mark><strong>for</strong> döngüsünün özelliği, bir başlangıç noktasından bir bitiş noktasına doğru, istediğimiz adım aralığında ilerleyebilmesidir.</mark>

*Örneğin, Nisan ayının günlerini ekranda göstermek istersek aşağıdaki gibi 0..30 arasında sırasıyla ilerleyen bir döngü oluşturabiliriz;*

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=for-loop-1.cs"></script>

*Eğer olimpiyatların hangi tarihlerde gerçekleştirildiğini ekranda göstermemiz gerekiyorsa, aşağıdaki örnekte olduğu gibi, dizi değişkeninin başlangıç değerini ilk olimpiyatın yapıldığı 1896 yılına ayarlar, döngünün bulunduğumuz yıla kadar (bulunduğumuz yıl dahil) sürmesini sağlar, her 4. yılı elde edebiliriz;*

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=for-loop-2.cs"></script>

Hatta, istersek <code>for</code> döngüsünün tersten çalışmasını bile sağlayabiliriz;

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=for-loop-3.cs"></script>

<mark><strong>foreach</strong> döngüsünün özelliği, bir listenin üzerinde adım adım ilerleyerek tüm öğelerini bize <em>sadece-okunur</em> olarak sağlamasıdır.</mark>

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=foreach-loop.cs"></script>

**foreach** döngüsünde unutulmaması gereken önemli nokta, döngü değişkeninin **sadece-okunur** (*read-only*) olmasıdır. Aşağıdaki örnekte olduğu gibi değişkenin değeri üzerinde **değişiklik yapamayız**;

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=foreach-variable-readonly.cs"></script>

**for** döngüleri *genellikle* bir dizinin öğeleri üzerinde gezinmek için kullanılır. Örneğin;

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=for-loop-to-array-1.cs"></script>

Bu kod örneğinde, şöyle bir problem var; döngünün ilk adımı gerçekleştikten sonra önce <code>iLoop</code> isimli döngü değişkeninin değeri 1 arttırılacak. Sonra <code>iLoop</code> değişkeninin değeri döngünün sonuna erişilip-erişilmediği belirlensin diye dizideki eleman adedi ile karşılaştırılacak.

Bir sonraki döngü adımının sonunda gene <code>iLoop</code> değişkenin değeri 1 arttırılacak ve döngünün sonuna gelinip-gelinmediğinin belirlenmesi için dizideki eleman adedi ile karşılaştırılacak.

Hatta <mark>dizideki eleman adedi ile karşılaştırma her döngü adımında tekrar tekrar yapılacak.</mark>

Çok önemli gibi gözükmese de, <mark>dizideki eleman adedini döngü öncesi bir değişkene alıp, döngü içerisinde hep bu değişken ile kontrol etmek, performansa olumlu katkı sağlayacaktır.</mark>

*Not: döngünün başından sonuna kadar dizideki eleman adedinin değişmediğini varsayıyorum*

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=for-loop-to-array-2.cs"></script>

Hatta, madem <code>for</code> döngüsünün ilk parçasında döngü değişkenini tanımlıyoruz, aynı anda ikinci bir değişken daha tanımlayamaz mıyız?

*Tanımlayabiliriz* :)

Aşağıdaki kod örneğinden de görebileceğiniz gibi, aynı anda iki değişken tanımlayıp, biri ile döngüyü ilerletmek, diğeri ile dizideki eleman adedini bir defa hesaplatmak mümkün;

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=for-loop-to-array-3.cs"></script>

Performans karşılaştırması için aşağıdaki küçük uygulamayı geliştirdim;

<script src="https://gist.github.com/polatengin/d197a257501e1d59085b2bdb25d255ba.js?file=Test-Program.cs"></script>

Sonuçlar, *bilgisayarın konfigürasyonuna*, *o an çalışmakta olan uygulamalara*, **debug**-**release** mode'lara, **x86**-**x64** mimariler arasındaki farklara, *.Net versiyonuna*, vs göre o kadar fazla farklılık gösterebilir ki, performans konusuna çok vakit ayırmak istemedim.

Eğer yorumunuz veya sorunuz varsa, lütfen aşağıya yazınız. Sizin sistemlerinizde üretilecek sonuçları da merak ediyorum.

Benim kullanmakta olduğum notebook'ta sonuçlar aşağıdaki gibi;

**CPU:** *i7 7700HQ x64*<br />
**OS:** *Windows 10 (16241) 64bit*<br />
**RAM:** *32GB 2666MHz*<br />

<img class="lazy img-responsive" data-src="/assets/uploads/2017/07/for-foreach.png" alt="for ve foreach döngüleri performans karşılaştırması" />

Benim ortamımda <code>foreach</code> döngüsü, <code>for</code> döngüsünden daha performanslı çıktı. *80.000* elemanlı bir dizide aradaki fark *birkaç nanosaniye* civarında olsa da, *800.000.000* elemanlı bir dizide fark yaklaşık *700ms* civarına çıkıyor.

*Çok elemanlı olmasa da sürekli üzerinde döndüğümüz diziler varsa, her seferinde kazanacağımız nanosaniyeler-milisaniyeler, toplamda büyük rakamlara ulaşabilir* ;)