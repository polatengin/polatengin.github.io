---
layout: post
title: "Windows Phone 8 uygulamasında çekilen resmi crop ettirmek"
date: 2014-12-05 21:20
author: engin.polat
comments: true
category: [Windows Phone]
tags: [completed, photochoosertask, pixelheight, pixelwidth, show, windows phone, wp8]
---
Geçtiğimiz aylarda bir etkinlikle göstermek için geliştirdiğim *demo uygulamasında* kamera aracılığıyla resim çekmem gerekti. Fakat geliştirdiğim uygulama, çekilen resmin belli bir *en x boy* oranında olmasını gerektiriyordu.

**Kamera** aracılığıyla çekilen resmin istediğim *en x boy* oranına göre **crop** edilmesini ve uygulamama **crop** edilmiş halinin verilmesini sağlamalıydım.

Gayet basit bir şekilde aşağıdaki *kod parçası* aracılığıyla bunu sağlayabildim;



private void PickPhotoClick(object sender, RoutedEventArgs e)
{
    var _photoChooserTask = new PhotoChooserTask();
    _photoChooserTask.PixelWidth = 600;
    _photoChooserTask.PixelHeight = 300;
    _photoChooserTask.Completed += _photoChooserTaskCompleted;
    _photoChooserTask.Show();
}


Gördüğünüz gibi sadece <a href="https://msdn.microsoft.com/microsoft.phone.tasks.photochoosertask" target="_blank">PhotoChooserTask</a> tipindeki değişkenin <a href="https://msdn.microsoft.com/microsoft.phone.tasks.photochoosertask.pixelwidth" target="_blank">PixelWidth</a> ve <a href="https://msdn.microsoft.com/microsoft.phone.tasks.photochoosertask.pixelheight" target="_blank">PixelHeight</a> özelliklerine istediğim *en x boy* oranlarını atamam yeterli oldu.

![](/assets/uploads/2014/12/ImageCrop.jpg)

