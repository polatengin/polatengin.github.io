---
layout: post
title: "C# Bir Windows Service'in Durumunu Belirlemek"
date: 2010-09-02 16:07
author: engin.polat
comments: true
category: [C#]
tags: [constructor, continuepending, displayname, machinename, paused, pausepending, running, service, servicecontroller, servicecontrollerstatus, servicename, serviceprocess, startpending, status, stopped, stoppending, windows service]
---
Bir **Windows Service**'ine bağımlı uygulama geliştirdiğiniz zaman, ilgili **Windows Service**'in *durumunu belirlemek* kritik öneme sahip oluyor. **Service**, uygulamamızı destekleyen, kendi geliştirdiğimiz bir service olabileceği gibi, Windows ile birlikte gelen service'lerden biri de olabilir.

**ServiceController Sınıfı**

<a href="http://msdn.microsoft.com/library/system.serviceprocess.servicecontroller" target="_blank" rel="noopener">ServiceController</a> sınıfı, <a href="http://msdn.microsoft.com/library/system.serviceprocess" target="_blank" rel="noopener">System.ServiceProcess</a> namespace'inde yer alır. *Lokal makinadaki* veya *Uzak makinadaki* bir **windows service**'ini temsil eder, ilgili service'in **sorgulanmasına** ve çeşitli özelliklerinin **değiştirilmesine** izin verir.

**ServiceController Sınıfının Kullanımı**

*ServiceController* sınıfını projelerimizde kullanabilmek için, projemize *System.ServiceProcess.dll* dosyasını referans olarak eklemeliyiz.

Daha sonra, kodumuzun using kısmına **System.ServiceProcess** eklemeliyiz;



using System.ServiceProcess;</pre>

**Lokal makinadaki bir service'in durumunu belirleme**
Lokal makinadaki bir service'in durumunu belirlemek için, öncelikle *ServiceController* sınıfından yeni bir örnek oluşturmamız lazım.

Sordulamak istediğimiz windows servis'i ile değişkenimizi ilişkilendirmek için kullanabileceğimiz üç yöntem var.



*   **ServiceName** özelliği
*   **DisplayName** özelliği
*   ServiceController **constructor**'ı

Örnek olarak *Print Spooler* servisini sorgulamak için;

<pre class="brush:csharp">ServiceController ServiceByServiceName = new ServiceController();
ServiceByServiceName.ServiceName = "Spooler";

ServiceController ServiceByDisplayName = new ServiceController();
ServiceByDisplayName.DisplayName = "Print Spooler";

ServiceController ServiceByConstructor = new ServiceController("Spooler");</pre>

Yukarıdaki kodda görebileceğiniz gibi **ServiceController** sınıfımızı tanımladıktan sonra, <a href="http://msdn.microsoft.com/library/system.serviceprocess.servicecontroller.status" target="_blank" rel="noopener">Status</a> özelliğini kullanarak, servis'in durum bilgisini sorgulayabiliriz.

**Status** özelliği <a href="http://msdn.microsoft.com/library/system.serviceprocess.servicecontrollerstatus" target="_blank" rel="noopener">ServiceControllerStatus</a> enum tipinde değer döndürür;



*   **ContinuePending: **Servis durdurulmuş ve başlatılıyor
*   **Paused: **Servis durdurulmuş
*   **PausePending: **Servis durduruluyor
*   **Running: **Servis çalışıyor
*   **StartPending: **Servis başlatılıyor
*   **Stopped: **Servis çalışmıyor
*   **StopPending: **Servis durduruluyor

Servis'in çalıştığı durumu kontrol etmek için kodumuzu aşağıdaki gibi yazabiliriz;

<pre class="brush:csharp">ServiceController sc = new ServiceController("Spooler");

if (sc.Status == ServiceControllerStatus.Running)
{
    MessageBox.Show("Servis çalışıyor");
}</pre>

*Not: Servis durumunu sorgulayan uygulamayı çalıştıran kullanıcının yeterli yetkisi bulunmalıdır. Aksi taktirde bir hata fırlatılacaktır.*

**Uzak makinadaki bir service'in durumunu belirleme**

*Uzak makinadaki* bir service'in durumunu belirleme, *lokal makinadaki* service'in durumunu belirlemek kadar kolaydır. Tek yapmamız gereken <a href="http://msdn.microsoft.com/library/system.serviceprocess.servicecontroller.machinename" target="_blank" rel="noopener">MachineName</a> özelliğine uzak makinanın adresini girmek.

Uzak makinadaki *Print Spooler* servisini sorgulamak istediğimizde;

<pre class="brush:csharp">ServiceController sc = new ServiceController("Spooler", "UzakSunucu");

if (sc.Status == ServiceControllerStatus.Running)
{
    MessageBox.Show("Servis çalışıyor");
}


