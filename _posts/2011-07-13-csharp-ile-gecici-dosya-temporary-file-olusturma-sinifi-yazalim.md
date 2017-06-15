---
layout: post
title: "C# ile Geçici Dosya (Temporary File) oluşturma sınıfı yazalım"
date: 2011-07-13 09:27
author: engin.polat
comments: true
category: [C#]
tags: [class, constructor, create, delete, exists, extension, file, FileSystem, idisposable, isnullorempty, Path.GetTempFileName(), private, property, public, readonly, string, temp, this, using]
---
Projelerimizde *dosya sistemi* üzerinde *geçici* olarak **dosya oluşturma** ve işimiz bittiğinde **silme** ihtiyacı hissedebiliriz.

Bu yazıyı okumadan önce <a href="http://www.enginpolat.com/hem-benzersiz-hem-de-gecici-dosya-olusturmanin-en-kolay-yolu/" target="_blank">Hem benzersiz hem de geçici dosya oluşturmanın en kolay yolu</a> ve <a href="http://www.enginpolat.com/c-ile-gecici-dosya-olusturmak/" target="_blank">C# ile Geçici Dosya Oluşturmak</a> başlıklı yazılarımı okumanızı öneririm.

Bu <a href="http://www.vcskicks.com/code-snippet/temp-file-class.php" target="_blank">linkte</a> bulduğum yöntemi çok kullanışlı buldum ve sizler (*aynı zamanda kendim*) için türkçeleştirdim;



public class TempFile : IDisposable
{
    public TempFile() : this(string.Empty)
    { }

    private readonly string _tmpfile;

    public TempFile(string extension)
    {
        _tmpfile = Path.GetTempFileName();

        if (!string.IsNullOrEmpty(extension))
        {
            string newTmpFile = _tmpfile + extension;

            /// Yeni bir geçici dosya oluşturulur
            File.Create(newTmpFile, 0);
            /// Eski geçici dosya silinmediyse, silinir.
            File.Delete(_tmpfile);

            /// Yeni oluşturulan geçici dosya kullanıma hazır!
            _tmpfile = newTmpFile;
        }
    }

    public string FullPath
    {
        get { return _tmpfile; }
    }

    void IDisposable.Dispose()
    {
        if (!string.IsNullOrEmpty(_tmpfile) && File.Exists(_tmpfile))
        {
            File.Delete(_tmpfile);
        }
    }
}</pre>

Kullanımına örnek;

<pre class="brush:csharp">using(TempFile tmp = new TempFile(".dat")) /// dat uzantılı bir geçici dosya oluşturuluyor
{
    /// FullPath özelliğinden geçici dosyanın yolu ve dosya adı alınabilir;
    string filename = tmp.FullPath;
}


