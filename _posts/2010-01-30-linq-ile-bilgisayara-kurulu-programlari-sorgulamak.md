---
layout: post
title: "LINQ ile Bilgisayara Kurulu Programları Sorgulamak"
date: 2010-01-30 10:10
author: engin.polat
comments: true
category: [C#]
tags: [csharp, displayname, event, foreach, from, getsubkeynames, getvalue, isnullorwhitespace, let, linq, listbox, opensubkey, regedit, registry, registrykey, select, string, using]
---
Bu yazımda, bilgisayarda kurulu programları, **LINQ** kullanarak nasıl sorgulayacağımızı inceleyeceğim.

Bilgisayara kurduğumuz her program bilgisayarın **Registry**'sine kurulum ile ilgili bir kayıt bırakır.

***Bilmeyenler için not:** Registry'yi açmak için komut satırına **regedit** yazmanız yeterli.*

**Registry** ile ilgili daha detaylı bilgi için <a title="MSDN: Registry" href="http://msdn.microsoft.com/en-us/library/ms724871(VS.85).aspx" target="_blank" rel="noopener">MSDN: Registry</a> sayfasına bakmanızı tavsiye ederim.

**Registry**'nin *LocalMachine\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall* dalında, bilgisayara kurulu olan uygulamalara ve bu uygulamalar ile ilgili bilgilere ulaşılabilir.

Uygulamamızda, **Registry** class'ını kullanabilmek için, kodumuza aşağıdaki namespace'i eklememiz gerekiyor.


using Microsoft.Win32;</pre>
Hemen form tasarlamakla başlayalım.

<a href="/assets/uploads/2010/01/BilgisayaraKuruluProgramlar_1.png">![Bilgisayarda Kurulu Programlar Ana Form Ekran Görüntüsü](/assets/uploads/2010/01/BilgisayaraKuruluProgramlar_1.png "Bilgisayarda Kurulu Programlar Ekran Görüntüsü")</a>

Yukarıdaki formu oluşturduktan sonra *btnGetir* butonunun *Click* olayına aşağıdaki kodu yazalım;
<pre class="brush:csharp">using (RegistryKey rk = Registry.LocalMachine.OpenSubKey(@"SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"))
{
    var programlar = from k in rk.GetSubKeyNames()
                     let r = rk.OpenSubKey(k)
                     select r.GetValue("DisplayName");

    foreach (string program in programlar)
        if (!string.IsNullOrWhiteSpace(program))
            lbProgramlar.Items.Add(program);
}</pre>
**Registry** sınıfının **static** *LocalMachine* üyesi üzerinden *OpenSubKey()* method'unu çağırıyoruz.

Daha sonra yaptığımız;
<pre class="brush:csharp">from k in rk.GetSubKeyNames()
let r = rk.OpenSubKey(k)
select r.GetValue("DisplayName");

**LINQ** sorgusunu yazmak oluyor. Bu sorgu, ilgili **Registry** dalının altında bulunan tüm dalları açar ve içlerindeki **DisplayName** anahtarının değerini getirir.

Son olarak basit bir *foreach* döngüsü ile bu değerleri *lbProgramlar* **Listbox** kontrolüne dolduruyoruz.

İşte benim bilgisayarımdaki sonuç;

<a href="/assets/uploads/2010/01/BilgisayaraKuruluProgramlar_2.png">![Bilgisayarda Kurulu Programlar Çalıştıktan Sonraki Ekran Görüntüsü](/assets/uploads/2010/01/BilgisayaraKuruluProgramlar_2.png "Bilgisayarda Kurulu Programlar Çalıştıktan Sonraki Ekran Görüntüsü")</a>

