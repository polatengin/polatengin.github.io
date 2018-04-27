---
layout: post
title: "C#'ta assembly&#58; InternalsVisibleToAttribute kullanımı"
date: 2016-07-16 22:00
author: engin.polat
comments: true
category: [C#]
tags: [access modifiers, application, assembly, attribute, class, compilerservices, console, csharp, erişim belirleyiciler, internal, internalsvisibleto, internalsvisibletoattribute, library, namespace, project, protection level, public, reference, runtime, solution, solution explorer, system, var, visual studio]
---
**C#**'ta kullanabildiğimiz *erişim belirleyicileri* (**Access Modifiers**) daha önce <a href="http://www.enginpolat.com/csharp-erisim-belirleyiciler-access-modifiers/" target="_blank" rel="noopener">C# Erişim Belirleyiciler - Access Modifiers</a> isimli makalede ele almıştım.

**C#** kurallarına göre, bir proje diğer projeyi **referans** olarak görüyorsa **public** erişim belirleyicili (*access modifier*) olan *class*'lara erişebilir. **internal** access modifier olan **class**'lara ise referans olarak gören projeden erişilemez, sadece tanımlandığı projeden erişilebilir.

*Göstermesi, anlatmasından kolay olacak sanırım.*

Hemen **Visual Studio 2015** açalım ve yeni bir **Console Application** projesi oluşturalım;

![](/assets/uploads/2016/07/assembly-internalsvisibleto-attribute-0.png)

**Solution**'a sağ tuşla tıklayalım ve **Add Project** menüsünden bir tane **Class Library** ekleyelim ve *Class1.cs* dosyasının ismini *VeritabaniErisimi.cs* olacak şekilde değiştirelim;

![](/assets/uploads/2016/07/assembly-internalsvisibleto-attribute-1.png)

Yeni oluşturduğumuz **Class Library** projesini **Console Application** projesinin *referans*'larına ekleyelim;

Böylece **solution**'ımız aşağıdaki gibi gözükmeli;

![](/assets/uploads/2016/07/assembly-internalsvisibleto-attribute-2.png)

*VeritabaniErisimi.cs* dosyasını açalım ve *VeritabaniErisimi* **class**'ının *erişim belirleyici*sini (**Access Modifier**) **internal** yapalım.

<script src="https://gist.github.com/polatengin/5851e2e34124f8c6a15b1a6b97b1cdd0.js?file=VeritabaniErisimi-Before.cs"></script>

**Console Application** projesindeki *Program.cs* dosyasını açar ve içerisinden *VeritabaniErisimi* isimli **class**'a erişmek istersek, **internal** *access modifier*'ına sahip olduğu için erişemeyeceğiz.

<script src="https://gist.github.com/polatengin/5851e2e34124f8c6a15b1a6b97b1cdd0.js?file=Program.cs"></script>

Bu noktada proje derlenemez ve *'VeritabaniErisimi' is inaccessible due to its protection level* hatası verir.

Çünkü; **internal** *access modifier*'ına sahip **class**'lar sadece kendi projelerinde kullanılabilir, erişebilirlerdir. Kendi projelerinin dışından erişilemezler.

Eğer istersek, *Kutuphane* isimli **Class Library**'deki **internal** *access modifier*'ına sahip sınıfların başka projelerden de erişilebilir olmasını sağlayabiliriz.

Bunun için **namespace** üstünde <a href="https://msdn.microsoft.com/library/system.runtime.compilerservices.internalsvisibletoattribute" target="_blank" rel="noopener">InternalsVisibleTo</a> **Attribute**'ünü kullanmamız lazım.

Öncelikle *VeritabaniErisimi.cs* dosyasını açalım (*aslında Kutuphane projesindeki herhangi bir csharp dosyasını açsak olur*) ve **using** kısmına *System.Runtime.CompilerServices* ekleyelim, **namespace** üzerine de *[assembly: InternalsVisibleTo("PROJEADI")]* yazalım.

**InternalsVisibelTo** *attribute*'ünün parametresi olan *PROJEADI*, **internal** *access modifier*'ına sahip **class**'ların görünür olmasını istediğimiz projelerin adı olmalı. Örneğin;

<script src="https://gist.github.com/polatengin/5851e2e34124f8c6a15b1a6b97b1cdd0.js?file=VeritabaniErisimi-After.cs"></script>