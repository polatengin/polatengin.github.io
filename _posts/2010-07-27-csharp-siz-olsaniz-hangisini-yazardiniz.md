---
layout: post
title: "C# siz olsanız hangisini yazardınız?"
date: 2010-07-27 09:00
author: engin.polat
comments: true
category: [C#]
tags: [code, csharp, method, parameter, sample, tercih]
---
İnternette gezerken şöyle bir kod parçasına rastladım;



public void ShowPanelWindow(bool isVisible)
{
    Visibility = isVisible ? Visibility.Visible : Visibility.Collapsed;
}
 
public void ShowBusy(bool isBusy)
{
    BusyIndicator.ShowIsBusy = isBusy;
}</pre>

Bu kodu yazan kişi, **eğer yukarıdaki kodu şimdi yazsaydım şöyle yazardım** demiş ve *aşağıdaki* kod parçasını yazmış;

<pre class="brush:csharp">public void HidePanelWindow()
{
    Visibility = Visibility.Collapsed;
}

public void ShowPanelWindow()
{
    Visibility = Visibility.Visible;
}

public void LookBusy()
{
    BusyIndicator.ShowIsBusy = true;
}

public void StopLookingBusy()
{
    BusyIndicator.ShowIsBusy = false;
}


Bu iki kodu okuduktan sonra, kendi kendime sordum ve ben de **ikinci tarz yaklaşımı** kullanırdım.

Peki siz olsanız hangi tarz kodu tercih ederdiniz?

Kısa kod mu? Kendini anlatan kod mu?

