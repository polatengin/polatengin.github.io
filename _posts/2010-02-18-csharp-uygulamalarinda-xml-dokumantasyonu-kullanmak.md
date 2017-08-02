---
layout: post
title: "C# Uygulamalarında XML Dokümantasyonu Kullanmak"
date: 2010-02-18 13:39
author: engin.polat
comments: true
category: [C#]
tags: [comment, compiler, derleyici, documentation, field, member, type, xml]
---
<a title="enginpolat.com: C# ile Uygulama Geliştirirken Yorum Satırlarını Kullanmak" href="/csharp-ile-uygulama-gelistirirken-yorum-satirlarini-kullanmak/" target="_self">C# ile Uygulama Geliştirirken Yorum Satırlarını Kullanmak</a> yazımda başladığım konuya **XML Dokümantasyonunu** eklemem gerekir.

**Geleneksel C-tarzı** yorum satırlarına ilave olarak **C#** geliştirilen kodların **Xml Dokümantasyonunu** otomatik olarak çıkartabilmek için, güçlü yorum operatörlerine sahiptir.

Bu yorum operatörleri (**///**) ile başlayan satırlara yazılır.

Aşağıdaki listedeki operatörler, **derleyici** (**compiler**) tarafından tanınır ve desteklenir;

**&lt;c&gt;** Tek satırı C# kodu olarak işaretler. Örneğin: &lt;c&gt;string AdSoyad = "Engin Polat";&lt;/c&gt;
**&lt;code&gt;** Birden çok satırı C# kodu olarak işaretler.
**&lt;example&gt;** İlgili satırları "örnek kod" olarak işaretler.
**&lt;exception&gt;** Exception sınıfını dokümante eder. (Derleyici(compiler) tarafından kontrol edilir)
**&lt;include&gt;** Başka bir dokümantasyon dosyasından yorum ekler. (Derleyici(compiler) tarafından kontrol edilir)
**&lt;list&gt;** Dokümantasyona liste ekler.
**&lt;param&gt;** Method parametresini dokümante eder. (Derleyici(compiler) tarafından kontrol edilir)
**&lt;paramref&gt;** Kelimenin parametre olduğunu işaretler. (Derleyici(compiler) tarafından kontrol edilir)
**&lt;permission&gt;** Öğeye erişim belirleyicisini dokümante eder. (Derleyici(compiler) tarafından kontrol edilir)
**&lt;remarks&gt;** Öğeye açıklama ekler.
**&lt;returns&gt;** Method'un dönüş tipini dokümante eder.
**&lt;see&gt;** Başka bir parametreye çapraz-referans ekler. (Derleyici(compiler) tarafından kontrol edilir)
**&lt;seealso&gt;** Açıklamaya "buna da bakın" parçası ekler. (Derleyici(compiler) tarafından kontrol edilir)
**&lt;summary&gt;** Öğenin kısa açıklamasını dokümante eder.
**&lt;value&gt;** Özelliği (property) tanımlar.

Örnek olması açısından, aşağıdaki *Matematik* sınıfını dokümantasyonu ile birlikte yazıyorum;



//Matematik.cs
namespace Engin.Polat
{
    ///&lt;summary&gt;
    ///  Engin.Polat.Matematik sınıfı.
    ///  İki rakamın toplanmasına yaran
    ///  Topla method'unu içerir.
    ///&lt;/summary&gt;
    public class Matematik
    {
        ///&lt;summary&gt;
        ///  İki rakamın toplanmasını sağlar.
        ///&lt;/summary&gt;
        ///&lt;example&gt;Örnek olarak: Topla(3, 5);&lt;/example&gt;
        ///&lt;returns&gt;Toplama işleminin sonucu (int)&lt;/returns&gt;
        ///&lt;param name="x"&gt;Toplama işleminin ilk rakamı&lt;/param&gt;
        ///&lt;param name="y"&gt;Toplama işleminin ikinci rakamı&lt;/param&gt;
        public int Topla(int x, int y)
        {
            return x + y;
        }
    }
}</pre>

Derleme sonucu oluşan **Xml dokümanı** aşağıdaki gibidir;

<pre class="brush:xml">&lt;?xml version="1.0"?&gt;
&lt;doc&gt;
    &lt;assembly&gt;
        &lt;name&gt;ConsoleApplication4&lt;/name&gt;
    &lt;/assembly&gt;
    &lt;members&gt;
        &lt;member name="T:Engin.Polat.Matematik"&gt;
            &lt;summary&gt;
                Engin.Polat.Matematik sınıfı.
                İki rakamın toplanmasına yaran
                Topla method'unu içerir.
            &lt;/summary&gt;
        &lt;/member&gt;
        &lt;member name="M:Engin.Polat.Matematik.Topla(System.Int32,System.Int32)"&gt;
            &lt;summary&gt;
                İki rakamın toplanmasını sağlar.
            &lt;/summary&gt;
            &lt;example&gt;Örnek olarak: Topla(3, 5);&lt;/example&gt;
            &lt;returns&gt;Toplama işleminin sonucu (int)&lt;/returns&gt;
            &lt;param name="z"&gt;Toplama işleminin ilk rakamı&lt;/param&gt;
            &lt;param name="y"&gt;Toplama işleminin ikinci rakamı&lt;/param&gt;
        &lt;/member&gt;
    &lt;/members&gt;
&lt;/doc&gt;


Dikkat ederseniz, derleyici (compiler) bizim için  ve  elementlerini eklemiştir. Her  element'i name özelliğine sahiptir ve değer olarak öğenin tam adını içerir.

Değerin ilk harfi özel bir anlam taşır;

**T :** *Type*
**F :** *Field*
**M :** *Member*

