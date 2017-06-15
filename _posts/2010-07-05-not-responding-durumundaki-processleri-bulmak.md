---
layout: post
title: "Not Responding durumundaki Process'leri bulmak"
date: 2010-07-05 16:49
author: engin.polat
comments: true
category: [C#]
tags: [csharp, foreach, getprocesses, process, System.Diagnostics]
---
O anda çalışmakta olan uygulamaların durumlarını gözleyen bir **service** yazmamız gerektiğinde, gözlediğimiz uygulamanın kullanıcıya yanıt verip-vermediğini bulabilmemiz gerekir.

Bunu **.Net Framework**'teki <a title="MSDN: Process" href="http://msdn.microsoft.com/en-us/library/system.diagnostics.process.aspx" target="_blank">Process</a> sınıfının üyeleri ile kolaylıkla yapabiliriz.

***Process Sınıfı***

*Process* sınıfı <a title="MSDN: System.Diagnostics" href="http://msdn.microsoft.com/en-us/library/system.diagnostics.aspx" target="_blank">System.Diagnostics</a> *namespace*'i içerisinde yeralır. *Process* sınıfı birçok *static* ve *instance* üyeye sahiptir. Bu üyeler sayesinde, lokal bilgisayardaki veya uzak bilgisayardaki herhangi bir uygulamaya müdahele edebilirsiniz. Ayrıca *Process* sınıfı ilgili uygulamanın "çalıştığını" veya "yanıt vermiyor" durumuna düştüğünü de belirleyebilir.

Bu özellik, uygulamaları monitör eden bir service geliştirecekseniz çok kullanışlıdır.

Bu yazıda, basit bir **console uygulaması** ile bilgisayardaki "yanıt veren" ve "yanıt vermeyen" uygulamaları listeleyeceğiz.

Öncelikle *System.Diagnostics* **namespace**'ini kod'umuzun **using** kısmına ekleyelim;



using System.Diagnostics;</pre>

Bilgisayarda o anda çalışan uygulamaları *Process* sınıfının *GetProcesses()* method'undan **Process dizisi** olarak alabiliriz;

<pre class="brush:csharp">Process[] p = Process.GetProcesses();</pre>

Basit bir döngü ile o anda çalışmakta olan **process**'ler arasında dönebiliriz. Sonra tek yapmamız gereken, Process sınıfının statik *Responding* property'sine bakmak;

<pre class="brush:csharp">if (p.Responding)
    Console.WriteLine(" yanıt veriyor.");
else
    Console.WriteLine(" yanıt VERMİYOR!");</pre>

Uygulamanın kodlarını toparlarsak;

<pre class="brush:csharp">Process[] processes = Process.GetProcesses();
foreach (Process p in processes)
{
    Console.Write(p.ProcessName);

    if (p.Responding)
        Console.WriteLine(" yanıt veriyor.");
    else
        Console.WriteLine(" yanıt VERMİYOR!");
}


