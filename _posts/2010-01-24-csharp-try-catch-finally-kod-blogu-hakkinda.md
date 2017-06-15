---
layout: post
title: "C# Try-Catch-Finally Kod Bloğu Hakkında"
date: 2010-01-24 13:51
author: engin.polat
comments: true
category: [C#]
tags: [class, csharp, false, method, return, true, try-catch, try-catch-finally]
---
Geçen aylarda **BilgeAdam**'da bir öğrencimin sorduğu soru geldi aklıma. Soru aslında çok basit, fakat farkettim ki, internette bu konu ile ilgili pek kaynak yok. Bari kendim yazayım dedim. Soru şu;


Bir method'dan geriye true/false değer döndürmem lazım.

Method içerisine yazdığım kodları try-catch-finally blokları içerisine almam gerekiyor.

Eğer try içerisinde hata oluşmazsa, geriye true değer döndüreceğim. Hata oluşur ve kod catch bloğuna girerse false değer döndüreceğim.

Ama finally kod bloğunda yapmam gereken işler var. (Açık bağlantıları kapatmak, vs.)

Eğer try-catch içerisinde return ifadesini kullanırsam, finally bloğundaki kod çalışır mı?</pre>
Sorunun doğru cevabı için; <!--more-->

Evet, eğer **try-catch-finally** ifadesinde **try-catch** içerisinde **return** ile **method** sonlandırılırsa bile, **finally** bloğundaki kod çalıştırılır.

Hemen bir örnek ile açıklayayım;
<pre class="brush:csharp">public bool OrnekMethod
{
    try
    {
        /// Yapılacak işler
        /// Başarılı olursa;
        return true;
    }
    catch (Exception ex)
    {
        /// Hatayı kaydet, vs.
        return false;
    }
    finally
    {
        ///Açık kaynakların kapatılması, vs. işleri gerçekleştirilir
    }
}

Yukarıdaki örnek'te, **return** ifadesi ile method'dan çıkılmadan önce, **finally** bloğundaki işler gerçekleştirilecektir.

