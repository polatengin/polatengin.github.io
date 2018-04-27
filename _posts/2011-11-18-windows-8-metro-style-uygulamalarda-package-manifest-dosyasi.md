---
layout: post
title: "Windows 8 Metro Style Uygulamalarda Package Manifest Dosyası"
date: 2011-11-18 13:19
author: engin.polat
comments: true
category: [Windows]
tags: [application ui, appxmanifest, badge, capabilities, declarations, entry point, lock screen notification, logo, manifest, MetroUI, notification, package, packaging, start screen, tiles, toast, visual studio 2011, windows8]
---
**Visual Studio 2011** kullanarak yeni bir **Windows Metro Style** projesi başlattığımızda bizim için projeye otomatik olarak bir **manifest dosyası** eklenir.

**Manifest** dosyası *Package.appxmanifest* olarak isimlendirilir ve projenin **kök dizininde** konumlanır.

![](/assets/uploads/2011/11/PackageManifest-1.png "Visual Studio 2011 - Metro Style Application - Package Manifest")

Temelinde *XML formatında* olan bu dosyayı kolay güncellemek için **Visual Studio** ile birlikte gelen GUI aracını kullanabiliriz.

*Project* -> *Store* -> *Edit App Manifest* menüsünden erişebilieceğimiz arayüz sayesinde **manifest dosyasını** çok kolay güncelleyebiliriz. <a href="http://www.enginpolat.com/windows-8-metro-style-uygulamalarda-async-destegi/" title="Windows 8 Metro Style Uygulamalarda Async Desteği" target="_blank" rel="noopener">Windows 8 Metro Style Uygulamalarda Async Desteği</a> başlıklı makalemde oluşturduğumuz projenin **manifest dosyasına** biraz göz atalım.

**Application UI**

![](/assets/uploads/2011/11/PackageManifest-2.png "Visual Studio 2011 - Metro Style Application - Package Manifest - Application UI")

Bu tab'daki seçenekler ile uygulamamız ile ilgili temel bilgileri güncelleyebiliriz.

**Display Name : **Uygulamanın başlığı. *Start Screen* (*Başlangıç Ekranı*), *Arama Sonuçları Sayfası*, vs. kullanıcının uygulamayı göreceği her yerde bu başlık ile görüntülenecek

**Entry Point : **Uygulamanın açılışında kullanılacak sınıf'ın adı. <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.application" title="Application Class" target="_blank" rel="noopener">Windows.UI.Xaml.Application</a> sınıf'ından türetilmiş olması gerekiyor

**Description : **Uygulama ile alakalı daha uzun ve detaylı bilginin bulunabildiği açıklama alanı. 2048 karakter limiti vardır

**Tiles (Logo, Wide Logo and Small Logo) : **Uygulamanın ikonları

*Logo : *Start Screen'de (Başlangıç Ekranı) uygulamayı temsil edecek ikon

*Small Logo : *Listeleme modunda uygulamayı temsil edecek ikon

*Wide Logo : *Start Screen'de (Başlangıç Ekranı) Geniş Mod'da iken uygulamayı temsil edecek ikon

![](/assets/uploads/2011/11/PackageManifest-3.png "Small Logo")

![](/assets/uploads/2011/11/PackageManifest-4.png "Wide Logo")

**Show Name : **Uygulamanın *Start Screen*'deki (*Başlangıç Ekranı*) *Tile*'ında uygulamanın adı'nın görüntülenip/görüntülenmeyeceği seçeneği

**Short Name : **Eğer *Show Name* seçeneği *Yes* olarak ayarlanmış ise; Short Name boş iken *Display Name*, Short Name dolu iken *Short Name* bilgisi kullanılır

**Foreground Text : **Uygulama başlığının *Tile*'da gösterilecek rengi. *Light* (*Açık*) veya *Dark* (*Koyu*) seçeneklerinden biri olabilir

**Background Color : **Uygulama'nın *Tile* arkaplan rengi

**Notifications : **Yeni gelen *Notication Service*'in kullanımı ile ilgili seçenekler

**Badge Logo : ***Lock Screen*'de (*Windows Oturum Açma Ekranı*) uygulamanın bildirimleri göstereceği ikon

**Toast Capable : **Uygulamanın bildirim gösterip/göstermeyeceği seçeneği

**Lock Screen Notifications : ***Lock Screen*'de (*Windows Oturum Açma Ekranı*) uygulamanın hangi tip bildirim gösterebileceği seçeneği. *Badge*, *Tile Text*, *Badge and Tile Text* seçeneklerinden biri olabilir

**Splash Screen : **Uygulamanın açılışı sırasında gösterilen karşılama ekranı ile ilgili seçenekler

**Splash Screen : **Uygulamanın açılış ekran görseli

**Background Color : **Uygulama açılış ekranının arkaplan rengi

![](/assets/uploads/2011/10/41.png "Windows 8 Uygulama Başlangıç Ekranı")

**Initial Rotation : **Uygulamanın başlangıç yönü. *Portrait*, *Landscape*, *Portrait and Flipped*, *Landscape and Flipped* seçeneklerinden biri olabilir

**Capabilities**

![](/assets/uploads/2011/11/PackageManifest-5.png "Visual Studio 2011 - Metro Style Application - Package Manifest - Capabilities")

**Windows 8** üzerinde çalışan uygulamalar erişmek isteyecekleri kaynakları (*İnternet*, *SMS*, *Webcam*, *Mikrofon*, vs.) manifest dosyasında belirtmeliler. *Manifest dosyasında* belirtilmeyen kaynaklara erişim **engellenmiştir**.

Uygulama *Manifest dosyasında* ilgili kaynaklara erişeceğini bildirmiş olsa dahi, donanım eksikliğinden (*WebCam'in olmaması*, *Mikrofon'un olmaması*, vs.) dolayı bu kaynaklara **erişemeyebilir**.

**Windows 8** uygulamaları kurulum esnasında kullanıcıya gösterilen bir ekran aracılığıyla hangi kaynaklara ihtiyaç duyacağını belirtir. Kullanıcı bu ekranda kaynaklara erişilmesine **izin vermeyebilir**.

**Declarations**

![](/assets/uploads/2011/11/PackageManifest-6.png "Visual Studio 2011 - Metro Style Application - Package Manifest - Declarations")

**Declarations**, uygulamanın *İşletim Sistemine* (*OS*) kendini tanıttığı **genişletme noktalarından** biridir. **Declarations** aracılığıyla, uygulama kendisini Arama noktalarından biri olarak (*Search Provider*), Paylaşım noktalarından biri olarak (*Sosyal paylaşım uygulamaları*), vs. tanıtabilir.

**Packaging**

![](/assets/uploads/2011/11/PackageManifest-7.png "Visual Studio 2011 - Metro Style Application - Package Manifest - Packaging")

**Packaging** tab'ı uygulamanın paketlenmesi ve yayınlanması ile ilgili seçenekleri içerir

**Package Name : **Paket'in ve dolayısıyla uygulamanın benzersiz adı, <a href="http://msdn.microsoft.com/library/system.guid" title="Guid Class" target="_blank" rel="noopener">Guid</a> formatındadır.

**Package Display Name : **Paket'in kullanıcılar tarafından görülebilen ismidir

**Logo : **Uygulamanın *Windows Store* (*Windows Uygulama Market'i*) üzerinde gözüken ikonu

**Publisher : **Uygulama geliştiriciye ait sertifika üzerinden otomatik olarak doldurulur. Her geliştirici, kendi sertifikası aracılığıyla uygulamasını imzalar

**Publisher Display Name : **Uygulama geliştiriciye ait sertifika üzerinden otomatik olarak doldurulur

**Package Family Name : **Uygulama geliştiriciye ait sertifika üzerinden otomatik olarak doldurulur

