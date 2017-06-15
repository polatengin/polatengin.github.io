---
layout: post
title: "LINQ ile Dosya Sisteminde Sorgulama Yapmak"
date: 2010-01-30 22:27
author: engin.polat
comments: true
category: [C#]
tags: [csharp, directoryinfo, döngü, extension, fileinfo, foreach, getdirectories, getfiles, linq, method, recursive, return, yield]
---
Yazdığımız uygulamalarda dosya sisteminde arama yapmaya ihtiyaç duyabiliriz. Bu durumda genelde döngüler yazarız. Peki **LINQ** kullanamaz mıyız? Üzerinde biraz çalıştıktan ve araştırma yaptıktan sonra, aşağıdaki kodu elde ettim;


private IEnumerable&lt;FileInfo&gt; DosyaListesi(DirectoryInfo KokDizin, string Uzanti, string DosyaAdiParcasi)
{
    foreach (var f in KokDizin.GetFiles().Where(Dosya =&gt; Dosya.Extension == Uzanti &amp;&amp; Dosya.Name.Contains(DosyaAdiParcasi)))
        yield return f;

    foreach (DirectoryInfo d in KokDizin.GetDirectories())
        foreach (var f in DosyaListesi(d, Uzanti, DosyaAdiParcasi))
            yield return f;
}

Gördüğünüz gibi fonksiyon, parametre olarak aramaya başlanacak kök dizini, arama yapılacak dosyanın uzantısını ve dosya isminde bir parçayı alıyor, geriye *FileInfo* sınıfında liste döndürüyor.

İlk *foreach* döngüsünde kök dizinde parametre ile alınmış kriterlere göre arama yapılıyor ve *yield* anahtar kelimesi ile, bulunan her sonuç dönüş kümesine ekleniyor.

İkinci (ve üçüncü) *foreach* döngülerinde ise, **recursive** (**kendini tekrarlamalı**) olarak *DosyaListesi()* fonksiyonu kendi kendisini çağırarak, arama işlemini alt klasörlerde de yapıyor.

