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

Çağırılan method'un belli bir **zaman aşımı süresine** sahip olması ve bu süre sonuna kadar değer üretmediyse **sonlanması** için birçok yöntem kullanabiliriz, fakat ben <a href="http://msdn.microsoft.com/library/system.threading" title="System.Threading Namespace" target="_blank" rel="noopener">System.Threading</a> *namespace*'inde yeralan <a href="http://msdn.microsoft.com/library/system.threading.cancellationtokensource" title="CancellationTokenSource Class" target="_blank" rel="noopener">CancellationTokenSource</a> sınıfını kullanan aşağıdaki yöntemi tercih ediyorum;

<script src="https://gist.github.com/polatengin/28cfed0e33b4bbbfb3c4587039ea2863.js?file=LongRunningTasksExecute.cs"></script>

Böylece değer döndürmeyen method'lar eğer **timeout**'a uğramışsa geriye *bool* tipinde **false** değeri, **timeout**'a uğramamışsa **true** değeri döndürebiliyoruz.

Geriye değer döndürecek method'lar eğer **timeout**'a uğramışsa geriye <a href="http://msdn.microsoft.com/library/system.tuple" title="Tuple Class" target="_blank" rel="noopener">Tuple</a> sınıfından yeni bir değer döndürüyoruz. İki property'li *Tuple*'ın birinci property'si **timeout** olup/olmadığını belirten *bool* tipinde, ikinci property ise çağırılan method'dan dönecek cevabın tipinin *varsayılan* değeri.

Bu methodlar sayesinde *hatalar* veya uzun süren method'ların *kaynaklarımızı tüketmesi* sorunları ile uğraşmadan uygulamalarımızı geliştirebiliriz.

*Örnek kullanımlar;*

Geriye değer **döndürmeyen** method'ları aşağıdaki örnek kullanım ile çağırabiliriz

<pre class="brush:csharp">var result = Execute(LongRunningProcess, 3000);</pre>

Geriye değer **döndüren** method'ları (_örneğin_ `int`) aşağıdaki örnek kullanım ile çağırabiliriz

<pre class="brush:csharp">var result = Execute&lt;int&gt;(LongRunningProcess, 5000);</pre>
