---
layout: post
title: "VB.NET'te anahtar kelimeyi değişken ismi olarak kullanma"
date: 2009-12-14 12:44
author: engin.polat
comments: true
category: [C#]
tags: [code, csharp, identifier, keyword, msdn, source, vbnet, verbatim]
---
Daha önce yazdığım <a title="enginpolat.com: C#’ta anahtar kelimeyi değişken ismi olarak kullanma" href="/c-sharp-anahtar-kelimeyi-degisken-ismi-olarak-kullanma/" target="_self">C#'ta anahtar kelimeyi değişken ismi olarak kullanma</a> yazımda, aynı işin VB.NET'te nasıl yapılacağını yazmamıştım.

Değişken isminin, dilin anahtar kelimelerinden biri olmasına **verbatim identifier** deniyor.

MSDN'de C# dili için <a title="MSDN: C# Verbatim Identifier" href="http://msdn.microsoft.com/en-us/library/aa664670(VS.71).aspx" target="_blank" rel="noopener">verbatim identifier nasıl tanımlanır</a> makalesi mevcut, fakat VB.NET için nasıl yapılacağı dökümante edilmemiş.

Hala verbatim identifier tanımlamanın ***KÖTÜ*** bir fikir olduğunu düşünüyorum, fakat VB.NET'te verbatim identifier nasıl tanımlanır, merak edenler için;


Dim [String] As String = ""
Dim [For] As Boolean = True
Dim [While] As Integer = 6
Dim [False] As DateTime = DateTime.Now
Dim [ReadOnly] As File


