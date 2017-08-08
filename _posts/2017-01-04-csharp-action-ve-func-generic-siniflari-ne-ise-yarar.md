---
layout: post
title: "C# Action ve Func Generic sınıfları ne işe yarar?"
date: 2017-01-04 20:30
author: engin.polat
comments: true
category: [C#]
tags: [csharp, action, func, class, generic]
---
Bu makalede <strong>C#</strong> projelerimizde kullandığımız <code>Action&lt;T&gt;</code> ve <code>Func&lt;TParam, TReturn&gt;</code> sınıfları ne işe yarar sorusunun cevabını arayacağız.

En basit anlatımı ile <code>Action&lt;T&gt;</code> ve <code>Func&lt;TParam, TReturn&gt;</code> sınıfları <code>delegate method</code> gibi davranır.

Yani <code>Action&lt;T&gt;</code> veya <code>Func&lt;TParam, TReturn&gt;</code> sınıfından yeni bir değişken oluşturup, değer olarak bir method'un kendisini atayabiliriz.

Böylece değişkeni her tetiklediğimizde aslında *değer olarak atadığımız method*'u tetiklemiş oluruz.

Hatta parametreleri uyduğu sürece değişkene atadığımız methodu başka bir method ile de değiştirebiliriz.

<code>Action&lt;T&gt;</code> ve <code>Func&lt;TParam, TReturn&gt;</code> sınıfları parametre alabilirde, almayabilirde. Yani sıfır veya daha fazla parametre alabilirler.

Aralarındaki fark ise, <code>Action&lt;T&gt;</code> geriye değer döndürmez iken, <code>Func&lt;TParam, TReturn&gt;</code> geriye değer döndürür.

Örneğin;

<script src="https://gist.github.com/polatengin/46c8cec02f19d8cf4a0b93e219971350.js?file=Program.cs"></script>

Önemli nokta; <code>Action&lt;T&gt;</code> sınıfından değişkene vereceğiniz method'un aldığı parametreler, <code>Action&lt;T&gt;</code> sınıfının generic parametreleri ile örtüşmeli.

Örneğin;

<script src="https://gist.github.com/polatengin/46c8cec02f19d8cf4a0b93e219971350.js?file=ActionParameters.cs"></script>

Ayrıca, <code>Func&lt;TParam, TReturn&gt;</code> sınıfından oluşturduğumuz değişkene atadığımız method'un parametreleri <code>TParam</code> **generic** parametreleri ile ve dönüş tipi <code>TReturn</code> **generic** parametresi ile örtüşmeli.

Örneğin;

<script src="https://gist.github.com/polatengin/46c8cec02f19d8cf4a0b93e219971350.js?file=FuncParameters.cs"></script>