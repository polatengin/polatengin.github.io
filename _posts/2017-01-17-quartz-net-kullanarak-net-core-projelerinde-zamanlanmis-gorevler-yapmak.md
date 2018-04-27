---
layout: post
title: "Quartz.Net kullanarak .Net Core projelerinde zamanlanmış görevler yapmak"
date: 2017-01-17 15:00
author: engin.polat
comments: true
category: [C#]
tags: [quartz, zamanlanmis, scheduled, task, net-core]
---
Eğer geliştirdiğiniz **.Net Core** projelerinde zamanlanmış görevler çalıştırmaya ihtiyaç duyarsanız, <a href="https://www.quartz-scheduler.net/" target="_blank" rel="noopener">Quartz.Net</a> kütüphanesinden faydalanabilirsiniz.

Bu makalede *Quartz.Net* kütüphanesini **.Net Core** ile geliştireceğimiz bir *Console* uygulamasında kullanacağız.

Hemen *Visual Studio 2017* açalım ve yeni bir **Console App (.Net Core)** projesi oluşturalım;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/01/quartz-0.png" />

Şimdi projenin *Dependencies* kısmına sağ tuşla tıklayıp **Manage Nuget Packages...** menüsünü seçelim, açılan pencerede <a href="https://www.nuget.org/packages/Quartz/" target="_blank" rel="noopener">Quartz</a> paketini aratalım ve projeye ekleyelim. (Ben bu yazıyı yazarken <a href="https://www.quartz-scheduler.net/2016/08/16/quartznet-3.0-alpha1-released.html" target="_blank" rel="noopener">v3.0.0-alpha2</a> *.Net Core* destekliyordu)

**Program.cs** dosyasını açalım ve **Main()** methodu içerisini aşağıdaki gibi değiştirelim;

<script src="https://gist.github.com/polatengin/6b38fddf08216e4223d6cea870290cee.js?file=Program-Main.cs"></script>

**InitializeJob()** methodu içerisinde öncelikle <a href="http://quartznet.sourceforge.net/apidoc/1.0/html/html/6f7e6890-0d6c-f05c-9659-3310944fa549.htm" target="_blank" rel="noopener">StdSchedulerFactory</a> sınıfından yeni bir *instance* çıkartıp, <a href="http://quartznet.sourceforge.net/apidoc/1.0/html/html/4a77afe3-a630-7c6d-eede-937d70a5d260.htm" target="_blank" rel="noopener">GetScheduler()</a> methodunu çağırıyor, <a href="http://quartznet.sourceforge.net/apidoc/1.0/html/html/edbcd9ad-0bf8-2b0e-52c9-e8a62ac4f610.htm" target="_blank" rel="noopener">IScheduler</a> *interface*'inde yeralan <a href="http://quartznet.sourceforge.net/apidoc/1.0/html/html/a2ae75d5-0677-dffe-85e0-83bfcffb9fa3.htm" target="_blank" rel="noopener">Start()</a> methodu ile başlatıyoruz.

<a href="http://quartznet.sourceforge.net/apidoc/2.0/html/html/fe74a1d5-33ad-9978-36a1-f030b8474d88.htm" target="_blank" rel="noopener">JobBuilder</a> sınıfının önce <a href="http://quartznet.sourceforge.net/apidoc/2.0/html/html/31e90849-355d-2b33-5776-3cd01522243e.htm" target="_blank" rel="noopener">Create()</a> methodunu, sonra <a href="http://quartznet.sourceforge.net/apidoc/2.0/html/html/162734e9-52d6-b6b7-b39a-d2134f5f264f.htm" target="_blank" rel="noopener">Build()</a> methodunu çağırıyoruz.

<a href="http://quartznet.sourceforge.net/apidoc/2.0/html/html/199cc54a-30af-2168-5f4f-ded0e09f7b4c.htm" target="_blank" rel="noopener">TriggerBuilder</a> sınıfının da önce <a href="http://quartznet.sourceforge.net/apidoc/2.0/html/html/895d3fd2-5eba-1859-2a18-7183ec784a79.htm" target="_blank" rel="noopener">Create()</a> methodunu, sonra <a href="http://quartznet.sourceforge.net/apidoc/2.0/html/html/4f48c60b-6b9b-e90f-82b6-2ab501cc2d59.htm" target="_blank" rel="noopener">StartNow()</a> methodunu çağırarak hemen çalıştırmaya başlayacağımızı, <a href="http://quartznet.sourceforge.net/apidoc/2.0/html/html/805f5358-ffd2-63d7-360b-9e67ba6ed6f6.htm" target="_blank" rel="noopener">WithCronSchedule()</a> mthodunu çağırarak hangi periyotta çalıştırmak istediğimizi belirtiyoruz, en sonunda <a href="http://quartznet.sourceforge.net/apidoc/2.0/html/html/036f510d-1061-7096-1a4f-88b80132931e.htm" target="_blank" rel="noopener">Build()</a> methodunu çağırmayı unutmuyoruz.

**WithCronSchedule()** methoduna parametre verebileceğimiz değerler için <a href="http://www.freeformatter.com/cron-expression-generator-quartz.html" target="_blank" rel="noopener">CronExpressionGenerator</a> sayfasını kullanabiliriz.

Ben bu makalede <strong>* * * ? * *</strong> ile <em>her saniye</em> tetiklenecek bir zamanlayıcı görev tanımladım.

**IScheduler** interface'inin <a href="http://quartznet.sourceforge.net/apidoc/1.0/html/html/84be9956-052d-05d7-4366-0837fcd6d78b.htm" target="_blank" rel="noopener">ScheduleJob()</a> methodu ile **Job** ve **Trigger** aracılığı ile zamanlanmış görevi başlatıyoruz.

<script src="https://gist.github.com/polatengin/6b38fddf08216e4223d6cea870290cee.js?file=Program-InitializeJob.cs"></script>

Son olarak projeye aşağıdaki sınıfı da ekleyelim;

<script src="https://gist.github.com/polatengin/6b38fddf08216e4223d6cea870290cee.js?file=SendUserEmailsJob.cs"></script>

Uygulamayı çalıştırdığımızda aşağıdaki gibi bir çıktı almamız lazım;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/01/quartz-1.gif" />