---
layout: post
title: "C# string sınıfı ve özellikleri"
date: 2010-09-03 09:00
author: engin.polat
comments: true
category: [C#]
tags: [array, compare, compareoptions, constructor, culture, globalization, ignorecase, indexof, isnullorempty, method, property, reverse, string, string.empty]
---
.Net <a href="http://msdn.microsoft.com/library/system.string" target="_blank">string</a> sınıfı uygulamalarımızda sıklıkla kullandığımız sınıflardan biridir.

**.Net 1.1** versiyonundan itibaren gelişme göstermesine rağmen, hala bazı fonksiyonlarının **eksik** olduğunu veya tam anlamıyla **kullanılmadığını** düşünüyoum.

Bu makalemde, **string sınıfının** *çok bilinmeyen* veya *çok kullanılmayan* **özelliklerine** ve **methodlarına** değinmeye çalışacağım.

**String değişkeni tekrar eden karakterler ile doldurmak**

*String değişkeni* tekrar eden karakterler ile doldurmak için, *String* sınıfının constructor'ını kullanmak gerekir.

Örneğin, bir string değişkeni *50 adet nokta (.) karakteri* ile doldurmak istiyorsak;



string degisken = new string('.', 50);</pre>

**String değişkenin boş olduğunu kontrol etmek**

*String* değişkenin değer içerip içermediğini belirlemek için **string.Empty** ve boş tırnaklar ("") ile karşılaştırmamız gerekir.

<pre class="brush:csharp">if (degisken != null && degisken != "")
{
}</pre>

Alternatif olarak bu iki karşılaştırmayı yapmak yerine, .Net 2.0 ile gelen **string.IsNullOrEmpty** *static fonksiyonunu* kullanabiliriz;

<pre class="brush:csharp">if (!string.IsNullOrEmpty(degisken))
{
}</pre>

**String.Empty ve boş tırnaklar ("") arasındaki fark**

İnternette çeşitli sitelerde, **string.Empty** ve **boş tırnaklar ("")** arasında seçim yapmak için yazılmış makalelere rastlayabilirsiniz.

Aslında yapılan onlarca test gösteriyor ki, *performans açısından* bakıldığında **string.Empty** ve **boş tırnaklar ("")** arasında **önemsenmeyecek kadar küçük** bir fark vardır.

Yapılan testler **milyarlarca** string değişken üzerinde yapılmasına rağmen ortaya çıkan fark **göz ardı edilebilecek** kadar düşük seviyededir.

**String değişkenin içeriğini ters çevirmek**

Bir *string* değişkenin içeriğini **ters çevirmek** için çeşitli algoritmalara internet üzerinden ulaşabilir veya kendi algoritmanızı geliştirebilirsiniz.

*Kodun temizliği*, *hız*, *Unicode karakter setleri ile sorunsuz çalışabilmesi* açısından benim en çok kullandığım yöntem şudur;

<pre class="brush:csharp">public static string Reverse(this string s)
{
    char[] charArray = s.ToCharArray();
    Array.Reverse(charArray);
    return new string(charArray);
}</pre>

**String karşılaştırma**

*String* değişkenin değeri <a href="http://msdn.microsoft.com/en-us/library/edakx9da.aspx" target="_blank">null</a> olabileceği için, <a href="http://msdn.microsoft.com/library/53k8ybth.aspx" target="_blank">karşılaştırma operatörünü</a> (==) kullanmaktan kaçınmamız gerekir.

Bunun yerine *String* sınıfının **static** <a href="http://msdn.microsoft.com/library/system.string.compare" target="_blank">Compare method'unu</a> kullanmamız daha doğrudur.

*Static* **Compare method'u** sayesinde *null referans'ları* doğru şekilde karşılaştırabilir, *büyük-küçük harf duyarlılığını* yoksayabilir, *farklı Culture'daki* değerleri karşılaştırabiliriz.

<pre class="brush:csharp">if (String.Compare(degisken1, degisken2, true) == 0)
{
}</pre>

**Büyük-Küçük harf duyarlılığı olmayan IndexOf**

*String sınıfının* <a href="http://msdn.microsoft.com/library/system.string.indexof" target="_blank">IndexOf method'u</a> büyük-küçük harf duyarlıdır. *Büyük-Küçük harf duyarlılığı* olmadan **IndexOf** method'unu kullanmak istiyorsak, <a href="http://msdn.microsoft.com/library/system.globalization" target="_blank">System.Globalization</a> namespace'inde yeralan <a href="http://msdn.microsoft.com/library/system.globalization.compareinfo" target="_blank">CompareInfo</a> sınıfı'nın <a href="http://msdn.microsoft.com/library/system.globalization.compareinfo.indexof" target="_blank">IndexOf</a> method'unu kullanabiliriz;

<pre class="brush:csharp">using System.Globalization;

string degisken1 = "Uygulamalarımızın olmazsa olmaz unsurları değişkenlerdir";
string degisken2 = "OLMAZ";

CompareInfo karsilastirma = CultureInfo.InvariantCulture.CompareInfo;
int i = karsilastirma.IndexOf(degisken1, degisken2, CompareOptions.IgnoreCase);


**string ve String farkı**

MSDN'deki <a href="http://msdn2.microsoft.com/En-US/library/aa691153.aspx" target="_blank">String sınıfı ile alakalı bir sayfadan</a> alıntı;

*"The keyword string is simply an alias for the predefined class System.String." – C# Language Specification 4.2.3*

Türkçesi;

*"string anahtar kelimesi basitçe, System.String sınıfının takma adıdır." – C# Language Specification 4.2.3*

