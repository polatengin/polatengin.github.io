---
layout: post
title: "Windows Phone 8 LongListSelector DataBind örneği"
date: 2013-03-01 10:00
author: engin.polat
comments: true
category: [Programlama]
tags: [binding, class, constructor, datatemplate, itemsource, itemtemplate, layoutroot, list, longlistselector, phonetexttitle1style, property, stackpanel, textblock, windows phone, wp8]
---
**Windows Phone 8** uygulamanıza <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.controls.longlistselector" title="LongListSelector Class" target="_blank" rel="noopener">LongListSelector</a> kontrolü eklemeniz ve bir veri kaynağına bağlamanız gerekiyorsa aşağıdaki adımları izleyebilirsiniz.

Öncelikle *DataBindSample* isimli yeni bir **Windows Phone App** projesi oluşturalım;

![Data Bind Sample Windows Phone Application Project](/assets/uploads/2013/02/DataBind-1.png)

Proje oluşturduktan sonra gelen **Windows Phone Platform** versiyon seçim penceresinde *Windows Phone OS 8.0* seçeneğinin seçili olduğundan emin olmalıyız;

![Windows Phone 8.0 SDK](/assets/uploads/2013/02/DataBind-2.png)

Bu örnek için *Book* ve *BookList* isminde birer **class** oluşturacağız.

*Book* sınıfına *Title* ve *Writer* isminde iki **property** ekleyelim;



public class Book
{
    public string Title { get; set; }

    public string Writer { get; set; }
}</pre>

*BookList* sınıfını *List&lt;Book&gt;* sınıfından türeteceğiz;

<pre class="brush:csharp">public class BookList : List&lt;Book&gt;
{
    public BookList()
    {
        Add(new Book() { Title = "Jurassic Park", Writer = "Michael Crichton" });
        Add(new Book() { Title = "Bourne Identity", Writer = "Robert Ludlum" });
        Add(new Book() { Title = "Devil Wears Prada", Writer = "Lauren Weisberger" });
        Add(new Book() { Title = "Fight Club", Writer = "Chuck Palahniuk" });
        Add(new Book() { Title = "Forrest Gump", Writer = "Winston Groom" });
        Add(new Book() { Title = "Green Mile", Writer = "Stephen King" });
        Add(new Book() { Title = "I Am Legend", Writer = "Richard Matheson" });
        Add(new Book() { Title = "Jaws", Writer = "Peter Benchley" });
        Add(new Book() { Title = "Notebook", Writer = "Nicholas Sparks" });
        Add(new Book() { Title = "Silence of the Lambs", Writer = "Thomas Harris" });
        Add(new Book() { Title = "Spartacus", Writer = "Howard Fast" });
    }
}</pre>

*BookList* sınıfının **constructor**'ında listeye birkaç kitap ekliyoruz, böylece uygulamayı çalıştırdığımızda ekrana gelecek liste dolu olacak.

*Not : Test süreci sonunda constructor'daki kodlar temizlenmeli ve verikaynağı olarak veritabanına veya bir web service'e bağlanmalıdır.*

*MainPage.xaml* dosyasını aşağıdaki şekilde güncelleyerek ekrana *list* isminde bir **LongListSelector** ve <a href="http://msdn.microsoft.com/library/system.windows.datatemplate" title="DataTemplate Class" target="_blank" rel="noopener">DataTemplate</a> özelliğine <a href="http://msdn.microsoft.com/library/system.windows.controls.stackpanel" title="StackPanel Class" target="_blank" rel="noopener">StackPanel</a> içerisinde <a href="http://msdn.microsoft.com/library/system.windows.controls.textblock" title="TextBlock Class" target="_blank" rel="noopener">TextBlock</a>'lar ekleyelim;

<pre class="brush:xml">&lt;Grid x:Name="LayoutRoot" Background="Transparent"&gt;
    &lt;Grid.RowDefinitions&gt;
        &lt;RowDefinition Height="Auto"/&gt;
        &lt;RowDefinition Height="*"/&gt;
    &lt;/Grid.RowDefinitions&gt;

    &lt;TextBlock Text="databind örnek" Margin="9,-7,0,0" Style="{StaticResource PhoneTextTitle1Style}" /&gt;

    &lt;Grid x:Name="ContentPanel" Grid.Row="1" Margin="12,0,12,0"&gt;
        &lt;phone:LongListSelector Name="list"&gt;
            &lt;phone:LongListSelector.ItemTemplate&gt;
                &lt;DataTemplate&gt;
                    &lt;StackPanel Orientation="Horizontal"&gt;
                        &lt;TextBlock Text="{Binding Path=Title}" /&gt;
                        &lt;TextBlock Text=" ( " /&gt;
                        &lt;TextBlock Text="{Binding Path=Writer}" FontStyle="Italic" /&gt;
                        &lt;TextBlock Text=" )" /&gt;
                    &lt;/StackPanel&gt;
                &lt;/DataTemplate&gt;
            &lt;/phone:LongListSelector.ItemTemplate&gt;
        &lt;/phone:LongListSelector&gt;
    &lt;/Grid&gt;
&lt;/Grid&gt;</pre>

Son olarak *MainPage.xaml.cs* **constructor**'ında *LongListSelector*'un <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.controls.longlistselector.itemssource" title="LongListSelector.ItemsSource Property" target="_blank" rel="noopener">ItemSource</a> özelliğine *BookList* sınıfından yeni bir instance atıyoruz;

<pre class="brush:csharp">list.ItemsSource = new BookList();


Artık uygulamayı çalıştırabiliriz, aşağıdaki çıktıyı görüyor olmamız lazım;

![Data Bind Sample screen shot](/assets/uploads/2013/02/DataBind-3.png)

