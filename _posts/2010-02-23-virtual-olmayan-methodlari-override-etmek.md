---
layout: post
title: "virtual olmayan method'ları override etmek"
date: 2010-02-23 15:40
author: engin.polat
comments: true
category: [C#]
tags: [base, base class, csharp, derived, derived class, method, new, override, virtual, void]
---
**Base class**'ta tanımlanmış bir **method**'u **override** etmemiz gerekiyor. Fakat method **virtual** yazılmamışsa, **override** edilemez. **Türetilmiş class**'ta **base class**'taki **virtual olmayan** method'u nasıl **override** edebiliriz?

Türetilmiş class'ta base class'taki method'u **override** etmek yerine **new** anahtar kelimesi ile baştan yazabiliriz. Böylece** virtual** yazılmamış ve dolayısıyla **override** edilemeyecek method'ları "*bir çeşit*" **override** etmiş oluruz.



class Base
{
    public virtual void VirtualGoster()
    {
        Console.WriteLine(“Base.VirtualGoster”);
    }

    public void Goster()
    {
        Console.WriteLine(“Base.Goster”);
    }
}

class Derived : Base
{
    public override void VirtualGoster()
    {
        Console.WriteLine(“Derived.VirtualGoster”);
    }

    public new void Goster()
    {
        Console.WriteLine(“Derived.Goster”);
    }
}

class Program
{
    static void Main(string[] args)
    {
        Base base = new Derived();
        base.VirtualGoster();
        base.Goster();

        Console.WriteLine();

        Derived derived = new Derived();
        derived.VirtualGoster();
        derived.Goster();
    }
}



***Çıktı :***
`Derived.VirtualGoster
Base.Goster
Derived.VirtualGoster
Derived.Goster`

