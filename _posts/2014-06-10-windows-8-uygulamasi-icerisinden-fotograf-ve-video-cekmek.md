---
layout: post
title: "Windows 8 uygulaması içerisinden fotoğraf ve video çekmek"
date: 2014-06-10 21:30
author: engin.polat
comments: true
category: [C#]
tags: [appbar, appxmanifest, async, await, bottomappbar, button, cameracaptureui, cameracaptureuimode.photo, cameracaptureuimode.video, capabilities, capturefileasync, copyandreplaceasync, createcollisionoption, createfileasync, guid, knownfolders, mainpage, newguid, package, permission, pictures library, pictureslibrary, replaceexisting, routedeventargs, stackpanel, staticresource, storage, style, videos library, webcam, windows store, windows8, xaml]
---
**Windows Store** için geliştireceğimiz uygulama içerisinden *fotoğraf* ve *video* çekecek ve *Fotoğraflar* ve *Videolar* dizinlerine kaydedeceğiz.

Yeni oluşturduğumuz projenin *Package.appxmanifest* dosyasını açıyor ve *Capabilities* tabında yeralan *Webcam*, *Videos Library*, *Pictures Library* kutucuklarını işaretliyoruz. Böylece uygulamamızın çalışırken ihtiyaç duyacağı yetkileri kullanıcıdan talep edilmesini sağlıyoruz.

*MainPage.xaml* dosyasını açarak içerisine aşağıdaki **xaml** kodlarını ekleyelim ve ekranın altında bir <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.appbar" title="AppBar Class" target="_blank" rel="noopener">AppBar</a> gözükmesini, içerisinde bir adet <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.stackpanel" title="StackPanel Class" target="_blank" rel="noopener">StackPanel</a> iki adette <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.button" title="Button Class" target="_blank" rel="noopener">Button</a> olmasını sağlayalım;



&lt;Page.BottomAppBar&gt;
    &lt;AppBar&gt;
        &lt;StackPanel Orientation="Horizontal" HorizontalAlignment="Right"&gt;
            &lt;Button Style="{StaticResource PhotoAppBarButtonStyle}" Click="PhotoButton_Click /"&gt;
            &lt;Button Style="{StaticResource VideoAppBarButtonStyle}" Click="VideoButton_Click /"&gt;
        &lt;/StackPanel&gt;
    &lt;/AppBar&gt;
&lt;/Page.BottomAppBar&gt;</pre>

Öncelikle *PhotoButton_Click* methodunun içini dolduralım;

<pre class="brush:csharp">private async void PhotoButton_Click(object sender, RoutedEventArgs e)
{
    var camera = new CameraCaptureUI();

    var capture = await camera.CaptureFileAsync(CameraCaptureUIMode.Photo);

    if (capture != null)
    {
        var file = await KnownFolders.PicturesLibrary.CreateFileAsync(Guid.NewGuid().ToString("N") + ".jpg", CreationCollisionOption.ReplaceExisting);

        await capture.CopyAndReplaceAsync(file);
    }
}</pre>

İlk olarak <a href="http://msdn.microsoft.com/library/windows/apps/windows.media.capture.cameracaptureui" title="CameraCaptureUI Class" target="_blank" rel="noopener">CameraCaptureUI</a> sınıfından yeni bir değişken oluşturup, <a href="http://msdn.microsoft.com/library/windows/apps/windows.media.capture.cameracaptureui.capturefileasync" title="CameraCaptureUI.CaptureFileAsync( Method)" target="_blank" rel="noopener">CaptureFileAsync()</a> methodunu çağırıyoruz, parametre olarak <a href="http://msdn.microsoft.com/library/windows/apps/windows.media.capture.cameracaptureuimode" title="CameraCaptureUIMode Enum" target="_blank" rel="noopener">CameraCaptureUIMode.Photo</a> değerini veriyoruz, böylece fotoğraf çekmek için gerekli hazırlıklarımızı tamamlamış oluyoruz.

<a href="http://msdn.microsoft.com/library/windows.storage.knownfolders" title="KnownFolders Class" target="_blank" rel="noopener">KnownFolders </a>sınıfının <a href="http://msdn.microsoft.com/library/windows.storage.knownfolders.pictureslibrary" title="KnownFolders.PicturesLibrary Property" target="_blank" rel="noopener">PicturesLibrary</a> özelliği sayesinde cihazın fotoğraf kütüphanesine erişiyoruz ve <a href="http://msdn.microsoft.com/library/windows/apps/br227251" title="StorageFolder.CreateFileAsync() Method" target="_blank" rel="noopener">CreateFileAsync()</a> methodunu kullanarak çekilen fotoğrafı kaydedebileceğimiz bir dosya oluşturuyoruz.

*capture* ismindeki değişkenin <a href="http://msdn.microsoft.com/library/windows/apps/hh738482" title="StorageFile.CopyAndReplaceAsync() Method" target="_blank" rel="noopener">CopyAndReplaceAsync()</a> methodu sayesinde *webcam* kullanılarak çekilen resmi kaydediyoruz.

*Video* çekimi yapacak *VideoButton_Click* methodunun içi *PhotoButton_Click* methoduna çok benziyor;

<pre class="brush:csharp">private async void VideoButton_Click(object sender, RoutedEventArgs e)
{
    var camera = new CameraCaptureUI();

    var capture = await camera.CaptureFileAsync(CameraCaptureUIMode.Video);

    if (capture != null)
    {
        var file = await KnownFolders.VideosLibrary.CreateFileAsync(Guid.NewGuid().ToString("N") + ".wmv", CreationCollisionOption.ReplaceExisting);

        await capture.CopyAndReplaceAsync(file);
    }
}


Üç önemli değişiklik var;



*   *camera* değişkeninin *CaptureFileAsync()* methoduna parametre olarak *CameraCaptureUIMode.Photo* değeri yerine *CameraCaptureUIMode.Video* değerini veriyoruz
*   *KnownFolders* sınıfının *PicturesLibrary* özelliği yerine *VideosLibrary* özelliğini kullanıyoruz
*   *CreateFileAsync()* methoduna parametre olarak verdiğimiz dosya isminin uzantısını jpg yerine wmv yapıyoruz

Böylece **Windows 8** uygulaması içerisinden hem fotoğraf hem video çekebilir ve uygun dizinlere kaydedilmesini sağlayabiliriz.

