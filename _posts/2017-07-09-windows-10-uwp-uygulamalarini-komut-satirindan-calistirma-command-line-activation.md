---
layout: post
title: "Windows 10 UWP uygulamalarını komut satırından çalıştırma (Command Line Activation)"
date: 2017-07-09 11:00
author: engin.polat
comments: true
category: [Windows]
tags: [command, app, execution, alias, extension, package, appxmanifest, onactivated, method, activationkind, commandlineactivatedeventargs, operation, ]
---
Eski nesil Windows uygulamaları (*Win32*) ile yeni nesil Windows uygulamaları (*UWP*) arasında en önemli farklardan biri komut satırından etkinleştirme eksikliği idi.

Komut satırı üzerinden etkinleştirme eksikliğinden dolayı, *UWP* uygulamalarını komut satırına *notepad.exe* yazıp çalıştırır gibi çalıştıramıyorduk. *UWP* uygulamaları sadece *Başlat Menüsü* kısayolu üzerinden çalıştırılabiliyordu.

Haliyle parametre alarak ve ilgili parametre üzerinden başlatılabilme yeteneğine de sahip olamıyorlardı.

<mark><em>Windows 10 Insider 16226</em> sürümünden itibaren UWP projelerine <a href="https://docs.microsoft.com/en-us/windows/uwp/porting/desktop-to-uwp-extensions" target="_blank" rel="noopener">App Execution Alias Extension</a> ekleyerek bir komut satırı uzantısına sahip olmaları sağlanabiliyor.</mark>

Uygulamamıza bu özelliği katmak aslında çok kolay, hemen *Visual Studio*'yu açalım ve *CommandLineActivationProject* isminde bir **UWP** projesi oluşturalım;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/07/commandlineactivation-0.png" />

Yapmamız gereken iki adım var;

<ul>
<li><a href="https://docs.microsoft.com/en-us/uwp/schemas/appxpackage/uapmanifestschema/schema-root" target="_blank" rel="noopener">Package.appxmanifest</a> dosyasına <code>appExecutionAlias</code> *extension* eklenmeli</li>
<li><mark>App.xaml.cs</mark> dosyasına <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.application#Windows_UI_Xaml_Application_OnActivated_Windows_ApplicationModel_Activation_IActivatedEventArgs_" target="_blank" rel="noopener">OnActivated()</a> methodu eklenmeli</li>
</ul>

Sırayla bu adımları gerçekleştirelim;

Öncelikle <mark>Package.appxmanifest</mark> dosyasını açalım ve <code>Extension</code>'lar içerisine <code>AppExecutionAlias</code> ekleyelim

*Burada önemli nokta, <code>Alias</code> **attribute**'une verdiğimiz değer ile uygulamamıza komut satırından erişilecek olması*

<script src="https://gist.github.com/polatengin/c1ad7854c1db74988f7b06c8345b0cf3.js?file=Package.appxmanifest"></script>

Şimdi yapmamız gereken, <mark>App.xaml.cs</mark> dosyasını açmak ve içerisine <code>OnActivated()</code> methodunu eklemek.

<script src="https://gist.github.com/polatengin/c1ad7854c1db74988f7b06c8345b0cf3.js?file=App.xaml.cs"></script>

<code>OnActivated()</code> methodunun aldığı <mark>args</mark> parametresinin <a href="https://docs.microsoft.com/uwp/api/Windows.ApplicationModel.Activation.IActivatedEventArgs#Windows_ApplicationModel_Activation_IActivatedEventArgs_Kind">Kind</a> özelliği eğer <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivatedeventargs">ActivationKind.CommandLineLaunch</a> değerine sahipse, demek ki uygulama komut satırından çalıştırılmıştır.

<mark>args</mark> parametresini <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivatedeventargs" target="_blank" rel="noopener">CommandLineActivatedEventArgs</a> tipine **unbox** edip, <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivatedeventargs#Windows_ApplicationModel_Activation_CommandLineActivatedEventArgs_Operation" target="_blank" rel="noopener">Operation</a> özelliği aracılığı ile komut satırından çalıştırılan uygulamamıza geçilen parametreleri yakalayabiliyoruz.

<img class="lazy img-responsive" data-src="/assets/uploads/2017/07/commandlineactivation-1.png" />

Örnek ekran görüntüsü ise aşağıdaki gibi olacaktır;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/07/commandlineactivation-2.png" />

<small>Bu makale <a href="https://blogs.windows.com/buildingapps/2017/07/05/command-line-activation-universal-windows-apps/" target="_blank" rel="noopener">Command-Line Activation of Universal Windows Apps</a> makalesi baz alınarak yazılmıştır :)</small>
