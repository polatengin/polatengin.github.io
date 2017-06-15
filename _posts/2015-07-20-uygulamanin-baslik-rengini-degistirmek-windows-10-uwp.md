---
layout: post
title: "Uygulamanın başlık rengini değiştirmek - Windows 10 UWP"
date: 2015-07-20 13:10
author: engin.polat
comments: true
category: [Universal App]
tags: [applicationview, backgroundcolor, buttonbackgroundcolor, buttonforegroundcolor, constructor, foregroundcolor, getforcurrentview, titlebar, uwp, viewmanagement, windows10]
---
![](/assets/uploads/2015/07/CustomizeTitleBarUWP.png)

*Windows 10* için optimize edilen uygulamaların başlık renginin (uygulamanın *logosunun*, *isminin*, *kapat*-*büyüt*-*küçült* butonlarının olduğu başlık) sistem renginden farklı olabildiğini görebiliyoruz. Örneğin **Outlook**, **Excel**, **Word** uygulamalarının başlık rengi uygulamanın hakim rengi ile aynıdır.

**Universal Windows Platform** uygulamalarında başlık rengini değiştirebilmek çok basit. Başlık rengini değiştirmek istediğiniz ekranın *constructor*'ında <a href="https://msdn.microsoft.com/library/windows/apps/xaml/windows.ui.viewmanagement.applicationview" target="_blank">ApplicationView</a> sınıfının <a href="https://msdn.microsoft.com/library/windows/apps/xaml/windows.ui.viewmanagement.applicationview.getforcurrentview" target="_blank">GetForCurrentView()</a> methodunu çağırarak <a href="https://msdn.microsoft.com/library/windows/apps/xaml/windows.ui.viewmanagement.applicationview.titlebar" target="_blank">TitleBar</a> özelliğine erişebiliyorsunuz.

<a href="https://msdn.microsoft.com/library/windows/apps/xaml/windows.ui.viewmanagement.applicationviewtitlebar" target="_blank">ApplicationViewTitleBar</a> tipindeki *TitleBar* özelliği içerisinde yer alan **BackgroundColor**, **ForegroundColor**, **ButtonBackgroundColor** ve **ButtonForegroundColor** özelliklerini kullanarak istediğiniz rengi belirleyebilirsiniz.

*Kaynak : <a href="http://www.sluniverse.com/ffn/index.php/2015/08/customize-title-bar-color-in-windows-10-xaml-apps" target="_blank">Customize Title Bar Colors In Windows 10 XAML Apps</a>*

