---
layout: post
title: "ionicframework ile cross-platform uygulama geliştirirken emulator kullanımı"
date: 2016-10-26 19:00
author: engin.polat
comments: true
category: [Cordova]
tags: [command prompt, cordova, css, debug, emulator, environment, html, html5, ionicframework, javascript, sass, scss, sensor, template, terminal, typescript, visual studio code]
---
<a href="http://ionicframework.com/" target="_blank" rel="noopener">ionicframework</a> ile **html**-**javascript**-**css** (hatta **typescript** ve **sass**) kullanarak **cross-platform** uygulama geliştirebiliyoruz.

**Cross-Platform** projemizi tamamen ücretsiz ve tüm platformlarda varolan **Visual Studio Code** editorü ile geliştirebiliyoruz.

**Visual Studio Code** ile geliştirdiğimiz <a href="http://ionicframework.com/" target="_blank" rel="noopener">ionicframework</a> projesini nasıl **debug** edebileceğimizi ve **emulator**'u nasıl kullanabileceğimizi inceleyeceğiz.

Öncelikle projeyi oluşturmak istediğimiz dizine **Command Prompt** (*Windows*) veya **Terminal** (*MacOS*, *Linux*) içerisinden gidelim ve aşağıdaki kodları çalıştıralım;

<script async defer src="https://gist.github.com/polatengin/7f60bab24ff427b8a399bd2681d700af.js?file=command.cmd"></script>

<img class="lazy img-responsive" data-src="/assets/uploads/2016/10/ionic-vscode-cordova-tools-0.png" />

Bu komutun şablonu;

<script async defer src="https://gist.github.com/polatengin/7f60bab24ff427b8a399bd2681d700af.js?file=command-template.cmd"></script>

Proje şablonu olarak aşağıdaki hazır template'lerden birini belirleyebilirsiniz;

*   <a href="https://github.com/driftyco/ionic-starter-blank" target="_blank" rel="noopener">blank</a>
*   <a href="https://github.com/driftyco/ionic-starter-tabs" target="_blank" rel="noopener">tabs</a>
*   <a href="https://github.com/driftyco/ionic-starter-sidemenu" target="_blank" rel="noopener">sidemenu</a>

Proje oluşturulduktan sonra **Visual Studio Code** ile ilgili dizini açalım ve projenin dosyalarını aşağıdaki gibi gördüğümüzden emin olalım;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/10/ionic-vscode-cordova-tools-1.png" />

Sol taraftaki panelden **Debug** butonuna tıklayalım ve **Debug Panel**'i açalım;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/10/ionic-vscode-cordova-tools-2.png" />

**Ayarlar** butonuna (**Debug Panel**'de gözüken *çark* simgeli buton) bastığımızda gelen **Select Environment** seçeneklerinden **Cordova** seçeneğini seçiyoruz.

<img class="lazy img-responsive" data-src="/assets/uploads/2016/10/ionic-vscode-cordova-tools-3.png" />

Böylece sistemimizde bulunan emulatorlerden istediğimiz bir tanesini seçerek ve *yeşil çalıştır* butonuna basarak projeyi **emulator** üzerinden **debug** etmeye başlayabiliriz;

<img class="lazy img-responsive" data-src="/assets/uploads/2016/10/ionic-vscode-cordova-tools-4.png" />

Projeyi **emulator** üzerinde **debug** etmeye başladığımız andan itibaren **Visual Studio Code** içerisinde **emulator**'ün çeşitli **sensor**lerine sahte sinyaller gönderebileceğimiz bir panel açılıyor.

Böylece istediğimiz **sensör**lere istediğimiz değerleri göndererek, farklı durumlarda uygulamamızın cihazda çalışmasını **simule** edebiliriz.

<img class="lazy img-responsive" data-src="/assets/uploads/2016/10/ionic-vscode-cordova-tools-5.png" />
