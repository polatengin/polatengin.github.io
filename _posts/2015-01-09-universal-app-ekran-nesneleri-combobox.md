---
layout: post
title: "Universal App Ekran Nesneleri - Combobox"
date: 2015-01-09 18:00
author: engin.polat
comments: true
category: [Programlama]
tags: [combobox, comboboxitem, event, isselected, method, selectedindex, selecteditem, selectionchanged, universal app, wp8, xaml]
---
Geliştirdiğiniz uygulamada sınırlı bir alanda çok seçenekten bir tanesini seçtirmek istiyorsanız <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.combobox" target="_blank">Combobox</a> ekran nesnelerini kullanmalısınız.

![](/assets/uploads/2015/01/Combobox1.png)

**Universal App** projenizde **combobox** kullanmak için istediğiniz **xaml** dosyasına aşağıdaki kod parçasını eklemeniz yeterlidir;



&lt;ComboBox x:Name="cmbMenu"&gt;
    &lt;ComboBoxItem Content="Birinci Eleman" /&gt;
    &lt;ComboBoxItem Content="İkinci Eleman" IsSelected="True" /&gt;
    &lt;ComboBoxItem Content="Üçüncü Eleman" /&gt;
    &lt;ComboBoxItem Content="Dördüncü Eleman" /&gt;
    &lt;ComboBoxItem Content="Beşinci Eleman" /&gt;
    &lt;ComboBoxItem Content="Altıncı Eleman" /&gt;
&lt;/ComboBox></pre>

Ekranın açılışında varsayılan olarak seçili gelmesini istediğiniz <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.comboboxitem" target="_blank">ComboboxItem</a> tipindeki elemanın <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.primitives.selectoritem.isselected" target="_blank">IsSelected</a> özelliğini *true* yapmalısınız.

![](/assets/uploads/2015/01/Combobox2.png)

Eğer açılır kutunun bir başlığı olması gerekiyorsa, Header özelliği ile bir başlık atayabiliriz;

<pre class="brush:xml">&lt;ComboBox x:Name="cmbMenu" Header="Menü"&gt;
    &lt;ComboBoxItem Content="Birinci Eleman" /&gt;
    &lt;ComboBoxItem Content="İkinci Eleman" IsSelected="True" /&gt;
    &lt;ComboBoxItem Content="Üçüncü Eleman" /&gt;
    &lt;ComboBoxItem Content="Dördüncü Eleman" /&gt;
    &lt;ComboBoxItem Content="Beşinci Eleman" /&gt;
    &lt;ComboBoxItem Content="Altıncı Eleman" /&gt;
&lt;/ComboBox></pre>

Uygulamanın **Windows Phone** yüklü bir cihazda çalıştırıldığı olduğu durumda eğer **Combobox** *5* veya *daha az* eleman içeriyorsa tıklandığında aşağıya bir liste açılır.

![](/assets/uploads/2015/01/Combobox4.png)

**Combobox** eğer *6* veya *daha fazla* eleman içeriyorsa ekranın tamamını kaplayan bir liste şeklinde gösterilir.

![](/assets/uploads/2015/01/Combobox3.png)

Seçili olan elemanın **sırasını** öğrenmek için <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.primitives.selector.selectedindex" target="_blank">SelectedIndex</a> özelliğini, seçili elemanın **kendisini** öğrenmek için <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.primitives.selector.selecteditem" target="_blank">SelectedItem</a> özelliğini kullanabiliriz.

Varolan **seçim değiştiğinde** yapmamız gereken işler varsa <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.primitives.selector.selectionchanged" target="_blank">SelectionChanged</a> **event**'i ile seçimin değiştiğini yakalayabilir ve yapmamız gereken işleri yapabiliriz.

<pre class="brush:xml">&lt;ComboBox x:Name="cmbMenu" Header="Menü" SelectionChanged="cmbMenu_SelectionChanged"&gt;</pre>

veya

<pre class="brush:csharp">cmbMenu.SelectionChanged += cmbMenu_SelectionChanged;</pre>

satırları ile değişim olduğunda *cmbMenu_SelectionChanged* **method**'unun çağırılmasını sağlarız;

<pre class="brush:csharp">private void cmbMenu_SelectionChanged(object sender, SelectionChangedEventArgs e)
{
    // yapılacak işler
}


