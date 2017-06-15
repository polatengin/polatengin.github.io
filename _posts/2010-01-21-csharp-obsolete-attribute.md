---
layout: post
title: "C# Obsolete Attribute"
date: 2010-01-21 11:34
author: engin.polat
comments: true
category: [C#]
tags: [.net, attribute, class, code, compile, csharp, deprecated, method, obsolete, source]
---
Yaklaşık olarak .Net Framework içerisinde binlerce **class** ve binlerce **class** içerisinde milyonlarca **method** vardır.

Her yeni .Net Framework versiyonunda bu **class**'ların ve **method**'ların bir kısmı yeni yöntemler / yeni teknikler ile baştan yazılıyor.

Bazen bu değişiklikler o kadar büyük oluyor ki, ilgili **class** veya **method** yeni bir isimle baştan yazılıyor ve eskisinin artık kullanılmaması öneriliyor.

Önceki Framework versiyonlarında yanlış konumlandırdıkları **class** veya **method**'ları taşıdıkları durumlarda da aynı durum geçerli.

Geriye yönelik uyumluluktan dolayı, kullanılmaması önerilen **class** veya **method**'lar **üç versiyon** daha yerinde durmaya devam eder.

Ama **derleme zamanında** uygulama geliştiriciye, ilgili **class** veya **method**'un **Obsolete** olduğunu bildirir ve kodunu güncellemesini ister.

Bu özellik **Obsolete Attribute** sayesinde sağlanır.

Eğer biz de yazdığımız projelerimizde çeşitli class veya method'ları **Obsolete** yapmak istersek, aşağıdaki kodda gözüktüğü gibi yapabiliriz;


[Obsolete]
public class EskimisClass
{
    ///
}</pre>
veya
<pre class="brush:csharp">[Obsolete("Bu method v4.5 versiyonundan itibaren kaldırılacak, lütfen yerine Ntv.YeniMedya.Veritabani sınıfında bulunan Baglan() methodunu kullanın. Ayrıntılı bilgi için http://www.xyz.com/Baglan sayfasına bakabilirsiniz")]
public void VeritabaniBaglan()
{
    ///
}

Yukarıdaki kodda bulunan *VeritabaniBaglan()* method'unu kullanırken ve projemizi derlerken aşağıdaki ekranlar ile karşılaşırız;

<a href="/assets/uploads/2010/01/Obsolete_1.png">![Obsolete Method](/assets/uploads/2010/01/Obsolete_1.png "Obsolete_1")</a>

<a href="/assets/uploads/2010/01/Obsolete_1.png"></a><a href="/assets/uploads/2010/01/Obsolete_2.png">![Obsolete Method Error](/assets/uploads/2010/01/Obsolete_2.png "Obsolete_2")</a>

