---
layout: post
title: "TPL (Task Parallel Library) - Task Class"
date: 2009-12-06 08:40
author: engin.polat
comments: true
category: [C#]
tags: [.net, code, csharp, plinq, source, task, thread, tpl]
---
.Net 4.0 ile birlikte gelecek güzel class'lardan bir tanesi de <a title="MSDN: Task" href="http://msdn.microsoft.com/en-us/library/system.threading.tasks.task%28VS.100%29.aspx" target="_blank">Task</a> class'ı.

Task class'ı ve TPL (Task Parallel Library) ile birlikte gelen diğer class'lar sayesinde paralel programlama .net framework ile desteklenir hale geliyor.

![TPL_Task_1](/assets/uploads/2009/12/TPL_Task_1-247x300.png "TPL_Task_1")

Yandaki görselde görebileceğiniz gibi, TPL (Task Parallel Library) ve PLINQ (Parallel LINQ) .Net Framework 4.0 ile gelen en önemli özellikler.

Paralel programlamanın performans'a katkısını MSDN'de yer alan şu iki makale'de okuyabilirsiniz;

<a title="MSDN: Parallel Programming in the .Net Framework" href="http://msdn.microsoft.com/en-us/library/dd460693%28VS.100%29.aspx" target="_blank">Parallel Programming in .Net Framework</a>

<a title="MSDN: Parallel Performance" href="http://msdn.microsoft.com/en-us/magazine/cc163340.aspx" target="_blank">Parallel Performance</a>

Gene MSDN'de yer alan şu sayfalardan da .net 4 ile gelecek yeni yapıları öğrenebilirsiniz;

<a title="MSDN: Data Structures for Parallel Programming" href="http://msdn.microsoft.com/en-us/library/dd460718%28VS.100%29.aspx" target="_blank">Data Structures for Parallel Programming</a>

<a title="MSDN: Task Parallelism (Task Parallel Library)" href="http://msdn.microsoft.com/en-us/library/dd537609%28VS.100%29.aspx" target="_blank">Task Parallelism (Task Parallel Library)</a>

<a title="MSDN: Introduction to Tasks" href="http://msdn.microsoft.com/en-us/library/dd997419%28VS.100%29.aspx" target="_blank">Introduction to Tasks</a>

Task class'ını kullanarak, Thread yönetme maliyetlerinden kurtularak kolaylıkla Multi-Core uyumlu, Asenkron çalışabilen kodlar yazabiliriz.

Task class'ından yeni bir örnek oluşturmak için;

Aşağıdaki gibi yeni bir instance oluşturup, daha sonra *Start* method'u ile başlatabiliriz.


Task t0 = new Task(() =&gt;
    MessageBox.Show("Task Örneği 1")
);
t0.Start();</pre>
Veya, aşağıdaki kodda yazdığım gibi, Task class'ının singleton static *Factory* property'sinin *StartNew* method'u ile hem tanımlayıp, aynı anda başlatabiliriz.
<pre class="brush:csharp">Task t1 = Task.Factory.StartNew(() =&gt;
{
    string Mesaj = "Birinci çalışacak..";
    MessageBox.Show(Mesaj);
});</pre>
Örneğini oluşturduğumuz Task nesnesi, başlatılana kadar hafızada bekler. Başlatıldığında, ayrı bir thread'de çalışacağından dolayı, uzun süren işlerin arayüz'ü kilitlemesini önlemek için kullanılabilir.

Birden Fazla Task'ın peşpeşe çalışması sağlanabilir;
<pre class="brush:csharp">Task t2 = Task.Factory.StartNew(() =&gt;
{
    MessageBox.Show("Birinci çalışacak..");
}).ContinueWith((t) =&gt;
{
    MessageBox.Show("İkinci çalışacak..");
}).ContinueWith((t) =&gt;
{
    MessageBox.Show("Üçüncü çalışacak..");
});</pre>
Veya birden fazla Task'ın aynı anda çalışması da sağlanabilir;
<pre class="brush:csharp">Task t3 = Task.Factory.StartNew(() =&gt;
{
    Task c1 = Task.Factory.StartNew(() =&gt;
    {
        MessageBox.Show("Aynı anda çalışacak..");
    }, TaskCreationOptions.AttachedToParent);

    Task c2 = Task.Factory.StartNew(() =&gt;
    {
        MessageBox.Show("Aynı anda çalışacak..");
    }, TaskCreationOptions.AttachedToParent);
});

*TaskCreationOptions* parametresine verdiğimiz *AttachedToParent* değerine dikkat!.. Bu sayede c1 ve c2 Task'ları t3 Task'ının **Child Task**'ları haline geldi, t3 Task'ı da **Parent Task** oldu.

