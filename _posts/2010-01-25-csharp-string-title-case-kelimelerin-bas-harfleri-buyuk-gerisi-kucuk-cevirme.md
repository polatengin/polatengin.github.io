---
layout: post
title: "C# String'i Title Case'e (Kelimelerin Baş Harfleri Büyük Gerisi Küçük) Çevirme"
date: 2010-01-25 12:47
author: engin.polat
comments: true
category: [C#]
tags: [class, convert, csharp, cultureinfo, currentculture, extensionmethod, method, string, textinfo, title case, tolower, toupper]
---
**.Net Framework** içerisinde *string.ToUpper()* ve *string.ToLower()* fonksiyonlarını kullanarak **string** değişkenin içeriğini BÜYÜK ve küçük harfe çevirebiliyoruz.

Metni **Upper Case** (**Tümü Büyük Harfler**) ve **Lower Case** (**Tümü Küçük Harfler**) formatlamak haricinde **Title Case** (**Kelimelerin Baş Harfleri Büyük Gerisi Küçük**) çevirmek yaygın kullanılan başka bir formattır.

**string** sınıfına bir **Extension Method** yazarak bu özelliğe sahip olmasını sağlayabiliriz. **Extension Method**'u yazarken bilmemiz gereken ilk şey, *ToTitleCase()* method'unun *TextInfo* sınıfında yer aldığıdır. *TextInfo* sınıfına *CultureInfo* sınıfının *CurrentCulture* özelliğinden ulaşabiliriz.



public static class ExtensionManager
{
    public static string ToTitleCase(this string Text)
    {
        return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(Text);
    }
}</pre>

Artık projemiz içerisinde herhangi bir yerde **string** değişkenimizin *ToTitleCase()* method'unu kullanabiliriz.

<pre class="brush:csharp">private void frmMain_Load(object sender, EventArgs e)
{
    string AdSoyad = "engin polat".ToTitleCase();
}


Yukarıdaki kod parçası çalıştığı zaman, *AdSoyad* değişkeninin içeriği **Engin Polat** olacaktır.

***Not :** CultureInfo sınıfının CurrentCulture özelliğinden TextInfo sınıfının özelliklerine eriştiğimiz için, bilgisayarınızda kullandığınız dile göre sonuç farklılık gösterebilir.*

