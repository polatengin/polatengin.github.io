---
layout: post
title: "Generic Dictionary sınıfına karıştırıcı (shuffle) Extension Method yazalım"
date: 2011-10-03 15:02
author: engin.polat
comments: true
category: [C#]
tags: [add, class, dictionary, extension, extensionmethod, for, generic, int, karıştır, karıştırma, list, next, orderby, random, shuffle, static, string, todictionary]
---
Winamp MP3 oynatıcısında çalma listesini (playlist) rastgele sıra ile karıştırabiliyorsunuz. Benzer özelliği kendi projelerimizde uygulamak isteyebiliriz.

Daha önce, <a href="http://www.enginpolat.com/csharp-ile-dizi-karistirma/" title="C# ile Dizi Karıştırma" target="_blank">C# ile Dizi Karıştırma</a> yazısında bir dizi'yi (<a href="http://msdn.microsoft.com/en-us/library/6sh2ey19.aspx" title="Listt&lt;T&gt; Generic Class" target="_blank">List&lt;T&gt;</a>) nasıl karıştıracağımızı incelemiştik.

Bu yazı ile **Karıştırma** (**Shuffle**) yeteneğini **Generic Dictionary** (<a href="http://msdn.microsoft.com/en-us/library/xfhwa508.aspx" title="Dictionary&lt;TKey, TValue&gt; Generic Dictionary" target="_blank">Dictionary&lt;TKey, TValue&gt;</a>) ekleyeceğimizi inceleyeceğiz.

İlk olarak, *ExtensionManager* isminde **static** bir **sınıf** oluşturalım;



public static class ExtensionManager
{
    public static Dictionary&lt;TKey, TValue&gt; Shuffle(this Dictionary&lt;TKey, TValue&gt; liste)
    {
        Random r = new Random();
        return liste.OrderBy(x => r.Next()).ToDictionary(item => item.Key, item => item.Value);
    }
}</pre>

*ExtensionManager* sınıfının **Shuffle()** isminde bir method'u var.

Bu method, <a href="http://msdn.microsoft.com/library/system.random" title="Random Sınıfı" target="_blank">Random</a> sınıfından yeni bir **instance**'ın <a href="http://msdn.microsoft.com/library/system.random.next" title="Random Sınıfının Next Methodu" target="_blank">Next()</a> method'unu kullanarak, liste değişkeninin her bir elemanını **rastgele** bir değerle sıralıyor.

Böylece, **Shuffle()** method'u her çağırıldığında liste değişkeninin elemanlarının **rastgele** sıralandığını görüyoruz.

*Örnek Kullanım;*

<pre class="brush:csharp">Dictionary&lt;int, string&gt; liste = new Dictionary&lt;int, string&gt;();

for (int iLoop = 0; iLoop &lt; 5; iLoop++)
{
    liste.Add(iLoop, "Eleman " + iLoop);
}
//0, Eleman 0
//1, Eleman 1
//2, Eleman 2
//3, Eleman 3
//4, Eleman 4

Dictionary&lt;int, string&gt; karistirilmis = liste.Shuffle();
//2, Eleman 2
//1, Eleman 1
//3, Eleman 3
//0, Eleman 0
//4, Eleman 4


