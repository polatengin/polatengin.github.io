---
layout: post
title: "Bu kodda ne yanlış var? – 5"
date: 2010-07-29 11:30
author: engin.polat
comments: true
category: [C#]
tags: [allow, ASP.NET, authorization, bknyv, configuration, deny, security, web.config]
---
Bu sefer bir **web uygulaması** projesinde görevliyiz. Uygulamanın **yönetim panelini** *YonetimPaneli* dizini içerisinde geliştirdik.

Güvenlik açısından önlem almak için **web.config** dosyasına şu satırları ekledik;



<configuration>
    <location path="YonetimPaneli">
        <system .web>
            <authorization>
                <allow roles="BUILTIN\Administrators"></allow>
                <deny users="?"></deny>
            </authorization>
        </system>
    </location>
</configuration>


Fakat, **Proje Lideri** bu kodu gördükten sonra yüzü asıldı.

Sizce **problem nedir** ve **nasıl düzeltebiliriz**?

