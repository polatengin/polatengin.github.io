---
layout: post
title: "UWP uygulamasında kullanıcının/bilgisayarın dilini bulmak"
date: 2017-09-21 16:15
author: engin.polat
comments: true
category: [Windows]
tags: [uwp]
---
Bir **UWP** projesinde, bilgisayarın hangi dil ile kullanıldığını bulmak ve bu dile göre bir takım değişiklikler yapmak gerekebilir.

Örneğin, *ondalık haneleri* **nokta** (.) veya **virgül** (,) ile ayırmak, tarihi *Gün/Ay/Yıl* şeklinde yerine *Ay/Gün/Yıl* şeklinde göstermek, hatta ekrandaki metinlerin **Türkçe** yerine **İngilizce** gelmesini sağlamak, gibi.

**UWP** uygulama geliştirirken kullandığımız **Windows SDK** içerisinde, bilgisayarın dilini bulabileceğimiz birkaç yol var.

İlk yol, <a href="https://docs.microsoft.com/en-us/uwp/api/windows.applicationmodel.resources.core" target="_blank">Windows.ApplicationModel.Resources.Core</a> *namespace*'inde yeralan <a href="https://docs.microsoft.com/en-us/uwp/api/windows.applicationmodel.resources.core.resourcecontext" target="_blank">ResourceContext</a> sınıfının, <code>GetForCurrentView()</code> methodu ile elde ettiğimiz nesnenin <code>Languages</code> özelliğine başvurmak.

*Bu özelliğin içerisinde diller dizi şeklinde durduğu için, ilk öğeyi aldığımızda, kullanıcının tercih ettiği dile ulaşmış oluruz*

<script src="https://gist.github.com/polatengin/eca20f3bfe1cd68cb5796442eebf31f7.js?file=option-1.cs"></script>

İkinci yol ise, <a href="https://docs.microsoft.com/en-us/uwp/api/windows.system.userprofile" target="_blank">Windows.System.UserProfile</a> *namespace*'inde yeralan <a href="https://docs.microsoft.com/en-us/uwp/api/windows.system.userprofile.globalizationpreferences" target="_blank">GlobalizationPreferences</a> sınıfının *static* olan <code>Languages</code> özelliğine başvurmak.

*Bu özelliğin de içerisinde diller dizi şeklinde durduğu için, ilk öğeyi aldığımızda, kullanıcının tercih ettiği dile ulaşmış oluruz*

<script src="https://gist.github.com/polatengin/eca20f3bfe1cd68cb5796442eebf31f7.js?file=option-2.cs"></script>

Hangi yöntemi tercih edersek edelim, elde ettiğimiz dil bilgisi <a href="https://tools.ietf.org/html/bcp47" target="_blank">BCP47</a> formatında olacak (*en-US*, *tr-TR*, gibi)

*Tarih formatı*, *Rakam formatı* gibi değerlerine ulaşabilmek için <a href="https://msdn.microsoft.com/en-us/library/system.globalization" target="_blank">System.Globalization</a> *namespace*'inde bulunan <a href="https://msdn.microsoft.com/en-us/library/system.globalization.cultureinfo" target="_blank">CultureInfo</a> sınıfına ihtiyacımız var.

<script src="https://gist.github.com/polatengin/eca20f3bfe1cd68cb5796442eebf31f7.js?file=CultureInfo.cs"></script>

Böylece, uygulamamız için gereken *tarih formatı*, *rakam formatı* gibi bilgilere ulaşabiliriz.

Ayrıca, **.Net**'in ilk yıllarından beri kullandığımız <a href="https://msdn.microsoft.com/en-us/library/system.globalization.cultureinfo" target="_blank">CultureInfo</a> sınıfının <a href="https://msdn.microsoft.com/en-us/library/system.globalization.cultureinfo.currentculture" target="_blank">CurrentCulture</a> özelliği hala varlığını sürdürmekte.

Bu özellik sayesinde bir adımda, istediğimiz <a href="https://msdn.microsoft.com/en-us/library/system.globalization.cultureinfo" target="_blank">CultureInfo</a> nesnesine kavuşabiliriz.

<script src="https://gist.github.com/polatengin/eca20f3bfe1cd68cb5796442eebf31f7.js?file=option-3.cs"></script>
