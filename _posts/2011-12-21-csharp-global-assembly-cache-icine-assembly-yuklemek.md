---
layout: post
title: "C# Global Assembly Cache içine Assembly yüklemek"
date: 2011-12-21 08:50
author: engin.polat
comments: true
category: [C#]
tags: [.net, assembly, dal, dll, ExecuteProcedure, ExecuteQuery, gac, gacinstall, gacutil, global assembly cache, install, publish, System.EnterpriseServices, System.EnterpriseServices.Internal, System.Security, System.Security.SecurityException]
---
C# ile geliştirdiğimiz uygulamalar büyüdükçe, uygulama içerisinde ortak kullandığımız yapıları tekilleştirme eğilimi gösteririz. *Örneğin; veritabanına erişim, e-posta gönderme, hata geribildirimleri, session kontrolü, vs.*

**Tekilleştirme** yapmak için, **ortak metodları**, **ortak bir sınıf** içerisinde toplar ve projenin her yerinde ilgili sınıf üzerinden kullanırız. *Örneğin;
DAL.ExecuteQuery();
DAL.ExecuteProcedure();
DAL.GetDataTable();*

**Ortak metodlar** çoğaldıkça, ortak bir sınıf yeterli olmaz ve **ortak sınıflar** oluşturmamız gerekir.*Örneğin;
Hata.Log(ex);
DAL.ExecuteQuery("sorgu", "parametreler");
EMail.Send("alıcı", "konu", "içerik");*

Eğer ortak sınıflarımızı çeşitli projeler arasında paylaşmamız gerekiyorsa, bu sınıfları **dll assembly**'ler içerisinde toplarız.

Daha sonra her projede, dll assembly'yi projenin **referanslarına** ekleriz.

Birden fazla projede referans olarak göstereceksek, dll assembly'yi ortak bir alana yüklememiz daha doğru olacaktır.

Böylece ilgili dll'de yapacağımız bir versiyon güncellemesi aynı anda birden fazla projede **etkin olacaktır**.

.Net dll'lerini koyabildiğimiz ortak alana <a href="http://msdn.microsoft.com/library/yf1d93sz.aspx" target="_blank">Global Assembly Cache</a> (kısaca **GAC**) denmektedir.

Bir .Net assembly'sini **GAC**'a eklemek için, **.Net Framework** ile birlikte gelen <a href="http://msdn.microsoft.com/library/ex0ss12c.aspx" target="_blank">gacutil</a> aracını kullanmalıyız. *Örnek Kullanım : gacutil -i [assembly_yolu]*

Komut satırından gerekli parametreleri vererek **gacutil** aracını kullanabiliriz.

Eğer, bir assembly'yi GAC'a **programatik bir yöntemle** eklemek istiyorsak, [System.EnterpriseServices.Internal](http://msdn.microsoft.com/library/twk4f69d.aspx) namespace'inde yeralan [Publish](http://msdn.microsoft.com/library/system.enterpriseservices.internal.publish) sınıfının [GacInstall](http://msdn.microsoft.com/library/system.enterpriseservices.internal.publish.gacinstall) method'unu kullanmalıyız.

İlk olarak kodumuzun *using* kısmına *System.EnterpriseServices.Internal* namespace'ini ekleyelim;



using System.EnterpriseServices.Internal;</pre>

Daha sonra yapmamız gereken, *Publish* sınıfından yeni bir örnek oluşturup, *GacInstall* method'unu çağırmak.

<pre class="brush:csharp">try
{
    Publish gac = new Publish();
    gac.GacInstall("yuklenecekassemblyyolu");
}
catch (System.Security.SecurityException se)
{
    ///Muhtemelen yetki eksikliğinden dolayı uygulamamız GAC'a erişemedi
}


Özellikle, **kendi kurulum uygulamamızı** yazacaksak, *GAC*'a programatik erişmemiz gerekecektir.

