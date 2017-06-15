---
layout: post
title: "Dosya boyutu almak için Head isteğinde bulunmak"
date: 2011-10-05 22:23
author: engin.polat
comments: true
category: [C#]
tags: [class, ContentLength, create, downloaddata, getresponse, head, header, headers, HttpResponseHeader, int, length, method, request, response, static, string, webclient, webrequest, webresponse]
---
Uygulamalarımızda internet üzerindeki bir dosyanın **boyut bilgisine** ihtiyacımız olabilir.

Yapmamız gereken; dosyaya istekte bulunup **Length** özelliğinden dosya boyutu bilgisini almak.



var DosyaKonum = "/assets/uploads/2011/07/FPSOrnek.rar";

WebClient wc = new WebClient();
var Dosya = wc.DownloadData(DosyaKonum);

int DosyaBoyut = Dosya.Length;</pre>

Bu yöntemin en önemli **dezavantajı**, dosyanın boyut bilgisini alabilmek için *dosyayı gerçekten download etmemiz gerekiyor*. Özellikle büyük boyutlu dosyalarda bu yöntem büyük problemlere yol açacaktır.

Aslında yapılan isteğin sonucunun *Başlık* (*Header*) bilgisinde **dosya boyutu** yer alıyor. Eğer *Başlık*'tan (*Header*) **boyut bilgisine** ulaşabilirsek *dosyayı download etmemize gerek kalmaz*.

<pre class="brush:csharp">var DosyaKonum = "/assets/uploads/2011/07/FPSOrnek.rar";

var Request = WebRequest.Create(DosyaKonum);

Request.Method = "HEAD";

var Response = Request.GetResponse();

var DosyaBoyut = Response.Headers[HttpResponseHeader.ContentLength];


Öncelikle <a href="http://msdn.microsoft.com/library/system.net.webrequest" title="WebRequest" target="_blank">WebRequest</a> sınıfının *static* <a href="http://msdn.microsoft.com/en-gb/library/bw00b1dc" title="WebRequest.Create" target="_blank">Create()</a> method'u sayesinde, parametresinde adresi verilmiş dosyaya bir **istek** oluşturuyoruz.

*Request* değişkeninin <a href="http://msdn.microsoft.com/library/system.net.webrequest.getresponse" title="WebRequest.GetResponse()" target="_blank">GetResponse()</a> method'undan sonuç bilgisini almadan önce <a href="http://msdn.microsoft.com/library/system.net.webrequest.method" title="WebRequest.Method" target="_blank">Method</a> özelliğine **HEAD** değerini atıyoruz.

Böylece istek sonucunda, dosyanın içeriğinin değil **sadece başlık bilgisinin** bulunmasını sağlıyoruz.

<a href="http://msdn.microsoft.com/library/system.net.httpresponseheader" title="HttpResponseHeader" target="_blank">HttpResponseHeader</a> enum'ında yeralan **ContentLength** değeri ile *Response* değişkeninin <a href="http://msdn.microsoft.com/library/system.net.webresponse.headers" title="WebResponse.Headers" target="_blank">Headers</a> özelliğinden **dosyanın boyut bilgisine** ulaşabiliyoruz.

