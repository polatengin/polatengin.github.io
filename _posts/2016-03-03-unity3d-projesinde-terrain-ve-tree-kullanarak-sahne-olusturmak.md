---
layout: post
title: "Unity3D projesinde Terrain ve Tree kullanarak sahne oluşturmak"
date: 2016-03-03 10:00
author: engin.polat
comments: true
category: [Unity3D]
tags: [3d, asset, environment, gameobject, height, import, inspector, object, package, random, settings, terrain, unity3d, unityengine]
---
*Bu makaleyi okumadan önce <a href="/kategori/unity3d/" target="_blank" rel="noopener">Unity3D Kategorisi</a>ndeki diğer makalelerimi okumanızı tavsiye ederim.*

Bu makale sonunda oyun sahnenizde istediğiniz *yeryüzü şekilleri* ve *ağaçlar* oluşacak.

Öncelikle **Unity3D**'yi açarak bir oyun projesi oluşturuyoruz;

![](/assets/uploads/2016/03/terrain-0.png)

**GameObject** menüsü altından **3D Object** / **Terrain** menüsüne tıklıyor ve sahneye bir **Terrain** nesnesi ekliyoruz.

![](/assets/uploads/2016/03/terrain-1.jpg)

Sahneye eklediğimiz **Terrain** nesnesinin üzerine *ağaçlar* koymak istiyorsak, öncelikle projeye *Tree Asset* eklemeliyiz. Bunun için **Assets** menüsü altından **Import Package** / **Environment** menüsüne tıklamalıyız.

![](/assets/uploads/2016/03/terrain-3.jpg)

Açılan ekrandaki **Import** butonuna tıklıyoruz.

![](/assets/uploads/2016/03/terrain-2.jpg)

Böylece oyun sahnesine bir **Terrain** nesnesi ve **Terrain** üzerine yerleştireceğimiz *Tree Asset*'lerini eklemiş olduk.

**Inspector** panelinde bulunan **Add Tree** butonuna tıklıyoruz.

![](/assets/uploads/2016/03/terrain-4.jpg)

Açılan ekranda istediğimiz **Tree Asset**'lerden birini seçiyoruz;

![](/assets/uploads/2016/03/terrain-5.jpg)

Artık **Terrain** üzerine ekleyeceğimiz ağaçların farklı boylara sahip olması için **Tree Height** özelliğindeki aralığı istediğimiz gibi belirleyebilir, **Mass Place Trees** butonuna tıklayarak, açılan ekranda **Terrain** üzerine kaç ağaç eklemek istediğimizi belirleyebiliriz.

Bu makalede ben *1.000* ağaç ekleyeceğim.

![](/assets/uploads/2016/03/terrain-6.jpg)

Ağaçlar eklendikten sonra *sahnemiz* aşağıdaki gibi gözüküyor olmalı.

![](/assets/uploads/2016/03/terrain-7.jpg)

**Inspector** panelinde yeralan **Raise/Lower Terrain** butonuna tıklayarak **Terrain** üzerinde *yükseltiler* ve *alçaltılar* oluşturabiliriz. İstediğimiz şekli seçip, **Settings** altında yeralan **Brush Size** ile büyüklüğü belirleyip **Terrain** üzerinde *dağlar* ve *vadiler* oluşturabiliriz.

![](/assets/uploads/2016/03/terrain-8.jpg)

Eğer yakından bakacak olursak, **Terrain** üzerine eklediğimiz ağaçların dağların ve vadilerin yamaçlarında da yer alabildiğini görebiliriz.

![](/assets/uploads/2016/03/terrain-9.jpg)

Böylece istediğimiz kadar *gerçekçi* bir **oyun alanı** oluşturabilmemiz mümkün.

