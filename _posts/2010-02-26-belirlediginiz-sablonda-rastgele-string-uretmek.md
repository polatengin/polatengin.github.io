---
layout: post
title: "Belirlediğiniz şablonda rastgele string üretmek"
date: 2010-02-26 11:59
author: engin.polat
comments: true
category: [C#]
tags: [csharp, delegate, matchevaluator, random, regex, replace, string]
---
Uygulamanızda sizin belirlediğiniz şablona göre rastgele üretilmiş bir string'e ihtiyaç duyarsanız, aşağıdaki kod işinizi görebilir;



Random r = new Random();
string KullanilabilecekKarakterler = "AzByCxDwEvFuGtHsIrJqKpLoMnNmOlPkQjRiShTgUfVeWdXcYbZa1234567890";

MatchEvaluator Rastgele = delegate (Match m) {
    return KullanilabilecekKarakterler[r.Next(KullanilabilecekKarakterler.Length)].ToString();
};

Console.WriteLine(Regex.Replace("XXXX-XXXX-XXXX-XXXX", "X", Rastgele)); /// Lv2U-jHsa-TUep-NqKa
Console.WriteLine(Regex.Replace("Şifreniz : XXXX", "X", Rastgele)); /// Şifreniz : w6G0
Console.WriteLine(Regex.Replace("XXX.XXX-XX/XX", "X", Rastgele)); /// Fu8.c3Y-xT/6P
Console.WriteLine(Regex.Replace("XXXXXX", "X", Rastgele)); /// 8cPD2y


