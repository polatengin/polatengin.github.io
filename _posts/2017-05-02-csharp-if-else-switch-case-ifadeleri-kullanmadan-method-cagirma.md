---
layout: post
title: "C# if-else switch-case ifadeleri kullanmadan method çağırma"
date: 2017-05-02 22:30
author: engin.polat
comments: true
category: [C#]
tags: [if, else, switch, case, break, default, dictionary, action, key, containskey, values, delegate, pattern]
---
Geçtiğimiz yıl, geliştirilmesine *yardımcı* olduğum bir **e-ticaret sitesi** projesinde bir gün aşağıdaki gibi kodlar yazıyordum;

<script src="https://gist.github.com/polatengin/17d762ace4574f963bbe8291395a7938.js?file=switch-case.cs"></script>

Eminim benim gibi sizler de zaman zaman <code>if-else</code> blocklarını veya <code>switch-case</code> blocklarını yukarıdaki gibi kullanıyorsunuzdur.

*Yukarıdaki kodda yanlış bir durum gözükmese de*, ya <mark>biri birgün yeni bir arama methodu ekleyecek olsa?</mark> Hatta <mark>biri bir arama methodunu silmek istese?</mark>

İşte bu tip durumlarla karşılaşılabilir, bu durumu nasıl ortadan kaldırabilirim diye düşünerek, küçük egzersizler yapmaya başladım.

Sonunda aklıma şöyle bir fikir geldi;

<ul>
<li><a href="https://msdn.microsoft.com/library/xfhwa508" target="_blank" rel="noopener">Dictionary&lt;TKey, TValue&gt;</a> sınıfından bir değişken tanımlasam ve <code>Key</code> için <strong>SearchArea</strong>, <code>Value</code> için <a href="https://msdn.microsoft.com/library/system.action" target="_blank" rel="noopener">Action</a> tiplerini belirlesem</li>
<li>Bu değişkene istediğim <strong>SearchArea</strong> için istediğim <code>Action</code>'ları eklesem</li>
<li>Bir arama yapılacağı zaman <strong>SearchArea</strong>'a uygun <code>Action</code>'ları getirsem ve sırasıyla onları çağırsam?</li>
</ul>

Böylece istediğim **SearchArea** için bir veya daha fazla <code>Action</code> tanımlayabilir, onları çağırabilirim.

Nasıl fikir ama? :) <em>(O zaman farkına varmasam da <mark>Delegate Dictionary</mark> isminde bir pattern zaten varmış)</em>

Yukarıdaki adımların koda dökülmüş hali;

<script src="https://gist.github.com/polatengin/17d762ace4574f963bbe8291395a7938.js?file=delegate-pattern.cs"></script>

Sizce de daha güzel gözükmüyor mu? :)