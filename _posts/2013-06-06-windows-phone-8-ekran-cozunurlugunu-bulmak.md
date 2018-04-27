---
layout: post
title: "Windows Phone 8 ekran çözünürlüğünü bulmak"
date: 2013-06-06 11:50
author: engin.polat
comments: true
category: [Programlama]
tags: [720p, content, resolution, scalefactor, screen, windows phone, windowsphone, wp8, wvga, wxga]
---
**Windows Phone 8**, 3 farklı ekran çözünürlüğünü destekler; *WVGA*, *WXGA*, *720p*

<div class="alignleft">
![](/assets/uploads/2013/06/480x800.png)
**WVGA**
480 x 800
*15 : 9*
</div>
<div class="alignleft">
![](/assets/uploads/2013/06/768x1280.png)
**WXGA**
768 x 1280
*15 : 9*
</div>
<div class="alignleft">
![](/assets/uploads/2013/06/720x1280.png)
**720p**
720 x 1280
*16 : 9*
</div>

<div class="alignleft">
Eğer programatik olarak *ekran çözünürlüğünü* bulmak istiyorsanız, *App.Current.Host.Content* altında tanımlı olan <a href="http://msdn.microsoft.com/library/windowsphone/develop/system.windows.interop.content.scalefactor" title="Content.ScaleFactor Property" target="_blank" rel="noopener">ScaleFactor</a> özelliğini kullanmanız gerekiyor;



var cozunurluk = App.Current.Host.Content.ScaleFactor;


Yukarıdaki örnek kodda, *cozunurluk* değişkenine *100* (**WVGA**), *160* (**WXGA**) veya *150* (**720p**) değerlerinden biri atanacaktır.
</div>

