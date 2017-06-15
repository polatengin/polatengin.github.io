---
layout: post
title: "Kalıtımı engellemek (sealed anahtar kelimesi)"
date: 2010-03-06 23:50
author: engin.polat
comments: true
category: [C#]
tags: [class, compile-time error, derleme zamanı hatası, inheritance, method, override, sealed, struct]
---
Yazdığınız bir sınıftan **kalıtım yoluyla** başka sınıflar üretilmesini **engellemek** istiyor olabilirsiniz.

Yapmanız gereken sınıfınızı *sealed* anahtar kelimesi ile "**mühürlemek**" olmalıdır. Böylece sınıfınızdan yeni sınıflar **türetilemeyecektir**.



sealed class AnaSinif
{
// Sınıf üyeleri
}</pre>

*AnaSinif* **class**'ımız *sealed* olduğu için, yeni sınıf türetilirken *base class* olamayacaktır;

<pre class="brush:csharp">class TuretilmisSinif : AnaSinif
{
// Derleme zamanında hata oluşur (compile-time error)
}</pre>

***Not :** struct'lar her zaman sealed ile mühürlenmiş gibi davranırlar. struct'lar kalıtım (inheritance) desteklemez*

Tüm sınıfın **kalıtım** yoluyla aktarılmasını engellemek yerine, tek bir method'un *override* edilmesini engellemek istiyor olabilirsiniz.

Bu durumda yapmanız gereken, sadece ilgili *method*'u *sealed* ile "**mühürlemek**" olmalıdır;

<pre class="brush:csharp">class AnaSinif
{
    public virtual void Goster()
    {
    }
}

class TuretilmisSinif : AnaSinif
{
// Bu kodda problem yok
// AnaSinif'tan gelen Goster() method'unu override eder
// Aynı zamanda sealed ile "mühürler"
    public sealed override void Goster()
    {
    }
}

class TekrarTuretilmisSinif : TuretilmisSinif
{
// Bu kod derlenmez. Hata oluşur
// TuretilmisSinif class'ında Goster() method'u sealed anahtar kelimesi ile "mühürlenmişti"
    public override void Goster()
    {
    }
}


