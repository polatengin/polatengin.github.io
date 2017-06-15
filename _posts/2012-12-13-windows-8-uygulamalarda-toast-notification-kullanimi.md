---
layout: post
title: "Windows 8 Uygulamalarda Toast Notification Kullanımı"
date: 2012-12-13 17:08
author: engin.polat
comments: true
category: [C#]
tags: [appendchild, appxmanifest, audio, capable, createtextnode, createtoastnotifier, enum, getelementbytagname, messagedialog, notification, package, public, static, string, toast, toastnotificationmanager, toasttemplatetype, windows8, winsoundevent]
---
**Windows 8** uygulaması geliştirirken kullanıcıyı bilgilendirmek isteyebiliriz. Kullanıcıya sadece bilgi vermek için <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.popups.messagedialog" title="MessageDialog Class" target="_blank">MessageDialog</a> kullanmak doğru olmayacaktır, kullanıcı bir süre sonra rahatsızlık duymaya başlayacak ve belkide uygulamayı kullanmaktan *vazgeçecektir*.

Kullanıcıyı bilgilendirmenin daha doğru yolu **Toast Notification** sistemini kullanmaktır.

**Toast Notification** sistemini kullanırken dikkat etmemiz gereken **ToastTemplateType** *enum* yapısıdır.

**MSDN**'de yer alan <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.notifications.toasttemplatetype" title="ToastTemplateType Enum" target="_blank">ToastTemplateType enumeration</a> sayfasından hangi tiplerde **toast notification** gösterebileceğinizi öğrenebilirsiniz.

*using* kısmına



Windows.UI.Notifications</pre>

eklemeliyiz. Örnek kullanım;

<pre class="brush:csharp">public static void ShowNotification(string Title, string Message)
{
    const ToastTemplateType template = ToastTemplateType.ToastText02;
    var toastXml = ToastNotificationManager.GetTemplateContent(template);

    var toastText = toastXml.GetElementsByTagName("text");
    toastText[0].AppendChild(toastXml.CreateTextNode(Title));
    toastText[1].AppendChild(toastXml.CreateTextNode(Message));

    var toast = new ToastNotification(toastXml);

    var toastNotifier = ToastNotificationManager.CreateToastNotifier();
    toastNotifier.Show(toast);
}

public static void ShowNotification(string Title, string Message, string ImageFileName)
{
    const ToastTemplateType template = ToastTemplateType.ToastImageAndText01;
    var toastXml = ToastNotificationManager.GetTemplateContent(template);

    var toastText = toastXml.GetElementsByTagName("text");
    toastText[0].AppendChild(toastXml.CreateTextNode(Title));
    toastText[1].AppendChild(toastXml.CreateTextNode(Message));

    var toastImage = toastXml.GetElementsByTagName("image");
    toastImage.SetAttribute("src", ImageFileName);

    var toast = new ToastNotification(toastXml);

    var toastNotifier = ToastNotificationManager.CreateToastNotifier();
    toastNotifier.Show(toast);
}</pre>

Hatta **Toast Notification** gösterimi esnasında **uyarı sesi** bile çaldırabiliriz. Bunu yapmak için <a href="http://msdn.microsoft.com/en-us/library/windows/apps/br230842.aspx" title="Toast Template Audio Element" target="_blank">audio</a> elementini kullanacağız. Sistemde kayıtlı uyarı sesleri;



*   ms-winsoundevent:Notification.Default
*   ms-winsoundevent:Notification.IM
*   ms-winsoundevent:Notification.Mail
*   ms-winsoundevent:Notification.Reminder
*   ms-winsoundevent:Notification.SMS
*   ms-winsoundevent:Notification.Looping.Alarm
*   ms-winsoundevent:Notification.Looping.Alarm2
*   ms-winsoundevent:Notification.Looping.Call
*   ms-winsoundevent:Notification.Looping.Call2

Örnek kullanım;

<pre class="brush:csharp">public static void ShowNotification(string Title, string Message, string ImageFileName, string SoundName)
{
    const ToastTemplateType template = ToastTemplateType.ToastImageAndText01;
    var toastXml = ToastNotificationManager.GetTemplateContent(template);

    var toastText = toastXml.GetElementsByTagName("text");
    toastText[0].AppendChild(toastXml.CreateTextNode(Title));
    toastText[1].AppendChild(toastXml.CreateTextNode(Message));

    var toastImage = toastXml.GetElementsByTagName("image");
    toastImage.SetAttribute("src", ImageFileName);

    var toastAudio = toastXml.GetElementsByTagName("audio");
    toastAudio.SetAttribute("src", SoundName);

    var toast = new ToastNotification(toastXml);

    var toastNotifier = ToastNotificationManager.CreateToastNotifier();
    toastNotifier.Show(toast);
}


Son olarak, yukarıdaki kodların çalışması için uygulamanın *Package.appxmanifest* dosyasında **Toast Capable** seçeneğine **Yes** değerini vermeyi *unutmamalıyız*

