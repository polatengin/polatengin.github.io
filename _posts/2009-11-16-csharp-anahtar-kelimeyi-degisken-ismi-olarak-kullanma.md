---
layout: post
title: "C#'ta anahtar kelimeyi değişken ismi olarak kullanma"
date: 2009-11-16 08:35
author: engin.polat
comments: true
category: [C#]
tags: [.net, amazon, anahtar kelime, cls, cls-compliant, csharp, değişken, google books, keyword, msdn, variable]
---
![NET_CLR_Unleashed](/assets/uploads/2009/11/NET_CLR_Unleashed.jpg "NET_CLR_Unleashed")

<a title="Google Kitaplar" href="http://books.google.com" target="_blank">Google Kitaplar</a>'da, <a title="Google Kitaplar: NET CLR Unleashed" href="http://books.google.com/books?id=3059QRxPNQcC&amp;printsec=frontcover&amp;source=gbs_navlinks_s#v=onepage&amp;q=&amp;f=false" target="_blank">şuradan</a> bulabileceğiniz <code>.Net CLR Unleashed</code> kitabından edindiğim bir bilgiyi paylaşmak istiyorum.

<a title="MSDN: CLS" href="http://msdn.microsoft.com/en-us/library/12a7a7h3.aspx" target="_blank">CLS (Common Language Specification)</a>, **CLS-Uyumlu** tüm dillerin, anahtar kelimelerin değişken ismi olarak kullanabilmesini sağlayacak bir mekanizma sunmasını ister.

<code>C#</code> dili için bu mekanizma, anahtar kelimenin başına gelen <code>@</code> işareti ile sağlanır.

<code>@</code> işareti kullanılarak, şunlar yapılabilir;

<script src="https://gist.github.com/polatengin/05392a802f500bd93acbc1fd07c3ce3e.js?file=Program.cs"></script>

Bu sayede, anahtar kelime olan <code>int</code>, değişken ismi olarak kullanılabildi.

Kaynak : <a title="MSDN: C# Keywords" href="http://msdn.microsoft.com/en-us/library/x53a06bb(VS.71).aspx" target="_blank">MSDN: C# Keywords</a>, <a title="MSDN: CLS" href="http://msdn.microsoft.com/en-us/library/12a7a7h3.aspx" target="_blank">MSDN: CLS</a>, <a title="MSDN: What is CLS" href="http://msdn.microsoft.com/en-us/library/12a7a7h3(VS.71).aspx" target="_blank">MSDN: What is CLS</a>, <a title="Amazon: NET CLR Unleashed" href="http://www.amazon.com/NET-Common-Language-Runtime-Unleashed/dp/0672321246" target="_blank">Amazon: NET CLR Unleashed</a>