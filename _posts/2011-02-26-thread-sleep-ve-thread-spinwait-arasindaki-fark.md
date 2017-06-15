---
layout: post
title: "Thread.Sleep ve Thread.SpinWait arasındaki fark"
date: 2011-02-26 09:30
author: engin.polat
comments: true
category: [C#]
tags: [const, context switch, cpu, long, msdn, optimization, priority, process, sleep, spinwait, synchronization object, thread]
---
[Thread](http://msdn.microsoft.com/library/system.threading.thread) sınıfı ile ilgili en çok karşılaştığım sorulardan birisi; *"Thread.Sleep() ile Thread.SpinWait() method'ları arasındaki fark nedir?"* olmuştur.

[MSDN Process ve Thread dökümanları](http://msdn.microsoft.com/library/ms684847.aspx) ne yazık ki bu konuda bize yeterli bilgi sağlamıyor.

Peki [Thread](http://msdn.microsoft.com/library/system.threading.thread) sınıfının [SpinWait()](http://msdn.microsoft.com/library/system.threading.thread.spinwait) ve [Sleep()](http://msdn.microsoft.com/library/system.threading.thread.sleep) method'ları arasındaki fark nedir?

[Programming .Net Components](http://www.amazon.com/Programming-NET-Components-Juval-Lowy/dp/0596102070) kitabının yazarı *Juval Löwy*'den [alıntı (sayfa 192)](http://books.google.com.tr/books?id=m7E4la3JAVcC&pg=PA192&lpg=PA192&dq=Juval+Lowy+spinwait&source=bl&ots=dDAR_voRIO&sig=xNg-Ltay2UApSKNcHE4cpo7gnwQ&hl=tr&ei=VVawTeOwCIzFswa4nKn_Cw&sa=X&oi=book_result&ct=result&resnum=1&ved=0CBcQ6AEwAA#v=onepage&q&f=false) yapacağım;



>Orjinal : When a thread calls SpinWait(), the calling thread waits the number of iterations specified, and the thread is never added to the queue of waiting threads. As a result, the thread is effectively put to sleep without relinquishing the remainder of its CPU time slot.

The .NET documentation does not define what an iteration is, but it is likely mapped to a predetermined number (probably just one) of NOP (no-operations) assembly instructions. Consequently, the following SpinWait() instruction will take different time to complete on machines with different CPU clock speeds:

const long MILLION = 1000000;
Thread.SpinWait(MILLION);

SpinWait() is not intended to replace Sleep(), but is rather made available as an advanced optimization technique. If you know that some resource your thread is waiting for will become available in the immediate future, it is potentially more efficient to spin and wait, instead of using either Sleep() or a synchronization object, because those force a thread context switch, which is one of the most expensive operations performed by the operating system. Even in the esoteric cases for which SpinWait() was designed, using it is an educated guess at best. SpinWait() will gain you nothing if the resource is not available at the end of the call, or if the operating system preempts your thread because its time slot has elapsed, or because another thread with a higher priority is ready to run. In general, I recommend that you should always use deterministic programming (using synchronization objects in this case) and avoid optimization techniques.



Alıntı'nın önemli cümleleri;



>Türkçesi : Eğer bir thread SpinWait() method'unu çağırırsa, parametre ile belirtilen CPU çevrimi boyunca beklemeye geçer ve Bekleyen Threadler (Waiting Threads) listesine kendini eklemez. Böylece, CPU'da bulunduğu slot'tan vazgeçmeden, uyku moduna geçmiş olur.

.NET dokümantasyonuna göre her CPU çevriminde (muhtemelen) bir adet NOP (no-operations) assembly komutu çalıştırır. Fakat, aşağıdaki SpinWait() komutu, farklı hızlarda çalışan CPU'larda farklı sürelerde tamamlanır.

const long MILLION = 1000000;
Thread.SpinWait(MILLION);

SpinWait() method'u, Sleep() method'unun yerine düşünülmemiştir, daha ileri seviye optimizasyon yapılabilmesi için amaçlanmıştır. Eğer çalışan thread'in ihtiyaç duyduğu kaynak, çok kısa süre içerisinde uygun olacaksa (mesela başka bir thread kaynak üzerinde bulunan lock'ı kaldıracaksa) Sleep() yerine SpinWait() kullanmak daha uygun olur.

Sleep() method'u (veya syncronization nesnesi), thread'in CPU üzerinde context switch yapmasına sebep olur.



*Son cümle; **SpinWait()** method'u, çağıran thread'i, işlemci üzerinde aktif tutar, **Sleep()** method'u ise, thread'i belirli süre boyunca gerçek anlamda uyutur.*

