---
layout: post
title: "C# Auto-Implemented Properties Özelliği"
date: 2010-01-20 09:31
author: engin.polat
comments: true
category: [C#]
tags: [auto implemented, class, code, compile, csharp, ildasm, private, property, public, readonly, source, writeonly]
---
Uygulamalarımızı geliştirirken birçok **class** veya **struct** yazmamız gerekir.

Bu **class** veya **struct**'ların hemen hepsinde özelliklere (**properties**) ihtiyaç duyarız.

Çünkü, local değişkenlerin **public** değil, **private** olmasını isteriz. Bu durumda yapmamız gereken **public** olmasını istediğimiz local değişkenlere birer tane özellik (**property**) yazmaktır.

Örnek **Personel Class**'ı aşağıdaki gibi olacaktır;



public class Personel
{
    private int PersonelId;
    private string AdSoyad;
}</pre>

<pre class="brush:csharp">public class Personel
{
    private int _PersonelId;
    private string _AdSoyad;

    public int PersonelId
    {
        get { return _PersonelId; }
        set { _PersonelId = value; }
    }

    public string AdSoyad
    {
        get { return _AdSoyad; }
        set { _AdSoyad = value; }
    }
}</pre>

Sadece okuma/yazma yapan iki özellik için ne faz kod yazdık, değil mi?

Eğer **get/set** blokları arasına özel iş yapan kod yazmamız gerekiyorsa, yukarıdaki gibi yapmaya devam etmeliyiz.

Fakat sadece okuma/yazma yapan özellikleri **C# 3.0**'dan itibaren daha kısa yazabiliyoruz;

<pre class="brush:csharp">public class Personel
{
    public int PersonelId { get; set; }

    public string AdSoyad { get; set; }
}</pre>

Gördüğünüz gibi local değişkenlerin oluşturulması ve yönetilmesi işini yapmakla uğraşmıyoruz.

Eğer local değişkenlerin nasıl oluşturulduğunu merak ediyorsanız, projenizi compile ettikten sonra, ortaya çıkan **exe/dll** dosyasını **ILDASM (Intermediate Language Disassembler)** tool'u ile açıp bakabilirsiniz.

*PersonelId* özelliği için **&lt;&gt;k__AutomaticallyGeneratedPropertyField0** isimli bir değişkenin oluşturulduğu ve tipininde *int* olduğunu göreceksiniz.

Otomatik oluşturulan değişken'in ismini herhangi bir kod parçasında kullanmaya çalışırsak, derleme (**compile**) zamanında yazım hatası (**syntax error**) alırız, yani local değişkenleri kullanamayız.

Eski stil kodlamada sadece okunabilir (**readonly**) veya sadece yazılabilir (**writeonly**) property tanımlayabiliyorduk. Bunu yeni stil kodlamada da yapabilir miyiz?

Cevap **Evet**, aşağıdaki kodu inceleyin;

<pre class="brush:csharp">public class Personel
{
    public int PersonelId { get; private set; }
    public string AdSoyad { private get; set; }
}


