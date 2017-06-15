---
layout: post
title: "Windows Phone 7 (WP7) ile programlamaya başlangıç"
date: 2012-03-24 01:28
author: engin.polat
comments: true
category: [C#]
tags: [accelerometer, apphub, azure, camera, expression blend, framework, gps, İnternet, location, mango, marketplace, sensor, silverlight, visual studio 2010, wcf, wifi, windows phone emulator, wp7, xaml, XNA]
---
Bu yazı dizisi ile birlikte **Windows Phone 7** (**WP7**) uygulama geliştirme konusunu inceliyor olacağız.

**WP7** uygulamalarını *Visual Studio 2010*, *Expression Blend*, *Silverlight* ve *XAML* gibi mevcut **Microsoft** araçları üzerine inşa ediyoruz.

**WP7**, uygulama geliştirmemiz için temel olarak *iki framework* sağlar;



*   **Silverlight Framework**
Bu framework ile olay tabanlı (XAML sayesinde) uygulamalar geliştirebiliriz
*   **XNA Games Framework**
Bu framework sayesinde, zengin 2D ve 3D oyunlar geliştirebiliriz

**Windows Phone 7 Uygulama Geliştirme Gereksinimleri**

*Visual Studio 2010* kurulu bilgisayarımıza <a href="http://www.microsoft.com/download/en/details.aspx?id=27570" title="Windows Phone SDK 7.1" target="_blank">Windows Phone SDK 7.1</a> indirip kurmamız gerekiyor.

*Windows Phone SDK 7.1* kurulumu sonrasında bilgisayarımıza aşağıdaki araçlar kurulmuş olacak;



*   Microsoft Visual Studio 2010 Express for Windows Phone
*   Windows Phone Emulator
*   Windows Phone SDK 7.1 Assemblies
*   Silverlight 4 SDK and DRT
*   Windows Phone SDK 7.1 Extensions for XNA Game Studio 4.0
*   Microsoft Expression Blend SDK for Windows Phone 7
*   Microsoft Expression Blend SDK for Windows Phone OS 7.1
*   WCF Data Services Client for Window Phone
*   Microsoft Advertising SDK for Windows Phone

Ayrıca *Visual Studio 2010* kurulumumuza, *New Project* dialog penceresinden erişebileceğimiz yeni proje şablonları da eklenmiş oluyor.

*Not : <a href="http://create.msdn.com/en-us/education/basics/developer_resources" title="App Hub - Developer Resources" target="_blank">App Hub - Developer Resources</a> sayfasından, hem ihtiyacımız olacak araçlara, hem de faydalı dokümanlara ulaşabiliriz.*

**Windows Phone 7 Mimarisi**

*MSDN*'de yer alan <a href="http://msdn.microsoft.com/en-us/library/ff402531(v=vs.92).aspx" title="Application Platform Overview for Windows Phone" target="_blank">Application Platform Overview for Windows Phone</a> makalesine göre, mimari şu şekilde;

![](http://i.msdn.microsoft.com/dynimg/IC513005.jpg "Application Platform Overview for Windows Phone")

WP7 mimarisinin 4 temel bileşeni;



*   **Runtimes**
Silverlight ve XNA framework, optimize edilmiş uygulama oluşturmak için geliştiriciler için mükemmel bir ortam sağlar
*   **Araçlar**
Visual Studio 2010 ve Expression Blend araçları kullanıcıya zengin uygulamalar tasarlamak ve geliştirmek için geliştiricilere esnek bir ortam sağlar
*   **Cloud Services**
Windows ve SQL Azure, Notification Services, Location Services ve diğer 3. parti servis desteği ile geliştiricilere esnek bir geliştirme ortamı sağlar
*   **Portal Services**
WP7 Market Place geliştiricilere, uygulamalarını yükleme ve sertifika yönetimi imkanı sağlar

**Silverlight ve Windows Phone 7**
Silverlight, XAML (Extensible Application Markup Language) dili ile uygulamalar ve basit 2D oyunlar geliştirmek için kullanılır. Geliştiriciler kolaylıkla Visual Studio veya Microsoft Blend gibi araçlar sayesinde XAML kodları üretebilirler.

**XNA ve Windows Phone 7**
XNA, temelde zengin 2D ve 3D oyunlar geliştirmek için kullanılır.

**Market Place Sertifikasyon Süreci**

*Windows Phone 7* için geliştirdiğimiz uygulamaları, **Market Place**'e göndermeden önce kontrol etmemiz gereken, *WP7*'ye özgü maddeler vardır.

Bu maddelere *MSDN*'de yeralan <a href="http://msdn.microsoft.com/en-us/library/hh184843(v=VS.92).aspx" title="Application Certification Requirements for Windows Phone" target="_blank">Application Certification Requirements for Windows Phone</a> sayfasından ulaşabiliriz.

**Donanım**

Şu anda piyasada bulunan *Windows Phone* cihazları tek bir ekran çözünürlüğüne sahiptir (*480 x 800*). Yakın gelecekte çıkacak yeni versiyonların birden fazla ekran çözünürlüğünü desteklemesi *bekleniyor*.

*Windows Phone* cihazların ortak yönlerinden biri, ön yüzlerinde aynı butonların bulunmasıdır;

![](/assets/uploads/2012/03/WP7_Baslangic_01.png "Windows Phone 7 Buttonlar")

![](/assets/uploads/2012/03/WP7_Baslangic_Back_Button.png "Windows Phone 7 Buttonlar - Geri")
**Geri Butonu** sayesinde uygulamalar ekranlar arası geri dönüş işlevlerini sağlayabilirler. İnternet tarayıcılarda bulunan Geri butonu ile aynı işleve sahiptir. Uygulamanın açılış ekranında kullanılması durumunda, ilgili uygulamanın kapatılmasına sebep olur

![](/assets/uploads/2012/03/WP7_Baslangic_Windows_Button.png "Windows Phone 7 Buttonlar - Windows")
**Windows Butonu** kullanıcının telefonun başlangıç ekranına dönmesini sağlar

![](/assets/uploads/2012/03/WP7_Baslangic_Search_Button.png "Windows Phone 7 Buttonlar - Arama")
**Arama Butonu** sayesinde kullanıcılar telefonun arama özelliğini çağırabilirler

**Sensörler**
*Windows Phone 7* telefonlarda geliştiriciler için en çok öneme sahip sensörler;



*   **WI-FI :** telefonların internete bağlanmak için kullandıkları bağlantı noktalarından biridir. *WP7* telefonlarda *Internet Explorer* tarayıcısı gelmektedir
*   **Camera :** *WP7* telefonlar en az *5MP kamera* ve *flaş* desteğine sahiptir. Uygulamalar kamerayı veri giriş aracı olarak kullanabilirler
*   **Accelerometer :** *İvmeölçer* sayesinde uygulamalar telefonun 3 koordinat düzlemine göre (*X-Y-Z*) tutuluş bilgisini öğrenebilir
*   **GPS :** *GPS* sayesinde uygulamalar, telefonun dünya üzerindeki konum bilgisini alabilirler

*Visual Studio 2010* ile *New Project* dialog penceresini açalım, *Installed Templates* kısmında yer alan proje şablon gruplarından *Silverlight for Windows Phone*'u seçelim.

Sağ tarafa gelen proje şablonlarından *Windows Phone Application*'ı seçip, projeye bir isim verelim ve *OK* butonuna tıklayarak projenin oluşturulmasını sağlayalım.

![](/assets/uploads/2012/03/WP7_Baslangic_02.png "Windows Phone 7 Yeni Proje")

Eğer tüm güncellemeleri yaptıysak, proje oluşturulması sırasında *Windows Phone 7* ve *Windows Phone 7.1* (*Mango*) arasında seçim yapabileceğimiz bir dialog kutusu görmemiz lazım

![](/assets/uploads/2012/03/WP7_Baslangic_OS_Select.png "Windows Phone 7 OS Select")

Proje oluşturulduktan sonra çalıştıracak olursak eğer, ilk olarak *Windows Phone Emulator* yüklenecek, ardından *ilk uygulamamız* ekranda belirecektir.

![](/assets/uploads/2012/03/WP7_Baslangic_Emulator_Load.png "Windows Phone 7 Emulator Yuklenme")

![](/assets/uploads/2012/03/WP7_Baslangic_Emulator_First_Project.png "Windows Phone 7 İlk Proje")

