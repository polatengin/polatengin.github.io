---
layout: post
title: "Generic Priority Queue Yazalım"
date: 2013-04-06 15:00
author: engin.polat
comments: true
category: [C#]
tags: [add, class, containskey, dequeue, enqueue, invalidoperationexception, keyvaluepair, method, priority, private, property, public, queue, remove, sorteddictionary, sum, throw]
---
**Queue** yapıları, *ilk gelen ilk çıkar* (*first in-first out*, *FIFO*) mantığı ile çalışan listelerdir. **C#** dilinde yeralan <a href="http://msdn.microsoft.com/en-us/library/7977ey2c.aspx" title="MSDN : Queue&lt;T&gt; Class" target="_blank" rel="noopener">Queue&lt;T&gt;</a> sınıfı bu mantık ile çalışan bir yapıdadır.

**Queue** sınıfına <a href="http://msdn.microsoft.com/en-us/library/t249c2y7.aspx" title="MSDN : Queue<T>.Enqueue Method" target="_blank" rel="noopener">Enqueue</a> methodu ile yeni eleman *ekleyebilir*, <a href="http://msdn.microsoft.com/en-us/library/1c8bzx97.aspx" title="MSDN : Queue&lt;T&gt;.Dequeue Method" target="_blank" rel="noopener">Dequeue</a> methodu ile de eklenmiş elemanları sırası ile *okuyabiliriz*.

Projelerimizde sıklıkla **Queue** sınıfına ihtiyaç duyarız. Örneğin, üye kaydı oluşturan kullanıcılara mail ile erişim bilgileri iletileceği durumda, her yeni oluşturulan üye kaydını bir *queue*'ya ekleriz, arka planda çalışan bir servis, *queue*'da eleman oldukça alır, veritabanında gerekli kayıtları oluşturduktan, yetkileri tanımladıktan, vs. sonra email gönderme işlemini yapar.

Bazı durumlarda bu senaryo *yetersiz* kalabilir. Özellikle *queue*'ya eklenen elemanlar arasında önceliklendirme yapamadığımız için, yeni kullanıcıya gönderilecek mail ile şifresini unutan kullanıcıya gönderilecek şifre hatırlatma maili aynı önceliğe sahip oluyor.

**Queue** sınıfına öncelikler eklemeye karar verdik, peki nasıl yapacağız? Başlangıç olarak *PriorityQueue* sınıfı oluşturalım;



public class PriorityQueue&lt;TPriority, TItem&gt;
{
}</pre>

*PriorityQueue* sınıfına her öncelik tipi için *Queue* barındıracak aşağıdaki değişken tanımlamasını ekleyelim;

<pre class="brush:csharp">public class PriorityQueue&lt;TPriority, TItem&gt;
{
    private SortedDictionary&lt;TPriority, Queue&lt;TItem&gt;&gt; _subqueues;
}</pre>

*PriorityQueue* sınıfının **constructor**'ında *_subqueues* değişkenine değer ataması yapalım;

<pre class="brush:csharp">public PriorityQueue()
{
    _subqueues = new SortedDictionary&lt;TPriority, Queue&lt;TItem&gt;&gt;();
}</pre>

Sırada bekleyen eleman var mı, varsa kaç eleman var sorularını cevaplayacak iki *property* ekleyelim;

<pre class="brush:csharp">public bool HasItems
{
    get { return _subqueues.Any(); }
}
public int Count
{
    get { return _subqueues.Sum(q => q.Value.Count); }
}</pre>

İlgili öncelik tipine eleman ekleme işini yapacak *Enqueue* method'unu yazalım;

<pre class="brush:csharp">public void Enqueue(TPriority priority, TItem item)
{
    if (!_subqueues.ContainsKey(priority))
    {
        _subqueues.Add(priority, new Queue&lt;TItem&gt;());
    }
 
    _subqueues[priority].Enqueue(item);
}</pre>

Eğer ilgili öncelik tipi öncelikler listesinde yoksa, ilk olarak öncelik tipine ait yeni *queue* oluşturuluyor, sonra eleman öncelik tipinin listesine ekleniyor.

Öncelik tipinin listesinden eleman okumak için gerekli *Dequeue* method'unu da yazalım;

<pre class="brush:csharp">public TItem Dequeue()
{
    if (_subqueues.Any())
    {
        KeyValuePair&lt;TPriority, Queue&lt;TItem&gt;&gt; first = _subqueues.First();

        TItem nextItem = first.Value.Dequeue();

        if (!first.Value.Any())
        {
            _subqueues.Remove(first.Key);
        }

        return nextItem;
    }
    else
    {
        throw new InvalidOperationException("Queue'da hiç eleman yok!");
    }
}</pre>

Örnek kullanım;

<pre class="brush:csharp">var queue = new PriorityQueue&lt;int, string&gt;();
 
queue.Enqueue(1, "A-1");
queue.Enqueue(2, "A-2");
queue.Enqueue(3, "A-3");
queue.Enqueue(1, "B-1");
queue.Enqueue(2, "B-2");
queue.Enqueue(3, "B-3");
queue.Enqueue(1, "C-1");
queue.Enqueue(2, "C-2");
queue.Enqueue(3, "C-3");

while (queue.HasItems)
{
    Console.WriteLine(queue.Dequeue());
}

// ÇIKTI
// A-1
// B-1
// C-1
// A-2
// B-2
// C-2
// A-3
// B-3
// C-3


*Kaynak : http://www.blackwasp.co.uk/PriorityQueue.aspx*

