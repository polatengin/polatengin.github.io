---
layout: post
title: "C# Klasörün Sadece-Okunabilir Olduğunu Döndüren Extension Method"
date: 2010-02-19 20:13
author: engin.polat
comments: true
category: [C#]
tags: [attributes, bool, csharp, directory, directoryinfo, dizin, extensionmethod, fileattributes, isreadonly, sadece okunabilir]
---
Deneysel amaçlı yazdığım extension method'lardan biridir;



namespace Extensions
{
    public static class ExtensionManager
    {
        public static bool SadeceOkunabilir(this DirectoryInfo Dizin)
        {
            if (Dizin == null)
                throw new ArgumentNullException("Dizin parametresi boş olamaz");

            return (Dizin.Attributes &amp; FileAttributes.ReadOnly) == FileAttributes.ReadOnly;
        }
    }
}


