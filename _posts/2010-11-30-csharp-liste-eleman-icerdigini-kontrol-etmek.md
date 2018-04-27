---
layout: post
title: "C# Liste'nin eleman içerdiğini kontrol etmek"
date: 2010-11-30 22:56
author: engin.polat
comments: true
category: [C#]
tags: [any, bool, collection, count, Enumerable, extensionmethod, generic, ICollection, IEnumerable, interface, IQueryable, isnullorempty, linq, method, MoveNext, namespace, null, optimize, parameter, static, system.linq]
---
Aşağıdaki kod parçasına, **programlama** üzerine yazılmış bir makaleyi okurken rastladım;



public void IsNullOrEmpty&lt;T&gt;(IEnumerable&lt;T&gt; koleksiyon)
{
    if (koleksiyon == null || koleksiyon.Count() == 0)
    {
        /// Koleksiyon'da hiç eleman yok
        /// Koleksiyon boş
    }
}</pre>

Yukarıdaki **method** <a href="http://msdn.microsoft.com/library/system.collections.ienumerable" target="_blank" rel="noopener">IEnumerable</a> **generic** tipinde **parametre** alıyor, <a href="http://msdn.microsoft.com/library/edakx9da.aspx" target="_blank" rel="noopener">null</a> veya boş olup/olmadığını kontrol ediyor.

Karşılaştırmada kullanılan,

<pre class="brush:csharp">Liste.Count() == 0</pre>

kod parçası dikkatimi çekti.

Eğer <a href="http://msdn.microsoft.com/library/system.string.isnullorempty" target="_blank" rel="noopener">IsNullOrEmpty</a> fonksiyonuna **parametre** olarak <a href="http://msdn.microsoft.com/library/system.collections.icollection" target="_blank" rel="noopener">ICollection&lt;T&gt;</a> **interface**'ini **implemente** *etmeyen* tipten bir değer gönderecek olursak (mesela **LINQ sorgusu** sonucu olarak <a href="http://msdn.microsoft.com/library/system.linq.iqueryable" target="_blank" rel="noopener">IQueryable</a>) <a href="http://msdn.microsoft.com/library/system.linq.enumerable.count" target="_blank" rel="noopener">Count</a> method'u **tüm liste üzerinde satır-satır ilerleyerek** listedeki *eleman adedini* hesaplayacaktır.

Eğer fonksiyona parametre olarak <a href="http://msdn.microsoft.com/library/system.collections.ienumerable" target="_blank" rel="noopener">IEnumerable</a> **interface**'ini **implemente** *eden* tipten bir değer gönderecek olursak, <a href="http://msdn.microsoft.com/library/system.linq.enumerable.count" target="_blank" rel="noopener">Count</a> method'u, **optimize** edilmiş haliyle, sadece koleksiyonun **Count özelliğini** sorgulayacaktır.

Türkçe ifadesiyle; "*Koleksiyonda eleman var mı?*" sorusu yerine "*Koleksiyon'da sıfır eleman mı var?*" sorusunu sormuş oluyoruz.

Aslında çözüm basit, <a href="http://msdn.microsoft.com/library/system.linq" target="_blank" rel="noopener">System.Linq</a> **namespace**'inde yeralan <a href="http://msdn.microsoft.com/en-us/library/bb337697.aspx" target="_blank" rel="noopener">Any</a> **extension method**'unu kullanmamız gerekiyor;

<pre class="brush:csharp">public void Test&lt;T&gt;(IEnumerable&lt;T&gt; koleksiyon)
{
    if (koleksiyon == null || !koleksiyon.Any())
    {
        /// Koleksiyon'da hiç eleman yok
        /// Koleksiyon boş
    }
}</pre>

Bu yöntemin güzelliği, **IEnumerable** **interface**'inin <a href="http://msdn.microsoft.com/library/system.collections.ienumerator.movenext" target="_blank" rel="noopener">MoveNext</a> methodunu sadece bir kere çağırması. Koleksiyonda bulunan *eleman adedi* ne olursa olsun, **Any** methodu sonucu **çok hızlı** birşekilde döndürecektir.

Hatta kendi **extension method**'umuzu da **Any** methodunu kullanarak yazabiliriz;

<pre class="brush:csharp">public static bool IsNullOrEmpty&lt;T&gt;(this IEnumerable&lt;T&gt; koleksiyon)
{
    return koleksiyon == null || !koleksiyon.Any();
}</pre>

Artık **extension method**'u da yazdığımıza göre, **asıl method**'u iyileştirebiliriz;

<pre class="brush:csharp">public void Test&lt;T&gt;(IEnumerable&lt;T&gt; koleksiyon)
{
    if (koleksiyon.IsNullOrEmpty())
    {
        /// Koleksiyon'da hiç eleman yok
        /// Koleksiyon boş
    }
}


