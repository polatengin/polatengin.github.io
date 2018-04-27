---
layout: post
title: "Windows Phone 8 ile WebClient sınıfında async kullanımı"
date: 2012-12-13 10:56
author: engin.polat
comments: true
category: [Programlama]
tags: [async, await, class, downloadstringasync, downloadstringcompleted, extensionmethod, İnternet, pattern, public, return, setexception, setresult, static, string, task, taskcompletionsource, void, webclient, webrequest, windows phone, wp8]
---
İnternet üzerinden veri indirmeden **Windows Phone 8** ile uygulama geliştirmek genellikle pek beklenmez.

**async** ve **await** anahtar kelimeleri hayatımıza girdikten sonra internetten veri indirmek gibi uzun sürebilecek işleri *asenkron* yapmaya başladık.

Fakat <a href="http://msdn.microsoft.com/library/system.net.webrequest" title="WebRequest Class" target="_blank" rel="noopener">WebRequest</a> ve <a href="http://msdn.microsoft.com/library/system.net.webclient" title="WebClient Class" target="_blank" rel="noopener">WebClient</a> sınıflarında **async**/**await** *pattern*'inin eksikleri hissediliyor.

Örneğin *WebClient* sınıfının <a href="http://msdn.microsoft.com/library/system.net.webclient.downloadstringasync" title="WebClient Class DownloadStringAsync Method" target="_blank" rel="noopener">DownloadStringAsync</a> method'unu inceleyelim;



public void DownloadStringAsync(Uri address);</pre>

Gördüğümüz gibi, geriye <a href="http://msdn.microsoft.com/library/system.threading.tasks.task" title="Task Class" target="_blank" rel="noopener">Task</a> veya <a href="http://msdn.microsoft.com/library/dd321424.aspx" title="Task&lt;T&gt; Class" target="_blank" rel="noopener">Task&lt;T&gt;</a> tipinde sonuç döndürmüyor.

Bu yüzden bu method'u **await** anahtar kelimesi ile kullanamıyoruz;

<pre class="brush:csharp">WebClient wc = new WebClient();
await wc.DownloadStringAsync(new Uri("http://www.enginpolat.com"));</pre>

Daha derleme esnasında

<pre class="brush:csharp">// Cannot await "void"</pre>

hatası alırız.

Fakat aşağıdaki sınıfı ve extension method'u kullanarak *WebClient* sınıfına *Task&lt;T&gt;* sonuç döndüren method ekleyebiliriz;

<pre class="brush:csharp">public static class Extensions
{
    public static Task&lt;string&gt; DownloadStringTask(this WebClient client, Uri uri)
    {
        var tcs = new TaskCompletionSource&lt;string&gt;();

        client.DownloadStringCompleted += (s, e) =>
        {
            if (e.Error != null)
            {
                tcs.SetException(e.Error);
            }
            else
            {
                tcs.SetResult(e.Result);
            }
        };

        client.DownloadStringAsync(uri);

        return tcs.Task;
    }
}</pre>

Örnek kullanım;

<pre class="brush:csharp">WebClient wc = new WebClient();
return await wc.DownloadStringTask(new Uri("http://www.enginpolat.com"));


