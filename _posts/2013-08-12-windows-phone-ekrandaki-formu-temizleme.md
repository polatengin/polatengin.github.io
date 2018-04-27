---
layout: post
title: "Windows Phone ekrandaki formu temizleme"
date: 2013-08-12 08:30
author: engin.polat
comments: true
category: [Programlama]
tags: [checkbox, children, dependencyobject, function, getchild, getchildrencount, grid, layoutroot, passwordbox, recursive, routedeventargs, textbox, this, visualtreehelper, windows phone, windowsphone, wp7, wp8]
---
**Windows Phone** için geliştirdiğiniz uygulamaya bir form eklediniz ve çok fazla giriş kutusu var (<a href="http://msdn.microsoft.com/library/system.windows.controls.textbox" title="TextBox Class" target="_blank" rel="noopener">TextBox</a>, <a href="http://msdn.microsoft.com/library/system.windows.controls.passwordbox" title="PasswordBox Class" target="_blank" rel="noopener">PasswordBox</a>, <a href="http://msdn.microsoft.com/library/system.windows.controls.checkbox" title="CheckBox Class" target="_blank" rel="noopener">CheckBox</a>, vs.)

Ekleyeceğiniz *Temizle* butonu aracılığıyla ekrandaki tüm giriş kutularını temizlemek istiyorsunuz. **Page** şablonunun varsayılan halinde yeralan *LayoutRoot* isimli <a href="http://msdn.microsoft.com/library/system.windows.controls.grid" title="Grid Class" target="_blank" rel="noopener">Grid</a> üzerinden temizleme yapabilirsiniz;



foreach (var element in LayoutRoot.Children)
{
    if (element is TextBox)
    {
        (element as TextBox).Text = "";
    }
}</pre>

Fakat tasarımına uymamasından dolayı *LayoutRoot* isimli **Grid** ekranda olmayabilir ve daha genel bir yöntemle tüm giriş kutularını temizlemek isteyebilirsiniz.

Aşağıdaki gibi bir kendini çağıran fonksiyon (*recursive function*) aracılığıyla bu işi yaptırabilirsiniz;

<pre class="brush:csharp">private void ClearTextbox(DependencyObject element)
{
    var elementChildCount = VisualTreeHelper.GetChildrenCount(element);

    if (elementChildCount > 0)
    {
        for (var iLoop = 0; iLoop < elementChildCount; iLoop++)
        {
            var innerElement = VisualTreeHelper.GetChild(element, iLoop);

            if (innerElement is TextBox)
            {
                (innerElement as TextBox).Text = "";
            }
            else
            {
                ClearTextbox(innerElement);
            }
        }
    }
}</pre>

<a href="http://msdn.microsoft.com/library/system.windows.media.visualtreehelper" title="VisualTreeHelper Class" target="_blank" rel="noopener">VisualTreeHelper</a> sınıfının static <a href="http://msdn.microsoft.com/library/system.windows.media.visualtreehelper.getchildrencount" title="VisualTreeHelper.GetChildrenCount Method" target="_blank" rel="noopener">GetChildrenCount()</a> methodu ile ilgili nesnenin içinde başka bir nesne olup olmadığını kontrol ediyoruz, eğer nesne başka nesne içeriyorsa, döngü aracılığı ile dönerek <a href="http://msdn.microsoft.com/library/system.windows.media.visualtreehelper.getchild" title="VisualTreeHelper.GetChild Method" target="_blank" rel="noopener">GetChild()</a> methodu sayesinde her elemanı buluyoruz.

Bulduğumuz nesne eğer bir **TextBox** ise, basitçe <a href="http://msdn.microsoft.com/library/system.windows.controls.textbox.text" title="TextBox.Text Property" target="_blank" rel="noopener">Text</a> özelliğini boşaltıyoruz, değilse fonksiyonu tekrar çağırıp elde ettiğimiz nesneyi veriyoruz. Böylece her nesnenin içerdiği elemanları teker teker bulup içeriklerini temizleyebiliyoruz.

Kullanmak için;

</pre><pre class="brush:csharp">private void TemizleButton_OnClick(object sender, RoutedEventArgs e)
{
    ClearTextbox(this);
}


