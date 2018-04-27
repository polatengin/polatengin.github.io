---
layout: post
title: "Unity3D ile sahneye saat ve gerisayım eklemek"
date: 2016-01-27 08:37
author: engin.polat
comments: true
category: [Unity3D]
tags: [add component, camera, canvas, Color, datetime, deltatime, find, font, fontsize, gameobject, getcomponent, hierarchy, inspector, ortographic, projection, recttransform, rendercamera, rendermode, screenspace, script, start, text, time, unity3d, update]
---
*Bu makaleyi okumadan önce <a href="/kategori/unity3d/" target="_blank" rel="noopener">Unity3D Kategorisi</a>ndeki diğer makalelerimi okumanızı tavsiye ederim.*

Bu makale sonunda sahneye saati ve 60 saniyeden geri sayımı gösteren iki yazı koyabileceksiniz.

Öncelikle **Unity3D**'yi açarak bir oyun projesi oluşturuyoruz;

![](/assets/uploads/2016/01/3-00.png)

**Hierarchy** panelinden **Main Camera** nesnesini seçiyor ve **Projection** özelliğinde **Ortographic** değeri olduğunu kontrol ediyoruz. **Scene** alanında tam kamera'nın arkasından bakmak için **GameObject** menüsü altından **Align View to Selected** menüsüne tıklıyoruz.

![](/assets/uploads/2016/01/3-01.png)

Sahneye bir **Text** nesnesi eklemek için **Hierarchy** panelinde boş bir yere sağ tuşla tıklıyor ve **UI** kategorisi altından **Text** menüsünü seçiyoruz.

![](/assets/uploads/2016/01/3-02.png)

Oluşturulan **Canvas** ve **Text**'in kamera'nın gördüğü alanın içerisinde olmasını sağlamak için **Canvas** seçili iken **Render Mode** özelliğine **Screen Space - Camera** değerini giriyoruz. Ayrıca **Render Camera** özelliğine **Hierarchy** panelinden **Main Camera** nesnesini sürükleyip bırakıyoruz.

![](/assets/uploads/2016/01/3-03.png)

**Hierarchy** panelinden **Text** nesnesini seçip **Inspector** panelinde gözüken **Rect Transform** kategorisi altından sahnede gözükeceği konumu belirliyoruz. Örneğin sahnenin sol üst köşesinde olması için *left* sütunu ile *top* satırının kesiştiği hücreye tıklıyoruz.

**Hierarchy** panelinde gözüken **Text** nesnesine isim olarak *TimerText* değerini verdikten sonra **Edit** menüsü altından **Duplicate** seçeneğini seçerek aynı nesneden bir tane daha oluşturuyoruz.

Yeni oluşturduğumuz **Text** nesnesine isim olarak *CountdownText* verip, sahnenin sağ üst köşesine hizalıyoruz.

Her iki **Text** nesnesinin de **Inspector** panelinden erişilebilen **Font**, **Font Size** ve **Color** değerlerini değiştirerek, sahnede büyük beyaz harfler gösterecek hale getiriyoruz.

![](/assets/uploads/2016/01/3-04.png)

**Hierarchy** panelinden **Canvas** nesnesini seçip **Inspector** panelinden **Add Component** butonuna tıklıyoruz ve **New Script** seçeneğini seçiyoruz.

**Canvas** nesnesine eklediğimiz yeni script'e *TimeManager* ismini verebiliriz.

![](/assets/uploads/2016/01/3-05.png)

*TimeManager.cs* dosyasını açarak için aşağıdaki kodları yazıyoruz;



using System;
using UnityEngine;
using UnityEngine.UI;

public class TimeManager : MonoBehaviour
{
    Text timerText;
    Text countdownText;

    float countdownTo = 60.0F;

    void Start()
    {
        timerText = GameObject.Find("TimerText").GetComponent&lt;Text&gt;();
        countdownText = GameObject.Find("CountdownText").GetComponent&lt;Text&gt;();
    }

    void Update()
    {
        countdownTo -= Time.deltaTime;

        if (countdownTo > 0)
        {
            countdownText.text = countdownTo.ToString();
        }

        timerText.text = DateTime.Now.ToString("hh:MM:ss");
    }
}


Öncelikle **Start()** methodunda ismi *TimerText* ve *CountdownText* olan iki nesneyi bulup içlerindeki **Text** elementlerine erişiyoruz ve bunları birer değişkende saklıyoruz. Böylece daha sonra bu nesnelere kolay bir şekilde erişebileceğiz.

**Update()** methodunda 60 saniyeden geri sayma yapabilmek için *countdownTo* değişkeninden geçen süreyi çıkartıyoruz ve elde ettiğimiz değeri sahnedeki *CountdownText* nesnesinde gösteriyoruz.

Son olarak **Update()** methodunda <a href="https://msdn.microsoft.com/library/system.datetime" target="_blank" rel="noopener">DateTime</a> sınıfının <a href="https://msdn.microsoft.com/library/system.datetime.now" target="_blank" rel="noopener">Now</a> özelliğinden elde ettiğimiz değeri *saat:dakika:saniye* formatına çeviriyoruz ve sahnedeki *TimerText* nesnesinde gösteriyoruz.

Eğer oyunu başlatacak olursak 60 saniyeden geri sayım ve bilgisayarın saati ekranda gözükecek;

![](/assets/uploads/2016/01/3-06.gif)

