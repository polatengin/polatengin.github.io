---
layout: post
title: ".Net 4 COM İyileştirmeleri - Office Uygulamarı ile Çalışmak"
date: 2010-03-03 10:00
author: engin.polat
comments: true
category: [C#]
tags: [.net, cells, chart, com, console, csharp, excel, interop, interoperability, office, range, sheet, word, workbooks]
---
.Net 4.0 **COM İyileştirmeleri** başlığı altında birçok yeni yeteneğe sahiptir. **Şubat** ayında verdiğim seminerlerden <a title="enginpolat.com : Şubat Seminerleri / C# 4.0 Yenilikleri - 2" href="/subat-2010-seminerleri-csharp-4-yenilikleri-2/" target="_self">C# 4.0 Yenilikleri - 2</a> seminerinde COM İyileştirmeleri başlığında özellikle bu yeniliklerden bahsettim.

**BilgeAdam**'daki bir öğrencimin sorusu üzerine bu yazımda **Excel** ve **Word** kullanımına ilişkin bir örnek yapacağım.

Öncelikle yeni bir *Console Application* projesi oluşturalım ve referanslara



*   Microsoft.Office.Interop.Excel
*   Microsoft.Office.Interop.Word

referanslarını ekleyelim.

Bu örnekte yapmak istediğimiz;



*   Bilgisayarımızda o anda en çok hafıza alanı kullanan 10 uygulamanın adını ve kulandığı hafıza miktarını yeni bir Excel dosyasında iki sütuna alt alta yazmak
*   Aynı excel dosyasının ikinci bir sheet'ine bu tablodan bir chart üretmek
*   Bu chart'ı kopyalayıp, yeni açacağımız bir Word dosyasına yapıştırmak

Hazırsanız, *Program.cs* dosyamıza aşağıdaki kodları yazmakla başlayalım;

**using** direktiflerini yazdığımz yere



using Excel = Microsoft.Office.Interop.Excel;
using Word = Microsoft.Office.Interop.Word;
using System.Diagnostics;</pre>

satırlarını ekleyelim

Yeni bir Excel dosyası oluşturmak ve görünür kılmak için;

<pre class="brush:csharp">var excel = new Excel.Application();
excel.Visible = true;</pre>

Bu Excel dosyasına yeni bir sheet eklemek ve tablonun başlıklarını yazmak için;

<pre class="brush:csharp">excel.Workbooks.Add();
excel.Cells[1, 1].Value = "Uygulama Adı";
excel.Cells[1, 2].Value = "Hafıza Kullanımı";</pre>

Tabloya en çok hafıza kullanan uygulamaları eklemek için;

<pre class="brush:csharp">int i = 2;
foreach (var p in Process.GetProcesses().OrderByDescending(p =&gt; p.WorkingSet64).Take(10))
{
    excel.Cells[i, 1].Value = p.ProcessName;
    excel.Cells[i, 2].Value = p.WorkingSet64;
    i++;
}</pre>

Tabloyu Excel dosyasında yeni bir sheet içerisine chart olarak eklemek için;

<pre class="brush:csharp">Excel.Range range = excel.Cells[1, 1];
Excel.Chart chart = excel.ActiveWorkbook.Charts.Add(After: excel.ActiveSheet);
chart.ChartWizard(Source: range.CurrentRegion, Title: Environment.MachineName + " Toplam Hafıza Kullanımı");
chart.ChartStyle = 45;</pre>

Tabloyu panoya kopyalamak, yeni bir Word dosyası açıp, içine yapıştırmak için;

<pre class="brush:csharp">chart.CopyPicture(Excel.XlPictureAppearance.xlScreen, Excel.XlCopyPictureFormat.xlBitmap, Excel.XlPictureAppearance.xlScreen);

var word = new Word.Application();
word.Visible = true;
word.Documents.Add();
word.Selection.Paste();</pre>

Tüm kodları tekrar yazarsak;

<pre class="brush:csharp">using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Excel = Microsoft.Office.Interop.Excel;
using Word = Microsoft.Office.Interop.Word;
using System.Diagnostics;

namespace COMIyilestirmeleri_OfficeUygulamasi
{
    class Program
    {
        static void Main(string[] args)
        {
            var excel = new Excel.Application();
            excel.Visible = true;
            excel.Workbooks.Add();
            excel.Cells[1, 1].Value = "Uygulama Adı";
            excel.Cells[1, 2].Value = "Hafıza Kullanımı";
            int i = 2;
            foreach (var p in Process.GetProcesses().OrderByDescending(p =&gt; p.WorkingSet64).Take(10))
            {
                excel.Cells[i, 1].Value = p.ProcessName;
                excel.Cells[i, 2].Value = p.WorkingSet64;
                i++;
            }
            Excel.Range range = excel.Cells[1, 1];
            Excel.Chart chart = excel.ActiveWorkbook.Charts.Add(After: excel.ActiveSheet);
            chart.ChartWizard(Source: range.CurrentRegion, Title: Environment.MachineName + " Toplam Hafıza Kullanımı");
            chart.ChartStyle = 45;
            chart.CopyPicture(Excel.XlPictureAppearance.xlScreen, Excel.XlCopyPictureFormat.xlBitmap, Excel.XlPictureAppearance.xlScreen);

            var word = new Word.Application();
            word.Visible = true;
            word.Documents.Add();
            word.Selection.Paste();
        }
    }
}


