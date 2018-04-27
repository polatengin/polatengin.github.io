---
layout: post
title: "Universal App Nokia Imaging SDK kütüphanelerinin eklenmesi"
date: 2014-08-07 09:30
author: engin.polat
comments: true
category: [Windows]
tags: [active solution platform, any cpu, configuration manager, nokia, nokia imaging sdk, nuget, reference, solution explorer, universal app, x64]
---
<a href="http://developer.nokia.com/" title="Nokia Developer" target="_blank" rel="noopener">Nokia Developer</a> sitesinde yeralan <a href="http://developer.nokia.com/resources/library/Lumia/nokia-imaging-sdk/adding-libraries-to-the-project.html" title="Nokia Imaging SDK : Adding libraries to the project" target="_blank" rel="noopener">Adding libraries to the project</a> makalesinde **Universal App** projesine **Nokia Imaging SDK** kütüphanelerinin nasıl ekleneceği anlatılmış. Yönergeleri adım adım izleyelim.

Öncelikle bir **Universal App** projesi oluşturmamız veya açmamız lazım;

![](/assets/uploads/2014/08/NokiaImagingSDK-0.jpg)

Projenin **Solution Explorer** panelinde görünen **References** kısmına sağ tuşla tıklamalı ve **Manage Nuget Packages** menüsünü seçmeliyiz.

![](/assets/uploads/2014/08/NokiaImagingSDK-1.png)

*Online* kategorisi altından **Nokia Imaging SDK** paketini aratarak bulmalı ve *Install* butonuna tıklayarak projemize eklemeliyiz.

![](/assets/uploads/2014/08/NokiaImagingSDK-2.png)

Ben bu yazıyı yazarken **Nokia Imaging SDK**, *Any CPU* ve *x64* derlemeler ile uyumsuz olduğu için *Build Configurations* altından *Any CPU* ve *x64* seçeneklerini kaldırmamız gerekiyor. Öncelikle *solution*'a sağ tuşla tıklayalım ve **Configuration Manager** menüsünü seçelim.

![](/assets/uploads/2014/08/NokiaImagingSDK-3.png)

**Active Solution Platform** kısmında *Edit* seçeneğini seçelim ve açılan pencerede **Any CPU** ve **x64** seçeneklerini *Remove* butonuna tıklayarak kaldıralım.

![](/assets/uploads/2014/08/NokiaImagingSDK-4.png)

Artık projemiz **Nokia Imaging SDK** referansına sahip ve geliştirme yapmaya başlayabiliriz.

