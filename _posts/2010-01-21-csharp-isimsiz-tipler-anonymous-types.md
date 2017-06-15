---
layout: post
title: "C# İsimsiz Tipler - Anonymous Types"
date: 2010-01-21 15:51
author: engin.polat
comments: true
category: [C#]
tags: [anonymous type, class, code, compile, csharp, idisposable, isimsiz tip, method, private, property, public, serverproperty, source, var]
---
Sadece bir method içerisinde kullanacağınız basit **class**'lara kaç defa ihtiyaç duydunuz? Böyle bir class'a her ihtiyaç duyduğunuzda yapmanız gereken, yeni bir **class** oluşturup, bütün tanımlama kodlarını (**private alanlar, public alanlar**, vs.) yazmaktır.

**C#** dili, **İsimsiz Tip** (**Anonymous Type**) tanımlamaya izin veriyor. Üstelik, **private** ve **public** öğelerin oluşturulmasını ve yönetilmesini **C#** dilinin kendisi üstleniyor.


public class HataLogla()
{
    var Hata = new { Mesaj = "Hata Mesajının Kendisi", Tarih = DateTime.Now, Yer = "XClass.YMethod" };
    var Kullanici = new { Id = 42, AdSoyad = "Engin Polat", Yonetici = "Ali Veli" };

    string Loglanacak = string.Format("Hata Mesajı: {0}\nTarih: {1} {2}\nHatanın Oluştuğu Yer: {3}\n\nKullanıcıId: {4}\nKullanıcı Adı: {5}\nYöneticisi: {6}", Hata.Mesaj, Hata.ToShortDateString(), Hata.Tarih.ToLongTimeString(), Hata.Yer, Kullanici.Id, Kullanici.AdSoyad, Kullanici.Yonetici);

    File.WriteAllText(Loglanacak, @"C:\Log\Log.txt");

    MessageBox.Show(Hata.Mesaj, Hata.Tarih);
}</pre>
Yukarıdaki kodda yer alan *Hata* ve *Kullanici* değişkenlerinin tipleri,** derleme zamanında** derleyici tarafından otomatik oluşturulur. Eğer **method**'un içerisine aşağıdaki kodları eklersek;
<pre class="brush:csharp">MessageBox.Show("Hata değişkeninin tipi : " + Hata.GetType().ToString());
MessageBox.Show("Kullanici değişkeninin tipi : " + Kullanici.GetType().ToString());</pre>
Mesaj kutularında şu değerleri görürüz;

*Hata değişkeninin tipi : &lt;&gt;f_AnonymousType0'3[System.String,System.DateTime,System.String]*
* Kullanici değişkeninin tipi : &lt;&gt;f_AnonymousType0'3[System.Int32,System.String,System.String]*

Farkettiğiniz gibi, böyle bir tip oluşturmaya çalışırsak, derleme zamanında hata alırız, ama **C# derleyicisi** bizim için bu tipleri oluşturuyor.

Değişkenin tipini veremeyeceğimiz için, C# diline **var** anahtar kelimesi eklenmiştir.

**var** anahtar kelimesi sayesinde, değişkenin tipi atandığı değerden otomatik olarak çözümleniyor.

**İsimsiz Tipler** (**Anonymous Types**) *IDisposable* interface'ini uygulamadığı için, **Disposable olamazlar**.

Eğer yukarıdaki örneği geleneksel kodlama teknikleri ile yazacak olsaydık;
<pre class="brush:csharp">public class HataBilgi
{
    private string _Mesaj = string.Empty;
    private DateTime _Tarih = DateTime.Now;
    private string _Yer = string.Empty;

    public string Mesaj
    {
        get
        {
            return _Mesaj;
        }
        set
        {
            _Mesaj = value;
        }
    }

    public DateTime Tarih
    {
        get
        {
            return _Tarih;
        }
        set
        {
            _Tarih = value;
        }
    }

    public string Yer
    {
        get
        {
            return _Yer;
        }
        set
        {
            _Yer = value;
        }
    }

    public HataBilgi(string Mesaj, DateTime Tarih, string Yer)
    {
        this.Mesaj = Mesaj;
        this.Tarih = Tarih;
        this.Yer = Yer;
    }
}

public class KullaniciBilgi
{
    private int _Id = 0;
    private string _AdSoyad = string.Empty;
    private string _Yonetici = string.Empty;

    public int Id
    {
        get
        {
            return _Id;
        }
        set
        {
            _Id = value;
        }
    }

    public string AdSoyad
    {
        get
        {
            return _AdSoyad;
        }
        set
        {
            _AdSoyad = value;
        }
    }

    public string Yonetici
    {
        get
        {
            return _Yonetici;
        }
        set
        {
            _Yonetici = value;
        }
    }

    public KullaniciBilgi(int Id, string AdSoyad, string Yonetici)
    {
        this.Id = Id;
        this.AdSoyad = AdSoyad;
        this.Yonetici = Yonetici;
    }
}

public class HataLoglama
{
    HataBilgi Hata = new HataBilgi("Hata Mesajının Kendisi", DateTime.Now, "XClass.YMethod");
    KullaniciBilgi Kullanici = new KullaniciBilgi(42, "Engin Polat", "Ali Veli");

    string Loglanacak = string.Format("Hata Mesajı: {0}\nTarih: {1} {2}\nHatanın Oluştuğu Yer: {3}\n\nKullanıcıId: {4}\nKullanıcı Adı: {5}\nYöneticisi: {6}", Hata.Mesaj, Hata.ToShortDateString(), Hata.Tarih.ToLongTimeString(), Hata.Yer, Kullanici.Id, Kullanici.AdSoyad, Kullanici.Yonetici);

    File.WriteAllText(Loglanacak, @"C:\Log\Log.txt");

    MessageBox.Show(Hata.Mesaj, Hata.Tarih);
}</pre>
**İsimsiz Tip** yeteneklerini kullanarak yazdığımızda ise;
<pre class="brush:csharp">public class HataLogla()
{
    var Hata = new { Mesaj = "Hata Mesajının Kendisi", Tarih = DateTime.Now, Yer = "XClass.YMethod" };
    var Kullanici = new { Id = 42, AdSoyad = "Engin Polat", Yonetici = "Ali Veli" };

    string Loglanacak = string.Format("Hata Mesajı: {0}\nTarih: {1} {2}\nHatanın Oluştuğu Yer: {3}\n\nKullanıcıId: {4}\nKullanıcı Adı: {5}\nYöneticisi: {6}", Hata.Mesaj, Hata.ToShortDateString(), Hata.Tarih.ToLongTimeString(), Hata.Yer, Kullanici.Id, Kullanici.AdSoyad, Kullanici.Yonetici);

    File.WriteAllText(Loglanacak, @"C:\Log\Log.txt");

    MessageBox.Show(Hata.Mesaj, Hata.Tarih);
}

Aradaki fark açıkça ortada!

