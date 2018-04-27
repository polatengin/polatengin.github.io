---
layout: post
title: "XNA Tarihçe"
date: 2012-01-20 09:30
author: engin.polat
comments: true
category: [XNA]
tags: [api, direct3d, directdraw, directinput, directsound, directx, microsoft, wp7, XNA, xna game studio]
---
**XNA** tarihçesine baktığımızda, ilk filizlerin *1995* yılında atıldığını görüyoruz.

*Windows 95* çıkana kadar, oyunların direk donanıma erişmesi gerekirdi (Örneğin *joystick*, *grafik kartı* veya *ses kartına*)

Bu yüzden oyun geliştirici firmalar, oyunların içerisine her ses kartı ailesinin, her grafik kartı ailesinin *komut setlerini* gömerlerdi.

Oyunu başlattığımızda genellikle ilk önce bilgisayarımızda bulunan *ses kartını* ve *grafik kartını* seçerdik, böylece oyun hangi komut setini kullanacağını bilirdi.

*Windows 95* ile birlikte *Microsoft*, (o zamanki adıyla) **Windows Game SDK** ismini verdiği bir *kütüphane* geliştirdi.

Bu kütüphane sayesinde oyunlar direk donanıma erişmek yerine, ara bir katmana erişecekler, böylece donanım'a özel komut setlerini bilmelerine gerek kalmayacaktı.

*Windows Game SDK*, tanıtılmasından kısa bir süre sonra <a href="http://en.wikipedia.org/wiki/DirectX" title="Wikipedia : DirectX" target="_blank" rel="noopener">DirectX 1.0</a> adı ile yayınlandı.

**DirectDraw**, **DirectInput** ve **DirectSound** katmanlarını içeriyordu. *X* karakteri, *Direct* öneki ile başlayan tüm isimleri kısaltmak için seçilmişti.

*DirectX* öncesinde çeşitli donanımlar ile konuşmanın standart olmaması oyun geliştirmenin en zor yanlarından biriydi. Genellikle geliştirilen oyunlar birden fazla donanım ailesi ile çalışabilecek şekilde yazılırdı, bu da geliştirme süresini ve kodların karmaşıklığını arttırırdı.

*DirectX* ile birlikte yazılımın donanım ile konuşacağı standart bir dil oluşturulmuş oldu.

Böylelikle oyunlar aslında donanım ile değil, *DirectX katmanı* ile konuşuyorlar, donanım ile konuşmak ise *DirectX*'in görevi oluyor.

1.0 versiyonunda sonra *DirectX* yıllar içerisinde oldukça yol aldı. 11.0 versiyonu *Windows7* ile birlikte duyuruldu. (*DirectX9* ile arasındaki tek fark *Direct3D* katmanının 11.0 versiyona yükseltilmesi)

*DirectX*, 7.0 versiyonundan itibaren C harici dilleri desteklemeye başladı. İlk başlarda sadece *Visual Basic* desteklenirken, *DirectX 9.0* ile birlikte *.Net* desteği geldi.

Ayrıca *DirectX 8.0*, *Programlanabilir Shader* desteğine sahip ilk sürüm haline getirildi.

DirectX'e .Net desteği gelmesi ile birlikte (*Managed DirectX*) oyun geliştiriciler tarafında büyük etki yarattı. 2006 yılında *XNA* adı altında toplanana kadar çok fazla oyun geliştirici tarafından kullanıldı.

*XNA 4.0* versiyonu ile birlikte hem *Windows*, hem *Xbox 360*, hem de *Windows Phone 7* platformlarına oyun geliştirilebiliyor.

