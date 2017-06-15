---
layout: post
title: "Bu kodda ne yanlış var? – 3"
date: 2010-02-18 13:52
author: engin.polat
comments: true
category: [C#]
tags: [bknyv, console, initialize, list, property, string]
---
Aşağıdaki kodu çalıştırdığımızda Console'a "Bir", "İki", "Üç" yazdığını görüyoruz.

Sizce neden "Dört" elemanı yazılmıyor?


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BuKoddaNeYanlisVar
{
    class Program
    {
        private List&lt;string&gt; _items = new List&lt;string&gt;();

        public List&lt;string&gt; Items
        {
            get { return _items.ToList(); }
            set { _items = value; }
        }
        static void Main(string[] args)
        {
            Program program = new Program();
            program.Items = new List&lt;string&gt; { "Bir", "İki", "Üç" };
            program.Items.Add("Dört");
            foreach (var item in program.Items)
                Console.WriteLine(item);
            Console.ReadLine();
        }
    }
}


