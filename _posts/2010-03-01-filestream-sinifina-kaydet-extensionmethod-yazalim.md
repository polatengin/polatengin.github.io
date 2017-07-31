---
layout: post
title: "FileStream sınıfına Kaydet() ExtensionMethod'u yazalım"
date: 2010-03-01 10:00
author: engin.polat
comments: true
category: [C#]
tags: [convert, exists, extensionmethod, file, filestream, getdirectory, getfilename, override, path, writeallbytes]
---
**FileStream** sınıfına yazacağımız *Save()* method'u sayesinde, aşağıdaki kodu kolaylıkla yazabilir olacağız. Üstelik bir tane de overload yazarak, varolan dosyanın üstüne yazmasını engelleyip, yeni bir dosya adı oluşturup yazma işlemine devam ettirebileceğiz.



fs.Kaydet("c:\\dosya_adi.uzanti");</pre>

Eğer aynı kodu, ikinci bir boolean parametreye *true* değeri vererek çağırırsak, klasörde *dosya_adi.uzanti* dosyası varsa *dosya_adi[1].uzanti* dosyasına yazmayı deneyecek, eğer bu dosya da varsa, *dosya_adi[2].uzanti* dosyasına deneyecek, vs..

<pre class="brush:csharp">fs.Kaydet("c:\\dosya_adi.uzanti", true);</pre>

İşte kodumuz;

<pre class="brush:csharp">namespace ExtensionManager
{
    public static class Extensions
    {
        public static string Kaydet(this FileStream Dosya, string Dizin)
        {
            return Dosya.Kaydet(Dizin, false);
        }

        public static string Kaydet(this FileStream Dosya, string Dizin, bool UstuneYaz)
        {
            int DosyaSayac = 1;

            string _Dizin = Path.GetDirectoryName(Dizin);

            if (!Directory.Exists(_Dizin))
                Directory.CreateDirectory(_Dizin);

            int DosyaBoyu = Convert.ToInt32(Dosya.Length);
            string DosyaAdi = Path.GetFileName(Dosya.Name);

            Byte[] b = new Byte[DosyaBoyu];
            Dosya.Read(b, 0, DosyaBoyu);

            string root = Path.GetDirectoryName(Dizin) + "\\" + Path.GetFileNameWithoutExtension(Dizin);

            while (!UstuneYaz &amp;&amp; File.Exists(Dizin))
                Dizin = root + "[" + DosyaSayac++.ToString() + "]" + Path.GetExtension(Dizin);

            File.WriteAllBytes(Dizin, b);

            return Path.GetFileName(Dizin);
        }
    }
}


