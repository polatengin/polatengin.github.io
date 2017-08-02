---
layout: post
title: "C# ile Hash işlemi"
date: 2010-07-06 16:56
author: engin.polat
comments: true
category: [C#]
tags: [ComputeHash, csharp, decrypt, encrypt, hash, md5, sha1, SHA1CryptoServiceProvider, sha256, sha384, sha512, System.Secuity.Cryptography]
---
**Sql Server** ile nasıl **hash** yapabileceğimizi daha önce <a title="enginpolat.com: Sql Server'da Hash işlemi" href="/sql-serverda-hash-islemi/" target="_blank">Sql Server'da Hash işlemi</a> isimli makalemde yazmıştım. Bu sefer, **.net** üzerinde **C#** ile nasıl **hash** işlemi yapabileceğimizi yazacağım.

*Hash*, büyük boyutta girdi verisi için sabit boyutlu üretilen benzersiz değerdir. Hash algoritmalarının yapısından dolayı, **girdi verisindeki küçük değişiklikler sonuç verisinde büyük farklılıklara yol açmaktadır**.

*.Net Framework* üzerinde bulunan <a title="MSDN: System.Security.Cryptography" href="http://msdn.microsoft.com/en-us/library/system.security.cryptography.aspx" target="_blank">System.Security.Cryptography</a> namespace'i, güvenli şifreleme ve çözme işlemleri için **şifreleme servislerini** barındırır.

.Net Framework şu hash algoritmalarını destekler;

**MD5**, girdi verisini şifrelemek için **128 bit** şifreleyici kullanır
** SHA1**, girdi verisini şifrelemek için **160 bit** şifreleyici kullanır
** SHA256**, girdi verisini şifrelemek için **256 bit** şifreleyici kullanır
** SHA384**, girdi verisini şifrelemek için **384 bit** şifreleyici kullanır
** SHA512**, girdi verisini şifrelemek için **512 bit** şifreleyici kullanır

En çok kullanılan şifreleme yöntemlerinden biri **SHA1**'dir.

***SHA1 Hashing Algoritması Örneği***

Öncelikle kod yazdığımız dosyanın *using* kısmına *System.Secuity.Cryptography* namespace'ini eklemeliyiz;


using System.Secuity.Cryptography;</pre>
*SHA1* sınıfından bir örnek oluşturalım;
<pre class="brush:csharp">SHA1 sha = new SHA1CryptoServiceProvider();</pre>
*SHA1* sınıfı **abstract** bir sınıf olduğu için kendisinden örnek oluşturamıyoruz. *SHA1* sınıfından türetilen **SHA1CryptoServiceProvider** sınıfından bir örnek oluşturuyoruz.

Artık yapmamız gereken, *sha* isimli değişkenimizin *ComputeHash()* method'unu çağırmak. *ComputeHash()* method'u, şifrelenecek veriyi parametre olarak **byte dizisi** aldığı ve geriye şifrelenmiş veriyi **byte dizisi** olarak döndürdüğü için aşağıdaki örnekte olduğu gibi kullanabiliriz;
<pre class="brush:csharp">string SifrelenecekVeri = "http://www.enginpolat.com/";

string SifrelenmisVeri = Convert.ToBase64String(sha.ComputeHash(Encoding.UTF8.GetBytes(SifrelenecekVeri)));</pre>
Uygulamanın kodlarının toparlanmış hali;
<pre class="brush:csharp">using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

class Program
{
  static void Main(string[] args)
  {
    SHA1 sha = new SHA1CryptoServiceProvider();

    string SifrelenecekVeri = "http://www.enginpolat.com/";

    string SifrelenmisVeri = Convert.ToBase64String(sha.ComputeHash(Encoding.UTF8.GetBytes(SifrelenecekVeri)));

    Console.WriteLine(SifrelenmisVeri);

    Console.ReadLine();
  }
}

Yukarıdaki örneği çalıştırırsanız şifrelenmiş çıktı şöyle olacaktır;

*8hocM3G7QhUoN7Nm3bWMSr0/SsM=*

