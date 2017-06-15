---
layout: post
title: "EntityFramework Expression kullanarak esnek veritabanı sorguları"
date: 2016-02-04 08:05
author: engin.polat
comments: true
category: [C#]
tags: [application, class, console, contains, csharp, dal, database, dbcontext, dbset, entityframework, expression, filter, firstordefault, foreach, from, func, generic, IEnumerable, linq, method, nuget, predicate, property, select, using, visual studio, where, yield]
---
Veritabanında gerçekleşecek **sorguları** yazdığımız *Veritabanı Erişim Katmanı*'nda (*Data Access Layer*, *DAL*) genelde bir tablodaki kayıtları **liste** olarak veya aranılan kritere göre **filtreleyerek** döndüren methodlarımız olur.

Projenin geliştirilme süresince *gelişen* ihtiyaçlara göre bu methodlara çeşitli kriterlere göre **filtreleme** yapan yeni methodlar eklenir ve bir süre sonra işin içinden çıkılmaz bir hale gelebilir.

<a href="http://msdn.microsoft.com/library/system.linq.expressions.expression" target="_blank">Expression</a>'ları kullanarak bu methodları azaltabiliriz.

Hemen **Visual Studio**'yu açalım ve yeni bir **Console Application** projesi oluşturalım;

![](/assets/uploads/2016/02/expression-1.png)

Projeye **Nuget Package Manager**'ı kullanarak <a href="http://www.asp.net/entity-framework" target="_blank">EntityFramework</a> paketini ekleyelim;

![](/assets/uploads/2016/02/expression-2.png)

Projeye *TestDatabaseDataContext* isminde yeni bir class ekleyelim ve içerisine aşağıdaki **property** tanımlamasını ekleyelim;



public class TestDatabaseDataContext : DbContext
{
    public DbSet&lt;Country&gt; Countries { get; set; }
}</pre>

Projeye *Country* isminde yeni bir class daha ekleyelim ve içerisine aşağıdaki **property** tanımlamalarını yapalım;

<pre class="brush:csharp">public class Country
{
    public int Id { get; set; }

    public string Name { get; set; }

    public decimal Area { get; set; }
}</pre>

Tekrar *Program.cs* dosyasını açalım ve içerisinde aşağıdaki iki method'u yazalım;

<pre class="brush:csharp">public static IEnumerable&lt;Country&gt; GetCountryList()
{
    using (var context = new TestDatabaseDataContext())
    {
        var ulkeler = (from country in context.Countries select country);

        foreach (var item in ulkeler)
        {
            yield return item;
        }
    }
}

public static Country GetCountry(int id)
{
    using (var context = new TestDatabaseDataContext())
    {
        return (from country in context.Countries select country).FirstOrDefault(e => e.Id == id);
    }
}</pre>

Böylece ülkelerin **listesini** ve aldığı **id** parametresine göre tek bir ülke'yi geri döndüren iki **method**'umuz olacak. Fakat zamanla gelişen yeni talepler ile bu method'lara, *isme göre ülke listesini* döndüren method, *belli bir yüzölçümünden büyük ülkelerin listesini* döndüren method, vs eklenecektir.

**Expression** sınıfını kullanarak bu methodları tekilleştirebiliriz. Hemen aşağıdaki method'u ekleyelim;

<pre class="brush:csharp">public static IEnumerable&lt;Country&gt; GetCountryList(Expression&lt;Func&lt;Country, bool&gt;&gt; expression)
{
    using (var context = new TestDatabaseDataContext())
    {
        var ulkeler = (from country in context.Countries select country).Where(expression);

        foreach (var item in ulkeler)
        {
            yield return item;
        }
    }
}</pre>

İstediğimiz yerde artık bu methodu aşağıdaki şekillerde kullanabiliriz;

<pre class="brush:csharp">var ulkeler1 = GetCountryList(u =&gt; u.Name.Contains("rika"));
// Amerika, Afrika, Kosta Rika, ...

var ulkeler2 = GetCountryList(u =&gt; u.Area &gt; 100);

var ulkeler3 = GetCountryList(u =&gt; u.Id &lt; 10);


*Böylece tek bir method'a nasıl bir sonuç listesi istediğimizi tarif ediyoruz ve o bize o sonucu döndürüyor.*

