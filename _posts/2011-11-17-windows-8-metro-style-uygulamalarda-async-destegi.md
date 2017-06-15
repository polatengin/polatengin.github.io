---
layout: post
title: "Windows 8 Metro Style Uygulamalarda Async Desteği"
date: 2011-11-17 14:17
author: engin.polat
comments: true
category: [C#]
tags: [acceptreturn, async, asynchronous, await, button, class, click, compiled, content, ensuresuccessstatuscode, event, explicitcapture, foreach, get, getasync, httpclient, httpcontent, httpresponsemessage, ignorecase, instance, itemssource, listbox, match, matchcollection, matches, maxresponsecontentbuffersize, MetroUI, msdn, multiline, namespace, None, property, readasstring, regex, regexoptions, regularexpressions, routedeventargs, scrollviewer, singleline, task parallel library, text, textbox, textwrapping, tpl, verticalscrollbarvisibility, visual studio 2011, windows8, xaml]
---
<a href="http://www.enginpolat.com/etiket/windows8/" title="Windows 8 Programlama" target="_blank">Windows 8 Programlama</a> makale serisine, **Async Desteği** ile devam ediyoruz.

**Asenkron programlama** *ölçeklendirilebilir* ve *yanıt veren (donmayan)* uygulama geliştirmek için uzun yıllardır bilinen bir teknik. Uzun yıllardır bilinmesine rağmen, uygulama geliştiriciler olarak **asenkron programlama** bize hep **zor** gelmiştir.

**.Net 4.5** ile birlikte *asenkron programlama* **Async Framework** sayesinde kolay programlanabilir hale getirildi ve **Task Parallel Library**'nin (**TPL**) içerisine entegre edildi.

**Asenkron programlama** ile ilgili daha detaylı bilgiye, **MSDN**'in <a href="http://msdn.microsoft.com/async" title="Visual Studio Asynchronous Programming">Visual Studio Asynchronous Programming</a> sayfasından ulaşabilirsiniz.

Bu makalede basit bir örnek ile **async** ve **await** anahtar kelimelerinin kullanımını inceleyeceğiz.

Yapacağımız örnek bir web sitesinin içeriğini okuyacak ve web adreslerini toplayacak. İlk olarak standart programlama yöntemlerini kullanarak uygulamamızı geliştireceğiz, daha sonra **async** ve **await** anahtar kelimeleri ile **asenkron programlama** öğelerini uygulamamıza dahil edeceğiz.

Hemen yeni bir **Visual Studio 2011** açarak geliştirmeye başlayalım;

![](/assets/uploads/2011/10/4.png "Visual Studio 2011 - Açılış Ekranı")

*Yeni Proje* oluşturma dialog kutusunda **Windows Metro Style** grubunda yer alan **Application** proje şablonunu seçelim ve projemize bir isim verelim (bu örnekte benim kullandığım isim, *AsyncOrnek*)

![](/assets/uploads/2011/11/Async-1.png "Visual Studio 2011 - Metro Style Application")

Proje oluşturulduğunda *MainPage.xaml* dosyasının içeriği;



&lt;UserControl x:Class="Windows8ApplicationBar.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    d:DesignHeight="768" d:DesignWidth="1366"&gt;

    &lt;Grid x:Name="LayoutRoot" Background="#FF0C0C0C"&gt;
    &lt;/Grid&gt;

&lt;/UserControl&gt;</pre>

İlk önce uygulamamıza bir <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.textbox" title="TextBox Control" target="_blank">TextBox</a>, bir <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.button" title="Button Control" target="_blank">Button</a> ve bir <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.listbox" title="ListBox Control" target="_blank">ListBox</a> nesnesi ekliyoruz;

<pre class="brush:xml">&lt;Grid x:Name="LayoutRoot" Background="#FF0C0C0C"&gt;

    &lt;TextBox x:Name="txtKaynakHtml" Width="600" Height="700" HorizontalAlignment="Left" /&gt;
    &lt;ListBox x:Name="lbUrlList" Width="600" Height="700" HorizontalAlignment="Right" /&gt;
    &lt;Button x:Name="btnTara" Content="Tara" HorizontalAlignment="Center" /&gt;

&lt;/Grid&gt;</pre>

Böylece uygulama ekranımız şu şekilde gözüküyor;

![](/assets/uploads/2011/11/Async-3.png "Visual Studio 2011 - Metro Style Application")

**TextBox** kontrolünün <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.textbox.text" title="TextBox Text Property" target="_blank">Text</a> özelliğine web sitesinin kaynak html'ini atayacağımız için, çok satır gösterebilir olması lazım (*MultiLine*)

*WPF* *TextBox* kontrolünün **MultiLine** olabilmesi için, **TextBox** element'ine şu özellikleri ekliyoruz;

<pre class="brush:csharp">TextWrapping="Wrap" AcceptsReturn="True" ScrollViewer.VerticalScrollBarVisibility="Visible"</pre>

**Button** kontrolüne basıldığında tarama işlemini başlatmak için, *Button* element'inde <a href="http://msdn.microsoft.com/library/windows.ui.xaml.controls.primitives.buttonbase.click" title="Button Click Event" target="_blank">Click</a> olayını yakalıyoruz;

<pre class="brush:csharp">Click="btnTara_Click"</pre>

Böylece uygulamamızın **XAML** kod'u aşağıdaki hale gelmiş oluyor;

<pre class="brush:xml">&lt;UserControl x:Class="AsyncOrnek.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    d:DesignHeight="768" d:DesignWidth="1366"&gt;

    &lt;Grid x:Name="LayoutRoot" Background="#FF0C0C0C"&gt;

        &lt;TextBox x:Name="txtKaynakHtml" Width="600" Height="700" HorizontalAlignment="Left" TextWrapping="Wrap" AcceptsReturn="True" ScrollViewer.VerticalScrollBarVisibility="Visible" /&gt;
        &lt;ListBox x:Name="lbUrlList" Width="600" Height="700" HorizontalAlignment="Right" /&gt;
        &lt;Button x:Name="btnTara" Content="Tara" HorizontalAlignment="Center" Click="btnTara_Click" /&gt;

    &lt;/Grid&gt;

&lt;/UserControl&gt;</pre>

*MainPage.xaml.cs* dosyasında *btnTara_Click* method'unu yazıyoruz;

<pre class="brush:csharp">private void btnTara_Click(object sender, RoutedEventArgs e)
{
}</pre>

Öncelikle, taradığımız sitede bulacağımız **url'leri** saklayacağımız **string dizisini** oluşturalım;

<pre class="brush:csharp">List&lt;string&gt; UrlList = new List&lt;string&gt;();</pre>

<a href="http://msdn.microsoft.com/library/system.net.http.httpclient(v=VS.110)" title="HttpClient Class" target="_blank">HttpClient</a> sınıfından yeni bir *instance* oluşturup, <a href="http://msdn.microsoft.com/en-gb/library/hh138154(v=VS.110)" title="HttpClient Get Method" target="_blank">Get()</a> method'una, tarayacağımız sitenin adresini yazalım.

*Get()* method'undan dönen <a href="http://msdn.microsoft.com/library/system.net.http.httpresponsemessage(v=vs.110)" title="HttpResponseMessage Class" target="_blank">HttpResponseMessage</a> tipindeki cevabı bir değişkene atayalım;

<pre class="brush:csharp">var HttpCagri = new HttpClient().Get("http://www.enginpolat.com");</pre>

**HttpClient** sınıfı <a href="http://msdn.microsoft.com/library/system.net.http(v=vs.110)" title="System.Net.Http Namespace" target="_blank">System.Net.Http</a> **namespace**'inde yer aldığı için, *MainPage.xaml.cs* dosyasının **using** kısmına

<pre class="brush:csharp">using System.Net.Http;</pre>

satırını ekleyelim.

*HttpCagri* değişkeninin sitenin kaynak html'ini okuyabildiğinden emin olmak için, <a href="http://msdn.microsoft.com/library/system.net.http.httpresponsemessage.ensuresuccessstatuscode(v=vs.110)" title="EnsureSuccessStatusCode Method" target="_blank">EnsureSuccessStatusCode()</a> method'unu çağıralım.

Böylece <a href="http://msdn.microsoft.com/library/system.net.http.httpcontent(v=vs.110)" title="HttpContent Class" target="_blank">HttpContent</a> tipindeki <a href="http://msdn.microsoft.com/library/system.net.http.httpresponsemessage.content(v=vs.110)" title="Content Property" target="_blank">Content</a> özelliğine erişebilir olacağız. **Content** özelliğinin <a href="http://msdn.microsoft.com/library/system.net.http.httpcontent.readasstring(v=vs.110)" title="ReadAsString Method" target="_blank">ReadAsString()</a> method'u kaynak html'ini döndürecek, biz de bir değişken aracılığıyla bu html'i saklayacağız.

<pre class="brush:csharp">var KaynakHtml = HttpCagri.EnsureSuccessStatusCode().Content.ReadAsString();</pre>

Elimizdeki bu html verisini, arayüzdeki *txtKaynakHtml* **TextBox**'ında göstermek için;

<pre class="brush:csharp">txtKaynakHtml.Text = KaynakHtml;</pre>

Şimdi yapmamız gereken, *KaynakHtml* değişkenindeki **url**'leri bulmak. Bunun için <a href="http://msdn.microsoft.com/library/system.text.regularexpressions.regex" title="Regex Class" target="_blank">Regex</a> sınıfından faydalanacağız ve yazacağımız **Regular Expression**'a uyan url'leri *UrlList* değişkeninde biriktireceğiz.

**Regex** sınıfı <a href="http://msdn.microsoft.com/library/system.text.regularexpressions" title="System.Text.RegularExpression Namespace" target="_blank">System.Text.RegularExpressions</a> namespace'inde olduğu için, *MainPage.xaml.cs* dosyasının **using** kısmına

<pre class="brush:csharp">using System.Text.RegularExpressions;</pre>

satırını ekleyelim.

Öncelikle **Regex** sınıfının *static* <a href="http://msdn.microsoft.com/library/system.text.regularexpressions.regex.matches" title="Regex Matches Method" target="_blank">Matches</a> method'una *KaynakHtml* değişkenini, *Regular Expression* metnini ve arama yaparken büyük/küçük harf ayrımı yapmaması için <a href="http://msdn.microsoft.com/library/system.text.regularexpressions.regexoptions" title="RegexOptions Enumeration" target="_blank">RegexOptions.IgnoreCase</a> değerini parametre olarak veriyoruz.

**RegexOptions** parametresine verebileceğimiz diğer değerler;



*   RegexOptions.None
*   RegexOptions.IgnoreCase
*   RegexOptions.Multiline
*   RegexOptions.ExplicitCapture
*   RegexOptions.Compiled
*   RegexOptions.Singleline
*   RegexOptions.IgnorePatternWhitespace
*   RegexOptions.RightToLeft
*   RegexOptions.ECMAScript
*   RegexOptions.CultureInvariant

Method'dan dönen <a href="http://msdn.microsoft.com/library/system.text.regularexpressions.matchcollection" title="MatchCollection Class" target="_blank">MatchCollection</a> tipindeki cevabı bir değişkende saklıyoruz;

<pre class="brush:csharp">var mc = Regex.Matches(KaynakHtml, "href\\s*=\\s*(?:\"(?&lt;1&gt;http://[^\"]*)\")", RegexOptions.IgnoreCase);</pre>

Bir **foreach** döngüsü ile **MatchCollection**'daki her <a href="http://msdn.microsoft.com/library/system.text.regularexpressions.match" title="Match Class" target="_blank">Match</a>'i *UrlList*'e ekliyoruz;

<pre class="brush:csharp">foreach (Match m in mc)
{
    UrlList.Add(m.Groups[1].Value);
}</pre>

Son olarak arayüzdeki *lbUrlList* **ListBox**'ında bu listeyi gösteriyoruz;

<pre class="brush:csharp">lbUrlList.ItemsSource = UrlList;</pre>

İlk çalıştırma aşamasına geldik. Projeyi çalıştırıp *Tara butonuna* bastığımızda garip bir hata alıyoruz;

*Cannot write more bytes to the buffer than the configured maximum buffer size: 65536*

![](/assets/uploads/2011/11/Async-2.png "Visual Studio 2011 - Metro Style Application")

Bu hataya, kaynak html'ini aldığımız siteden dönen cevabın *65536* karakterden büyük olması yol açıyor. Çözüm aslında basit;

**HttpClient** tipindeki değişkenin <a href="http://msdn.microsoft.com/library/system.net.http.httpclient.maxresponsecontentbuffersize(v=vs.110)" title="MaxResponseContentBufferSize Property" target="_blank">MaxResponseContentBufferSize</a> özelliğine sitenin kaynak html'inin karakter sayısı kadar büyük bir değer vermemiz lazım.

Bu örnek için ben verilebilecek en büyük değer olan <a href="http://msdn.microsoft.com/library/system.int32.maxvalue" title="int MaxValue Constant" target="_blank">int.MaxValue</a> değerini seçtim, *HttpCagri* değişkenini tanımladığımız satırı şöyle güncelliyoruz;

<pre class="brush:csharp">var HttpCagri = new HttpClient() { MaxResponseContentBufferSize = int.MaxValue }.Get("http://www.enginpolat.com");</pre>

Artık projemizi çalıştırabiliriz;

![](/assets/uploads/2011/11/Async-4.png "Visual Studio 2011 - Metro Style Application")

Buraya kadar uygulamayı çalıştırmaya odaklanmıştık, uygulamayı çalıştırdıktan sonra kullanıyoruz ve farkediyoruz ki, *Tara butonuna* bastıktan sonra liste dolana kadar uygulama kullanıcıya **yanıt vermiyor**.

Kullanıcı dostu bir uygulamanın her zaman kullanıcıya yanıt vermesi beklenir. Biz de *Tara butonunun* yaptığı işi **asenkron** yapmasını sağlayarak oluşan donmaların önüne geçebiliriz.

**Asenkron** çalışma yeteneğini eklemek için öncelikle *btnTara_Click* method'una **async** anahtar kelimesini ekleyeceğiz;

<pre class="brush:csharp">private async void btnTara_Click(object sender, RoutedEventArgs e)</pre>

Uygulamanın donmasına sebep olan en uzun iş, internet sitesinin cevabının alındığı **HttpClient** sınıfının **Get()** method'u. Bu yüzden **Get()** method'unu *asenkron* özellikte olan <a href="http://msdn.microsoft.com/library/hh158944(v=VS.110)" title="GetAsync Method" target="_blank">GetAsync()</a> method'u ile değiştiriyoruz.

*HttpCagri* değişkenine değer atamadan önce **await** anahtar kelimesi ile *asenkron* yaptığımız çağrının sonuçlanmasını beklemeliyiz. İlgili satırı aşağıdaki şekilde güncelleyelim;

<pre class="brush:csharp">var HttpCagri = await new HttpClient() { MaxResponseContentBufferSize = int.MaxValue }.GetAsync("http://www.enginpolat.com");</pre>

Böylece uygulamamıza **asenkron** çalışabilme yeteneğini kazandırmış olduk. Projenin kodlarının tamamı;

<pre class="brush:xml">&lt;UserControl x:Class="AsyncOrnek.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"
    d:DesignHeight="768" d:DesignWidth="1366"&gt;

    &lt;Grid x:Name="LayoutRoot" Background="#FF0C0C0C"&gt;

        &lt;TextBox x:Name="txtKaynakHtml" Width="600" Height="700" HorizontalAlignment="Left" TextWrapping="Wrap" AcceptsReturn="True" ScrollViewer.VerticalScrollBarVisibility="Visible" /&gt;
        &lt;ListBox x:Name="lbUrlList" Width="600" Height="700" HorizontalAlignment="Right" /&gt;
        &lt;Button x:Name="btnTara" Content="Tara" HorizontalAlignment="Center" Click="btnTara_Click" /&gt;

    &lt;/Grid&gt;

&lt;/UserControl&gt;</pre>

<pre class="brush:csharp">private async void btnTara_Click(object sender, RoutedEventArgs e)
{
    List&lt;string&gt; UrlList = new List&lt;string&gt;();

    var HttpCagri = await new HttpClient() { MaxResponseContentBufferSize = int.MaxValue }.GetAsync("http://www.enginpolat.com");
    var KaynakHtml = HttpCagri.EnsureSuccessStatusCode().Content.ReadAsString();

    txtKaynakHtml.Text = KaynakHtml;

    var mc = Regex.Matches(KaynakHtml, "href\\s*=\\s*(?:\"(?&lt;1&gt;http://[^\"]*)\")", RegexOptions.IgnoreCase);

    foreach (Match m in mc)
    {
        UrlList.Add(m.Groups[1].Value);
    }

    lbUrlList.ItemsSource = UrlList;
}


