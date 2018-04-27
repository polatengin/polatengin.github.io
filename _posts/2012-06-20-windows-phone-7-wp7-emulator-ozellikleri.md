---
layout: post
title: "Windows Phone 7 (WP7) Emulator Özellikleri"
date: 2012-06-20 08:04
author: engin.polat
comments: true
category: [C#]
tags: [accelerometer, additional tools, gps, landscape flat, landscape standing, location, marketplace, orientation, portrait flat, portrait standing, recorded data, screenshot, visual studio 2010, windows phone emulator, wp7]
---
<a title="Windows Phone 7 (WP7) ile programlamaya başlangıç" href="http://www.enginpolat.com/windows-phone-7-wp7-ile-programlamaya-baslangic/" target="_blank" rel="noopener">Windows Phone 7 (WP7) ile programlamaya başlangıç</a> makalesi ile başladığımız *Windows Phone 7* serisine <a title="Windows Phone Emulator" href="http://msdn.microsoft.com/en-us/library/ff402563.aspx" target="_blank" rel="noopener">Windows Phone Emülatör</a> özellikleri ile devam ediyoruz.

*Visual Studio 2010* ile *New Project* dialog penceresini açalım, *Installed Templates* kısmında yer alan proje şablon gruplarından *Silverlight for Windows Phone*'u seçelim.

Sağ tarafa gelen proje şablonlarından *Windows Phone Application*'ı seçip, projeye bir isim verelim ve *OK* butonuna tıklayarak projenin oluşturulmasını sağlayalım.

![](/assets/uploads/2012/03/WP7_Baslangic_02.png "Windows Phone 7 Yeni Proje")

Proje oluşturulması sırasında *Windows Phone 7* ve *Windows Phone 7.1* (*Mango*) arasında seçim yapabileceğimiz bir dialog kutusu görmemiz lazım,

![](/assets/uploads/2012/03/WP7_Baslangic_OS_Select.png "Windows Phone 7 OS Select")

Proje oluşturulduktan sonra çalıştıracak olursak eğer, ilk olarak **Windows Phone Emulator** yüklenecek, ardından uygulamamız ekranda belirecektir.

![](/assets/uploads/2012/03/WP7_Baslangic_Emulator_Load.png "Windows Phone 7 Emulator Yuklenme")

![](/assets/uploads/2012/03/WP7_Baslangic_Emulator_First_Project.png "Windows Phone 7 İlk Proje")

<br class="clear" />

*Emulator* penceresinin üzerine geldiğimizde beliren *dikey toolbox*'ta *çift ok* butonuna tıklarsak eğer **Additional Tools** penceresi açılır;

![](/assets/uploads/2012/06/WP7_Emulator_01.png "Windows Phone 7 Emulator")

Bu pencerede **Accelerometer**, **Location** ve **Screenshot** tablarına ulaşabiliriz. *Accelerometer* tab'ında, telefonun farklı şekillerde tutulduğu durumlarda uygulamanın nasıl gözükeceğini test edebiliriz.

*Orientation* kutusunda telefonun yatay veya dikey (*Portrait Standing*, *Landscape Standing*, *Portrait Flat*, *Landscape Flat*) duracağına karar verebiliriz.

*Recorded Data* kutusundan ise, telefonun sallanmasını simüle ettirebiliriz.

Ayrıca telefonun tam ortasında gözüken turuncu noktayı, sağa-sola-yukarı-aşağı oynatarak, telefonun farklı şekillerde tutulmasını da simüle ettirebiliriz.

![](/assets/uploads/2012/06/WP7_Emulator_02.png "Windows Phone 7 Emulator - Accelerometer")

*Location* tab'ında, uygulamanın **GPS** kullanımını test edebiliriz. Harita üzerinde birden fazla noktaya tıklayarak, telefonun sırası ile bu lokasyonlar arasında geziliyormuş durumunu simüle etmesini sağlayabiliriz.

![](/assets/uploads/2012/06/WP7_Emulator_03.png "Windows Phone 7 Emulator - Location")

Son olarak, **Screenshot** tab'ında uygulamanın o anda ekran görüntüsünü alabiliriz. Özellikle uygulamayı <a href="http://www.windowsphone.com/marketplace" title="Windows Phone Marketplace" target="_blank" rel="noopener">Marketplace</a>'e gönderirken birden fazla ekran görüntüsünün alınmasında fayda var.

![](/assets/uploads/2012/06/WP7_Emulator_04.png "Windows Phone 7 Emulator - Screenshot")

