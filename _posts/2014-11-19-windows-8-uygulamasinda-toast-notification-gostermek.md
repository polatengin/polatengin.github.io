---
layout: post
title: "Windows 8 uygulamasında Toast Notification göstermek"
date: 2014-11-19 09:00
author: engin.polat
comments: true
category: [Programlama]
tags: [appendchild, binding, createtextnode, createtoastnotifier, getelementsbytagname, gettemplatecontent, notification, show, static, template, toast, toastnotification, toastnotificationmanager, toasttemplatetype, xmldocument]
---
*Windows 8* için geliştirdiğiniz uygulamada kolayca **toast notification** gösterebilmek için yapmanız gerekenler aslında çok basit.

Öncelikle <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.notifications" target="_blank">Windows.UI.Notifications</a> *namespace*'inde yer alan <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.notifications.toastnotificationmanager" target="_blank">ToastNotificationManager</a> sınıfının *static* olan <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.notifications.toastnotificationmanager.gettemplatecontent" target="_blank">GetTemplateContent()</a> method'unu <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.notifications.toasttemplatetype" target="_blank">ToastTemplateType</a> *enum*'ından bir değer ile çağırıyoruz ve geri dönen <a href="https://msdn.microsoft.com/library/system.xml.xmldocument" target="_blank">XmlDocument</a> tipindeki cevabı bir değişkende saklıyoruz;



var template = ToastNotificationManager.GetTemplateContent(ToastTemplateType.ToastText01);</pre>

*GetTemplateContent()* methodunu *ToastTemplateType.ToastText01* parametresi ile çağırdığımızda aşağıdaki cevabı alıyoruz;

<pre class="brush:xml">&lt;toast&gt;
    &lt;visual&gt;
        &lt;binding template="ToastText01"&gt;
            &lt;text id="1"&gt;&lt;/text&gt;
        &lt;/binding&gt;  
    &lt;/visual&gt;
&lt;/toast&gt;</pre>

*text* isimli element'i bulup, içine *toast notification*'da göstermek istediğimiz metni yazıyoruz;

<pre class="brush:csharp">var elements = template.GetElementsByTagName("text");
elements[0].AppendChild(template.CreateTextNode("çok önemli mesaj!"));</pre>

Artık yapmamız gereken elimizdeki *template* değişkenini kullanarak yeni bir <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.notifications.toastnotification" target="_blank">ToastNotification</a> nesnesi oluşturmak;

<pre class="brush:csharp">var toast = new ToastNotification(template);</pre>

Son olarak <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.notifications.toastnotificationmanager" target="_blank">ToastNotificationManager</a> sınıfının *static* <a href="https://msdn.microsoft.com/library/windows/apps/windows.ui.notifications.toastnotificationmanager.createtoastnotifier" target="_blank">CreateToastNotifier()</a> methodunu ve gene *static* olan <a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.notifications.toastnotifier.show" target="_blank">Show()</a> methodunu çağırmamız yeterli;

<pre class="brush:csharp">ToastNotificationManager.CreateToastNotifier().Show(toast);


<a href="http://msdn.microsoft.com/library/windows/apps/windows.ui.notifications.toasttemplatetype" target="_blank">ToastTemplateType</a> *enum*'ının diğer değerleri ve metin dışında resim de içerebilen template'lerinin listesi için *MSDN*'deki <a href="https://msdn.microsoft.com/library/windows/apps/hh761494" target="_blank">The toast template catalog</a> sayfasına bakabilirsiniz.

