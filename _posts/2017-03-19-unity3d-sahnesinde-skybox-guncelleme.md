---
layout: post
title: "Unity3D sahnesinde Skybox güncelleme"
date: 2017-03-19 10:00
author: engin.polat
comments: true
category: [Unity3D]
tags: [3d, asset, environment, scene, skybox, gameobject, unity3d, unityengine, hierarchy, camera, clearflags, component]
---
*Bu makaleyi okumadan önce <a href="/kategori/unity3d/" target="_blank" rel="noopener">Unity3D Kategorisi</a>ndeki diğer makalelerimi okumanızı tavsiye ederim.*

Bu makale sonunda oyun sahnenizin görülebilir en uzak noktalarını (yani sahnenin <code>Skybox</code>'ını) istediğiniz bir resim ile değiştirebileceksiniz.

<mark>Oynadığımız oyunların atmosferini belirleyen en önemli etkenlerden biri içinde bulunduğumuz dünyadır.</mark>

Dünyanın (veya uzayın, denizaltının, başka bir gezegenin, vs) sınırlarında gördüğümüz tüm alan **Unity3D** projesinde <code>Skybox</code> olarak isimlendirilir.

Hemen yeni bir **Unity3D** projesi oluşturalım ve <code>Skybox</code>'ı nasıl değiştirebileceğimizi görelim;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/03/skybox-0.png" />

**Hierarchy** paneli altında bulunan *Main Camera* nesnesini seçip **Inspector** paneline bakarsak, **Camera** nesnemizin **Clear Flags** seçeneğinde <code>Skybox</code> seçili olduğunu görebiliriz.

<img class="lazy img-responsive" data-src="/assets/uploads/2017/03/skybox-1.jpg" />

Bu noktada projemize <code>Skybox</code> olarak kullanabileceğimiz görseller eklememiz lazım.

<code>Skybox</code> olarak ekleyeceğimiz görseller için aşağıdaki grafiklerden faydalanabiliriz;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/03/skybox-2.png" />

İstediğimiz görsellerden bir <code>Skybox</code> ürettiğimizde aslında tüm sahnemizin (*Main Camera*, *Directional Light*, *Character*, vs) içinde olacağı bir küpün iç yüzeyini kaplamış oluyoruz;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/03/skybox-3.png" />

Ben <code>Skybox</code> olarak kullanmak için 6 adet görsel hazırlamak yerine **Unity3D**'nin **Asset Store**'undan faydalanacağım.

**Unity3D** editöründe *Window* &rarr; *Asset Store* menüsünü açalım ve <code>Skybox</code> anahtar kelimesi ile arama yapalım, keyfimize göre istediğimiz bir paketi önce **Download** sonra **Import** butonuna tıklayarak projeye ekleyelim;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/03/skybox-4.png" />

**Hierarchy** paneli içerisinde *Main Camera* nesnesi seçili durumda iken, **Inspector** panelindeki **Add Component** butonuna basalım ve açılan ekranda <code>Skybox</code> seçeneğini seçip, *Main Camera* nesnemize bir <code>Skybox</code> **component**'i ekleyelim.

<img class="lazy img-responsive" data-src="/assets/uploads/2017/03/skybox-5.jpg" />

Şimdi **Project** paneli içerisinde sağ tuşla tıklayalım ve *Create* &rarr; *Material* menüsünü seçelim, yeni eklediğimiz **Material**'a bir isim verelim (*mars*, *sualti*, *sahra*, vs) ve **Inspector** panelinde her bir yüzey için uygun resmi sürükleyerek bırakalım;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/03/skybox-6.png" />

Son olarak, *Main Camera* nesnesine eklediğimiz <code>Skybox</code> **component**'inin **Custom Skybox** özelliğine oluşturduğumuz **Material**'i sürükleyerek bırakıyoruz.

Böylece oyunumuzun sahnesinin <code>Skybox</code>'ını değiştirmiş olduk. Artık oyunumuz (seçtiğimiz 6 adet görsele göre) *uzayda*, *sualtında*, *iki güneşi olan bir gezegende*, vs geçebilir.