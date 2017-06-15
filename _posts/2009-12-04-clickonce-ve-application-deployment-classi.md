---
layout: post
title: "ClickOnce ve ApplicationDeployment class'ı"
date: 2009-12-04 09:10
author: engin.polat
comments: true
category: [C#]
tags: [.net, applicationdeployment, clickonce, code, csharp, singleton, source, static]
---
<a title="enginpolat.com : Kısa Sınav - 3" href="http://www.enginpolat.com/kisa-sinav-3/" target="_blank">Kısa Sınav - 3</a> yazımda belirttiğim gibi, <a title="MSDN: ClickOnce" href="http://msdn.microsoft.com/en-us/library/t71a733d.aspx" target="_blank">ClickOnce</a> ile deploy ettiğiniz uygulamalarda, güncellemeleri programatik olarak kontrol etmek için ApplicationDeployment class'ını kullanırız.

Bu yazımda, <a title="MSDN: ApplicationDeployment" href="http://msdn.microsoft.com/en-us/library/system.deployment.application.applicationdeployment.aspx" target="_blank">ApplicationDeployment</a> class'ının kullanımını anlatmaya çalışacağım.

Öncelikle bilinmesi gereken, ApplicationDeployment class'ından yeni bir instance oluşturamazsınız. Çünkü public bir constructor'ı yoktur.

![KisaSinav3_1](/assets/uploads/2009/12/KisaSinav3_1.png "KisaSinav3_1")

ApplicationDeployment class'ından yeni bir örnek oluşturmak için, gene ApplicationDeployment class'ının static ve singleton CurrentDeployment property'sini kullanırız.

![KisaSinav3_2](/assets/uploads/2009/12/KisaSinav3_2.png "KisaSinav3_2")

Artık elimizde bir değişken olduğuna göre, bu değişkeni kullanarak uygulamamızda güncelleme olup-olmadığını sorgulayabiliriz.

Bunun için kullanabileceğimiz fonksiyonlar;

![KisaSinav3_3](/assets/uploads/2009/12/KisaSinav3_3.png "KisaSinav3_3")

**CheckForUpdate()**

Uygulamanın yeni versiyonu olup-olmadığını kontrol eder, geriye *bool* tipinde değer döner.

**CheckForUpdateAsync()**

*CheckForUpdate()* fonksiyonu ile aynı işi yapar, fakat asenkron çalışabilir.

Versiyon kontrolü tamamlandığında *CheckForUpdateCompleted* event'i otomatik olarak çağırılır.

**CheckForDetailedUpdate()**

Uygulamanın yeni versiyonu olup-olmadığını kontrol eder, geriye *UpdateCheckInfo* tipinde değer döner.

![KisaSinav3_4](/assets/uploads/2009/12/KisaSinav3_4.png "KisaSinav3_4")

Genelde *CheckForDetailedUpdate()* fonksiyonunu çağırmakta fayda vardır. Çünkü, daha güncel versiyonun çıktığını bulduğumuzda, kullanıcıya mesaj vermek isteyeceğiz. Mesaja yazacağımız detaylı bilgiye *UpdateCheckInfo* class'ı aracılığıyla ulaşabiliriz. Bu bilgiyi bize *CheckForDetailedUpdate()* fonksiyonu döndürüyor.

<a title="MSDN: UpdateCheckInfo" href="http://msdn.microsoft.com/en-us/library/system.deployment.application.updatecheckinfo.aspx" target="_blank">UpdateCheckInfo</a> class'ının member'ları;

**AvailableVersion**

Uygulamanın güncellenebilir son versiyonunun versiyon bilgisi. (Version tipinde değer döner)

**IsUpdateRequired**

Uygulamanın ClickOnce ile deploy'u sırasında "UpdateRequired" seçeneğinin seçilip seçilmediğinin bilgisi. (bool tipinde değer döner) Eğer true değer içeriyorsa, kullanıcıya mesaj verilmeli, çalışan uygulaman kapatılmalı ve güncelleme yapılmalıdır.

**MinimumRequiredVersion**

Kullanıcıda bulunması gerekli minimum versiyon bilgisi. (Version tipinde değer döner)

**UpdateAvailable**

Kullanıcıda çalışan uygulamadan daha güncel bir versiyonun bulunup bulunmadığı bilgisi. (bool tipinde değer döner)

**UpdateSizeBytes**

Güncellenecek dosyaların toplam boyutu bilgisi. (long tipinde değer döner)

