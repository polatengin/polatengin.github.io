---
layout: post
title: "Angular uygulamasında RxJs ve Observables ile Global Messaging servisi yazalım"
date: 2017-05-25 16:00
author: engin.polat
comments: true
category: [Web]
tags: [angular, typescript, rxjs, observable, class, injectable, global, event, service, instance, constructor, static, component, implements, pipe, pipetransform, json, subscribe]
---
<div class="alert alert-success" role="alert" style="margin: 10px 0px; display: block;"> Bu makalenin kodlarına <strong>Github</strong> üzerinde <a href="https://github.com/polatengin" class="alert-link" target="_blank" rel="noopener">polatengin</a> hesabımda yer alan <a href="https://github.com/polatengin/blog-codes/tree/master/angular-global-messaging-sample" class="alert-link" target="_blank" rel="noopener">Global Messaging Sample</a> aracılığıyla erişebilirsiniz.</div>

<mark><em>Bu makaleyi okumadan önce <a href="/etiketler/#angular-ref" target="_blank" rel="noopener">Angular</a> etiketindeki diğer makalelerimi okumanızı tavsiye ederim.</em></mark>

Geçtiğimiz hafta *Yazılım Mimarı* olarak, çeşitli projelerine yardımcı olduğum bir müşteride yeni başladığımız **Angular** projesinde *global* bir *event* mekanizması kurgulamamız gerekti.

Bu yapacağımız *event* mekanizması sayesinde, uygulamanın herhangi bir nesnesinden fırlatacağımız bir bilgiyi, tamamen başka bir nesne (*hatta nesneler*) alıp, kendi istediği gibi işleyebilecek.

Örneğin, ürünler dizisi içerisinde bir üründe yeralan *Sepete Ekle* butonuna basıldığında, eğer ekranda sepetin tamamı gözüküyorsa yeni bir satır oluşsun, sepetin tamamı gözükmüyorsa oluşmasın, login olduysak ödeme sayfasına gidelim, olmadıysak *Giriş Yap* uyarısı çıksın, gibi..

Hemen yeni bir **Angular** projesi oluşturalım;

<script src="https://gist.github.com/polatengin/b9d1a51a15989359e2db0297424fffaa.js?file=ng-new-project.cmd"></script>

Projeye yeni bir **Service** eklemek için aşağıdaki komutu çalıştıralım;

<script src="https://gist.github.com/polatengin/b9d1a51a15989359e2db0297424fffaa.js?file=ng-generate-service.cmd"></script>

Bu sayede, projenin çeşitli dosyalarında kullanabileceğimiz, <code>Injectable()</code> bir servisimiz oluştu.

Yeni oluşturduğumuz servisi açalım ve aşağıdaki kodları içerecek şekilde güncelleyelim;

<script src="https://gist.github.com/polatengin/b9d1a51a15989359e2db0297424fffaa.js?file=global-messaging.service.ts"></script>

Bu servisin <code>Injectable()</code> olmasını sağladık, fakat hala <code>instance</code>'i alınıp kullanılabilir. <code>constructor()</code> method içerisinde kurguladığımız mantık sayesinde bu servisin yeni <code>instance</code>'inin alınmasının önüne geçmiş olduk.

<code>GetInstance()</code> methodu ile de, bir çeşit **Singleton Pattern** implemente etmiş olduk.

<code>broadcast()</code> methodu, parametre ile aldığı bilgiyi, *Global Messaging* servisine kendini bağlamış (*attached*) olan her nesneye iletir.

<code>messaging$</code> değişkenini ise, başka nesnelerin *Global Messaging* servisine kendilerini bağlayabilmeleri için ekledik.

Örnek kullanımı, *app.component.html* dosyasını açalım ve aşağıdaki 2 satırı ekleyelim;

<script src="https://gist.github.com/polatengin/b9d1a51a15989359e2db0297424fffaa.js?file=app.component.html"></script>

Özellikle ikinci satırdaki kullanıma dikkat edelim. <code>message</code> değişkeni olduğu hali ile değil, <code>json</code> karşılığı ile ekrana gelecek. Bir değişkeni olduğu hali ile değil, bir takım değişikliklerin uygulandığı hali ile kullanmak için <a href="https://angular.io/api/core/PipeTransform" target="_blank" rel="noopener">Angular PipeTransform</a> sınıfını kullanıyoruz.

Son olarak, *app.component.ts* dosyasını açalım ve aşağıdaki şekilde güncelleyelim;

<script src="https://gist.github.com/polatengin/b9d1a51a15989359e2db0297424fffaa.js?file=app.component.ts"></script>

<code>AppComponent</code> *class*'ı <a href="https://angular.io/api/core/OnInit" target="_blank" rel="noopener">OnInit</a> *interface*'ini *implemente* ediyor ve <code>ngOnInit()</code> methodu içerisinde <code>GlobalMessagingService</code> *class*'ının <code>GetInstance()</code> methodu aracılığı ile *instance*'ına ulaşıyor ve <code>messaging$</code> değişkeni aracılığı ile *global event*'e **subscribe** oluyor. Tek yaptığımız ise, *event* aracılığı ile gelen değeri <code>message</code> değişkenine atamak.

<code>sendMessage()</code> methodunda ise <code>GlobalMessagingService</code> *class*'ının <code>GetInstance()</code> methodu aracılığı ile *instance*'ına ulaşıyor ve <code>broadcast()</code> methodunu istediğimiz bir parametre ile çağırıyoruz.

Yukarıdaki örnekte <code>{ title: 'Laptop', price: 1200, command: 'SepeteEkle', date: new Date() }</code> parametresi ile çağırdığımız için ekrandaki butona her bastığımızda <code>messaging$</code> değişkeni üzerinden kendini bağlamış her nesne, sepete *1200* değerinde bir *Laptop* eklendiğini öğrenecek.

<img class="lazy img-responsive" data-src="/assets/uploads/2017/05/angular-global-messaging.gif" width="658" height="492" />