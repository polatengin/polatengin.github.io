---
layout: post
title: "C# CallerMemberName attribute"
date: 2013-02-12 10:00
author: engin.polat
comments: true
category: [C#]
tags: [attribute, callerfilepath, callerfilepathattribute, callerlinenumber, callerlinenumberattribute, callermembername, callermembernameattribute, compilerservices, dependencyobject, exception, namespace, onpropertychanged, propertychangedeventargs, propertychangedeventhandler, serialize]
---
*.Net 4.5* ve *C# 5* ile duyurulan <a href="http://msdn.microsoft.com/library/system.runtime.compilerservices.callermembernameattribute" title="CallerMemberNameAttribute Class" target="_blank" rel="noopener">CallerMemberName</a> attribute'unun Loglama ve <a href="http://msdn.microsoft.com/library/system.windows.dependencyobject.onpropertychanged" title="DependencyObject.OnPropertyChanged Method" target="_blank" rel="noopener">OnPropertyChanged</a> method'unu daha kolay tetiklemek dışında ne işe yarayacağını uzun süre düşündükten sonra, internette gördüğüm bir makale ile aklıma bir fikir geldi. **CallerMemberName** *attribute*'unun kullanım alanlarını inceleyelim;

***Loglama***



public static void LogException(string message,
    [CallerMemberName] string callerName = null,
    [CallerLineNumber] int lineNumber = 0,
    [CallerFilePath] string filePath = null)
{
    Console.WriteLine("Hata oluştu : {0}. Method : {1} Satır : {2} Dosya : {3}", message, callerName, lineNumber, filePath);
}

private static void Calculate()
{
    try
    {
        /// Veritabanına bağlan, sorgulama yap, hesapla
    }
    catch (Exception ex)
    {
        LogException(ex.Message);
    }
}</pre>

***OnPropertyChanged***

*OnPropertyChanged* method'unu *C# 5*'ten önce şöyle tetikleriz;

<pre class="brush:csharp">protected virtual void OnPropertyChanged(string propertyName)
{
    PropertyChangedEventHandler handler = PropertyChanged;
    if (handler != null)
    {
        handler(this, new PropertyChangedEventArgs(propertyName));
    }
}

private string _productName;
public string ProductName
{
    get { return _productName; }
    set
    {
        _productName = value;
        OnPropertyChanged("ProductName");
    }
}</pre>

*C# 5* ile birlikte gelen **CallerMemberName** attribute'unu kullanarak aynı işi şu şekilde yapabiliriz;

<pre class="brush:csharp">protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
{
    PropertyChangedEventHandler handler = PropertyChanged;
    if (handler != null)
    {
        handler(this, new PropertyChangedEventArgs(propertyName));
    }
}
 
private string _productName;
public string ProductName
{
    get { return _productName; }
    set
    {
        _productName = value;
        OnPropertyChanged();
    }
}</pre>

***Strategy Pattern***

**CallerMemberName** *attribute*'unun yukarıdakilerden farklı kullanımı aşağıdaki gibi olabilir;

<pre class="brush:csharp">public class CustomSerializer
{
    public Func&lt;string&gt; Serialize { get; private set; }

    public CustomSerializer([CallerMemberName] string memberName = "")
    {
        if (memberName.Contains("Xml"))
        {
            Serialize = () => { return "xml"; };
        }
        else
        {
            Serialize = () => { return "json"; };
        }
    }
}

public static void WriteXml()
{
    var serializer = new CustomSerializer();
    Console.WriteLine(serializer.Serialize()); /// xml
}

public static void WriteJson()
{
    var serializer = new CustomSerializer();
    Console.WriteLine(serializer.Serialize()); /// json
}


Böylece, *CustomSerializer* class'ında bulunan *Serialize* method'unu çağıran method'un adında *Xml* anahtar kelimesi varsa *Serialize* method'u *xml serialization* yapacak, yoksa *json serialization* yapacak.

*Kaynak : Makaleyi tekrar bulamadım :(*

