---
layout: post
title: "C# 4.0 dynamic ve object farkı?"
date: 2010-12-19 09:45
author: engin.polat
comments: true
category: [C#]
tags: [boxing, compiler, derleyici, dynamic, exception, gettype, int, message, method, object, property, runtimebinder, RuntimeBinderException, string, system.int32, system.object, unboxing]
---
**C# 4.0** ile hayatımıza giren dynamic ve **C# 1.0**'dan beri varolan object arasında ne fark var?

Önce **eski dostumuz** object ile başlayalım;

[object](http://msdn.microsoft.com/library/system.object) anahtar kelimesi aslında [System.Object](http://msdn.microsoft.com/library/system.object) sınıfının bir kısaltmasından başka birşey değildir (ki kendisi **C# sınıf hiyerarşisi**nin en temelinde yer almaktadır)

*Not : Birçoğumuzun bildiği gibi, aslında herşey [object](http://msdn.microsoft.com/library/system.object) sınıfından **türememektedir**. bknz: [Eric Lippert'in MSDN Blog yazısı](http://blogs.msdn.com/b/ericlippert/archive/2009/08/06/not-everything-derives-from-object.aspx)*

[object](http://msdn.microsoft.com/library/system.object) tipinde bir değişkene, hemen hemen istediğimiz her değeri **atayabiliriz**. Birkaç örnek;



object Rakam = 10;
Console.WriteLine(Rakam.GetType());
/// System.Int32

Rakam = Rakam + 10;
/// Derleme zamanı hatası. Çünkü derleme anında Rakam değişkeni System.Object tipinde

Rakam = (int)Rakam + 10;
/// Hatasız atama için, unboxing yapmamız gerekiyor</pre>

Örnekte gördüğümüz gibi, *Rakam* değişkeninde **rakamsal** bir değer tutuyor olmamıza rağmen, derleyici, değişken üzerinde matematiksel işlem yapmamıza **izin vermedi**.

Değişken'in değerine erişebilmek için [unboxing](http://msdn.microsoft.com/library/yz2be5wk.aspx) yapmak zorunda kaldık ve **tip güvenliği** olmadığı için **çalışma zamanı hataları** oluşturabilecek, zayıf bir **kod** ortaya çıktı.

Bir de [C# 4.0](http://www.enginpolat.com/?s=c%23+4.0) ile birlikte gelen [dynamic](http://msdn.microsoft.com/library/dd264741.aspx) inceleyelim;

<pre class="brush:csharp">dynamic Rakam = 10;
Console.WriteLine(Rakam.GetType());
/// object için aldığımız sonucun aynısını alıyoruz
/// System.Int32

Rakam = Rakam + 10;
/// Derleme zamanı hatası almayız, çünkü derleyici tipi çözümlemek için uğraşmaz.</pre>

Bu, [object](http://msdn.microsoft.com/library/system.object) ile [dynamic](http://msdn.microsoft.com/library/dd264741.aspx) arasındaki en temel farktır. **dynamic** ile, **derleyici**'ye (**compiler**), nesnenin tipinin sadece **çalışma zamanında** bilinebileceğini söylemiş oluyoruz.

*Sonuçta aslında derleme zamanı için daha az kod yazıyoruz.

Fakat bu dynamic anahtar kelimesini daha az tehlikeli veya daha tehlikeli duruma getirmez.*

Genelde bir sonraki soru; *"dynamic ile herhangi bir method'a uygun olmayan tipte parametre gönderip, hata oluşmasını sağlayabilir miyim?"* oluyor.

Basit bir örnek ile bu soruyu test edelim;

<pre class="brush:csharp">public static void AdSoyadYaz(string Ad, string Soyad)
{
    Console.WriteLine(Ad + " " + Soyad);
}</pre>

Bu method'umuzu dynamic tipindeki bir değişken ile çağıralım;

<pre class="brush:csharp">dynamic Ad = 10;
dynamic Soyad = 20;

/// Çalışma zamanı hatası almanız lazım.
AdSoyadYaz(Ad, Soyad);</pre>

Yukarıdaki kod ile, çalışma zamanında [RuntimeBinderException](http://msdn.microsoft.com/library/microsoft.csharp.runtimebinder.runtimebinderexception) tipinde bir hata almalısınız. Hatanın [Message](http://msdn.microsoft.com/library/system.exception.message) property'sinde; "*The best overloaded method match for 'AdSoyadYaz(string, string)' has some invalid arguments*" yazıyor olmalı.

<pre class="brush:csharp">dynamic Ad = "Engin";
dynamic Soyad = "Polat";

AdSoyadYaz(Ad, Soyad);</pre>

Gördüğünüz gibi, method'un çalıştırılması için parametre tipleri **çalışma zamanı**nda kontrol edilir, ve uygunsuz ise, [RuntimeBinderException](http://msdn.microsoft.com/library/microsoft.csharp.runtimebinder.runtimebinderexception) tipinde bir hata fırlatılır.

**object** anahtar kelimesinde ise, bu süreç **derleme zamanı**nda kontrol edilir.

<pre class="brush:csharp">object Ad = 10;
object Soyad = 20;

/// Derleme zamanı hatası almanız lazım.
AdSoyadYaz(Ad, Soyad);

object Ad = "Engin";
object Soyad = "Polat";

AdSoyadYaz((string)Ad, (string)Soyad);


