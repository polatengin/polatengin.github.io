---
layout: post
title: "Dosya veya Dizin isimlendirirken kullanmamanız gereken karakterler"
date: 2010-03-05 10:30
author: engin.polat
comments: true
category: [C#]
tags: [char, class, dizin, dosya, filename, GetInvalidFileNameChars, GetInvalidPathChars, method, path, system.io]
---
*System.IO* **namespace**'inde yer alan *Path* **class**'ının

*GetInvalidFileNameChars()*

*GetInvalidPathChars()*

**method**larını kullanarak dosya veya dizin isimlendirirken **kullanmamanız** gereken karakterleri bulabilirsiniz.

Her iki method'dan da geriye *char[]* döner.

MSDN'de <a title="MSDN: GetInvalidFileNameChars()" href="http://msdn.microsoft.com/en-us/library/system.io.path.getinvalidfilenamechars.aspx" target="_blank" rel="noopener">şuradaki makaleden</a> *GetInvalidFileNameChars()* methodu ile ilgili ayrıntılı bilgiye ulaşabilirsiniz.

MSDN'de <a title="MSDN: GetInvalidPathChars()" href="http://msdn.microsoft.com/en-us/library/system.io.path.getinvalidpathchars.aspx" target="_blank" rel="noopener">şuradaki makaleden</a> *GetInvalidPathChars()* methodu ile  ilgili ayrıntılı bilgiye ulaşabilirsiniz.

