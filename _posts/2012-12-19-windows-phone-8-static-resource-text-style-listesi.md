---
layout: post
title: "Windows Phone 8 Static Resource Text Style listesi"
date: 2012-12-19 11:15
author: engin.polat
comments: true
category: [Programlama]
tags: [extension, phonetextaccentstyle, phonetextblockbase, phonetextcontraststyle, phonetextextralargestyle, phonetextgroupheaderstyle, phonetexthugestyle, phonetextlargestyle, phonetextnormalstyle, phonetextsmallstyle, phonetextsubtlestyle, phonetexttitle1style, phonetexttitle2style, phonetexttitle3style, resource, static, staticresource, style, textblock, textstyle, themestyle, windows phone, wp8]
---
**Windows Phone 8** için *static resource* *text style* listesini görebileceğimiz bir uygulama geliştireceğiz.

Öncelikle *TextStyles* isimli yeni bir **Windows Phone App** projesi oluşturalım;

![Text Styles Windows Phone Application Project](/assets/uploads/2012/12/TextStyles1.png)

Proje oluşturduktan sonra gelen **Windows Phone Platform** versiyon seçim penceresinde *Windows Phone OS 8.0* seçeneğinin seçili olduğundan emin olmalıyız;

![Windows Phone 8.0 SDK](/assets/uploads/2012/12/TextStyles2.png)

*MainPage.xaml* dosyasını aşağıdaki gibi güncelleyelim;



&lt;Grid x:Name="LayoutRoot" Background="Transparent"&gt;
    &lt;Grid.RowDefinitions&gt;
        &lt;RowDefinition Height="Auto"/&gt;
    &lt;/Grid.RowDefinitions&gt;

    &lt;StackPanel x:Name="TitlePanel" Grid.Row="0" Margin="12,17,0,28"&gt;
        &lt;TextBlock Text="TEXT STYLE 1" Style="{StaticResource PhoneTextBlockBase}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 2" Style="{StaticResource PhoneTextNormalStyle}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 3" Style="{StaticResource PhoneTextSubtleStyle}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 4" Style="{StaticResource PhoneTextTitle1Style}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 5" Style="{StaticResource PhoneTextTitle2Style}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 6" Style="{StaticResource PhoneTextTitle3Style}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 7" Style="{StaticResource PhoneTextSmallStyle}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 8" Style="{StaticResource PhoneTextLargeStyle}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 9" Style="{StaticResource PhoneTextExtraLargeStyle}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 10" Style="{StaticResource PhoneTextGroupHeaderStyle}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 11" Style="{StaticResource PhoneTextContrastStyle}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 12" Style="{StaticResource PhoneTextAccentStyle}" Margin="12,0"/&gt;
        &lt;TextBlock Text="TEXT STYLE 12" Style="{StaticResource PhoneTextHugeStyle}" Margin="12,0"/&gt;
    &lt;/StackPanel&gt;
&lt;/Grid&gt;


<a href="http://msdn.microsoft.com/library/ms750950" title="StaticResource Markup Extension" target="_blank">StaticResource</a> olarak kullanabileceğimiz **ThemeStyle**'ların ve **TextStyle**'ların listesine *MSDN*'de yer alan <a href="http://msdn.microsoft.com/library/ff769552" title="Theme Resources for Windows Phone" target="_blank">Theme Resources for Windows Phone</a> sayfasından erişebiliriz.

Uygulamayı çalıştırdığımızda aşağıdaki ekran görüntüsünü görüyor olmamız lazım;

![Text Styles Windows Phone 8 Application](/assets/uploads/2012/12/TextStyles3.png)

Projenin kodlarını <a href="/assets/uploads/2012/12/TextStyles.rar" title="Text Styles Windows Phone 8 Application Kaynak Kodlar" target="_blank">buradan</a> indirebilirsiniz.

