---
layout: post
title: ".Net Core projelerine referans ve Nuget paketi eklemek"
date: 2017-06-14 10:30
author: engin.polat
comments: true
category: [Web]
tags: [dotnet, csharp, net-core, aspnetcore, nuget, reference, package]
---
Bu makaleyi aslında kendime not oluşturmak için yazıyorum :)

<code>.Net Core</code> ve <code>Asp.Net Core</code> projelerine bir **Nuget** paketi eklemek için **Visual Studio**'yu açıp, *Solution Explorer*'da **Dependencies** üzerine sağ tuşla tıklamak ve **Manage Nuget Packages** menüsünü seçmek yeterli. Böylece açılan ekrandan istediğimiz paketi aratıp projemize ekleyebiliriz.

Fakat sizler de benim gibi <code>Visual Studio</code> yerine <code>Visual Studio Code</code> kullanmayı tercih ediyorsanız, ne yazık ki **Nuget** paketi eklemek için <code>Visual Studio</code>'yu açmak gereksiz gelecektir.

Aslında komut satırı aracılığıyla (*Visual Studio Code* içerisinde gelen *Terminal* pencereside olur) aşağıdaki kodu çalıştırmamız yeterli;

<script src="https://gist.github.com/polatengin/9cf617528741f53e55ec0c8715fc21e8.js?file=dotnet-cli-add-package.cmd"></script>

Eğer projeye bir **Nuget** paketi değil, *başka bir projeyi* **referans** olarak eklemek istiyorsak, aşağıdaki kodu çalıştırabiliriz;

<script src="https://gist.github.com/polatengin/9cf617528741f53e55ec0c8715fc21e8.js?file=dotnet-cli-add-reference.cmd"></script>