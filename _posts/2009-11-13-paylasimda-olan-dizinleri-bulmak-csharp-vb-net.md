---
layout: post
title: "Paylaşımda Olan Dizinleri Bulmak ( C# + VB.NET )"
date: 2009-11-13 14:29
author: engin.polat
comments: true
category: [C#]
tags: [.net, code, csharp, ManagementObjectSearcher, source, vbnet, WMI]
---
Bilgisayarda paylaşımda olan klasörleri bulmamız gerektiğinde WMI sorgusu çalıştırmamız gerekir.

WMI (Windows Management Instrumentation) hakkında daha detaylı bilgiye MSDN üzerindeki <a href="http://msdn.microsoft.com/en-us/library/aa394582(VS.85).aspx" target="_blank" rel="noopener">bu kaynaktan</a> ulaşabilirsiniz.

WMI sorgusu çalıştırmak için öncelikle System.Management.dll'i projemize referans göstermeliyiz.

<a href="/assets/uploads/2009/11/PaylasimdaOlanDizinler_Referans.png">![PaylasimdaOlanDizinler_Referans](/assets/uploads/2009/11/PaylasimdaOlanDizinler_Referans_thumb.png "PaylasimdaOlanDizinler_Referans")</a>

System.Management.dll'i projeye referans gösterdikten sonra form üzerine bir Listbox, bir de Button ekleyip, butonun click event'ine aşağıdaki kodu yazıyoruz;

**C# Code :**


    private void btnDizinleriListele_Click(object sender, EventArgs e)
    {
      //WMI sorgusu çalıştırıyoruz.
      ManagementObjectSearcher mos = new ManagementObjectSearcher("SELECT * FROM Win32_Share");

      //Win32_Share classı :
      /*
        class Win32_Share : CIM_LogicalElement
        {
          uint32   AccessMask;
          boolean  AllowMaximum;
          string   Caption;
          string   Description;
          datetime InstallDate;
          uint32   MaximumAllowed;
          string   Name;
          string   Path;
          string   Status;
          uint32   Type;
        };
       */
      foreach (ManagementObject dizin in mos.Get())
        lbDizinler.Items.Add(string.Format("Dizin : {0}\\{1} ({2})", dizin["Path"], dizin["Name"], dizin["Description"]));
    }</pre>
**VB.NET Code :**
<pre class="brush:vbnet">  Private Sub btnDizinleriListele_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDizinleriListele.Click
    'WMI sorgusu çalıştırıyoruz.
    Dim mos As New ManagementObjectSearcher("SELECT * FROM Win32_Share")

    'Win32_Share classı :
    'class Win32_Share : CIM_LogicalElement
    '{
    ' uint32   AccessMask;
    ' boolean  AllowMaximum;
    ' string   Caption;
    ' string   Description;
    ' datetime InstallDate;
    ' uint32   MaximumAllowed;
    ' string   Name;
    ' string   Path;
    ' string   Status;
    ' uint32   Type;
    '};
    For Each dizin As ManagementObject In mos.Get()
      lbDizinler.Items.Add(String.Format("Dizin : {0}\\{1} ({2})", dizin("Path"), dizin("Name"), dizin("Description")))
    Next
  End Sub

 

ManagementObjectSearcher class'ının constructor'ına SELECT * FROM Win32_Share yazdığımıza dikkat edin.

Win32_Share class'ı hakkında daha detaylı bilgiye MSDN üzerinde yeralan <a href="http://msdn.microsoft.com/en-us/library/aa394435%28VS.85%29.aspx" target="_blank" rel="noopener">bu kaynak</a>tan ulaşabilirsiniz.

C# için kaynak kodlar : <a href="/assets/uploads/2009/11/PaylasimdaOlanDizinler_C_.zip" target="_blank" rel="noopener">PaylasimdaOlanDizinler_C#.zip</a>
VB.NET için kaynak kodlar : <a href="/assets/uploads/2009/11/PaylasimdaOlanDizinler_VB.zip" target="_blank" rel="noopener">PaylasimdaOlanDizinler_VB.zip</a>

