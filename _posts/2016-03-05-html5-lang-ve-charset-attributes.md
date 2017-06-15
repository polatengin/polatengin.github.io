---
layout: post
title: "HTML5 lang ve charset attributes"
date: 2016-03-05 15:10
author: engin.polat
comments: true
category: [AspNet]
tags: [attribute, body, charset, Color, css, css3, font-family, head, html, html5, lang, meta, seo, style, text to speech]
---
**HTML** ve **HTML5** sayfalarında aşağıdaki sebeplerden ötürü <a href="http://www.w3schools.com/tags/att_global_lang.asp" target="_blank">lang</a> ve <a href="http://www.w3schools.com/tags/att_meta_charset.asp" target="_blank">charset</a> **attribute**'lerini kullanmak faydalıdır;



*   Görme engellilerin kullandığı özel yazılım veya donanımlara gerekli dönüşümleri yapabilmesi için bilgi verir (Braille alfabesi)
*   *Text-to-Speech* (*Metinden Yazıya*) çeviri yapabilen yazılım veya donanımlara hangi dil setinin kullanılacağı konusunda bilgi verir
*   Daha sonra gerçekleştirilecek dil dönüşümü işlemleri için hangi dillerin desteklendiği konusunda bilgi verir

Böylece hem **SEO** açısından hem de daha fazla insanın ve yazılımın ilgili sayfayı daha başarılı kullanabilmesi bakımından **lang** ve **charset** *attribute*'lerini kullanmak önemlidir.

**lang** attribute **Global Set** içerisinde tanımlı olduğu için bir **html** sayfasındaki tüm elementlerde kullanılabilir. Örneğin;

[code language="xml"]&lt;p lang='tr'&gt;Merhaba Dünya!&lt;/p&gt;
&lt;p lang='en'&gt;Hello World!&lt;/p&gt;
&lt;p lang='es'&gt;Hola Mundo!&lt;/p&gt;[/code]

Genellikle ise, **html** elementin kendisinde kullanılır, örneğin;

[code language="xml"]&lt;!doctype html&gt;
&lt;html lang='tr'&gt;
&lt;head&gt;
	&lt;title&gt;Merhaba Dünya&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;/body&gt;
&lt;/html&gt;[/code]

Hatta, sayfaların ilgili dil'e göre ayrı stillendirilebilmesi bile mümkün, örneğin;

[code language="css"]body {
	font-family: 'Palatino Linotype', 'Book Antiqua', Palatino, serif;
}
:lang(tr) {
	color: red;
}
:lang(en) {
	color: blue;
}
:lang(ar) {
	color: green;
	font-family: 'Traditional Arabic', 'Al Bayan', serif;
}[/code]

Böylece varsayılan yazı fontu *Palatino Linotype* olarak belirlendi, **Türkçe** sayfalarda yazı rengi *red* (*kırmızı*), **İngilizce** sayfalarda yazı rengi *blue* (*mavi*), **Arapça** sayfalarda yazı rengi *green* (*yeşil*) ve yazı fontu *Traditional Arabic* oldu.

*Mutlaka html dokümanlarında character set'i tanımlamalıyız.* *Character Set*'i tanımlamak için **charset** attribute kullanmamız yeterli. **charset** *attribute* kullanmak için **&lt;head&gt;** element içerisine **&lt;meta&gt;** element eklememiz yeterli. Aşağıdaki iki farklı kullanım yöntemi de aynı şekilde çalışır, istediğimizi tercih edebiliriz;

[code language="xml"]&lt;head&gt;
	&lt;meta charset='utf-8' /&gt;
&lt;/head&gt;[/code]

[code language="xml"]&lt;head&gt;
	&lt;meta http-equiv='Content-Type' content='text/html; charset=utf-8' /&gt;
&lt;/head&gt;[/code]

