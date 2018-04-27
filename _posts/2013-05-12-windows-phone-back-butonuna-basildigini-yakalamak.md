---
layout: post
title: "Windows Phone Back butonuna basıldığını yakalamak"
date: 2013-05-12 10:30
author: engin.polat
comments: true
category: [Windows]
tags: [back, cancel, canceleventargs, componentmodel, messagebox, method, onbackkeypress, override, phoneapplicationpage, property, virtual, windows phone, windowsphone, wp8]
---
**Windows Phone** uygulamanızın bazı sayfalarında kullanıcının **Back** butonuna bastığını yakalamak isteyebilirsiniz.

Özellikle sayfada *kaydedilmemiş veriler* olduğu durumlarda kullanıcıya verileri kaydetmek isteyip istemediğini sorabilmek için **Back** butonuna *basıldığı anı* yakalamamız gerekir.

**Back** butonuna basıldığını yakalamak istediğimiz sayfada <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.controls.phoneapplicationpage.onbackkeypress" title="MSDN : PhoneApplicationPage.OnBackKeyPress Method " target="_blank" rel="noopener">OnBackKeyPress</a> method'unu **override** etmemiz gerekiyor.

*OnBackKeyPress* method'u aslında <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.controls.phoneapplicationpage" title="MSDN : PhoneApplicationPage Class" target="_blank" rel="noopener">PhoneApplicationPage</a> sınıfında **virtual** olarak tanımlanmıştır ve **Back** butonuna basıldığında çağırılır, biz de bu method'u **override** ederek, kendi istediğimiz işleri yaptırabiliriz;



protected override void OnBackKeyPress(CancelEventArgs e)
{
    MessageBox.Show("Uygulamadan çıkılacak!");
}</pre>

Hatta istersek *OnBackKeyPress* methodunun <a href="http://msdn.microsoft.com/library/system.componentmodel.canceleventargs" title="MSDN : CancelEventArgs Class" target="_blank" rel="noopener">CancelEventArgs</a> tipindeki *e* parametresinin <a href="http://msdn.microsoft.com/library/system.componentmodel.canceleventargs.cancel" title="MSDN : CancelEventArgs.Cancel Property" target="_blank" rel="noopener">Cancel</a> *property*'sine **true** değeri vererek, **Back** butonunu iptal bile edebiliriz;

<pre class="brush:csharp">protected override void OnBackKeyPress(CancelEventArgs e)
{
    if (MessageBox.Show("Uygulamadan çıkmak istediğinize emin misiniz?", "Çıkış", MessageBoxButton.OKCancel) == MessageBoxResult.Cancel)
    {
        e.Cancel = true;
    }
}


