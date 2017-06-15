---
layout: post
title: "C# ile uzun süren method'ları kontrol altına alın"
date: 2013-10-18 09:30
author: engin.polat
comments: true
category: [C#]
tags: [action, cancel, cancellationtokensource, create, default, dispose, factory, func, idisposable, startnew, task, thread, timeout, token, tuple, wait]
---
Uygulama geliştirirken karşılaştığımız birçok senaryoda çağırdığımız bir method'un *uzun sürede* **cevap üretmemesinden** dolayı kaynaklarımızı tükettiğini görebiliriz.

Çağırılan method'un belli bir **zaman aşımı süresine** sahip olması ve bu süre sonuna kadar değer üretmediyse **sonlanması** için birçok yöntem kullanabiliriz, fakat ben <a href="http://msdn.microsoft.com/library/system.threading" title="System.Threading Namespace" target="_blank">System.Threading</a> *namespace*'inde yeralan <a href="http://msdn.microsoft.com/library/system.threading.cancellationtokensource" title="CancellationTokenSource Class" target="_blank">CancellationTokenSource</a> sınıfını kullanan aşağıdaki yöntemi tercih ediyorum;



/// &lt;summary&gt;
/// Timeout süresinde tamamlanmayan method'u otomatik sonlandırır
/// &lt;/summary&gt;
/// &lt;param name="action"&gt;Çağırılacak method&lt;/param&gt;
/// &lt;param name="timeout"&gt;Milisaniye cinsinden zamanaşımı süresi&lt;/param&gt;
/// &lt;returns&gt;&lt;/returns&gt;
public static bool Execute(Action action, int timeout)
{
    var tokenSource = new CancellationTokenSource();

    var token = tokenSource.Token;

    var task = Task.Factory.StartNew(action, token);

    if (!task.Wait(timeout, token))
    {
        tokenSource.Cancel();

        return false;
    }

    task.Dispose();

    return true;
}

/// &lt;summary&gt;
/// Timeout süresinde tamamlanmayan method'u otomatik sonlandırır
/// &lt;/summary&gt;
/// &lt;param name="action"&gt;Çağırılacak method&lt;/param&gt;
/// &lt;param name="timeout"&gt;Milisaniye cinsinden zamanaşımı süresi&lt;/param&gt;
/// &lt;returns&gt;&lt;/returns&gt;
public static Tuple&lt;bool, T&gt; Execute&lt;T&gt;(Func&lt;T&gt; action, int timeout)
{
    var result = Tuple.Create(false, default(T));

    var tokenSource = new CancellationTokenSource();

    var token = tokenSource.Token;

    var task = Task.Factory.StartNew(() =&gt; { result = Tuple.Create(true, action.Invoke()); }, token);

    if (!task.Wait(timeout, token))
    {
        tokenSource.Cancel();
    }

    task.Dispose();

    return result;
}</pre>

Böylece değer döndürmeyen method'lar eğer **timeout**'a uğramışsa geriye *bool* tipinde **false** değeri, **timeout**'a uğramamışsa **true** değeri döndürebiliyoruz.

Geriye değer döndürecek method'lar eğer **timeout**'a uğramışsa geriye <a href="http://msdn.microsoft.com/library/system.tuple" title="Tuple Class" target="_blank">Tuple</a> sınıfından yeni bir değer döndürüyoruz. İki property'li *Tuple*'ın birinci property'si **timeout** olup/olmadığını belirten *bool* tipinde, ikinci property ise çağırılan method'dan dönecek cevabın tipinin *varsayılan* değeri.

Bu methodlar sayesinde *hatalar* veya uzun süren method'ların *kaynaklarımızı tüketmesi* sorunları ile uğraşmadan uygulamalarımızı geliştirebiliriz.

*Örnek kullanımlar;*

Geriye değer **döndürmeyen** method'ları aşağıdaki örnek kullanım ile çağırabiliriz

<pre class="brush:csharp">var result = Execute(LongRunningProcess, 3000);</pre>

Geriye değer **döndüren** method'ları (*örneğin int*) aşağıdaki örnek kullanım ile çağırabiliriz

<pre class="brush:csharp">var result = Execute&lt;int&gt;(LongRunningProcess, 5000);


