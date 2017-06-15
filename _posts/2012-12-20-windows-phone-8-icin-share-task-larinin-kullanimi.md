---
layout: post
title: "Windows Phone 8 için Share Task'larının kullanımı"
date: 2012-12-20 22:52
author: engin.polat
comments: true
category: [Programlama]
tags: [cameracapturetask, click, columndefinition, content, event, filepath, grid, inputscope, phonetextextralargestyle, private, relativeorabsolute, routedeventargs, rowdefinition, sharelinktask, sharemediatask, sharestatustask, staticresource, textblock, textbox, uri, urikind, void, windows phone, wp8]
---
**Windows Phone 8** için *share task*'ları kullanacağımız bir uygulama geliştireceğiz.

Bu uygulamanın geliştirilmesi sırasında <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.sharestatustask" title="ShareStatusTask Class" target="_blank">ShareStatusTask</a>, <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.sharelinktask" title="ShareLinkTask Class" target="_blank">ShareLinkTask</a>, <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.sharemediatask" title="ShareMediaTask Class" target="_blank">ShareMediaTask</a>, <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.cameracapturetask" title="CameraCaptureTask Class" target="_blank">CameraCaptureTask</a> gibi yapıları kullandığımız kodlar yazacağız.

Öncelikle *ShareTasks* isimli yeni bir **Windows Phone App** projesi oluşturalım;

![Share Tasks Windows Phone Application Project](/assets/uploads/2012/12/ShareTasks1.png)

Proje oluşturduktan sonra gelen **Windows Phone Platform** versiyon seçim penceresinde *Windows Phone OS 8.0* seçeneğinin seçili olduğundan emin olmalıyız;

![Windows Phone 8.0 SDK](/assets/uploads/2012/12/ShareTasks2.png)

Ekran tasarımı için *MainPage.xaml* dosyasını aşağıdaki gibi güncelleyelim;



&lt;Grid x:Name="LayoutRoot" Background="Transparent"&gt;
    &lt;Grid.RowDefinitions&gt;
        &lt;RowDefinition Height="Auto" /&gt;
        &lt;RowDefinition Height="Auto" /&gt;
        &lt;RowDefinition Height="Auto" /&gt;
        &lt;RowDefinition Height="Auto" /&gt;
        &lt;RowDefinition Height="Auto" /&gt;
        &lt;RowDefinition Height="Auto" /&gt;
        &lt;RowDefinition Height="Auto" /&gt;
        &lt;RowDefinition Height="Auto" /&gt;
        &lt;RowDefinition Height="Auto" /&gt;
        &lt;RowDefinition Height="Auto" /&gt;
        &lt;RowDefinition Height="Auto" /&gt;
    &lt;/Grid.RowDefinitions&gt;

    &lt;Grid.ColumnDefinitions&gt;
        &lt;ColumnDefinition Width="125"  /&gt;
        &lt;ColumnDefinition Width="*" /&gt;
    &lt;/Grid.ColumnDefinitions&gt;

    &lt;TextBlock Text="SHARE TASKS" Style="{StaticResource PhoneTextNormalStyle}" Margin="15,0" Grid.Row="0" Grid.ColumnSpan="2" /&gt;

    &lt;TextBlock Text="share status" Margin="10,0,0,10" Style="{StaticResource PhoneTextExtraLargeStyle}" Grid.Row="1" Grid.ColumnSpan="2" /&gt;
    &lt;TextBlock Text="STATUS" Margin="30,20,0,0" Style="{StaticResource PhoneTextTitle3Style}" Grid.Row="2" Grid.Column="0" /&gt;
    &lt;TextBox Margin="0,0,0,0" Name="txtShareStatus_Status" Grid.Row="2" Grid.Column="1" /&gt;
    &lt;Button Content="PAYLAŞ" Name="btnShareStatus" Margin="0,0,0,0" Grid.Row="3" Grid.ColumnSpan="2" Click="btnShareStatus_Click" /&gt;

    &lt;TextBlock Text="share link" Margin="10,0,0,0" Style="{StaticResource PhoneTextExtraLargeStyle}" Grid.Row="4" Grid.ColumnSpan="2" /&gt;
    &lt;TextBlock Text="TITLE" Margin="30,20,0,0" Style="{StaticResource PhoneTextTitle3Style}" Grid.Row="5" Grid.Column="0" /&gt;
    &lt;TextBox Margin="0,0,0,0" Name="txtShareLink_Title" Grid.Row="5" Grid.Column="1" /&gt;
    &lt;TextBlock Text="MESSAGE" Margin="30,20,0,0" Style="{StaticResource PhoneTextTitle3Style}" Grid.Row="6" Grid.Column="0" /&gt;
    &lt;TextBox Margin="0,0,0,0" Name="txtShareLink_Message" Grid.Row="6" Grid.Column="1" /&gt;
    &lt;TextBlock Text="LINK URL" Margin="30,20,0,0" Style="{StaticResource PhoneTextTitle3Style}" Grid.Row="7" Grid.Column="0" /&gt;
    &lt;TextBox Margin="0,0,0,0" Name="txtShareLink_Url" InputScope="Url" Grid.Row="7" Grid.Column="1" /&gt;
    &lt;Button Content="PAYLAŞ" Name="btnShareLink" Margin="0,0,0,0" Grid.Row="8" Grid.ColumnSpan="2" Click="btnShareLink_Click" /&gt;

    &lt;TextBlock Text="share media" Margin="10,0,0,0" Style="{StaticResource PhoneTextExtraLargeStyle}" Grid.Row="9" Grid.ColumnSpan="2" /&gt;
    &lt;Button Content="KAMERA ÇEK ve PAYLAŞ" Name="btnShareMedia" Margin="0,0,0,0" Grid.Row="10" Grid.ColumnSpan="2" Click="btnShareMedia_Click" /&gt;
&lt;/Grid&gt;</pre>

Butonlara basıldığında tetiklenecek method'ları *MainPage.xaml.cs* dosyasına ekleyelim;

<pre class="brush:csharp">private void btnShareStatus_Click(object sender, RoutedEventArgs e)
{
    var Status = txtShareStatus_Status.Text;

    ShareStatusTask task = new ShareStatusTask();
    task.Status = Status;

    task.Show();
}

private void btnShareLink_Click(object sender, RoutedEventArgs e)
{
    var Title = txtShareLink_Title.Text;
    var Message = txtShareLink_Message.Text;
    var Url = txtShareLink_Url.Text;

    ShareLinkTask task = new ShareLinkTask();
    task.Title = Title;
    task.Message = Message;
    task.LinkUri = new Uri(Url, UriKind.RelativeOrAbsolute);

    task.Show();
}

private void btnShareMedia_Click(object sender, RoutedEventArgs e)
{
    CameraCaptureTask task = new CameraCaptureTask();
    task.Completed += CameraCaptureTask_Completed;

    task.Show();
}

private void CameraCaptureTask_Completed(object sender, PhotoResult e)
{
    ShareMediaTask task = new ShareMediaTask();
    task.FilePath = e.OriginalFileName;

    task.Show();
}


<a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.sharestatustask" title="ShareStatusTask Class" target="_blank">ShareStatusTask</a>, <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.sharelinktask" title="ShareLinkTask Class" target="_blank">ShareLinkTask</a>, <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.sharemediatask" title="ShareMediaTask Class" target="_blank">ShareMediaTask</a> sınıflarından yeni bir örnek oluşturulup, <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.sharetaskbase.show" title="ShareTaskBase Class Show Method" target="_blank">Show()</a> method'u çağırıldığı zaman, telefonuna bağlı hesaplardan oluşan *bir liste* ekrana gelir ve *seçilen hesap* üzerinden *paylaşım gerçekleştirilir*.

Uygulamayı çalıştırdığımızda ve Paylaş butonlarından birine bastığınızda aşağıdaki aşağıdaki ekran görüntülerini görüyor olmamız lazım;

![Share Tasks Windows Phone 8 Application](/assets/uploads/2012/12/ShareTasks3.png) ![Share Tasks Windows Phone 8 Application](/assets/uploads/2012/12/ShareTasks4.png)

Projenin kodlarını <a href="/assets/uploads/2012/12/ShareTasks.rar" title="Share Status Windows Phone 8 Application Source Code" target="_blank">buradan</a> indirebilirsiniz.

