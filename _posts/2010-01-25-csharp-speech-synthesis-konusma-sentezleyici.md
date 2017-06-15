---
layout: post
title: "C# Speech Synthesis - Konuşma Sentezleyici"
date: 2010-01-25 14:32
author: engin.polat
comments: true
category: [C#]
tags: [assembly, class, csharp, reference, speak, speakasync, speech, speech synthesis, speechsynthesizer, text to speech, using]
---
Eğer uygulamanızda, **Text-to-Speech** (**TTS**) yeteneği olmasını istiyorsanız, **.Net Framework** içerisinde bunu yapmanızı sağlayacak sınıflar mevcut.

Projenizde **Text-To-Speech** sınıflarını kullanabilmek için, *System.Speech.Synthesis* namespace'indeki sınıflara erişebilmeniz gereklidir.

*System.Speech.Synthesis* namespace'ine, projenize **System.Speech.dll** assembly'yi referans olarak ekleyerek ulaşabilirsiniz.

**Text-to-Speech** kullanmak istediğiniz sınıfın bulunduğu kod dosyasının en üstünde bulunan **using**'leri yazdığınız kısma;


using System.Speech.Synthesis;</pre>
satırını ekleyiniz. Daha sonra yapmanız gereken, kodunuzun ilgili yerine aşağıdaki kod parçasını eklemek;
<pre class="brush:csharp">SpeechSynthesizer ss = new SpeechSynthesizer();
ss.Speak("Konuşmaya çevrilecek ve hoparlörden duyulacak metin");</pre>
Uygulama çalışırken, ilgili satıra geldiğinde, önce *Speak()* methoduna parametre olarak verdiğiniz string hoparlörden duyulur, sonra bir sonraki satırdan çalışmaya devam eder.

Eğer metnin konuşmaya çevrilme işleminin uzun sürdüğünü ve uygulamanıza "**yavaşlık**" kattığını düşünüyorsanız, aynı kodu aşağıdaki gibi yazabilirsiniz;
<pre class="brush:csharp">SpeechSynthesizer ss = new SpeechSynthesizer();
ss.SpeakAsync("Konuşmaya çevrilecek ve hoparlörden duyulacak metin");

*SpeakAsync()* method'u sayesinde, uygulama metnin konuşmaya çevrilmesi ve ses kartı aracılığıyla yayınlanması işlemini ayrı bir iş parçacığında gerçekleştirir.

***Not :** Speak() method'u ingilizce kelimeleri doğru olarak okuyor, fakat türkçe kelimeleri okuyamıyor.*

