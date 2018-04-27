---
layout: post
title: "C# FolderBrowserDialog seçili dizini değiştirmek"
date: 2010-09-04 20:50
author: engin.polat
comments: true
category: [C#]
tags: [.net, class, description, desktop, dialogresult, environment, folderbrowserdialog, initialdirectory, openfiledialog, rootfolder, selectedpath, showdialog, specialfolder]
---
.Net ile <a href="http://msdn.microsoft.com/library/system.windows.forms.folderbrowserdialog" target="_blank" rel="noopener">FolderBrowserDialog</a> sınıfı sayesinde, **Dizin Seçme Dialog Penceresi** oluşturabiliyoruz.

[OpenFileDialog](http://msdn.microsoft.com/library/system.windows.forms.openfiledialog) sınıfını kullanırak **Dosya Seçme Dialog Kutusu** açtıracağımız zaman, varsayılan dizini [InitialDirectory](http://msdn.microsoft.com/library/system.windows.forms.filedialog.initialdirectory) özelliği ile belirleyebiliyoruz.

*FolderBrowserDialog* sınıfının *InitialDirectory* özelliği olmadığı için, varsayılan dizini bu özelliği ayarlayarak **belirleyemiyoruz**.

Fakat yardımımıza [SelectedPath](http://msdn.microsoft.com/library/system.windows.forms.folderbrowserdialog.selectedpath) özelliği yetişiyor;



FolderBrowserDialog dialog = new FolderBrowserDialog();
dialog.Description = "Lütfen aşağıdaki listeden bir dizin seçiniz.";
dialog.RootFolder = Environment.SpecialFolder.Desktop;
dialog.SelectedPath = @"C:\Program Files";
if (dialog.ShowDialog() == DialogResult.OK)
{
    Console.WriteLine(dialog.SelectedPath);
}


Örnek kodu çalıştırdığımızda aşağıdaki ekranı görmelisiniz;

![CSharp Browse Folder Dialog](/assets/uploads/2010/09/BrowseForFolderDialog.png "CSharp Browse Folder Dialog")

