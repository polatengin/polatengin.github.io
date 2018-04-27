---
layout: post
title: "C# Textbox'ın AutoComplete Özelliği"
date: 2010-08-23 21:31
author: engin.polat
comments: true
category: [C#]
tags: [allsystemsources, allurl, append, autocompletecustomsource, autocompletemode, autocompletesource, combobox, CustomSource, FileSystem, FileSystemDirectories, HistoryList, None, RecentlyUsedList, Suggest, SuggestAppend, textbox]
---
Genellikle **web uygulamalarında** gördüğümüz metin kutularının **otomatik tamamlama** özelliğini *Windows Masaüstü* uygulamalarımıza da **ekleyebiliriz**.

Yapmamız gereken, **otomatik tamamlama** özelliği vermek istediğimiz <a href="http://msdn.microsoft.com/library/system.windows.forms.textbox" target="_blank" rel="noopener">Textbox</a>'ın birkaç özelliğini ayarlamak;

<a href="http://msdn.microsoft.com/library/system.windows.forms.textbox.autocompletemode" target="_blank" rel="noopener">AutoCompleteMode</a> :
Varsayılan olarak *None* değerini içerir
*Append*, yazılan harflere uyan ilk kelimenin kalanını textbox'a ekler ve seçili hale getirir
*Suggest*, aşağı açılan listeyi gösterir
*SuggestAppend*, hem aşağı açılan listeyi gösterir, hem de yazılan harflere uyan ilk kelimenin kalanını textbox'a ekler ve seçili hale getirir

<a href="http://msdn.microsoft.com/library/system.windows.forms.textbox.autocompletesource" target="_blank" rel="noopener">AutoCompleteSource</a> :
Varsayılan olarak *None* değerini içerir
*FileSystem*, *FileSystemDirectories*, *HistoryList*, *RecentlyUsedList*, *AllSystemSources*, *AllUrl*, *CustomSource* değerlerinden birini içerebilir

<a href="http://msdn.microsoft.com/library/system.windows.forms.textbox.autocompletecustomsource" target="_blank" rel="noopener">AutoCompleteCustomSource</a> :
**AutoCompleteSource** özelliği *CustomSource* olarak atanmışsa **AutoCompleteCustomSource** özelliği *string dizisi* olarak listeyi tutar

Önce aşağıdaki ekran görüntüsünde form oluşturalım;

![TextBox AutoCompleteMode Form](/assets/uploads/2010/08/AutoComplete.png "TextBox AutoCompleteMode Form")

Öncelikle formumuzun **yüklenme olayında** (*Form_Load Event*) **Kaynak** açılır listesine (*ComboBox*), **otomatik tamamlama kaynaklarının** listesini ekleyelim;



cmbKaynak.Items.Add(AutoCompleteSource.CustomSource);
cmbKaynak.Items.Add(AutoCompleteSource.FileSystem);
cmbKaynak.Items.Add(AutoCompleteSource.FileSystemDirectories);
cmbKaynak.Items.Add(AutoCompleteSource.HistoryList);
cmbKaynak.Items.Add(AutoCompleteSource.RecentlyUsedList);
cmbKaynak.Items.Add(AutoCompleteSource.AllSystemSources);
cmbKaynak.Items.Add(AutoCompleteSource.AllUrl);</pre>

![TextBox AutoCompleteSource List](/assets/uploads/2010/08/AutoComplete_0.png "TextBox AutoCompleteSource Source List")

Daha sonra, *TextBox*'ın **AutoCompleteMode** ve **AutoCompleteCustomSource** özelliklerine değer atamaları yapalım;

<pre class="brush:csharp">txtWebSitesi.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
txtWebSitesi.AutoCompleteCustomSource.AddRange(new string[] { "http://www.enginpolat.com", "http://www.karalamalar.net", "http://www.cebirci.com", "http://www.kadirgunay.com" });
cmbKaynak.SelectedIndex = 0;</pre>

Son olarak, Kaynak **combobox**'ının **seçili eleman değişti** olayında (*SelectedIndexChanged Event*) **textbox**'ın **AutoCompleteSource** özelliğini değiştiriyoruz;

<pre class="brush:csharp">txtWebSitesi.AutoCompleteSource = (AutoCompleteSource)cmbKaynak.SelectedItem;</pre>

![TextBox AutoCompleteCustomSource](/assets/uploads/2010/08/AutoComplete_1.png "TextBox AutoCompleteCustomSource")

![TextBox AutoCompleteSource FileSystem](/assets/uploads/2010/08/AutoComplete_2.png "TextBox AutoCompleteSource FileSystem")

![TextBox AutoCompleteSource History List](/assets/uploads/2010/08/AutoComplete_3.png "TextBox AutoCompleteSource History List")

Örnek uygulamanın tüm kaynak kodu;

<pre class="brush:csharp">using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;

public partial class frmMain : Form
{
    public frmMain()
    {
        InitializeComponent();
    }

    private void frmMain_Load(object sender, EventArgs e)
    {
        cmbKaynak.Items.Add(AutoCompleteSource.CustomSource);
        cmbKaynak.Items.Add(AutoCompleteSource.FileSystem);
        cmbKaynak.Items.Add(AutoCompleteSource.FileSystemDirectories);
        cmbKaynak.Items.Add(AutoCompleteSource.HistoryList);
        cmbKaynak.Items.Add(AutoCompleteSource.RecentlyUsedList);
        cmbKaynak.Items.Add(AutoCompleteSource.AllSystemSources);
        cmbKaynak.Items.Add(AutoCompleteSource.AllUrl);

        txtWebSitesi.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
        txtWebSitesi.AutoCompleteCustomSource.AddRange(new string[] { "http://www.enginpolat.com", "http://www.durgut.com", "http://www.karalamalar.net", "http://www.kadirgunay.com", "http://www.microsoft.com", "http://www.bilgeadam.com", "http://www.ntvmsnbc.com", "http://www.arcelik.com" });

        cmbKaynak.SelectedIndex = 0;
    }

    private void cmbKaynak_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtWebSitesi.AutoCompleteSource = (AutoCompleteSource)cmbKaynak.SelectedItem;
    }

    private void lblenginpolatcom_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
    {
        Process.Start("http://www.enginpolat.com");
    }
}


