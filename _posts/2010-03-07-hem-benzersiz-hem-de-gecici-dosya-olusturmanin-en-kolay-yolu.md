---
layout: post
title: "Hem benzersiz hem de geçici dosya oluşturmanın en kolay yolu"
date: 2010-03-07 20:12
author: engin.polat
comments: true
category: [C#]
tags: [create, file, File.OpenText, generate, Path.GetRandomFileName(), Path.GetTempFileName(), random, rastgele, StreamWriter, string, WriteLine]
---
Geliştirdiğiniz bir uygulamada, **geçici bir dosyaya** ihtiyacınız olduğunu düşünelim. Ama daha önce oluşturulmuş bir dosyanın ismini vermediğinizden **emin olmak** istiyorsunuz.


*   Kullanıcının geçici dosyaları hangi **dizinde** tuttuğunu bulmak
*   **Rastgele** bir dosya ismi üretmek, eğer bu dosya isminde bir dosya varsa, yeni bir dosya ismi bulana kadar rastgele yeni dosya ismi üretmek
*   Ürettiğiniz rastgele isme sahip yeni bir dosya **oluşturmak**
adımlarını gerçekleştirmek yerine, *Path.GetTempFileName()* method'unu kullanabilirsiniz.



string GeciciDosya = Path.GetTempFileName(); /// GeciciDosya değişkeni kullanıcının Temp dizininde 0-byte boyutlu bir dosyanın tam dosya yolunu içerir.

using (StreamWriter sw = File.OpenText(GeciciDosya))
{
    sw.WriteLine("Geçici Dosyaya yazılacak bilginin ilk satırı");
}</pre>

Benim kullandığım bilgisayarda, *Path.GetTempFileName()* methodu geriye "**C:\Documents and Settings\EnginPolat\Local Settings\Temp\tmp3A.tmp**" *string* değeri döndürdü.

Eğer rastgele dosyanın gerçekten oluşturulmasını değil, sadece dosya isminin üretilmesini istiyorsanız; *Path.GetRandomFileName()* methodunu kullanabilirsiniz;

<pre class="brush:csharp">string DosyaAdi = Path.GetRandomFileName(); /// DosyaAdi değişkeni sadece rastgele bir dosya ismini içerir.


Benim bilgisayarımda, *Path.GetRandomFileName()* methodu geriye "**z4a2sa4a.49e**" *string* değeri döndürdü.

