---
layout: post
title: "Windows Phone 8 SaveRingtoneTask ile melodi kaydetme"
date: 2013-08-19 11:00
author: engin.polat
comments: true
category: [Programlama]
tags: [completed, displayname, saveringtonetask, sdk, sharelinktask, sharemediatask, sharestatustask, windows phone, windowsphone, wp8]
---
**Windows Phone 8** için geliştirdiğiniz uygulamada, kullanıcıya telefonun *çalma melodisi* kaydetme özelliği vermek istiyorsunuz. Örneğin bir bankaya ait olacak uygulama geliştiriyorsunuz ve uygulamanın kullanıcısının telefonun çalma melodisi olarak bankanın reklam *jingle*'ını seçebilmesini istiyorsunuz.

**Windows Phone SDK** ile gelen <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.tasks.saveringtonetask" title="SaveRingtoneTask Class" target="_blank" rel="noopener">SaveRingtoneTask</a> sınıfı sayesinde bunu başarabilirsiniz. **SaveRingtoneTask** sınıfının kullanımı oldukça basit, <a href="http://www.enginpolat.com/windows-phone-8-icin-share-task-larinin-kullanimi/" title="Windows Phone 8 için Share Task'larının kullanımı" target="_blank" rel="noopener">Windows Phone 8 için Share Task'larının kullanımı</a> makalesinde bahsettiğim *share task*'ların kullanımına çok benziyor;



var task = new SaveRingtoneTask();
task.Completed += delegate(object _sender, TaskEventArgs _e)
{
    if(_e.TaskResult == TaskResult.OK)
    {
        MessageBox.Show("Ringtone kaydedildi!..");
    }
};
task.Source = new Uri("appdata:/cemilusta.wma");
task.DisplayName = "cemil usta akçaabat köftesi :)";
task.Show();


![](/assets/uploads/2013/08/saveringtonetask.png)

*cemil usta akçaabat köftesi reklam jingle* <a href="/assets/uploads/2013/08/cemilusta.wma" title="cemil usta akçaabat köftesi reklam jingle" target="_blank" rel="noopener">indir</a>

<audio controls><source src="/assets/uploads/2013/08/cemilusta.mp3" type="audio/mpeg"/></audio>

