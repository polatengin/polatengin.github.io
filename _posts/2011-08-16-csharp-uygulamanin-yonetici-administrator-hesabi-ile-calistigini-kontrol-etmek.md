---
layout: post
title: "C# Uygulamanın Yönetici (Administrator) hesabı ile çalıştığını kontrol etmek"
date: 2011-08-16 23:02
author: engin.polat
comments: true
category: [C#]
tags: [administrator, bool, function, GetCurrent, IsInRole, method, namespace, public, static, System.Security.Principal, using, WindowsBuiltInRole, WindowsIdentity, WindowsPrincipal, yönetici]
---
Eğer uygulama içerisinde **Yönetici** (**Administrator**) hesabının yetkisi ile yapılabilecek görevlerimiz varsa, öncelikle *bu haklara sahip olduğumuza emin olmamız* gerekir.

Günümüzde birçok uygulama **Yönetici** (**Administrator**) haklarına ihtiyaç duyar. Bu makalede bu haklara sahip olduğumuzu nasıl kontrol edeceğimizi işleyeceğiz.

Öncelikle kodumuzun **using** kısmına <a href="http://msdn.microsoft.com/library/system.security.principal" target="_blank" rel="noopener">System.Security.Principal</a> **namespace**'ini eklememiz gerekiyor;

<pre>using System.Security.Principal;</pre>

Daha sonra *IsAdministrator()* isminde bir fonksiyon yazıyoruz;

<pre class="brush:csharp">public static bool IsAdministrator()
{
    WindowsIdentity identity = WindowsIdentity.GetCurrent();

    WindowsPrincipal principal = new WindowsPrincipal(identity);

    return principal.IsInRole(WindowsBuiltInRole.Administrator);
}</pre>

Bu fonksiyon sayesinde **Yönetici** (**Administrator**) haklarına sahip olup/olmadığımızı anlayabiliyoruz.

Fonksiyon içerisinde öncelikle <a href="http://msdn.microsoft.com/library/system.security.principal.windowsidentity" target="_blank" rel="noopener">WindowsIdentity</a> sınıfından bir değişkene <a href="http://msdn.microsoft.com/library/system.security.principal.windowsidentity" target="_blank" rel="noopener">WindowsIdentity</a> sınıfının static <a href="http://msdn.microsoft.com/library/system.security.principal.windowsidentity.getcurrent" target="_blank" rel="noopener">GetCurrent()</a> methodundan dönen değeri atıyoruz.

İkinci adımda ise, bu değişkeni kullanarak <a href="http://msdn.microsoft.com/library/system.security.principal.windowsprincipal" target="_blank" rel="noopener">WindowsPrincipal</a> sınıfından yeni bir değişken oluşturuyoruz.

Son adımda, bu değişkenin <a href="http://msdn.microsoft.com/library/system.security.principal.windowsprincipal.isinrole" target="_blank" rel="noopener">IsInRole</a> fonksiyonuna <a href="http://msdn.microsoft.com/library/system.security.principal.windowsbuiltinrole" target="_blank" rel="noopener">WindowsBuiltInRole</a> enum'ından *Administrator* değerini parametre olarak geçiyoruz ve sonucu fonksiyondan geriye <a href="http://msdn.microsoft.com/en-us/library/c8f5xwh7.aspx" target="_blank" rel="noopener">boolean</a> değer olarak döndürüyoruz.

Uygulama içerisinde her ihtiyacımız olduğunda yukarıdaki fonksiyonu çağırarak Yönetici (Administrator) haklarına sahip olduğumuzu kontrol edebiliriz;

<pre class="brush:csharp">bool AdminRole = Program.IsAdministrator();</pre>