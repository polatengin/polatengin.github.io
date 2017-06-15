---
layout: post
title: "C# ile iki tarih arasında belli bir günden kaç adet olduğunu bulmak"
date: 2013-02-02 10:00
author: engin.polat
comments: true
category: [C#]
tags: [adddays, count, csharp, datetime, dayofweek, Enumerable, IEnumerable, list, range, select, subtract, totaldays, where]
---
Geliştirdiğim projede *iki tarih aralığında* belirli bir günden **kaç adet** olduğunu bulmam gerekti.

Bunun için iki tarih arasındaki gün farkını alıp, bir tarih listesi oluşturmak için kullanıyorum, daha sonra tarih listesinin içinde istediğim gün'den kaç tane olduğunu sayıyorum.

Örneğin 2013 yılındaki Pazartesilerin adedi için;



var baslangic = new DateTime(2013, 1, 1);
var bitis = new DateTime(2013, 12, 31);
var toplamGun = (int)bitis.Subtract(baslangic).TotalDays + 1;

var tarihListe = Enumerable.Range(1, toplamGun).Select(e =&gt; baslangic.AddDays(e));

var gunAdet = tarihListe.Where(e => e.DayOfWeek == DayOfWeek.Monday).Count();


