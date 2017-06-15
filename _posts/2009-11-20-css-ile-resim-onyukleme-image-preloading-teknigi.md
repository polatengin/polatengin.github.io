---
layout: post
title: "CSS ile resim önyükleme (image preloading) tekniği"
date: 2009-11-20 10:30
author: engin.polat
comments: true
category: [Programlama]
tags: [css, image, önyükleme, preload, resim, web, web2]
---
İstediğiniz resimleri, aşağıdaki css tekniği ile önyükleyebilirsiniz.



#preloadedImages
{
  width: 0px;
  height: 0px;
  display: inline;
  background-image: url(path/imageA.png);
  background-image: url(path/imageB.png);
  background-image: url(path/imageC.png);
  background-image: url(path/imageD.png);
  background-image: url(path/imageE.png);
  background-image: url();
}


