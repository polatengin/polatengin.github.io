---
layout: post
title: "C# MD5 yöntemi ile metin şifreleme"
date: 2011-08-14 14:32
author: engin.polat
comments: true
category: [C#]
tags: [ComputeHash, crypto, csharp, encoding, foreach, getbytes, instance, md5, MD5CryptoServiceProvider, namespace, return, string, stringbuilder, System.Secuity.Cryptography, tostring, using]
---
Aşağıdaki küçük fonksiyon yardımıyla **string** tipindeki değişkenlerin içeriğini <a href="http://tr.wikipedia.org/wiki/MD5" title="MD5 Şifreleme Yöntemi" target="_blank">MD5</a> yöntemi ile şifreleyebiliriz.

Öncelikle kodumuzun **using** kısmına <a href="http://msdn.microsoft.com/library/system.security.cryptography" target="_blank">System.Security.Cryptography</a> **namespace**'ini eklememiz lazım.

Böylece <a href="http://msdn.microsoft.com/library/system.security.cryptography.md5cryptoserviceprovider" target="_blank">MD5CryptoServiceProvider</a> sınıfından yeni bir *örnek* (**instance**) oluşturabilir, ve *şifreleme sağlayıcısı* (**crypto service provider**) olarak kullanabiliriz.



using System.Text;
using System.Security.Cryptography;

public static string Sifrele(string Metin)
{
    MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

    byte[] ba = Encoding.UTF8.GetBytes(Metin);
    ba = md5.ComputeHash(ba);

    StringBuilder sb = new StringBuilder();
    foreach (byte b in ba)
    {
        sb.Append(b.ToString("x2").ToLower());
    }

    return sb.ToString();
}


