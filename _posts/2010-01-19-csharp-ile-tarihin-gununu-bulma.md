---
layout: post
title: "C# ile Tarihin Gününü Bulma"
date: 2010-01-19 18:01
author: engin.polat
comments: true
category: [C#]
tags: [code, csharp, cultureinfo, datetime, datetimeformat, daynames, dayofweek, getcultureinfo, now, source, tostring]
---
Uygulamanızda **tarih** göstereceğiniz ekranlarda, tarihin gününü de göstermek istersiniz. Hatta gün isimlerinin, kullanıcının dilinde olmasını istersiniz.

Öncelikle ilgili tarihin hangi güne geldiğini bulalım;


int gun1 = (int)DateTime.Now.DayOfWeek;
int gun2 = (int)DateTime.Now.AddMonth(-5).DayOfWeek;
int gun3 = (int)DateTime.Parse("2009-01-05").DayOfWeek;</pre>
Dikkat etmemiz gereken şey; *DayOfWeek* ilgili tarihin hangi güne denk geldiğini bulurken, **Pazar** gününü baz alır.

Uygulamayı kullanan kullanıcının kendi dilinde gün ismini bulmak için;
<pre class="brush:csharp">string gun1 = DateTime.Now.ToString("dddd");
string gun2 = DateTime.Now.DayOfWeek;
string gun3 = DateTime.Parse("2009-01-05").DayOfWeek;
string gun4 = CultureInfo.CurrentCulture.DateTimeFormat.DayNames[(int)DateTime.Now.DayOfWeek];</pre>
İlgili tarihin hangi güne geldiğini başka bir dilde bulmak için;
<pre class="brush:csharp">string gun5 = CultureInfo.GetCultureInfo("tr-TR").DateTimeFormat.DayNames[(int)DateTime.Now.DayOfWeek];
string gun6 = CultureInfo.GetCultureInfo("de-DE").DateTimeFormat.DayNames[(int)DateTime.Now.DayOfWeek];


