---
layout: post
title: "Windows Phone uygulaması ile ekran görüntüsü almak"
date: 2014-05-25 00:10
author: engin.polat
comments: true
category: [Windows]
tags: [createdirectory, createfile, directoryexists, getuserstoreforapplication, isolatedstoragefile, memorystream, render, rootvisual, savejpeg, screenshot, translatetransform, windows phone, wp8, writeablebitmap]
---
Bazı durumlarda **Windows Phone** için geliştirdiğimiz uygulamanın o andaki *ekran görüntüsünü* almamız gerekebilir, örneğin bir hata oluştuğu andaki ekran görüntüsü ilgili alanlara girilmiş verileri görebilmeyi sağlayacağı için çok kullanışlı olacaktır.

Aşağıdaki *CaptureScreen()* method'u her çağırıldığında ekran görüntüsü alınacak ve *ekrangoruntuleri* dizinine o anın dosya adı ile kaydedilecek;

<script src="https://gist.github.com/polatengin/91b9c640f842f28dfd5537fce14c5606.js?file=CaptureScreen.cs"></script>

İlk olarak <a href="http://msdn.microsoft.com/library/system.windows.media.translatetransform" title="TranslateTransform Class" target="_blank" rel="noopener">TranslateTransform</a> sınıfından yeni bir değişken oluşturuyoruz.

Ekran görüntüsü alacağımız nesneyi belirlediğimiz ikinci satırda <a href="http://msdn.microsoft.com/library/system.windows.application.rootvisual" title="Application.RootVisual Property" target="_blank" rel="noopener">Application.Current.RootVisual</a> özelliğini kullanarak ekranın tamamının görüntüsünün alınmasını sağlıyoruz.

Öncelikle bir <a href="http://msdn.microsoft.com/library/system.windows.media.imaging.writeablebitmap" title="WriteableBitmap Class" target="_blank" rel="noopener">WritableBitmap</a> değişkeni oluşturuyoruz ve *RootVisual* özelliği sayesinde tüm ekranın bu değişkene <a href="http://msdn.microsoft.com/library/system.windows.media.imaging.writeablebitmap.render" title="WriteableBitmap.Render Method" target="_blank" rel="noopener">Render</a> edilmesini sağlıyoruz.

<a href="http://msdn.microsoft.com/library/system.io.memorystream" title="MemoryStream Class" target="_blank" rel="noopener">MemoryStream</a> tipinde yeni bir değişken oluşturarak *WriteableBitmap* değişkenimizin içeriğini hafızaya taşıyoruz.

<a href="http://msdn.microsoft.com/library/system.io.isolatedstorage.isolatedstoragefile" title="IsolatedStorageFile Class" target="_blank" rel="noopener">IsolatedStorageFile</a> sınıfının <a href="http://msdn.microsoft.com/library/system.io.isolatedstorage.isolatedstoragefile.getuserstoreforapplication" title="IsolatedStorageFile.GetUserStoreForApplication Method" target="_blank" rel="noopener">GetUserStoreForApplication()</a> methodunu kullanarak uygulamamıza ait olan disk alanına erişiyoruz ve *ekrangoruntuleri* isminde bir dizin olup/olmadığını <a href="http://msdn.microsoft.com/library/system.io.isolatedstorage.isolatedstoragefile.directoryexists" title="IsolatedStorageFile.DirectoryExists Method" target="_blank" rel="noopener">DirectoryExists()</a> methodu ile kontrol ediyoruz.

Eğer dizini bulamazsak <a href="http://msdn.microsoft.com/library/system.io.isolatedstorage.isolatedstoragefile.createdirectory" title="IsolatedStorageFile.CreateDirectory Method" target="_blank" rel="noopener">CreateDirectory()</a> methodunu kullanarak ilgili dizini oluşturuyoruz.

Son olarak <a href="http://msdn.microsoft.com/library/system.io.isolatedstorage.isolatedstoragefile.createfile" title="IsolatedStorageFile.CreateFile Method" target="_blank" rel="noopener">CreateFile()</a> methodu ile *ekrangoruntuleri* dizininde yeni bir dosya oluşturuyoruz ve *MemoryStream* değişkenindeki görüntüyü kaydediyoruz.