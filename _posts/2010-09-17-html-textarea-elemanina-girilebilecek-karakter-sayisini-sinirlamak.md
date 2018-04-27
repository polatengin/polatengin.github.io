---
layout: post
title: "HTML TextArea elemanına girilebilecek karakter sayısını sınırlamak"
date: 2010-09-17 06:56
author: engin.polat
comments: true
category: [Programlama]
tags: [attribute, browser, document, function, getelementbyid, html, innerhtml, input, javascript, maxlength, onkeyup, span, text, textarea, type, var]
---
**HTML**'de **metin kutularına** (*&lt;input type="text" /&gt;*) girilebilecek *karakter sayısını* <a href="http://www.w3schools.com/tags/att_input_maxlength.asp" target="_blank" rel="noopener">maxlength</a> özelliği ile **kısıtlayabiliyoruz**;



&lt;input type="text" id="AdSoyad" maxlength="75" /&gt;</pre>

Fakat **TextArea** elemanı için **maxlength** özelliği yer *almamaktadır*.

Eğer **TextArea** elemanı için **maxlength** özelliğini sağlamak istersek, sayfamıza **javascript** kodu eklememiz gerekir.

Örneğin, ilgili **TextArea** elemanına *100 karakterlik* bir sınır koymak istiyorsak, aşağıdaki **javascript** kodunu sayfamıza ekleyebiliriz;

<pre class="brush:xml">&lt;script type="text/javascript"&gt;
    function TextAreaKarakterSayisiDogrula()
    {
        var sonSayi = 100 - document.getElementById("Adres").value.length;
        if (sonSayi &gt;= 0)
        {
            document.getElementById("KalanKarakterSayac").innerHTML = sonSayi;
        }
        else
        {
            document.getElementById("Adres").value = document.getElementById("Adres").value.substring(0, 100);
            document.getElementById("KalanKarakterSayac").innerHTML = 0;
        }
    }
&lt;/script&gt;

&lt;textarea id="Adres" onkeyup="TextAreaKarakterSayisiDogrula()" cols="20" rows="5"&gt;&lt;/textarea&gt;

Kalan karakter sayısı : &lt;span id="KalanKarakterSayac"&gt;100&lt;/span&gt;


Örnek kodu herhangi bir **html** sayfasına koyarsanız, *farklı tarayıcılarda* **sorun çıkartmadan** çalışacaktır.

