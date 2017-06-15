---
layout: post
title: "Windows 10 UWP uygulamasında Page.Resources içinde Style kullanmak"
date: 2016-01-31 20:00
author: engin.polat
comments: true
category: [Windows]
tags: [border, column, columndefinition, grid, page, resource, stackpanel, style, textblock, uwp, windows, windows10]
---
**Windows 10 UWP** uygulaması yazarken bazen ekranda **stil** verdiğimiz bir nesnenin stilini aynı tipteki diğer nesnelere de uygulamak isteriz.

Böyle bir durumda içinde bulunduğumuz <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.page" target="_blank">Page</a>'in <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.frameworkelement.resources" target="_blank">Resources</a> kısmına stillerimizi ortak bir şekilde tanımlamak ve sayfanın içinde aynı tipteki nesnelerde kullanmak iyi bir çözüm yolu olabilir.

Bu makalede örnek olarak, *saati* gösterecek veya belli bir süreden *geri sayım* yapabilecek aşağıdaki sayfayı **UWP** ile tasarlayacağız;

![](/assets/uploads/2016/01/style-1.png)

Öncelikle sayfanın kodlarını aşağıdaki hale getirip *temizleyelim*;



&lt;Page
    x:Class="PageResourceStyleOrnek.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:PageResourceStyleOrnek"&gt;

&lt;/Page&gt;</pre>

Sayfaya önce bir <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.stackpanel" target="_blank">StackPanel</a> nesnesi, **StackPanel** nesnesinin içerisine bir <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.grid" target="_blank">Grid</a> nesnesi, **Grid** nesnesinin <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.grid.columndefinitions" target="_blank">ColumnDefinitions</a> özelliğine de *5 adet* <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.columndefinition" target="_blank">ColumnDefinition</a> ekliyoruz.

Aynı şekilde **Grid** nesnesinin içerisine her <a href="https://msdn.microsoft.com/library/system.windows.controls.grid.column" target="_blank">Column</a>'a birer tane denk gelecek şekilde <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.border" target="_blank">Border</a> nesneleri ekliyoruz, **Border** nesnelerinin içerisine <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.textblock" target="_blank">TextBlock</a> veya <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.stackpanel" target="_blank">StackPanel</a> içerisinde <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.textblock" target="_blank">TextBlock</a> ekliyoruz.

**Border** nesnelerini kullanmamızın sebebi, **TextBlock** nesnesi tek başına **arkaplan** rengine sahip olamaz, eğer **Border** nesnesinin içerisine koyarsak, **Border** nesnesine verdiğimiz <a href="https://msdn.microsoft.com/library/windows.ui.xaml.controls.border.background" target="_blank">Background</a> özelliği sayesinde bir **arkaplan** rengi olabilir.

<pre class="brush:xml">&lt;StackPanel Margin="10"&gt;
    &lt;Grid&gt;
        &lt;Grid.ColumnDefinitions&gt;
            &lt;ColumnDefinition Width="*" /&gt;
            &lt;ColumnDefinition Width="Auto" /&gt;
            &lt;ColumnDefinition Width="*" /&gt;
            &lt;ColumnDefinition Width="Auto" /&gt;
            &lt;ColumnDefinition Width="*" /&gt;
        &lt;/Grid.ColumnDefinitions&gt;

        &lt;Border Grid.Column="0"&gt;
            &lt;StackPanel Orientation="Horizontal"&gt;
                &lt;TextBlock Text="0" /&gt;
                &lt;TextBlock Text="0" /&gt;
            &lt;/StackPanel&gt;
        &lt;/Border&gt;
        &lt;Border Grid.Column="1"&gt;
            &lt;TextBlock Text=":" /&gt;
        &lt;/Border&gt;
        &lt;Border Grid.Column="2"&gt;
            &lt;StackPanel Orientation="Horizontal"&gt;
                &lt;TextBlock Text="0" /&gt;
                &lt;TextBlock Text="0" /&gt;
            &lt;/StackPanel&gt;
        &lt;/Border&gt;
        &lt;Border Grid.Column="3"&gt;
            &lt;TextBlock Text=":" /&gt;
        &lt;/Border&gt;
        &lt;Border Grid.Column="4"&gt;
            &lt;StackPanel Orientation="Horizontal"&gt;
                &lt;TextBlock Text="0" /&gt;
                &lt;TextBlock Text="0" /&gt;
            &lt;/StackPanel&gt;
        &lt;/Border&gt;

    &lt;/Grid&gt;
&lt;/StackPanel&gt;</pre>

Böylece **tasarım** anında ekranımız aşağıdaki gibi gözükecek;

![](/assets/uploads/2016/01/style-2.png)

İstediğimiz ekran tasarımına *henüz* sahip değiliz, fakat *yaklaştık*. Sayfada birçok nesnenin aynı şekilde gözükmesini istiyoruz, eğer hepsinde aynı *özelliklere* aynı *değerleri* verecek olursak aslında bunu elde edebiliriz. Fakat daha sonra değişiklik yapması zor olur, kodun karmaşıklığı artar, vs.

Sayfadaki **Page** elementinin içerisine **Resources** elementi ekler ve içerisine istediğimiz nesnelerin ortak sahip olacağı *stilleri* yazarsak bu problemlerin önüne geçmiş oluruz;

<pre class="brush:xml">&lt;Page.Resources&gt;
    &lt;Style TargetType="Border"&gt;
        &lt;Setter Property="Background" Value="#e67e22" /&gt;
        &lt;Setter Property="Padding" Value="10" /&gt;
    &lt;/Style&gt;
    &lt;Style TargetType="TextBlock"&gt;
        &lt;Setter Property="FontSize" Value="20" /&gt;
        &lt;Setter Property="Foreground" Value="White" /&gt;
        &lt;Setter Property="Margin" Value="10" /&gt;
    &lt;/Style&gt;
&lt;/Page.Resources&gt;</pre>

Öncelikle **Page.Resources** elementini oluşturuyoruz, sayfadaki tüm **Border** nesneleri için hangi özelliklere hangi değeri atamak istiyorsak, <a href="https://msdn.microsoft.com/library/system.windows.style" target="_blank">Style</a> elementi içerisinde <a href="https://msdn.microsoft.com/library/system.windows.setter" target="_blank">Setter</a> elementini kullanarak, <a href="https://msdn.microsoft.com/library/system.windows.setter.property" target="_blank">Property</a> ve <a href="https://msdn.microsoft.com/library/system.windows.setter.value" target="_blank">Value</a> değerlerine atamalar yapıyoruz.

Aynı şekilde sayfadaki tüm **TextBlock** nesneleri için de ortak özelliklere değer atamaları yapıyoruz.

Tüm **Border** ve **TextBlock** nesnelerine aynı değerleri tek tek atamak yerine, **Page.Resources** içerisinde ortak bir şekilde atamış olduk. Artık arkarengi değiştirmek istersek, tek bir yerden değiştirebileceğiz;

<pre class="brush:xml">&lt;Setter Property="Background" Value="#9b59b6" /&gt;


![](/assets/uploads/2016/01/style-3.png)

