---
layout: post
title: "Birkaç Faydalı Extension Method"
date: 2010-01-30 14:17
author: engin.polat
comments: true
category: [C#]
tags: [action, csharp, datetime, decrypt, directoryinfo, encrypt, extension method, foreach, generics, isweekend, json, md5]
---
**C# 3.0** ile gelen **Extension Method** desteğini çok kullanışlı bulduğum için, kendi uygulamalarımda kullanmaya çalışıyorum. Bu yazımda faydalı bulduğum birkaç **Extension Method**'u toplamaya çalıştım.

***Metni Encrypt - Decrypt Eden Extension Method***



namespace ExtensionManager
{
    public static class Extensions
    {
        public static string Encrypt(this string stringToEncrypt, string key)
        {
            if (string.IsNullOrEmpty(stringToEncrypt))
                throw new ArgumentException("Boş metin şifrelenemez");
            if (string.IsNullOrEmpty(key))
                throw new ArgumentException("Şifreleme için anahtar vermelisiniz");

            CspParameters cspp = new CspParameters();
            cspp.KeyContainerName = key;

            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(cspp);
            rsa.PersistKeyInCsp = true;

            byte[] bytes = rsa.Encrypt(UTF8Encoding.UTF8.GetBytes(stringToEncrypt), true);

            return BitConverter.ToString(bytes);
        }

        public static string Decrypt(this string stringToDecrypt, string key)
        {
            if (string.IsNullOrEmpty(stringToDecrypt))
                throw new ArgumentException("Beş metnin şifresi çözülemez");
            if (string.IsNullOrEmpty(key))
                throw new ArgumentException("Şifre çözme için anahtar vermelisiniz");
            string result = null;
            try
            {
                CspParameters cspp = new CspParameters();
                cspp.KeyContainerName = key;

                RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(cspp);
                rsa.PersistKeyInCsp = true;

                string[] decryptArray = stringToDecrypt.Split("-");
                byte[] decryptByteArray = Array.ConvertAll&lt;string, byte&gt;(decryptArray, (s =&gt; Convert.ToByte(byte.Parse(s, NumberStyles.HexNumber))));
                byte[] bytes = rsa.Decrypt(decryptByteArray, true);

                result = UTF8Encoding.UTF8.GetString(bytes);
            }
            catch()
            {
            }
            return result;
        }
    }
}</pre>

**Örnek kullanım;**
<pre class="brush:csharp">string metin = "My Secret";
string sifrelenmis = metin.Encrypt("sifreleyici");
string sifresicozulmus = sifrelenmis.Decrypt("sifreleyici");</pre>

***Listeler üzerinde Foreach Yapan Extension Method***

<pre class="brush:csharp">namespace ExtensionManager
{
    public static class Extensions
    {
        public static void ForEach&lt;T&gt;(this IEnumerable&lt;T&gt; kaynak, Action&lt;T&gt; islem)
        {
            foreach (var item in kaynak)
                islem(item);
        }
    }
}</pre>

**Örnek kullanım;**
<pre class="brush:csharp">List&lt;string&gt; isimler = new List&lt;string&gt; { "engin", "polat", "ahmet", "mehmet", "murat" };
isimler.ForEach(isim =&gt; MessageBox.Show(isim));</pre>

***İnternet Adresi Doğrulayan Extension Method***

<pre class="brush:csharp">namespace ExtensionManager
{
    public static class Extensions
    {
        public static bool IsValidUrl(this string text)
        {
            Regex r = new Regex(@"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?");
            return r.IsMatch(text);
        }
    }
}</pre>

**Örnek kullanım;**
<pre class="brush:csharp">string Adres = "http://www.enginpolat.com";
bool AdresDogru = Adres.IsValidUrl();</pre>

***Email Adresi Doğrulayan Extension Method***

<pre class="brush:csharp">namespace ExtensionManager
{
    public static class Extensions
    {
        public static bool IsValidEmail(this string text)
        {
            Regex r = new Regex(@"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
            return r.IsMatch(text);
        }
    }
}</pre>

**Örnek kullanım;**
<pre class="brush:csharp">string Adres = "test@test.com";
bool AdresDogru = Adres.IsValidEmail();</pre>

***Klasör Oluşturan Extension Method***

<pre class="brush:csharp">namespace ExtensionManager
{
    public static class Extensions
    {
        public static void CreateDirectory(this DirectoryInfo dirInfo)
        {
            if (dirInfo.Parent != null)
                CreateDirectory(dirInfo.Parent);
            if (!dirInfo.Exists)
                dirInfo.Create();
        }
    }
}</pre>

**Örnek kullanım;**
<pre class="brush:csharp">var dir = new DirectoryInfo(@"C:\temp\bir\iki\uc");
dir.CreateDirectory();</pre>

***Tarihin Haftasonuna Geldiğini Doğrulayan Extension Method***

<pre class="brush:csharp">namespace ExtensionManager
{
    public static class Extensions
    {
        public static bool IsWeekend(this DateTime value)
        {
            return (value.DayOfWeek == DayOfWeek.Sunday || value.DayOfWeek == DayOfWeek.Saturday);
        }
    }
}</pre>

**Örnek kullanım;**
<pre class="brush:csharp">for (DateTime date = BaslangicTarih; date &lt;= BitisTarih; date = date.AddDays(1))
{
    if (date.IsWeekend())
        continue;
    /// Tatil değil, yapılacak işler yapılır.
}</pre>

***Object türünden JSON'a, JSON'dan Object Türüne Çeviren Extension Method***

<pre class="brush:csharp">namespace ExtensionManager
{
    public static class Extensions
    {
        public static string ToJson(this object obj)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(obj);
        }

        public static T FromJson&lt;T&gt;(this object obj)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Deserialize&lt;T&gt;(obj as string);
        }
    }
}</pre>

**Örnek kullanım;**
<pre class="brush:csharp">Personel Engin = new Personel("Engin Polat", 5000);
string json = Engin.ToJson();
Engin = null;
Engin = s.FromJson&lt;Personel&gt;();</pre>

***Tarihten Yaş Hesaplayan Extension Method***

<pre class="brush:csharp">namespace ExtensionManager
{
    public static class Extensions
    {
        public static int Age(this DateTime tarih)
        {
            DateTime now = DateTime.Now;
            int yas = now.Year - tarih.Year;
            if (now &lt; tarih.AddYears(yas))
                yas--;
            return yas;
        }
    }
}</pre>

**Örnek kullanım;**
<pre class="brush:csharp">DateTime AhmetDogumGunu = new DateTime(1979, 05, 07);
int Yas = AhmetDogumGunu.Age();</pre>

***Ayın İlk Gününü - Ayın Son Gününü Bulan Extension Method***

<pre class="brush:csharp">namespace ExtensionManager
{
    public static class Extensions
    {
        public static DateTime FirstDayOfMonth(this DateTime date)
        {
            return new DateTime(date.Year, date.Month, 1);
        }

        public static DateTime LastDayOfMonth(this DateTime date)
        {
            return new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1).AddMonths(1).AddDays(-1);
        }
    }
}</pre>

**Örnek kullanım;**
<pre class="brush:csharp">DateTime Simdi = DateTime.Now;
MessageBox.Show("Ayın ilk günü: " + Simdi.FirstDayOfMonth().ToShortDateString());
MessageBox.Show("Ayın son günü: " + Simdi.LastDayOfMonth().ToShortDateString());</pre>

***Dosyanın MD5 Değerini Hesaplayan Extension Method***

<pre class="brush:csharp">namespace ExtensionManager
{
    public static class Extensions
    {
        public static string GetMD5(this string filename)
        {
            string result = string.Empty;

            try
            {
                MD5CryptoServiceProvider md5Provider = new MD5CryptoServiceProvider();
                FileStream fileStream = new FileStream(filename, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
                byte[] arrByteHashValue = md5Provider.ComputeHash(fileStream);
                fileStream.Close();

                string hashData = BitConverter.ToString(arrByteHashValue).Replace("-", "");
                result = hashData;
            }
            catch()
            {
            }
            return result.ToLower();
        }
    }
}</pre>

**Örnek kullanım;**
<pre class="brush:csharp">string Dosya = @"C:\Temp\DosyaAdi.txt";
MessageBox.Show(Dosya + " dosyasının MD5 değeri: " + Dosya.GetMD5());


