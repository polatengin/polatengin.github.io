---
layout: post
title: "C# Binary Search Tree örneği"
date: 2017-10-18 12:30
author: engin.polat
comments: true
category: [C#]
tags: [binary, search, tree, node, item, iteration, foreach, loop, root, child, sibling, parent, degree, path, dotnet, console, generic, array, params, balanced, list, orderby, skip, first, remove, insert, continue, comparer, default, compare, while]
---
<div class="alert alert-success" role="alert" style="margin: 10px 0px; display: block;">
Bu makalenin kodlarına <strong>Github</strong> üzerinde <a href="https://github.com/polatengin" class="alert-link" target="_blank" rel="noopener">polatengin</a> hesabımda yer alan <a href="https://github.com/polatengin/blog-codes/tree/master/csharp-bst" class="alert-link" target="_blank" rel="noopener">CSharp Binary Search Tree</a> aracılığıyla erişebilirsiniz.
</div>

Bu makale de gene *email* üzerinden aldığım bir soruyu cevaplayacağım.

<mark><em>Soru</em>, <em>C#</em> ile <strong>Binary Search Tree</strong> örneği nasıl geliştirebilirim?</mark>

Önce **Tree** (*Ağaç*) yapılarını inceleyelim.

**Tree** (*Ağaç*) yapıları ile, birbirleri arasında **Parent**-**Child** ilişkisi bulunan veriler modellenebiliyor.

*Örneğin*, bilgisayardaki *dizinler* ve *dosyalar*, ürün ağaçları, veya organizasyon şemaları, **Tree** (*Ağaç*) yapısında saklanırlar;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/10/binary-search-tree-0.png" width="334" height="638" />

<mark><strong>Tree</strong> (<em>Ağaç</em>) yapılarında, bir öğenin birden fazla alt öğesi olabilir</mark>

Hatta **Root** (*Kök*) öğe bile, gerekirse birden fazla olabilir.

**Tree** (*Ağaç*) veri yapılarına ilişkin tanımlamalar;

<ul>
<li>
<strong>Root</strong> (<em>Kök</em>)<br />
Ağacın başlangıç node'udur
</li>
<li>
<strong>Node</strong> (<em>Düğüm</em>)<br />
Ağacın her bir node'una verilen isimdir
</li>
<li>
<strong>Child</strong> (<em>Çocuk</em>)<br />
Bir node'a bağlı olan node'lara verilen isimdir
</li>
<li>
<strong>Parent</strong> (<em>Aile</em>)<br />
Node'ların bağlı olduğu node'a verilen isimdir
</li>
<li>
<strong>Sibling</strong> (<em>Kardeş</em>)<br />
Aynı node'a bağlı olan node'lara verilen isimdir
</li>
<li>
<strong>Degree</strong> (<em>Derece</em>)<br />
Bir node'dan başlayarak en alt node'a gidene kadar geçilen katman sayıdır
</li>
<li>
<strong>Path</strong> (<em>Yol</em>)<br />
Bir node'a varabilmek için izlenmesi gereken yola verilen isimdir
</li>
</ul>

**Binary Tree** (genellikle *İkili Ağaç* olarak Türkçeleştirilir) yapıları ise, **Root** (*Kök*) olarak tek bir elemana sahip olan ve her dalında en fazla *2* öğe bulunabilen özel bir **Tree** (*Ağaç*) veri modelidir.

<img class="lazy img-responsive" data-src="/assets/uploads/2017/10/binary-search-tree-1.png" width="492" height="236" />

Gelelim asıl konumuza, **Binary Search Tree** <em>:)</em>

**Binary Search Tree** yapıları, **Binary Tree** yapılarının özelleşmiş bir halidir.

**Root** (*Kök*) olarak gene tek bir *node*'a sahiptir, her *node*, kendisine bağlı en fazla 2 *node*'a sahip olabilir.

Bu noktaya kadar **Binary Tree** yapıları ile aynı özelliklere sahip, farklı olarak, *node*'lara bağlanan *child node*'ların içerdiği değerler, *parent node*'un kendi değerinden *küçükse* *soldaki*, *büyük* veya *eşitse* *sağdaki* *node*'a kaydedilir.

Böylece, **Tree** (*Ağaç*) yapısı üzerinde yapılacak aramalar çok hızlı sonuçlanacaktır.

**Tree** (*Ağaç*) yapısının **Degree** (*Derece*) değeri kaç ise, o kadar adımda aranan değere ulaşılabilir.

<img class="lazy img-responsive" data-src="/assets/uploads/2017/10/binary-search-tree-2.png" width="492" height="219" />

Yukarıdaki örnekte, *50* değerine *1* adımda, *72* değerine *2* adımda, *23* değerine *3* adımda, *67* değerine *4* adımda ulaşılabilecektir.

**Binary Search Tree** yapıları sayesinde, <code>int.Max</code> (*2^32* : *2.147.483.647*) kadar farklı değere sahip olan **Tree** (*Ağaç*) yapılarında bile arama işlemi *32* adımda sonuçlanacaktır.

**.Net Core** ile **Binary Search Tree** örneği geliştirmek için hemen yeni bir proje oluşturalım;

<script src="https://gist.github.com/polatengin/10279a044c0b672d5e14ea375b16422c.js?file=dotnet-new.cmd"></script>

İlk olarak <code>Node</code> sınıfını oluşturalım. Nispeten basit bir sınıf olacak;

<script src="https://gist.github.com/polatengin/10279a044c0b672d5e14ea375b16422c.js?file=Node.cs"></script>

<code>Value</code> özelliği sayesinde <code>int</code> tipinde değer içerebiliyor, ayrıca kendisine bağlanabilecek *2* <code>Node</code>'u, <code>Left</code> ve <code>Right</code> isimli özelliklerde tutabiliyor.

Fakat <code>int</code> yerine <code>string</code>, <code>DateTime</code> veya <code>Customer</code> tipli <code>Node</code>'lar oluşturmak istersek yeni <code>Node</code> sınıfları üretmemiz gerekir.

Daha iyisi, <code>Node</code> sınıfını **Generic** hale getirmek;

<script src="https://gist.github.com/polatengin/10279a044c0b672d5e14ea375b16422c.js?file=NodeOfT.cs"></script>

Artık <code>Tree</code> sınıfını yazabiliriz ve onu da **Generic** yapmakta fayda var;

<script src="https://gist.github.com/polatengin/10279a044c0b672d5e14ea375b16422c.js?file=TreeOfT.cs"></script>

<code>Tree</code> sınıfına yazdığımız <code>Top</code> özelliği sayesinde, **Tree** (*Ağaç*) yapısının başlangıç <code>Node</code>'unu tanımlamış olduk.

Aslında **Binary Search Tree** yapısını tamamlamış olduk. Fakat yeni <code>Node</code> eklemek, hatta ekranda listelemek için gereken method'ları da <code>Tree</code> sınıfına eklememiz iyi olacaktır.

<code>Node</code> eklemek için <code>Tree</code> sınıfına <code>Add()</code> methodu ekleyelim.

<code>Add()</code> methodu parametre olarak <code>T</code> tipinde değer alsın ve bu değere uygun bir yer bulup ekleme işlemini gerçekleştirsin.

<script src="https://gist.github.com/polatengin/10279a044c0b672d5e14ea375b16422c.js?file=AddWithT.cs"></script>

Hatta, <code>Add()</code> sınıfının <code>T</code> tipinde parametresini dizi şeklinde yapalım, böylece, istenirse aynı anda birden fazla değer ekleme işlemine tabi tutulabilir.

<script src="https://gist.github.com/polatengin/10279a044c0b672d5e14ea375b16422c.js?file=AddWithTArray.cs"></script>

Hatta, <code>T[]</code> tipindeki parametrenin başına <code>params</code> anahtar kelimesini ekleyebiliriz ve böylece <code>Add()</code> methodu çağırılırken değerler dizi şeklinde değil, virgülle ayrılmış şekilde de verilebilir.

<script src="https://gist.github.com/polatengin/10279a044c0b672d5e14ea375b16422c.js?file=AddWithParamsTArray.cs"></script>

**Binary Search Tree** yapısına ekleyeceğimiz <code>Node</code>'ları, mümkün olduğu kadar dengelememiz iyi olacaktır. Böylece, arama işlemi çok hızlı gerçekleşir.

*Dengeli* dağıtılan <code>Node</code> yapısına **Balanced Tree** adı verilir.

Eğer *dengeli* bir ağaç yapısı oluşturamazsak, <code>Node</code>'lar *sağlı-sollu* değil, *uç-uca* dizilecektir.

<img class="lazy img-responsive" data-src="/assets/uploads/2017/10/binary-search-tree-3.png" width="206" height="210" />

*Uç-Uca* dizilen <code>Node</code>'lar üzerinde arama yapılacağı zaman **Root** (*Kök*) <code>Node</code>'dan başlanıp, neredeyse tüm Node'lara uğranması gerekir.

*Dengeli* dizilen <code>Node</code>'lar üzerinde arama yapılacağı zaman ise, **Root** (*Kök*) <code>Node</code>'dan başlandığında, her seferinde ya <code>Left Node</code>, ya <code>Right Node</code> üzerinden devam edilerek, çok daha az <code>Node</code>'a uğranır.

**Binary Search Tree** yapısını **Balanced** (*Dengeli*) hale getirmek için, ekleyeceğimiz <code>Node</code>'ların tam orta noktasını **Root** (*Kök*) <code>Node</code> olarak belirlemeliyiz.

<code>Add()</code> methodunun içerisinde, parametre olarak gelen dizinin orta noktasını bulmak için, önce sıralıyor, sonra dizi uzunluğunun yarısı kadar elemanı atlıyor, karşımıza çıkan ilk elemanı seçiyoruz;

<script src="https://gist.github.com/polatengin/10279a044c0b672d5e14ea375b16422c.js?file=SelectMiddleItem.cs"></script>

Orta elemanı diziden çıkartıp, dizinin ilk elemanı olacak şekilde tekrar <code>Insert()</code> ediyoruz.

Artık dizi üzerinde bir döngü kurup, tüm <code>Node</code>'ları tek tek oluşturabiliriz;

<script src="https://gist.github.com/polatengin/10279a044c0b672d5e14ea375b16422c.js?file=ForEachLoop.cs"></script>

Burada dikkat edilmesi gereken noktalar,

<ul>
<li><code>Top</code> özelliğine dizinin ilk kaydını (dizinin orta elemanı aslında) vermemiz</li>
<li>Döngünün her <em>iteration</em>'ında dizi elemanını <code>Tree</code>'nin <code>Node</code>'ları ile karşılaştırıyoruz</li>
<li><code>Comparer&lt;T&gt;</code> sınıfının <code>Default</code> özelliğinde yer alan <code>Compare</code> methodu ile karşılaştırma yapıyoruz</li>
<li>Eğer karşılaştırma sonucunda <em>-1</em> değerini elde ediyorsak, daha küçük, <em>0</em> elde ediyorsak eşit, <em>1</em> elde ediyorsak daha büyük demektir</li>
<li>Karşılaştırma sonucuna göre ya <code>Left</code> ya da <code>Right</code> özelliği üzerinden ilerleyerek, <code>Tree</code>'ye <code>Node</code> eklemesi yapıyoruz</li>
</ul>

<script src="https://gist.github.com/polatengin/10279a044c0b672d5e14ea375b16422c.js?file=AddMethod.cs"></script>