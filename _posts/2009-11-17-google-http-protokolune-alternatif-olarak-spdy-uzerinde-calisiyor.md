---
layout: post
title: "Google, HTTP protokolüne alternatif olarak SPDY üzerinde çalışıyor"
date: 2009-11-17 13:30
author: engin.polat
comments: true
category: [Genel]
tags: [google, http, İnternet, spdy, web]
---
Google, "<a title="Google: Let's make the web faster" href="http://code.google.com/speed/" target="_blank" rel="noopener">Let's make the web faster</a>" vizyonu çerçevesinde pazara sürekli yeni ürünler/teknolojiler çıkartmaya devam ediyor.

<a title="Google: SPDY Whitepaper" href="http://dev.chromium.org/spdy/spdy-whitepaper" target="_blank" rel="noopener">Şuradan</a> tamamını okuyabileceğiniz döküman ile HTTP protokolüne alternatif geliştirdiğini de öğrenmiş olduk.

Yeni protokole SPDY (SPeeDY şeklinde telaffuz ediliyor) ismini vermişler ve SSL üstünde çalışmasını sağlamışlar.

SPDY protokolünün tanımını yaptıkları dokümanda, HTTP'nin şu limitlerinden bahsediyorlar;

**Bağlantı başına tek istek** : HTTP, aynı anda tek kaynak talep edebilir, getirebilir. HTTP protokolü aynı anda tek istekte bulunabiliyor ve bu istekleri FIFO (First In, First Out) mantığı ile kuyruğa alıp işliyor.

Browser'lar bu problemi çözebilmek için, aynı anda 2 bağlantı açıyorlardı, 2008 yılından beri hemen hemen tüm browserlar, aynı anda bağlantı sayısını 6'ya çıkarttılar.

**Sadece istemci istekte bulunabilir** : HTTP protokolünde, sunucudan isteği sadece istemci yapabilir. Hatta sunucu, istemci'nin bir kaynağa ihtiyacı olduğunu bilse bile, istemci adına bu kaynağa erişip, sonucu istemciye döndüremez.

**Request ve Response Header'larının sıkıştırılamaması** : Günümüzde request header'larının boyutu, 200 bayt ile 2 kilobayt arasında değişiyor. Uygulamanızda cookie vs. kullanıyorsanız, boyut ortalama 700-800 bayt oluyor. Her isteğin (request) ve cevabın (response) headerında yer alan bilginin sıkıştırılmadan taşınması, önemli gecikmelere yol açmaktadır.

**Gereksiz header bilgileri** : Header'da hiç değişmeyecek bilgilerin (User-Agent, Host, Accept, ... gibi) tekrar tekrar gönderilmesi gereksizdir. HTTP protokolü, bu bilgileri her isteğin ve cevabın headerına ekliyor.

**Veri sıkıştırmasının varsayılan olmaması** : HTTP protokolünde veri, varsayılan olarak sıkıştırılmamış formattadır. SPDY protokolünde Google, varsayılan olarak verinin tamamının sıkıştırılmış formatta olmasını sağlıyor.<!--more-->

Yapılan ölçümlemeye göre, sunucundan yapılan yükleme işlemlerinin %50 azalması iki kat hızlı sörf deneyimi sunacaktır. Birkaç yüz milisaniye, tek bir kullanıcı için çok önemli olmasa da, aynı anda yüzlerce, binlerce, hatta milyonlarca kullanıcıya hizmet veren web sunucular için çok önemlidir.

Google, SPDY protokolü ile tam olarak neyi hedefliyor?


*   Tek TCP bağlantısında birden fazla HTTP (SPDY) isteği gerçekleştirebilmeyi
*   Header'ın gereksiz kısımlarını silerek, kalan kısımlarını da sıkıştırarak, bandwith kullanımını azaltmayı
*   Web sunucular açısından, HTTP protokolünden daha kolay uygulanabilir, işlenebilir olmasını
*   Sunucunun, hazır olduğu zaman, istemciye veri gönderebilmesini.
Ayrıca Google, web'in geleceğinde SSL'in anahtar rolü olduğuna inandığı için, SPDY protokolünü SSL üzerine kurmuş durumda.

HTTP GET ve HTTP POST komutlarının değişmeden kalması öngörülüyor, fakat SPDY ile yeni komutların da geleceği haber veriliyor.

Şu ana kadar Google, hafızada çalışan bir web sunucusu hazırlamış durumda, üstelik yakında açık kaynak olarak halka açmayı da planlıyor.

Chrome browser'ının da hem HTTP, hem de SPDY protokollerini destekleyen bir sürümünü (kod adı "flip") çıkartmışlar, <a title="Google Chrome: Flip Kaynak kodu" href="http://src.chromium.org/viewvc/chrome/trunk/src/net/flip/" target="_blank" rel="noopener">şuradan</a> kaynak kodlarını indirebilirsiniz.

Bu prototipleri kullanarak yapılan testlerde ortaya çıkan sonuç;

"Top 100" listesinde yer alan 25 site, ev kullanıcısı bağlantı kapasitesini simule ederek, %1 paket kaybı ile 10'ar defa download edildi ve ortalamalar alındı.

**SSL olmayan sitelerde hız artışı** : *%27 - %60* arasında,

**SSL olan sitelerde hız artışı** : *%39 - %55* arasında.

Bu sonuçlara rağmen, Google'ın tek başına başarıyı yakalaması çok zor. Mutlaka sektör'deki diğer büyük firmalar'ın SPDY protokolünü desteklemesi lazım.

