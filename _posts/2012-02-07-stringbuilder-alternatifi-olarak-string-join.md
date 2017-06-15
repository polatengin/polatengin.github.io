---
layout: post
title: "StringBuilder alternatifi olarak String.Join"
date: 2012-02-07 06:42
author: engin.polat
comments: true
category: [C#]
tags: [append, class, garbage collector, IEnumerable, immutable, join, json, object, override, property, public, string, stringbuilder, tostring, xml]
---
<a href="http://msdn.microsoft.com/library/system.string" title="System.String Sınıfı" target="_blank">String</a> sınıfının <a href="http://msdn.microsoft.com/en-us/library/362314fe.aspx" title="string class immutable" target="_blank">immutable</a> olduğunu duymayanımız kalmamıştır (*bknz; <a href="http://stackoverflow.com/questions/2365272/why-net-string-is-immutable" title="string sınıfı neden immutable?" target="_blank">string sınıfı neden immutable?</a>*)

<a href="http://msdn.microsoft.com/library/system.string" title="String Sınıfı" target="_blank">string</a> tipindeki bir değişkenin değeri üzerinde *sürekli* değişiklik yapıp <a href="http://msdn.microsoft.com/en-us/library/0xy59wtx.aspx" title="Garbage Collector Referans" target="_blank">Garbage Collector</a>'a gereksiz iş oluşturmak yerine, <a href="http://msdn.microsoft.com/library/system.text.stringbuilder" title="StringBuilder Sınıfı" target="_blank">StringBuilder</a> sınıfını kullanırız (*Garbage Collector hakkında detaylı bilgi için bknz; <a href="http://msdn.microsoft.com/en-us/library/ms973837.aspx" title="Garbage Collector Basics and Performance Hints" target="_blank">Garbage Collector Temelleri ve Performans Noktaları</a>*)

Çeşitli sebeplerden dolayı (Loglama, XML veya JSON veri üretme, vs) sınıflarımızın <a href="http://msdn.microsoft.com/library/system.object.tostring" title="Object.ToString() Method" target="_blank">ToString()</a> method'larını override ederiz (bknz; <a href="http://msdn.microsoft.com/en-us/library/ms173154.aspx" title="MSDN: How to: Override the ToString Method" target="_blank">ToString() Method'unu override etmek</a>)

**ToString()** method'undan geriye *string* değer döndüreceğimiz için method içerisinde **string** değer tutabilecek bir değişkene ihtiyaç duyarız. Bu değişken yukarıda bahsettiğimiz nedenlerden dolayı *genelde* **StringBuilder** tipinde olur.

Örnek *ProductOrderCollection* sınıfımızın *ProductID* ve *Orders* isminde *property*'leri olduğunu varsayalım;



public class ProductOrderCollection
{
    public int ProductID { get; set; }

    public IEnumerable&lt;Order&gt; Orders{ get; set; }
}</pre>

*ToString() method'unu override ettiğimiz örnek kod parçası;*

<pre class="brush:csharp">public override string ToString()
{
    StringBuilder sb = new StringBuilder();
    sb.Append("Product{Id=");
    sb.Append(this.Id);
    sb.Append(",Orders=");
    if (this.Orders == null)
    {
        sb.Append("null");
    }
    else
    {
        sb.Append("[");
        for (int i = 0; i < this.Orders.Length; i++)
        {
            if (i > 0 && i < this.Orders.Length - 1)
            {
                sb.Append(",");
            }

            sb.Append(this.Orders[i]);
        }

        sb.Append("]");
    }

    sb.Append("}");

    return sb.ToString();
}</pre>

Yukarıdaki örnek kod sayesinde *ProductOrderCollection* sınıfının verilerinden JSON değer üretebiliriz.

*StringBuilder* sınıfı yerine <a href="http://msdn.microsoft.com/library/system.string.join" title="String.Join() Method" target="_blank">String.Join</a> methodunu kullanarak yapacak olsaydık;

</pre><pre class="brush:csharp">public override string ToString()
{
    StringBuilder sb = new StringBuilder();
    sb.Append("Product{Id=");
    sb.Append(this.Id);
    sb.Append(",Orders=");
    if (this.Orders == null)
    {
        sb.Append("null");
    }
    else
    {
        sb.Append("[");
        sb.Append(string.Join(",", this.Orders));
        sb.Append("]");
    }

    sb.Append("}");

    return sb.ToString();
}</pre>

Hatta *if/else* kod parçasını daha da kısaltabiliriz;

<pre class="brush:csharp">public override string ToString()
{
    StringBuilder sb = new StringBuilder();
    sb.Append("Product{Id=");
    sb.Append(this.Id);
    sb.Append(",Orders=");
    sb.Append(this.Orders == null ? "null" : "[" + string.Join(",", this.Orders) + "]");
    sb.Append("}");

    return sb.ToString();
}</pre>

*StringBuilder* sınıfını *hiç kullanmamak* için;

<pre class="brush:csharp">public override string ToString()
{
    return string.Join("Product{Id=", this.Id, ",Orders=", this.Orders == null ? "null" : "[" + string.Join(",", this.Orders) + "]", "}");
}


