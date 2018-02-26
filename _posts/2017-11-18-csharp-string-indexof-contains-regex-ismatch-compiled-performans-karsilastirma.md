---
layout: post
title: "C# String.IndexOf, String.Contains, Regex.IsMatch(), Regex.IsMatch(Compiled) performans karşılaştırma"
date: 2017-11-18 14:15
author: engin.polat
comments: true
category: [C#]
tags: [string, indexof, contains, regex, ismatch, compiled, performans, stopwatch, garbage collector, gc, gccollectionmode, collect, waitforfullgccomplete, restart, elapsedmilliseconds, for, loop, regexoptions, action, nameof, stringcomparison, ordinal]
---
<div class="alert alert-success" role="alert" style="margin: 10px 0px; display: block;">
Bu makalenin kodlarına <strong>Github</strong> üzerinde <a href="https://github.com/polatengin" class="alert-link" target="_blank">polatengin</a> hesabımda yer alan <a href="https://github.com/polatengin/blog-codes/tree/master/string-performance-test-contains-indexof-regex-2017" class="alert-link" target="_blank">CSharp String Performance Comparison</a> aracılığıyla erişebilirsiniz.
</div>

Ne tür bir uygulama geliştiriyor olursak olalım (*Web*, *Mobile*, *Cloud*, *Game*, *Desktop*, etc) <a href="https://msdn.microsoft.com/en-us/library/system.string" target="_blank">string</a> tipi üzerinde karşılaştırma mutlaka yaparız.

Bu makalede, <a href="https://msdn.microsoft.com/en-us/library/system.string" target="_blank">string</a> değişkenler üzerinde yapabileceğimiz *karşılaştırma* methodlarını **performans** odaklı olarak inceleyeceğiz.

Ben aşağıdaki 4 yöntemi karşılaştırmaya karar verdim, eğer sizin aklınıza başka karşılaştırma yöntemleri gelirse, aşağıdaki **Yorumlar** alanına veya <a href="https://github.com/polatengin/polatengin.github.io/issues/new" target="_blank">Issues</a> altına bir yorum bırakabilirsiniz ;)

<ul>
<li><em>String.IndexOf()</em></li>
<li><em>String.Contains()</em></li>
<li><em>Regex.IsMatch()</em></li>
<li><em>Regex.IsMatch(Compiled)</em></li>
</ul>

Öncelikle test ortamımızı oluşturalım, bunun için *TestScenarios* ve *Program* isimli birer **class** oluşturuyoruz.

*Program.cs* dosyasında yeralan *Program* **class**'ında sadece *TestScenarios* **class**'ından yeni bir **instance** oluşturup, *InvokeTest()* methodunu çağırıyoruz;

<script src="https://gist.github.com/polatengin/20456c4700311bd30f3d19c865a85173.js?file=Program.cs"></script>

*TestScenarios* **class**'ı içerisinde, üzerinde testleri geçekleştireceğimiz, <a href="https://msdn.microsoft.com/en-us/library/system.string" target="_blank">string</a> bir değişkene ihtiyacımız var;

<script src="https://gist.github.com/polatengin/20456c4700311bd30f3d19c865a85173.js?file=TestString.cs"></script>

Ben, kendi bilgisayarımda, karşılaştırma operasyonunu *10 Milyon* (*10_000_000*) defa yapıp, toplam harcanan süreyi ölçtüm;

<script src="https://gist.github.com/polatengin/20456c4700311bd30f3d19c865a85173.js?file=TestIterationCount.cs"></script>

Karşılaştırma operasyonunu gerçekleştirip, sonucu ekrana yazdırabilmek için *TestAndPrint()* isimli bir method geliştirdim;

<script src="https://gist.github.com/polatengin/20456c4700311bd30f3d19c865a85173.js?file=TestAndPrint.cs"></script>

Bu method içerisinde, öncelikle, <a href="https://msdn.microsoft.com/en-us/library/system.diagnostics.stopwatch" target="_blank">Stopwatch</a> tipinde bir değişken oluşturuyorum.

<a href="https://docs.microsoft.com/en-us/dotnet/standard/garbage-collection/" target="_blank">GarbageCollector</a> tarafından testin etkilenmemesi için, <a href="https://msdn.microsoft.com/en-us/library/system.gc" target="_blank">GC</a> sınıfının <a href="https://msdn.microsoft.com/en-us/library/system.gc.collect" target="_blank">Collect()</a> methodunu **Generation 2** için çalıştırıyorum.

Sonra da, <a href="https://msdn.microsoft.com/en-us/library/system.gc.waitforfullgccomplete" target="_blank">WaitForFullGCComplete()</a> methodu ile, eğer yürüyen bir <a href="https://msdn.microsoft.com/en-us/library/system.gc.collect" target="_blank">Collect()</a> operasyonu varsa, tamamlanmasını bekliyorum.

<a href="https://msdn.microsoft.com/en-us/library/system.diagnostics.stopwatch" target="_blank">Stopwatch</a> değişkenini <a href="https://msdn.microsoft.com/en-us/library/system.diagnostics.stopwatch.restart" target="_blank">Restart()</a> edip, sıfırlıyor, <a href="https://msdn.microsoft.com/en-us/library/system.action" target="_blank">Action</a> tipinde aldığım *Test()* parametresini çağırıyor, geçen toplam süreyi *milisaniye* cinsinden ekrana yazıyorum.

Şimdi, tek tek, *String.IndexOf()*, *String.Contains()*, *Regex.IsMatch()* ve *Regex.IsMatch(Compiled)* test senaryolarını yazalım;

*String.IndexOf()* testi için;

<script src="https://gist.github.com/polatengin/20456c4700311bd30f3d19c865a85173.js?file=StringIndexOf.cs"></script>

*String.Contains()* testi için;

<script src="https://gist.github.com/polatengin/20456c4700311bd30f3d19c865a85173.js?file=StringContains.cs"></script>

*Regex.IsMatch()* testi için;

<script src="https://gist.github.com/polatengin/20456c4700311bd30f3d19c865a85173.js?file=RegexIsMatch.cs"></script>

*Regex.IsMatch(Compiled)* testi için;

<script src="https://gist.github.com/polatengin/20456c4700311bd30f3d19c865a85173.js?file=RegexIsMatchCompiled.cs"></script>

Şimdi, *TestScenarios* **class** içerisine *InvokeTest()* methodu yazıyoruz;

<script src="https://gist.github.com/polatengin/20456c4700311bd30f3d19c865a85173.js?file=InvokeTests.cs"></script>

Her testi *2* kere çalıştırıyoruz, biri karşılaştırma sonucu *başarılı olacak* şekilde, biri *başarılı olmayacak* şekilde.

Gelelim, en önemli kısma, karşılaştırma sonuçları :)

<img class="lazy img-responsive" data-src="/assets/uploads/2017/11/string-performance-comparison.png" width="962" height="429" />

Sonuçlara baktığım zaman aşağıdaki noktalar dikkatimi çekti;

<ul>
<li>Tüm testlerde arama sonucu bulunmadığı zaman, arama sonucu bulunduğu zamana göre daha iyi performans göstermiş</li>
<li><em>Regex</em> karşılaştırmaları en yavaş olanlar</li>
<li><em>String.Contains()</em> karşılaştırması, <em>String.IndexOf()</em> karşılaştırmasından daha iyi performans göstermiş</li>
</ul>

**Microsoft**'un **Github**'da yayınladığı <a href="https://github.com/Microsoft/referencesource" target="_blank">ReferenceSource</a> repository'sinde <a href="https://github.com/Microsoft/referencesource/blob/master/mscorlib/system/string.cs" target="_blank">String</a> classının *Contains()* methodu aşağıdaki şekilde yazılmış;

<script src="https://gist.github.com/polatengin/20456c4700311bd30f3d19c865a85173.js?file=String.cs"></script>

Aslında *Contains()* methodu, içeride *IndexOf()* methodunu çağırıyor.

Peki, neden bizim testlerimizde *Contains()* ve *IndexOf()* farklı sonuçlar üretti?

Çünkü, *Contains()* methodu içinden *IndexOf()* methodu, <code>StringComparison.Ordinal</code> parametresi ile çağırılıyor.

Eğer kendi uygulamalarımızda *IndexOf()* methodunu çağıracaksak, <code>StringComparison.Ordinal</code> parametresini kullanmamız performans artışı sağlayacaktır.

Daha kolayı, *Contains()* methodunu kullanmak :)