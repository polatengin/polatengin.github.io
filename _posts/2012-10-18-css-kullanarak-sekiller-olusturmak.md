---
layout: post
title: "CSS kullanarak şekiller oluşturmak"
date: 2012-10-18 09:30
author: engin.polat
comments: true
category: [Web]
tags: [background, border, border-radius, css, css3, height, width]
---
*Güncelleme: CSS3 ile birlikte aşağıdaki liste ve stiller güncellendi*

**CSS** stillerini kullanarak web sayfalarına çeşitli şekiller ekleyebiliriz.

Aşağıdaki listede kullanabileceğiniz birçok *şekil* bulunmakta;



#square { width: 100px; height: 100px; background: red; }

#rectangle { width: 200px; height: 100px; background: red; }

#circle { width: 100px; height: 100px; background: red; border-radius: 50%; }

#oval { width: 200px; height: 100px; background: red; border-radius: 100% / 50%; }

#triangle-up { width: 0; height: 0; border-left: 50px solid transparent; border-right: 50px solid transparent; border-bottom: 100px solid red; }

#triangle-down { width: 0; height: 0; border-left: 50px solid transparent; border-right: 50px solid transparent; border-top: 100px solid red; }

#triangle-left { width: 0; height: 0; border-top: 50px solid transparent; border-right: 100px solid red; border-bottom: 50px solid transparent; }

#triangle-right { width: 0; height: 0; border-top: 50px solid transparent; border-left: 100px solid red; border-bottom: 50px solid transparent; }

#triangle-topleft { width: 0; height: 0; border-top: 100px solid red; border-right: 100px solid transparent; }

#triangle-topright { width: 0; height: 0; border-top: 100px solid red; border-left: 100px solid transparent; }

#triangle-bottomleft { width: 0; height: 0; border-bottom: 100px solid red; border-right: 100px solid transparent; }

#triangle-bottomright { width: 0; height: 0; border-bottom: 100px solid red; border-left: 100px solid transparent; }

#star-six { width: 0; height: 0; border-left: 50px solid transparent; border-right: 50px solid transparent; border-bottom: 100px solid red; position: relative; } #star-six:after { width: 0; height: 0; border-left: 50px solid transparent; border-right: 50px solid transparent; border-top: 100px solid red; position: absolute; content: ""; top: 30px; left: -50px; }

#pacman { width: 0px; height: 0px; border-right: 60px solid transparent; border-top: 60px solid red; border-left: 60px solid red; border-bottom: 60px solid red; border-top-left-radius: 60px; border-top-right-radius: 60px; border-bottom-left-radius: 60px; border-bottom-right-radius: 60px; }

#talkbubble { width: 120px; height: 80px; background: red; position: relative; border-radius: 10px; } #talkbubble:before { content:""; position: absolute; right: 100%; top: 26px; width: 0; height: 0; border-top: 13px solid transparent; border-right: 26px solid red; border-bottom: 13px solid transparent; }


![](/assets/uploads/2012/10/css.png)

*Kaynak: <a href="https://css-tricks.com/examples/ShapesOfCSS/" target="_blank">Shapes of CSS</a>*

