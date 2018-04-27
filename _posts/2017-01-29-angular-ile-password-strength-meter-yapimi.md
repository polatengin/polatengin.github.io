---
layout: post
title: "Angular ile Password Strength Meter yapımı"
date: 2017-01-29 15:00
author: engin.polat
comments: true
category: [Web]
tags: [angular, attribute, bootstrap, button, cli, command prompt, css, dependencies, framework, head, html, keyup, ngmodel, npm, terminal, typescript]
---
<div class="alert alert-success" role="alert" style="margin: 10px 0px; display: block;">
Bu makalenin kodlarına <strong>Github</strong> üzerinde <a href="https://github.com/polatengin" class="alert-link" target="_blank" rel="noopener">polatengin</a> hesabımda yer alan <a href="https://github.com/polatengin/blog-codes/tree/master/password-strength-meter" class="alert-link" target="_blank" rel="noopener">Password Strength Meter</a> aracılığıyla erişebilirsiniz.
</div>

Bu makalede '<em>Bir Angular projesinin üyelik formunda şifrenin yeteri kadar güçlü girildiğinden nasıl emin olabilirim?</em>' sorusunu cevaplayacağız.

Önce bir <strong>Angular</strong> projesi oluşturacağız, <strong>Bootstrap 4</strong> ile stillendireceğimiz üyelik formu yapacağız ve şifre giriş alanının altına, girilen şifrenin <em>güçlülük</em> derecesine göre kırmızıdan-yeşile doğru hareket eden bir bar ekleyeceğiz.

Hemen projeyi oluşturmak istediğimiz dizine <strong>Command Prompt</strong> (<em>Windows</em>) veya <strong>Terminal</strong> (<em>MacOS</em>, <em>Linux</em>) içerisinden gidelim ve aşağıdaki komutu çalıştıralım;

<script src="https://gist.github.com/polatengin/8ad151c2f36a1660380cb3c77fdf314a.js?file=ng-new.cmd"></script>

<img class="lazy img-responsive" data-src="/assets/uploads/2017/01/psm0.png" width="600" height="300" />

<a href="https://cli.angular.io/" target="_blank" rel="noopener">Angular CLI</a>, projeyi oluşturduktan sonra <a href="http://npmjs.org" target="_blank" rel="noopener">npm</a> aracılığıya gerekli tüm <strong>dependency</strong>'leri <em>download</em> edecek.

<img class="lazy img-responsive" data-src="/assets/uploads/2017/01/psm1.png" width="600" height="300" />

Projeyi oluşturduğumuz dizinde aşağıdaki komutu çalıştıralım, böylece <strong>Angular CLI</strong> projeyi <em>http://localhost:4200</em> adresi üzerinden yayınlamaya başlayacak;

<script src="https://gist.github.com/polatengin/8ad151c2f36a1660380cb3c77fdf314a.js?file=ng-serve.cmd"></script>

<img class="lazy img-responsive" data-src="/assets/uploads/2017/01/psm2.png" width="600" height="300" />

Projenin <em>src</em> dizininde yer alan <em>index.html</em> dosyasının <strong>head</strong> taglarının arasına aşağıdaki satırı ekleyelim ve projede <a href="http://getbootstrap.com/" target="_blank" rel="noopener">Bootstrap 4</a> <strong>css framework</strong>'ünü kullanmaya başlayalım;

<script src="https://gist.github.com/polatengin/8ad151c2f36a1660380cb3c77fdf314a.js?file=index-bootstrap.html"></script>

Projenin <em>src/app/app.component.html</em> dosyasını açalım ve aşağıdaki kodlar ile değiştirelim;

<script src="https://gist.github.com/polatengin/8ad151c2f36a1660380cb3c77fdf314a.js?file=app-component.html"></script>

Yukarıdaki kodlarda <strong>bootstrap</strong>'in stillerini kullanarak bir <strong>üyelik formu</strong> oluşturduk. Şifre giriş alanının altında <em>.strength-meter</em> <strong>css class</strong>'ına sahip olan <em>div</em>, şifrenin ne kadar güçlü olduğunu göstereceğimiz alan olacak.

<blockquote>Formun <em>input</em> elementlerine yazdığımız <strong>[(ngModel)]</strong> <em>attribute</em>'lerine dikkat! Bu attribute'lerin değeri, sayfanın <strong>Typescript</strong> kodlarında oluşturacağımız değişkenlerin isimleri ile aynı olmalı.

Son olarak, <em>button</em> elementine yazdığımız <strong>(click)</strong> <em>attribute</em>'ü, <strong>button</strong>'a tıklandığında çalıştırılacak <strong>Typescript</strong> <em>method</em>'unun ismini içermeli!</blockquote>

Projenin <em>src/app/app.component.css</em> dosyasını açalım ve aşağıdaki kodlar ile değiştirelim;

<script src="https://gist.github.com/polatengin/8ad151c2f36a1660380cb3c77fdf314a.js?file=app-component.css"></script>

Böylece ekranda ihtiyaç duyduğumuz tüm <strong>css</strong>'leri de yazmış olduk.

Eğer sayfaya bu haline bakacak olursak, aşağıdaki gibi bir sonuç görmemiz lazım;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/01/psm3.png" width="600" height="700" />

Şimdi gelelim <em>src/app/app.component.ts</em> dosyasına ve aşağıdaki kodları yazalım;

<script src="https://gist.github.com/polatengin/8ad151c2f36a1660380cb3c77fdf314a.js?file=app-component.ts"></script>

Öncelikle form elemanlarının değerlerini alabilmek için <em>fullName</em>, <em>email</em> ve <em>password</em> değişkenlerini <strong>string</strong> olarak tanımlıyoruz.

Ayrıca <strong>Kaydol</strong> butonuna tıklandığında yapılacak işleri yazacağımız <em>signup()</em> methodunu da tanımlıyoruz.

<em>Şifre</em> alanında <strong>keyup</strong> <em>event</em>'i tetiklendikçe (<em>yani şifre belirlenirken</em>) çağırılan <em>updateMeter()</em> methodunda şifrenin karmaşıklık seviyesini hesaplayacağımız kodları yazıyoruz.

<blockquote>Şifrenin karmaşıklık seviyesini belirlemek için internetten yardım aldım, <a href="http://stackoverflow.com/" target="_blank" rel="noopener">stackoverflow</a>'daki çeşitli örnek kodları inceledim ve birkaç tanesini birleştirerek bu makaledeki kodu yazdım. Sizler kendiniz de bir kod geliştirebilir veya benim yaptığım gibi <em>hazır yazılmışlardan</em> faydalanabilirsiniz ;)</blockquote>

Eğer sayfayı yenileyecek ve sonuca bakacak olursak, aşağıdaki ekranı görmemiz lazım;

<img class="lazy img-responsive" data-src="/assets/uploads/2017/01/psm4.gif" width="600" height="700" />

Bu makalenin kodlarına <strong>Github</strong> üzerinde <a href="https://github.com/polatengin" target="_blank" rel="noopener">polatengin</a> hesabımda yer alan <a href="https://github.com/polatengin/blog-codes/tree/master/password-strength-meter" target="_blank" rel="noopener">Password-Strength-Meter</a> aracılığıyla erişebilirsiniz.