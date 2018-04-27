---
layout: post
title: "Unity3D ile kendi etrafında dönen Cube yapmak"
date: 2016-01-23 21:30
author: engin.polat
comments: true
category: [Unity3D]
tags: [3d, asset, camera, cube, deltatime, directional light, editor, fps, gameobject, hierarchy, light, object, rotate, scene, script, start, time, transform, unity3d, unityengine, update, vector3]
---
*Bu makaleyi okumadan önce <a href="/kategori/unity3d/" target="_blank" rel="noopener">Unity3D Kategorisi</a>ndeki diğer makalelerimi okumanızı tavsiye ederim.*

Bu makale sonunda sahneye koyacağınız bir **Cube** nesnesini kendi ekseni etrafında istediğiniz hızda döndürebileceksiniz.

Öncelikle **Unity3D**'yi açarak bir oyun projesi oluşturuyoruz;

![](/assets/uploads/2016/01/1-00.png)

**Unity3D Editor** açıldıktan sonra, sahneye bir tane **Cube** nesnesi ekliyoruz;

![](/assets/uploads/2016/01/1-01.png)



*   **Hierarchy** panelinde boş bir yere sağ tuşla tıklanır
*   **3D Object** menüsü altından **Cube** seçeneği seçilir
*   **Hierarchy** paneline eklenen **Cube** nesnesine çift tıklanır ve **Scene** alanında **Cube** nesnesine odaklanılır

![](/assets/uploads/2016/01/1-02.png)

Sahnedeki nesnelerin gözükebilmesi için üzerlerine **ışık** tutmak gerekir;



*   **Hierarchy** panelinde boş bir yere sağ tuşla tıklanır
*   **Light** menüsü altından **Directional Light** seçeneği seçilir

![](/assets/uploads/2016/01/1-03.png)

Kamera bakış açısını **Scene** alanında gördüğümüz gibi yapmak için **Main Camera** nesnesi seçili iken **GameObject** menüsünden **Align with View** alt menüsü seçilir.

**Hierarchy** panelinden **Cube** nesnesi seçilir, **Inspector** panelinde gözüken **Add Component** butonuna tıklanır, **New Script** menüsüne tıklanır ve *SpinningCube* yazılır.

![](/assets/uploads/2016/01/1-04.png)

**Project Assets** panelinde gözüken *SpinningCube.cs* dosyasına çift tıklanır ve **Cube** nesnesine eklediğimiz script dosyası açılır.

*SpinningCube.cs* dosyası içinde iki **method** yer almaktadır;



using UnityEngine;
using System.Collections;

public class SpinningCube : MonoBehaviour {

    // Use this for initialization
    void Start () {
    
    }
    
    // Update is called once per frame
    void Update () {
    
    }
}</pre>

**Start()** methodu, **Cube** nesnesi oyunda ilk oluşturulduğunda bir defa çalıştırılır. **Update()** methodu ise oyunun her "*kare*"sinde tekrar tekrar çalıştırılır. Örneğin, 60fps hızında bir oyunda **Update()** methodu saniyede 60 defa çalışacaktır.

**Update()** methodu içerisinde **Cube** nesnesini *yukarı-aşağı* eksen etrafında hareket ettirmemiz gerekiyor. Böylece kendi ekseni etrafında dönüyormuş gibi gözükecek.

<pre class="brush:csharp">void Update () {
    transform.Rotate(Vector3.up, Time.deltaTime * 30);
}


**Vector3.up** ile, *yukarı-aşağı* yönlü ekseni belirliyoruz, **Time.deltaTime** ile oyunun çalıştığı cihazın hızından bağımsız olarak hareket etmesini garantiliyoruz, böylece hızlı cihazlarda hızlı, yavaş cihazlarda yavaş dönmeyecek. Son olarak 30 ile çarparak bir miktar hızlı dönmesini sağlıyoruz.

Şimdi oyunu çalıştırarak **Cube** nesnesinin kendi ekseni etrafında döndüğünü görelim;

![](/assets/uploads/2016/01/1-05.gif)

