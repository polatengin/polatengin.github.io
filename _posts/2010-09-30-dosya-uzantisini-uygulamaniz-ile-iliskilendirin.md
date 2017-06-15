---
layout: post
title: "Dosya uzantısını uygulamanız ile ilişkilendirin"
date: 2010-09-30 16:22
author: engin.polat
comments: true
category: [C#]
tags: [application, array, classesroot, createsubkey, executablepath, file, registry, registrykey, setvalue, startuppath, string]
---
Bir **windows uygulaması** geliştirdiniz ve uygulamanız **belli uzantıdaki dosyalar** üzerinde işlemler gerçekleştiriyor (*Görüntüleme, Kaydetme, vs.*)

Eğer ilgili uzantıdaki dosyaya **çift tıklandığı** zaman uygulamanızın **açılmasını** ve dosya üzerinde **işlem yapmasını** istiyorsanız, öncelikle *dosya uzantısı* ve *uygulamanızı* **registry** üzerinden **birbiri ile ilişkilendirmelisiniz**.

Aşağıdaki örnek kod sayesinde, *eng uzantılı* dosyaların **uygulamanız ile ilişkilendirilmesini** ve **dosya ikonlarının** sizin belirlediğiniz (*icon.ico*) olarak gözükmesini sağlayabilirsiniz;



Registry.ClassesRoot.CreateSubKey(".eng").SetValue(null, "EnginDosyasi.eng");

RegistryKey rk = Registry.ClassesRoot.CreateSubKey("EnginDosyasi.eng");
rk.CreateSubKey("DefaultIcon").SetValue(null, Application.StartupPath + "\\icon.ico");
rk.CreateSubKey(@"shell\open\command").SetValue(null, "\"" + Application.ExecutablePath + "\" \"%1\"");</pre>

*eng uzantılı* bir dosyaya **çift tıklandığında** artık sizin uygulamanız **açılacaktır**.

**Çift tıklandığı için** uygulamanızı açtıran **dosyaya**, aşağıdaki kod satırı ile *ulaşabilirsiniz*;

<pre class="brush:csharp">public static void Main(string[] args)
{
    string Dosya = args[1];
}


