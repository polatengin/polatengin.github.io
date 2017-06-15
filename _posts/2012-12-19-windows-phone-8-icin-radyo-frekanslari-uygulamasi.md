---
layout: post
title: "Windows Phone 8 için Radyo Frekansları uygulaması"
date: 2012-12-19 00:35
author: engin.polat
comments: true
category: [Programlama]
tags: [action, capability, class, constructor, content, datatemplate, delegate, deserialize, downloadstringasync, downloadstringcompleted, error, foreach, header, id_cap_networking, IEnumerable, itemssource, itemtemplate, join, json, linq, linq query, longlistselector, nuget, null, pivot, pivotitem, public, resource, select, stackpanel, static, textblock, tostring, viewmodel, webclient, where, windows phone, wmappmanifest, wp8]
---
**Windows Phone 8** için şehir-şehir radyo frekanslarını görebileceğimiz bir uygulama geliştireceğiz.

Bu uygulamanın geliştirilmesi sırasında <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.pivot" title="Pivot Class" target="_blank">Pivot</a>, <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.pivotitem" title="PivotItem Class" target="_blank">PivotItem</a>, <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.longlistselector" title="LongListSelector Class" target="_blank">LongListSelector</a>, <a href="http://msdn.microsoft.com/library/system.windows.datatemplate" title="DataTemplate Class" target="_blank">DataTemplate</a>, <a href="http://msdn.microsoft.com/library/system.net.webclient" title="WebClient Class" target="_blank">WebClient</a> gibi sınıfları kullandığımız kodlar yazacağız.

Öncelikle *RadyoListe* isimli yeni bir *Windows Phone App* projesi oluşturalım;

![Windows Phone App Project](/assets/uploads/2012/12/RadyoListe1.png)

Proje oluşturduktan sonra gelen **Windows Phone Platform** versiyon seçim penceresinde *Windows Phone OS 8.0* seçeneğinin seçili olduğundan emin olmalıyız;

![Windows Phone 8.0 SDK](/assets/uploads/2012/12/RadyoListe2.png)

Uygulama ihtiyaç duyduğu veriyi internetten indireceği için *WMAppManifest.xml* dosyasında **Network erişim** izninin istenmiş olması gerekiyor;



&lt;Capabilities&gt;
    &lt;Capability Name="ID_CAP_NETWORKING" /&gt;
&lt;/Capabilities&gt;</pre>

Radyo listesi için *json* formatında hazırladığım veriyi kendi sunucuma <a href="enginpolat.com/application-data/radyolar.json" title="Radyo Listesi" target="_blank">radyolar.json</a> ismi ile yükledim.

**Json formatında** okuyacağımız bu veriyi işlemek için *References* içerisine <a href="http://nuget.org/packages/newtonsoft.json" title="Newtonsoft Json.net Nuget Package" target="_blank">Newtonsoft Json.Net (4.5.11)</a> **Nuget paketini** eklemeliyiz;

![Newtonsoft Json.Net Nuget Package](/assets/uploads/2012/12/RadyoListe3.png)

*Models* isminde bir dizin ekleyip, içerisinde *LiveData*, *City*, *Channel*, *Frequency* isimli sınıflar oluşturalım;

*LiveData.cs*
<pre class="brush:csharp">public class LiveData
{
    public IEnumerable&lt;City&gt; Cities { get; private set; }

    public IEnumerable&lt;Channel&gt; Channels { get; private set; }

    public IEnumerable&lt;Frequency&gt; Frequencies { get; private set; }

    public LiveData()
    {
        this.Cities = new List&lt;City&gt;();
        this.Channels = new List&lt;Channel&gt;();
        this.Frequencies = new List&lt;Frequency&gt;();
    }

    public LiveData(string LiveDataResponse)
    {
        var LiveDataResult = JsonConvert.DeserializeObject&lt;LiveData&gt;(LiveDataResponse);

        this.Cities = LiveDataResult.Cities;
        this.Channels = LiveDataResult.Channels;
        this.Frequencies = LiveDataResult.Frequencies;
    }
}</pre>

*City.cs*
<pre class="brush:csharp">public class City
{
    public int ID { get; set; }

    public string Name { get; set; }
}</pre>

*Channel.cs*
<pre class="brush:csharp">public class Channel
{
    public int ID { get; set; }

    public string Name { get; set; }
}</pre>

*Frequency.cs*
<pre class="brush:csharp">public class Frequency
{
    public int CityID { get; set; }

    public int ChannelID { get; set; }

    public float No { get; set; }
}</pre>

Uygulama ilk açıldığında çalıştırılan **App** (*App.xaml.cs*) sınıfına aşağıdaki kodları ekleyelim;

<pre class="brush:csharp">public static Action DataLoaded;

public static LiveData ViewModel = null;

public async static void LoadData()
{
    WebClient wc = new WebClient();

    wc.DownloadStringCompleted += (s, e) =>
    {
        if (e.Error == null)
        {
            ViewModel = new LiveData(e.Result);

            if (DataLoaded != null)
            {
                DataLoaded();
            }
        }
    };

    wc.DownloadStringAsync(new Uri("http://www.enginpolat.com/application-data/radyolar.json"));
}</pre>

**App** sınıfının constructor'ında *LoadData()* method'unu çağıralım;

<pre class="brush:csharp">LoadData();</pre>

Kodları inceleyecek olursak;

Sınıf seviyesinde tanımlanan *LiveData* tipindeki *ViewModel* değişkeni, *LoadData()* method'u içerisinde **asenkron** olarak doldurulur. *ViewModel* değişkenine değer ataması yapıldıktan sonra *DataLoaded* **action**'ını dinleyen bir method varsa *tetiklenir*.

Bu sayede uygulamanın açılışı esnasında *internetten verinin indirilmesi* ve *deserialize edilmesi* **asenkron** olarak yapılmış olur.

*MainPage.xaml* dosyasında ekranda sadece bir <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.pivot" title="Pivot Class" target="_blank">Pivot</a> kontrolünün gösterilmesini sağlayalım;

<pre class="brush:xml">&lt;Grid x:Name="LayoutRoot" Background="Transparent"&gt;
    &lt;Grid.RowDefinitions&gt;
        &lt;RowDefinition Height="*"/&gt;
    &lt;/Grid.RowDefinitions&gt;
    &lt;phone:Pivot Margin="0,10,10,10" Title="Radyo Listesi" Name="pvtSehirListesi" Grid.RowSpan="1" /&gt;
&lt;/Grid&gt;</pre>

Artık *MainPage.xaml.cs* dosyasındaki **constructor**'a giderek ekranı dolduracak kodları yazabiliriz;

<pre class="brush:csharp">App.DataLoaded = () =>
{
    foreach (City Sehir in App.ViewModel.Cities)
    {
        PivotItem pi = new PivotItem();
        pi.Header = Sehir.Name;

        LongListSelector list = new LongListSelector();
        list.ItemTemplate = Application.Current.Resources["FrequencyListItemTemplate"] as DataTemplate;
        list.ItemsSource = (from Frekans in App.ViewModel.Frequencies
            join Kanal in App.ViewModel.Channels on Frekans.ChannelID equals Kanal.ID
            where Frekans.CityID == Sehir.ID
            select new { ChannelName = Kanal.Name, Frequency = Frekans.No.ToString("00.0") }).ToList();

        pi.Content = list;

        pvtSehirListesi.Items.Add(pi);
    }
};</pre>

Böylece *App* sınıfında, *ViewModel* değişkenine değer yükledikten sonra tetiklediğimiz <a href="http://msdn.microsoft.com/library/system.action" title="Action Class" target="_blank">Action</a> içerisinde bir <a href="http://msdn.microsoft.com/library/vstudio/ttw7t8t6" title="foreach Loop" target="_blank">foreach</a> döngüsü çağırmış oluyoruz.

Döngü içerisinde ilk önce yeni bir <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.pivotitem" title="PivotItem Class" target="_blank">PivotItem</a> tipinde değişken oluşturuyoruz ve <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.pivotitem.header" title="PivotItem Class Header Property" target="_blank">Header</a> özelliğine döngü değişkeninden elde ettiğimiz *şehir ismi* bilgisini atıyoruz.

*PivotItem* tipindeki değişkenin <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.pivotitem.content" title="PivotItem Class Content Property" target="_blank">Content</a> özelliğine, <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.longlistselector" title="LongListSelector Class" target="_blank">LongListSelector</a> tipinde yeni bir değişken atıyoruz.

*LongListSelector* tipindeki değişkenin <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.longlistselector.itemssource" title="LongListSelector Class ItemsSource Property" target="_blank">ItemsSource</a> özelliğine *App.ViewModel* değişkenindeki değerlerden **LINQ Expression** ile oluşturduğumuz listeyi atıyoruz.

Aynı şekilde *LongListSelector* tipindeki değişkenin <a href="http://msdn.microsoft.com/library/microsoft.phone.controls.longlistselector.itemtemplate" title="LongListSelector Class ItemTemplate Property" target="_blank">ItemTemplate</a> özelliğine

<pre class="brush:csharp">Application.Current.Resources["FrequencyListItemTemplate"] as DataTemplate;</pre>

değerini atıyoruz.

Son olarak, *App.xaml* dosyasına *FrequencyListItemTemplate* ismindeki **Resource**'u ekliyoruz;

<pre class="brush:xml">&lt;Application.Resources&gt;
    &lt;DataTemplate x:Name="FrequencyListItemTemplate"&gt;
        &lt;StackPanel Margin="0,0,0,17"&gt;
            &lt;TextBlock Text="{Binding ChannelName}" TextWrapping="Wrap" Style="{StaticResource PhoneTextExtraLargeStyle}"/&gt;
            &lt;TextBlock Text="{Binding Frequency}" TextWrapping="Wrap" Margin="12,-6,12,0" Style="{StaticResource PhoneTextSubtleStyle}"/&gt;
        &lt;/StackPanel&gt;
    &lt;/DataTemplate&gt;
&lt;/Application.Resources&gt;


Uygulamayı çalıştırdığımızda aşağıdaki ekran görüntüsünü görüyor olmamız lazım;

![Radyo Liste Windows Phone 8 Application](/assets/uploads/2012/12/RadyoListe4.png)

Projenin kodlarını <a href="/assets/uploads/2012/12/RadyoListe.rar" title="Radyo Liste Windows Phone 8 Application Kaynak Kodlar" target="_blank">buradan</a> indirebilirsiniz.

