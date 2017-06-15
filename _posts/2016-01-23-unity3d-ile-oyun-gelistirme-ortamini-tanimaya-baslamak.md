---
layout: post
title: "Unity3D ile oyun geliştirme ortamını tanımaya başlamak"
date: 2016-01-23 20:54
author: engin.polat
comments: true
category: [Unity3D]
tags: [2d, 3d, add component, android, asset, camera, cross-platform, cube, cylinder, directional light, game, hierarchy, inspector, ios, light, linux, material, model, ortographic, packages, panel, perspective, playstation, projection, rigidbody, scene, script, sphere, spotlight, texture, windows, xbox]
---
**Unity3D** *cross-platform* bir oyun geliştirme aracıdır. **Unity3D**'yi kullanarak geliştirdiğimiz oyunu çok basit bir şekilde *Windows*, *Android*, *iOS*, *Linux*, *Xbox*, *Playstation*, vs. ortamlarına yükleyebiliriz.

![logo](/assets/uploads/2016/01/logo.png)

Öncelikle <a href="http://unity3d.com/get-unity" target="_blank">http://unity3d.com/get-unity</a> adresinden **Unity3D** kurulum dosyasını indiriyoruz ve bilgisayarımıza kurulumu gerçekleştiriyoruz.

İsmi **Unity3D** olmasına rağmen, *4.3* versiyondan itibaren *2D* oyunlar da yapabilmemize olanak tanıyan yeni yapılar içeriyor. Böylece *2D* oyunları da **Unity3D**'yi kullanarak yapabiliyoruz.

**Unity3D**'yi açıp, hemen yeni bir oyun projesi oluşturalım;

Pencerenin üstünde yeralan *New* butonuna tıklıyor, gelen ekrandaki alanları doldurarak oyun projemizi oluşturuyoruz.

![00](/assets/uploads/2016/01/00.png)

**Unity3D** editörü karşımıza geliyor. *Editör*'ün içinde yeralan panelleri istediğimiz gibi özelleştirebiliyoruz. Böylece oyun projesindeki dosyaları pencerenin altına değil soluna yerleştirmemiz veya oyun sahnesini küçültüp oyunun önizlemesini ekrana koymamız mümkün.

![01](/assets/uploads/2016/01/01.png)

**Unity3D** Editörünün panellerine hızlıca bakalım;



*   **Hierarchy:** Oyun sahnesinde bulunan tüm nesnelerin listesinin gözüktüğü panel. Yeni bir oyun projesi oluşturduğunuzda bu panel'de *Main Camera* nesnesi gözükür. Eğer sahneye *Cube*, *Sphere*, *Cylinder*, *Spotlight*, vs gibi nesneler ekleyecek olursak, bu panel'de listelenecekler. Bu panel'de listelenen nesneleri sürükleyip diğer bir nesnenin içine bırakarak nesneleri birbirleri ile ilişkilendirebilir ve *parent/child* yapısı oluşturabiliriz.

*   **Scene:** Oyun alanını bu alanda görür, modeller, tasarlarız. Herhangi bir nesneyi sahnede bulmak için *Hierarchy* panelindeki ismine çift tıklamamız yeterli.

*   **Project Assets:** Oyun içerisinde kullanabileceğimiz herşey (*Texture*, *3D Model*, *Script*, vs) bu panelde listelenir. Bu panelde yeralan dosyalar oyun projesinin diskteki dizini ile birebir aynıdır. Oyun projesinin dizininde yeni bir dizin veya dosya oluşturursak aynı anda *Project Assets* panelinde gözükmeye başlar.

*   **Inspector:** *Hierarchy* veya *Scene* panellerinden seçilen nesne veya nesnelerin özelliklerini görebildiğimiz ve değiştirebildiğimiz paneldir. *Inspector* paneli sayesinde bir nesnenin oyun sahnesindeki *konum*, *boyut*, *renk*, *kaplama*, vs gibi özelliklerini görebilir, değiştirebiliriz.


**Unity3D**'de bir oyun sahnesi oyuncuya kamera'nın bakış açısından gösterilir. Böylece ekrandan daha büyük alanlarda hareket etmek için aslında kamera'yı hareket ettiririz. **Unity3D** bir oyun projesi oluşturduğumuzda bizim için sahneye bir tane kamera (*Main Camera*) ekler. İstersek biz de sahneye ikinci veya üçüncü kameralar ekleyebiliriz.

![02](/assets/uploads/2016/01/02.png)

3D oyunlarda kamera'nın **Projection** özelliği (kamera seçili iken *Inspector* panelinde görüntülenir) **Perspective** seçili iken, 2D oyunlarda kamera'nın **Projection** özelliği **Ortographic** seçili olmalıdır.

![03](/assets/uploads/2016/01/03.png)

Eğer istersek *Hierarchy* panelinde görüntülenen nesnelerin isimlerini değiştirebiliriz, bunun için ilgili nesnenin üzerine sağ tuşla tıklayıp *Rename* menüsünü seçmemiz yeterli. Böylece *Directional Light* nesnesinin ismini *Güneş* olarak veya *Cube* nesnesinin ismini *Sandık* olarak değiştirebiliriz.

![04](/assets/uploads/2016/01/04.png)

**Unity3D**'de sahnede olan bir nesneye kendi özelliklerinin dışında yeni özellikler eklemek istiyorsak **Inspector** panelinde bulunan **Add Component** butonuna tıklamalı ve gelen listeden eklemek istediğimiz özelliğe göre bir öğeyi seçmeliyiz. Örneğin; **Cube** nesnemizin yerçekimi kanunlarına uymasını istiyorsak nesneye **Rigidbody** component'ını eklemeliyiz.

![05](/assets/uploads/2016/01/05.png)

Eğer sahneye yeni nesneler eklemek istiyorsak basitçe **Hierarchy** panelinde boş bir yere sağ tuşla tıklayıp **3D Object** menüsü altından *Cube*, *Sphere*, *Cylinder*, vs seçerek sahneye ekleyebiliriz.

![06](/assets/uploads/2016/01/06.png)

**Hierarchy** panelinde sahneye eklediğimiz birden fazla nesneyi başka bir nesnenin içerisine sürükleyip bırakarak bir bütün olarak ele alınmalarını sağlayabiliriz. Böylece birlikte hareket ettirilip, birlikte döndürülebilir veya boyutlandırılabilirler.

![07](/assets/uploads/2016/01/07.png)

**Project Assets** paneli içerisinde boş bir alana sağ tuşla tıklayıp oyun projesine yeni dizin, yeni script dosyası, yeni materyal, vs eklemek mümkün.

![08](/assets/uploads/2016/01/08.png)

Genelde **Project Assets** panelinde ismi **Scenes** olan bir dizin oluşturulur ve oyun'daki sahneler bu dizine kaydedilir.

![09](/assets/uploads/2016/01/09.png)

Eğer aktif sahneyi oynamak istiyorsak **Unity3D** editörü ekranının üstünde yeralan *başlat* (*oynat*) butonuna tıklanır ve oyun kamera'nın bakış açısından oynanmaya başlanır.

![10](/assets/uploads/2016/01/10.png)

Oyuna eklemek istediğimiz çeşitli nesneler veya özellikler ile ilgili daha önce oluşturulmuş paketleri oyuna **Assets** menüsü altında bulunan **Add Packages** alt menüsü içerisinden ekleyebiliriz. Böylece oyuna hızlı bir şekilde ağaçlar, deniz, çeşitli arabalar, efektler veya duman / alev / havai fişek gösterisi, vs ekleyebilmemiz mümkün.

![11](/assets/uploads/2016/01/11.png)

