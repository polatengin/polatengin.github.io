---
layout: post
title: "C# switch ifadelerinde explicit fall through"
date: 2010-01-11 13:54
author: engin.polat
comments: true
category: [C#]
tags: [break, case, csharp, explicit fall through, goto, switch]
---
**Explicit Fall Through** : Uygulamanın ilgili değişkenin değerine göre, **switch** ifadesindeki **case**'lerden uygun olana dallanması ve *break* görene kadar, koddan aşağı doğru, diğer **case**'lere girerek ilerlemesidir.

***C# dilinde switch ifadelerinde explicit fall through desteklenmez***.

Bu yüzden aşağıdaki kod, derleme zamanında hata verecektir ve derlenmeyecektir.



switch(değişken)
{
    case 0:
        /// 0 durumda çalışacak kod
    case 1:
        /// hem 0, hem de 1 durumunda çalışacak kod
    case 2:
        /// hem 0, hem 1, hem de 2 durumunda çalışacak kod
        break;
}</pre>

Yukarıdaki kod parçasını C#'ta çalıştırmak istiyorsak, aşağıdaki gibi yazabiliriz;

<pre class="brush:csharp">switch(değişken)
{
    case 0:
        /// 0 durumda çalışacak kod
        goto case 1;
    case 1:
        /// hem 0, hem de 1 durumunda çalışacak kod
        goto case 2;
    case 2:
        /// hem 0, hem 1, hem de 2 durumunda çalışacak kod
        break;
}


Bu sayede, case'ler arasındaki akış açıkça belirtilmiş olur.

