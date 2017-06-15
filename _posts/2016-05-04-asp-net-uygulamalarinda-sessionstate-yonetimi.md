---
layout: post
title: "Asp.Net uygulamalarında SessionState yönetimi"
date: 2016-05-04 19:30
author: engin.polat
comments: true
category: [AspNet]
tags: [aspnet, configuration, database, httpcontext, httpsessionstate, inproc, mode, property, session, sessionstate, sqlconnectionstring, sqlserver, stateconnectionstring, stateserver, system.web, timeout, veritabanı]
---
**Asp.Net** uygulamalarında kullanıcı ile ilgili sürekli erişilmesi gereken bilgileri her seferinde veritabanından sorgulamak yerine daha hızlı erişebilmek amacıyla <a href="http://msdn.microsoft.com/library/system.web.httpcontext" target="_blank">HttpContext Class</a> sınıfının içinde yeralan ve <a href="http://msdn.microsoft.com/library/system.web.sessionstate.httpsessionstate" target="_blank">HttpSessionState Class</a> tipinde olan <a href="http://msdn.microsoft.com/library/system.web.httpcontext.session" target="_blank">Session</a> property'si içerisinde tutabiliriz.

Uygulamada **Session** yapılandırmak için basitçe *web.config* dosyasına aşağıdaki elementi eklememiz yeterlidir;

<script src="https://gist.github.com/polatengin/3202a4df0106fd84c91930d58b8b09a5.js?file=web.config"></script>

**timeout** *attribute* ile kaç dakika boyunca kullanıcı işlem yapmazsa **session**'daki değişkenlerinin temizleneceğini belirliyoruz.

**mode** *attribute* ile **session** değişkenlerinin tutulacağı yeri belirliyoruz. Seçenekler;

<h4>InProc</h4>
Uygulamanın çalıştığı sunucunun RAM hafızasında. Uygulama, çalıştığı sunucunun RAM hafızasına çok hızlı erişebileceği için tek sunuculu ortamlarda genellikle bu seçenek tercih edilir.

<script src="https://gist.github.com/polatengin/3202a4df0106fd84c91930d58b8b09a5.js?file=web-inproc.config"></script>

<h4>StateServer</h4>
Uygulamanın çalıştığı sunucunun veya başka bir sunucunun RAM hafızasında. *Session* bilgileri hala RAM'de tutulduğu için hızlı erişilebilir, birden fazla sunuculu ortamlarda *session* bilgileri ortak bir yerde tutulduğu için genellikle bu seçenek tercih edilir. Örneğin, uygulamamız 2 sunucuda çalışıyorsa, kullanıcının *session* değişkenleri Sunucu1'de oluştuğunda Sunucu2 için böyle bir kullanıcı hiç varolmayacaktır. Eğer kullanıcının herhangi bir isteği Sunucu2 sunucusuna yönlenecek olursa, Sunucu2 bu isteği işleyemeyecektir. Bu sorunu çözmek için *session* bilgilerini Sunucu1 veya Sunucu2 üzerinde tutmak yerine, ortak bir *StateServer* üzerinde tutabiliriz.

<script src="https://gist.github.com/polatengin/3202a4df0106fd84c91930d58b8b09a5.js?file=web-stateserver.config"></script>

<h4>SQL Server</h4>
Tıpkı *StateServer* seçeneği gibi çalışır, farklı olarak *session* bilgileri RAM hafızada tutulmaz, *SqlServer*'da oluşturulan tablolarda tutulur. *StateServer*'a göre daha yavaştır (veritabanında sorgulama, kayıt ekleme, güncelleme adımları da araya girdiği için)

Fakat *StateServer* kapanıp açılacak olursa, RAM hafıza temizleneceği için, *session* bilgileri kaybolur, *SqlServer*'da ise, kaybolmaz.

<script src="https://gist.github.com/polatengin/3202a4df0106fd84c91930d58b8b09a5.js?file=web-sqlserver.config"></script>