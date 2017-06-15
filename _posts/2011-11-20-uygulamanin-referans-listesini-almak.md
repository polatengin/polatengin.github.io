---
layout: post
title: "Uygulamanın Referans Listesini Almak"
date: 2011-11-20 18:48
author: engin.polat
comments: true
category: [C#]
tags: [assembly, assemblycompanyattribute, assemblycopyrightattribute, assemblydescriptionattribute, assemblyfileversionattribute, assemblyproductattribute, assemblytitleattribute, console, foreach, fullname, getcustomattributes, getexecutingassembly, getreferencedassemblies, linq, linq query, load, loop, reflection, runtime, static, WriteLine]
---
**Çalışma zamanında** (*Run-Time*) uygulamanın referans olarak kullandığı *assembly*'lerin (*dll*) listesini almak için aşağıdaki *LINQ sorgusunu* kullanabilirsiniz;



var assemblies = from assemblyName in Assembly.GetExecutingAssembly().GetReferencedAssemblies()
let assembly = Assembly.Load(assemblyName)
let companies = assembly.GetCustomAttributes(typeof(AssemblyCompanyAttribute), false)
where companies.Length > 0 && (companies[0] as AssemblyCompanyAttribute).Company != "Microsoft Corporation"
select assembly;</pre>

<a href="http://msdn.microsoft.com/library/system.reflection.assembly" title="Assembly Class">Assembly</a> sınıfının *static* <a href="http://msdn.microsoft.com/library/system.reflection.assembly.getexecutingassembly" title="Assembly GetExecutingAssembly Method">GetExecutingAssembly()</a> method'unu kullanarak çalışan *assembly*'ye ulaşabiliriz.

<a href="http://msdn.microsoft.com/library/system.reflection.assembly.getreferencedassemblies" title="Assembly GetReferencedAssemblies Method">GetReferencedAssemblies()</a> method'u ilgili **Assembly**'nin referans olarak kullandığı *assembly*'lerin listesini döndürür.

*Assembly* sınıfının *static* <a href="http://msdn.microsoft.com/library/system.reflection.assembly.load" title="Assembly Load Method">Load() method'u ile ilgili *assembly* hafızaya yüklenir.

</a><a href="http://msdn.microsoft.com/library/system.reflection.assembly.getcustomattributes" title="Assembly GetCustomAttributes Method">GetCustomAttributes()</a> method'u ile ilgili *assembly*'nin çeşitli **meta bilgileri** sorgulanabilir. *Örneğin*;



*   <a href="http://msdn.microsoft.com/library/system.reflection.assemblycompanyattribute" title="AssemblyCompanyAttribute Class">AssemblyCompanyAttribute</a>
*   <a href="http://msdn.microsoft.com/library/system.reflection.assemblyfileversionattribute" title="AssemblyFileVersionAttribute Class">AssemblyFileVersionAttribute</a>
*   <a href="http://msdn.microsoft.com/library/system.reflection.assemblytitleattribute" title="AssemblyTitleAttribute Class">AssemblyTitleAttribute</a>
*   <a href="http://msdn.microsoft.com/library/system.reflection.assemblycopyrightattribute" title="AssemblyCopyrightAttribute Class">AssemblyCopyrightAttribute</a>
*   <a href="http://msdn.microsoft.com/library/system.reflection.assemblydescriptionattribute" title="AssemblyDescriptionAttribute Class">AssemblyDescriptionAttribute</a>
*   <a href="http://msdn.microsoft.com/library/system.reflection.assemblyproductattribute" title="AssemblyProductAttribute Class">AssemblyProductAttribute</a>

**AssemblyCompanyAttribute** bilgisini aldıktan sonra, *Microsoft Corporation* değerinden farklı olduğunu kontrol ederek, *Microsoft* firması haricinde firmaların *referans assembly*'lerini bulabiliriz.

Son olarak, basit bir **foreach** döngüsü ile *assembly* listesini ekrana yazdırabiliriz;

<pre class="brush:csharp">foreach (var assembly in assemblies)
{
    Console.WriteLine(assembly.FullName);
}


