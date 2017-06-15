---
layout: post
title: "2011 Build Konferansı Birinci Gün Raporu"
date: 2011-09-17 08:54
author: engin.polat
comments: true
category: [Genel]
tags: [api, build konferans, csharp, Daron Yöndem, gesture login, html5, javascript, kernel, MetroUI, microsoft, silverlight, task manager, vbnet, visual studio, windows api, windows store, windows8, winrt, x64, x86]
---
Blog'umun **200. yazısını** beni kırmayarak sevgili **Daron Yöndem** yazdı. Aslında tek bir yazı yazacaktı, fakat **Microsoft**'un <a href="http://www.buildwindows.com/" target="_blank">Build Konferans</a>'ına katıldığı için bir yazı serisine dönüştü. Hergün izlenimlerini  sizlerle paylaşıyor olacağım. Yazıların orjinallerini <a href="http://daron.yondem.com" target="_blank">Daron Yöndem</a>'in kendi blog'undan da takip edebilirsiniz. Ayrıca **twitter**'dan da takip etmenizi öneririm; <a href="http://twitter.com/daronyondem" title="Twitter / Daron Yöndem" target="_blank">@daronyondem</a>

Söz Daron'da...<!--more-->

Şu an saat gece yarısı 01:40 :) Build'in ilk gününden yeni otele varabildim ve uyku gözümden akarken :) yarın sabah 6.30'da kalkacakken :) yine de bu yazıyı "yazmalıyım" diyerek... neyse uzatmiyim :) Bugün neler neler oldu bir bilseniz...

Evet, bugün o uzun süredir beklediğimiz Build konferansının ilk günü gerçekleşti. Ortalıkta gezen ve benim özellikle kafa karıştırmamak adına blogda hiç bahsetmediğim dedikoduların hiçbiri gerçek olmadı. Yani özetle ortada korkacak hiçbirşey yok :) Herşey yolunda hatta SÜPER yolunda.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_01.jpg "Microsoft Build Konferans")

Bugün neredeyse tamamen Windows 8 ve ağırlıklı olarak yeni Tablet Interface'i etrafında geçti. Aslına bakarsanız buna doğrudan bir tablet interface'i demek yanlış çünkü sadece tabletlerde değil desktoplarda, Windows açılışında da bu arayüz karşılayacak bizi. Şimdilik bu durumu hafif garipsesem de ya biz alışacağız :) ya da bu durum desktoplar için belki opsyonel olarak disable edilebilecek. Ama şimdilik biz alışacağız seçeneği aktif :)

**LiveID Sync ve Gesture Login**

Sunumun ilk başında dikkatimi çeken şeylerden biri işletim sisteminin login mekanizmasının tamamen LiveID ile entegre olması. Yani artık bir Windows User yaratmak yerine LiveID ile işletim sistemine login oluyorsunuz. "Domain User'larına ne olacak?" sorusu garip bir şekilde havada ama tahminen bu LiveID entegrasyonu yeri geldiğinde eski authentication sistemleri ile replace edilebilecektir. Burada kritik nokta LiveID entegrasyonu sayesinde tüm işletim sistemi genelinde bazı kullanıcı ayarlarının cloud'da tutuluyor olması. Yani başka bir bilgisayarda aynı LiveID ile login olduğunuzda aynı ayarları göreceksiniz. Hatta uygulamalar bile belirli sınırlarda datayı LiveID üzerinden işletim sisteminin kontrolüne verip cihazlar arası sync edilebilmesini sağlayabilecek. Bu özellikle MetroUI'daki, yani tablet interface'i diyebileceğimiz yerdeki uygulamalar için süper kritik. Düşünün Angry Birds oynadığınızda geçtiğiniz level'lar :) başka bir tablet aldığınızda ve login olduğunda tamamlanmış olarak gelecek karşınıza.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_02.jpg "Microsoft Build Konferans")

İkinci "amanın" dediğim şey ise **Gesture Login** oldu. Bana ilk anda etrafımda gördüğüm bazı Android'lerdeki keylock sistemini hatırlarsa da biraz daha farklı bir gesture login eklenmiş Windows'a girerken. Normal şifrenizi girmenin yanı sıra isterseniz bir resim seçip o resim üzerinde 3 parmak hareketi yaparak bu 3 hareketi şifre şeklinde kullanabiliyorsunuz. İlginç :)

**Performans**

İnanılmaz olan şeylerden biri Windows 8'in açılma süresinin ortalama 2-3 saniyeye inmiş olması. Hızlı boot eden bir cihazda OS boot süresinin de kısalması ile beraber toplam açılış süresi 5 saniyeye kadar kısalabiliyor. Benim gördüğüm tabletlerde 2-3 saniyede açılmalar inanılmazdı.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_03.jpg "Microsoft Build Konferans")

Verilen istatistiklerden birisi ise işletim sisteminin temiz bir yükleme sonrası kullandığı bellek miktarıydı. Windows 7'de bu rakam 404 MB şeklindeyken 8'in şu anki Developer Preview sürümünde 281 MB'a ulaşılmış durumda. Kendi fikrimi söylemem gerekirse :) tabletler hariç desktop için memory miktarının artık çok kritik olmadığını düşünüyorum ama yine de güzel bir gelişme.

**Metro UI**

Gelelim şu meşhur Metro UI olayımıza. Kabaca "kare kare" :) diyebileceğimiz interface konseptine Metro UI adı veriliyor. Bu konsept Windows Phone'da da dominant bir arayüz tasarımı olarak karşımıza çıkmıştı. Windows 8'in giriş arayüzü de tamamen Metro UI üzerine oturuyor. Özünde Windows Phone'dan öğrenilmiş bazı derslerin de implemente edildiğini gördüğümü söyleyebilirim :) Oturumlardan taş atılan ve Windows 8'de farklı olduğu söylenen bazı navigasyon metodlarının Windows Phone'da şu an var oluyor olması belki yakında Windows Phone'da da bazı updatelerin geleceğini işaret edebilir.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_04.jpg "Microsoft Build Konferans")

Metro UI'daki uygulamaların deveplopmentı ile ilgili birçok dedikodu yayılmıştı. Konuyu çok uzatmadan şunu söyleyebilirim ki Microsoft neredeyse istediğimiz herşeyi yapmış durumda. Metro UI için isterseniz **C++** ve **XAML** = **Silverlight** ile uygulama yazabiliyorsunuz. Bu seçenek özellikle **Windows RT** (**Windows Runtime**) **API**'lerine çok bağımlı uygulamalar için süper bir performans artısı sağlayacaktır. (Windows RT konusuna birazdan geleceğiz :)) İkinci olarak **C#**/**VB.NET** ve **XAML** = **Silverlight** ile **Metro UI** için uygulama yazabiliyorsunuz. Son olarak ise HTML5 ve JavaScript ile Metro UI uygulamaları geliştirebilirsiniz.

Manzara epey ilginç. Şimdi aklımıza gelebilecek ilk soruyu hemen cevaplayalım. Örneğin kamera gibi donanım vs API'lerine nasıl ulaşırız tüm bu platformlardan. Malum kamera ile ilgili API'leri işletim sistemi açıyor olsa gerek? Kesinlikle.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_05.jpg "Microsoft Build Konferans")

Yukarıdaki fotoğrafta sağ tarafta mavi kolonlarda görebileceğiniz üzere normal Desktop uygulamalarında işletim sistemi Kernel'i üzerinde .NET'i vardı. C ve C++ tarafında Win32, HTML ve JavaScript tarafında ise tarayıcı arada kalıyordu. Metro UI için hazırlanan uygulamaların hepsi "WinRT" (Windows Runtime) denilen bir Runtime üzerinde çalışıyor. Bu runtime doğrudan işletim sisteminin içine gömülü geliyor. Bu runtime'ın görevi Kernel'den API'leri C, C++, C#, VB ve JavaScript'e açmak. Önemli olan WinRT ile bu diller arasında başka kimsenin olmaması. Örneğin tarayıcı yok!.

Bu durumda kamera gibi donanımlara veya işletim sistemi API'lerine ulaşılabilmesi için gerekli API'ler tüm bu saydığımız diller için ayrı ayrı açılmış durumdalar diyebiliriz. Yani aynı API'yi C, C++'dan veya C#, VB'den veya JavaScript'ten çağırabiliyorsunuz.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_06.jpg "Microsoft Build Konferans")

Burada tabi doğal olarak en kritik nokta JavaScript'in platform bağımsız bir tad verir gibi durmasına karşın yukarıda bahsettiğimiz API call'ları yüzünden pek de bağımsız kalamıyor olması. Eh işletim sistemi sağlayıcıların API'lerle ilgili yan yana gelip bir anlaşmaya varma ihtimali de pek olmadığına göre bu işin pek başka çaresi yok. En azından API calları bir katmana habsedilebilirse geri kalan katmanların platform bağımsız olma şansı olacaktır.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_07.jpg "Microsoft Build Konferans")

HTML5'den bahsederken tabi tüm bu uygulamaları tasarlama noktasında bu teknoloji için de bir IDE'nin gerekliliği ortada. Nitekim özellikle burada kullanılan HTML5'in data attribute'leri ile zenginleştirilmek zorunda olduğunu da göz önünde bulundurursak tüm bu işleri otomatikleştirecek bir araç lazım. İşte o araç Expression Blend oluyor! Özellikle bu haber çok sevindirici. Expression Blend en az Visual Studio kadar başarılı bir araç ve HTML5 platformunu da kapsamaya başlaması çok iyi bir gelişme.

**Windows Store**

Metro UI üzerindeki uygulamaların dağıtımı için bir AppStore / Marketplace olacağını tahmin etmek hiç de zor değil. Benim bu noktada dualarım :) bu marketplace'in Türkiye'ye de gelmesi (Korku örneği: Windows Phone Marketplace) Herşeyi bir kenara bırakın Windows'un dünyada en çok kullanılan ve yüklenen son kullanıcı işletim sistemi olduğu malum. Bizim bu işletim sistemini kullanan herkese hitap eden bir pazara direk uygulama satabiliyor ve pazardan pay alabiliyor olmamız bence çok kritik.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_08.jpg "Microsoft Build Konferans")

Windows Store şu anda tabi ki açık değil, developerlara test amaçlı dahi açılmış değil. Zaten Windows 8'in daha beta bile olmadığı düşünülürse durum normal kabul edilebilir. Daha Beta olacak, RC olacak sonra da RTM ve GA. Yukarıda sunum esnasından paylaşılan bir web sayfasının görüntüsünü takriben neler olabilir görebilelim diye paylaşıyorum. Bu konuda özellikle iki ilginç detay vardı. Birincisi uygulamalarınızın satışını ve lisanslamasını Microsoft'a bırakabileceğiniz modelin varlığı (ki aslında bu normal bir durum) ikincisi ise desktop uygulamaları için eğer satıcılar isterse store'da uygulamalarının listelenebileceği ve satın alma süreci için de üreticinin sitesine link verilebileceğiydi. Yani uygulamanız Windows Store'da listelenebilir fakat oradan satılmayabilir.

**Herkese Windows 8'li bir tablet!**

PDC 2009'u hatırlayanlarınız olursa :) Etkinliğin ikinci günü Microsoft etkinliğe katılan herkese bir laptop hediye etmişti. Bu hediyenin arkasındaki düşünce ise Windows 7 ile beraber gelen "Sensor And Location API" gibi yeni API'lerle alakalı katılımcıların hemen development yapabilmesine olanak sağlamaktı. İtiraf etmem gerek ki konferansla ilgili tüm katılımcıların en büyük beklentilerinden biri de Windows 8 yüklü bir tablet hediye edilmesiydi :) Tabi bunun arkasındaki düşünce ise tüm yukarıda bahsettiğim MetroUI uygulamalarının Windows 8 çıkmadan önce developerlar tarafından geliştirilebilmesi, test edilebilmesi vs.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_09.jpg "Microsoft Build Konferans")

Beklenen oldu ve ilk gün açılış konuşmasında konferansa katılan herkese birer tablet hediye edileceği duyuruldu :) Tabletin özelliklerini vs bir kenara bırakırsak 5000 kişiye 1 saat gibi kısa bir sürede tablet dağıtabilen organizasyonu ilk önce buradan bir saygıyla selamlamak istiyorum. Bir salondan çıkıp tablet almaya yürüyen "5000 spartalı" pek kolay başa çıkılabilecek bir kitle değil açıkçası :) Neyse, konumuza dönersek. Tablet'i daha test etme şansım olmadı fakat donanımın başarılı olduğunu söyleyebilirim. Kişisel tek hayal kırıklığım tabletin Intel işlemci ile gelmesi oldu. Ben ARM / Nvidia Tegra'yı tercih ederdim. Pil ömrünü ciddi değiştirecektir bu tercih. Yarın tüm gün konferans boyunca tableti yanımda taşımayı ve tabi kullanmayı planlıyorum. Bu konuda detaylı yorumlarımı yarın sizlerle paylaşacağım.

**Yıllar sonra değişen Task Manager**

Evet sonunda Task Manager değişmiş! :) Artık her process'in sadece işlemci ve bellek kullanımını değil disk ve network kullanımını da görebiliyoruz. Aşağıdaki ekran görüntüsünde özellikle **Suspended** olarak geçen uygulamalar dikkatinizi çekecektir. İşte bu uygulamalar MetroUI içerisinde açılmış fakat o an ekrandan kaldırılmış uygulamalar. Yani bir anlamda MetroUI içerisinden standby'a alınmış arka plandaki uygulamalr denebilir. MetroUI içerisinde uygulamalar arası geçişler çok hızlı yapılabiliyor. İşte bunu sağlayan da bu "Suspended" olayı :)

![](/assets/uploads/2011/09/build_1_10.jpg "Microsoft Build Konferans")

Suspended moda geçen bir uygulama hiç CPU kullanmıyor, böylece tabletinizi açık tutsanız veya "Connected Standby" denilen moda alsanız da pil ömrü uzuyor. "Connected Standby" konusuna gelince. Windows Phone 7'nin ilk versiyonundaki "sözüm ona :)" multitasking yani Notification API'sini incelediyseniz bu mimarinin çok daha gelişmiş bir halinin (ki bu WP7'ye de Mango update ile gelecek) Windows 8'e de geleceğini söyleyebiliriz. İşte bu notificationların cihaz tarafından alınabilmesi için Network bağlantısının ayakta tutulduğu bir Standby modu var. Bu modun da adı "Connected Standby" :)

<a href="/assets/uploads/2011/09/build_1_11.jpg">![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_11.jpg "Microsoft Build Konferans")</a>

Task Manager'da daha birçok yenilik var. Bahsetmeden geçemeyceğim bir diğer yenilik ise "App History" sekmesi. Burada makinede daha önce çalışan uygulamaların bir listesini ve CPU kullanım, bellek kullanım gibi verilerini bulabiliyorsunuz.

**Herkese Windows 8 Developer Preview**

Konferansın ilk günü ile beraber güzel bir haber daha geldi. Windows 8'in Developer Preview adında bir sürümü herkes için download açıldı! Daha önceki konferanslarda sadece katılımcılara bu tarz downloadları açma huyu olan Microsoft'a gelen eleştiriler sanırım sonunda işe yaramış ki :) download herkese birden açıldı. Fakat unutmayın bu sürüm daha Beta bile değil! :) O nedenle başınıza herşey gelebilir yüklerseniz. Microsoft bu konuda kesinlikle destek veremeyeceğini ve sorumluluk kabul edemeyeceğini konferansta defalarca dile getirdi.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_12.jpg "Microsoft Build Konferans")

Windows 8 Developer Preview'u <a href="http://dev.windows.com/" target="_blank">http://dev.windows.com</a> adresinden indirebilirsiniz. Söz konusu adreste x86, x64 sürümlerinin haricinde iki farklı download ayrımı daha var. Downloadlardan biri MetroUI konusunda development testleri yapabilmeniz için Visual Studio 2011'in bir Express Preview ve Expression Blend 5'in Preview sürümlerini de yüklü olarak içeriyor, diğeri ise sadece Windows 8 Developer Preview download.

**Visual Studio ve Expression Studio artık aynı motoru kullanıyor.**

Visual Studio ile Expression Studio arasında farklılıkları ve ürünlerin hitap ettikleri kitlelerin farklılıklarını bilip olabildiğince bunu korumaya çalışsa da Microsoft aslında her iki üründe de aynı stabiliteyi sağlayabilmek istiyor. Bu iki ürünün de ayrı ayrı **WPF** ve **Silverlight Designer Engine**'lerinin olması doğal olarak hem anlamlı değildi hem de tutarsız sonuçlara neden olabiliyordu.

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_13.jpg "Microsoft Build Konferans")

Yukarıdaki ekran görüntüsünde de görebileceğiniz üzere artık Visual Studio içerisinde Blend'den alışık olduğumuz bazı toolbarlar var. Bunu sağlayan mekanizma iki ürünün de aynı WPF/SilverLight rendering motorunu kullanmaya başlaması.

*Ve böylece ilk gün biter...*

Tahmin edebileceğiniz üzere uzun ve yoğun bir gün oldu. Gün içinde olabildiğince anlık durumları <a href="http://twitter.com/daronyondem" target="_blank">twitter</a>'dan geçmeye çalıştım. Konferans alanındaki internet bağlantısı pek sağlıklı olmadığı için (aşağıdaki manzaraya bakın herkes bağlanmaya çalışıyordu orada :D) maalesef ancak text tweetler yollayabildim :)

![Microsoft Build Konferans](/assets/uploads/2011/09/build_1_14.jpg "Microsoft Build Konferans")

Yarın da aynı şekilde devam etmeye çalışacağım. Yarın demişken.. saat 3.30 olmuş :) 3 saat uyku kaldı bana. Daha anlatacak çok şey var, yazacak çok şey var. Toparladıkça bloga aktaracağım. Yarın yine bir gün özeti ile görüşmek üzere!
