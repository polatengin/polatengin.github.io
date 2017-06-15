---
layout: post
title: "C# Erişim Belirleyiciler - Access Modifiers"
date: 2010-01-20 09:35
author: engin.polat
comments: true
category: [C#]
tags: [access modifiers, class, CLR, csharp, erişim belirleyiciler, internal, member, private, protected internal, public, struct]
---
Öncelikle erişim belirleyicilerin (**access modifiers**) nerelere uygulandığını bilmemiz lazım; C# projesinde tanımlanmış tüm varlıklara uygulanabilir, buna *class*, *struct*, *function*, *method*, *property* ve class seviyesindeki tüm *değişkenler* dahildir.

Peki, neden erişim belirleyicilere ihtiyaç duyarız?

Çünkü, uygulamamızda kullandığımız varlıkların bulundukları kod bloğunun dışından erişilip/erişilemeyeceğini belirlemek isteriz.

C# dilinde tanımlı erişim belirleyiciler (**access modifiers**);

**public :** public olarak tanımlanan öğe, kod bloğunun içinde ve dışında tamamen erişilebilirdir. Yani, hiçbir kısıtlama yoktur.

**protected :** protected olarak tanımlanan öğe, sadece tanımlandığı class'ın içinde ve o class'tan türetilmiş diğer class'ların içinde erişilebilirdir.

**internal :** internal olarak tanımlanan öğe, bulunduğu assembly'nin (Dll veya Exe dosyası) içinde erişilebilirdir. Dll veya Exe dosyasının içerisinde erişim için kısıtlama yoktur, ama dışarıdan erişilemez.

**protected internal :** protected internal erişim belirleyicisi, protected ve internal erişim belirleyicilerinin VEYA (OR) işlemiyle birleştirilmiş halidir. protected internal olarak tanımlanmış öğe, tanımlandığı class'ın içinde ve o class'tan türetilmiş diğer class'ların içinde erişilebilir. Ayrıca, aynı assembly içinde olmasalar dahi, tanımlandığı class'tan türetilmiş diğer class'ların içinde de erişilebilirdir.

**private :** private olarak tanımlanan öğe, sadece tanımlandığı class'ın içerisinde erişilebilirdir. En katı erişim belirleyicidir.

Aslında CLR içinde tanımlı bir erişim belirleyici daha vardır. **FamilyAndAssembly** olarak bilinir. C# kelimeleri ile benzetmeye çalışırsak, **protected VE (AND) internal** erişim belirleyicisidir. C# dili bu erişim belirleyicisini desteklemez, eğer kullanmanız gerekiyorsa, C++ ve direk IL yazmanız gerekmektedir.

*class* veya *struct*'lar ya **public**, ya da **internal** olabilir, varsayılan olarak **internal** erişim belirleyicisine sahiptirler.

Varsayılan olarak *class* içerisinde tanımlı öğeler **private** erişim belirleyicisine sahiptirler.

*struct* içerisinde tanımlı öğeler **public**, **internal** veya **private** olabilirler. *struct*'lar türetmeyi desteklemediği için **protected** ve **protected internal** erişim belirleyicisine zaten ihtiyaçları yoktur.

