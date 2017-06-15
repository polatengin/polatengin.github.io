---
layout: post
title: "Windows 8 için Blog RSS Reader uygulaması"
date: 2014-05-08 11:45
author: engin.polat
comments: true
category: [Windows]
tags: [addeditems, appbar, async, await, binding, columndefinition, datatemplate, grid, horizontalalignment, itemtemplate, listview, mainpage, navigatetostring, onnavigatedto, orientation, parse, retrievefeedasync, rowdefinition, selectionchanged, stackpanel, syndication, syndicationclient, textblock, topappbar, webview, windows store, windows8]
---
Blog'ların **RSS** adreslerine bağlanacak, makalelerin listesini getirecek ve seçilen makaleyi okumamızı sağlayacak **Windows 8** uygulaması geliştireceğiz.

Öncelikle *BlogReader* isimli **Windows 8** projesini oluşturalım ve *MainPage.xaml* dosyasına aşağıdaki kodları yazarak ekran tasarımımızı yapalım;



&lt;Page
    x:Class="BlogReader.MainPage"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    xmlns:local="using:BlogReader"
    xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
    xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
    mc:Ignorable="d"&gt;

    &lt;Grid&gt;
        &lt;Grid.ColumnDefinitions&gt;
            &lt;ColumnDefinition Width="300" /&gt;
            &lt;ColumnDefinition Width="*" /&gt;
        &lt;/Grid.ColumnDefinitions&gt;


        &lt;ListView Name="BlogPostListView" Margin="20" Grid.Column="1" SelectionChanged="BlogPostListView_SelectionChanged"&gt;
            &lt;ListView.ItemTemplate&gt;
                &lt;DataTemplate&gt;
                    &lt;StackPanel&gt;
                        &lt;TextBlock Text="{Binding Title}" FontSize="14" Margin="5,0,0,0" TextWrapping="Wrap" /&gt;
                        &lt;TextBlock Text="{Binding Description}" FontSize="12" Margin="15,0,0,0" /&gt;
                    &lt;/StackPanel&gt;
                &lt;/DataTemplate&gt;
            &lt;/ListView.ItemTemplate&gt;
        &lt;/ListView&gt;

        &lt;Grid Margin="20" Grid.Column="2"&gt;
            &lt;Grid.RowDefinitions&gt;
                &lt;RowDefinition Height="40"/&gt;
                &lt;RowDefinition Height="*"/&gt;
            &lt;/Grid.RowDefinitions&gt;

            &lt;TextBlock Name="PostTitleText" Text="{Binding Title}" FontSize="20" Grid.Row="0" TextWrapping="Wrap" /&gt;
            &lt;WebView Name="ContentView" Grid.Row="1" Margin="0,50,0,0" /&gt;
        &lt;/Grid&gt;
    &lt;/Grid&gt;

    &lt;Page.TopAppBar&gt;
        &lt;AppBar Name="topBar"&gt;
            &lt;StackPanel Orientation="Horizontal" HorizontalAlignment="Right"&gt;
                &lt;Button Name="Refresh" Style="{StaticResource RefreshAppBarButtonStyle}" Click="Refresh_Click" /&gt;
            &lt;/StackPanel&gt;
        &lt;/AppBar&gt;
    &lt;/Page.TopAppBar&gt;
&lt;/Page&gt;</pre>

Böylece iki sütunlu bir <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.xaml.controls.grid" title="Grid class" target="_blank">Grid</a> içerisinde soldaki sütunda Blog'un *RSS* adresinden çekeceğimiz makalelerin listesini göstereceğiz, sağdaki sütunda ise makale listesinden seçilen makalenin **başlığını** ve **içeriğini** göstereceğiz.

Ekranın <a href="http://msdn.microsoft.com/library/windows/Apps/windows.ui.xaml.controls.appbar" title="AppBar class" target="_blank">TopAppBar</a>'ında verileri tekrar çekecek olan **Refresh** (*Tazele*) <a href="http://msdn.microsoft.com/library/system.windows.controls.button" title="Button Class" target="_blank">Button</a> nesnesi yer alacak.

![](/assets/uploads/2014/05/BlogRSSReader-0.png)

Projemize *BlogPost* isminde bir sınıf ekleyelim ve rss adresindeki bilgiyi parse ettiğimizde elde edeceğimiz veriyi tutacağımız *property*'leri tanımlayalım;

<pre class="brush:csharp">public class BlogPost
{
    public string Title { get; set; }
    public string Author { get; set; }
    public string Content { get; set; }
    public DateTime PubDate { get; set; }
}</pre>

Artık *MainPage.xaml.cs* dosyasına gidebilir ve sayfa ekrana ilk geldiğinde yapılacak işleri <a href="http://msdn.microsoft.com/library/system.windows.controls.page.onnavigatedto" title="Page.OnNavigatedTo Method" target="_blank">OnNavigatedTo()</a> methodunun içerisine yazabiliriz.

Öncelikle rss adresindeki veriyi **parse** ettiğimizde elde edeceğimiz *BlogPost*'ların listesi için bir değişken tanımlaması yapıyoruz;

<pre class="brush:csharp">var postList = new List&lt;BlogPost&gt;();</pre>

Şimdi *Windows.Web.Syndication* namespace'inde tanımlı <a href="http://msdn.microsoft.com/library/windows/apps/windows.web.syndication.syndicationclient" title="SyndicationClient class" target="_blank">SyndicationClient</a> tipinde bir değişken tanımlayabilir ve <a href="http://msdn.microsoft.com/library/windows/apps/windows.web.syndication.syndicationclient.retrievefeedasync" title="SyndicationClient.RetrieveFeedAsync Method" target="_blank">RetreiveFeedAsync()</a> methodunu kullanarak belli bir adresteki rss verisini **parse** edebiliriz.

<pre class="brush:csharp">var client = new SyndicationClient();

var feed = await client.RetrieveFeedAsync(new Uri("http://feeds.feedburner.com/muammerbenzes"));</pre>

*Not : Bu örnekte sevgili <a href="http://www.muammerbenzes.com/" title="Muammer Benzeş" target="_blank">Muammer Benzeş</a>'in blogunun rss adresini kullandık, başka blogların rss adresleri için özel bir kod yazmaya gerek yok.*

**Parse** ettiğimiz rss verisinin içerisinde dönerek *BlogPost* listesine teker teker ekliyoruz;

<pre class="brush:csharp">foreach (var item in feed.Items)
{
    var post = new BlogPost();

    post.Title = item.Title.Text;
    post.PubDate = item.PublishedDate.DateTime;
    post.Author = item.Authors[0].Name.ToString();
    if (feed.SourceFormat == SyndicationFormat.Atom10)
    {
        post.Content = item.Content.Text;
    }
    else if (feed.SourceFormat == SyndicationFormat.Rss20)
    {
        post.Content = item.Summary.Text;
    }

    postList.Add(post);
}
</pre>

Tek yapmamız gereken ekrandaki *BlogPostListView* nesnesine elimizdeki *BlogPost* listesini bağlamak.

<pre class="brush:csharp">BlogPostListView.ItemsSource = postList;</pre>

*BlogPostListView* nesnesinden bir blog post seçildiğinde ekranın sağ tarafında başlığı ve içeriği ile göstermek için aşağıdaki method'u da *MainPage.xaml.cs* dosyasına eklememiz gerekiyor;

<pre class="brush:csharp">private void BlogPostListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
{
    if (e.AddedItems.Count > 0)
    {
        var post = e.AddedItems[0] as BlogPost;
        if (post != null)
        {
            PostTitleText.Text = post.Title;
            ContentView.NavigateToString(post.Content);
        }
    }
    else
    {
        PostTitleText.Text = "";
        ContentView.NavigateToString("");
    }
}


Böylece *BlogPostListView* nesnesinden herhangi bir blog post seçilirse ekranın sağ tarafında seçilen blog post'un başlığı ve içeriği görüntüleniyor olacak.

![](/assets/uploads/2014/05/BlogRSSReader-1.png)

