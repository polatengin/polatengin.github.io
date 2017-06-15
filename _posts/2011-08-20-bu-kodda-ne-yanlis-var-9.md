---
layout: post
title: "Bu kodda ne yanlış var? – 9"
date: 2011-08-20 14:06
author: engin.polat
comments: true
category: [C#]
tags: [bknyv, buffer, byte, close, compress, compression, compressionmode, create, decompress, file, file.open, filemode, filestream, finally, gzipstream, method, open, public, static, stream, stringt, void, while]
---
Geliştirmekte olduğumuz bir projede *C:\* sürücüsünde bulunan *OnemliDosya.xls* dosyasını **sıkışırmamız** ve *OnemliDosya.zip* dosyasını **oluşturmamız** istendi.

Hemen arkasından sıkıştırdığımız dosyayı **açmamız** ve *OnemliDosya.Yeni.xls* dosyasını **oluşturmamız** bekleniyor.

Aşağıdaki method'ları bu görev için yazdık;



public static void Compress(string ZiplenecekDosyaAdi, string ZipDosyaAdi)
{
    FileStream InputStream = File.Open(ZiplenecekDosyaAdi, FileMode.Open);
    FileStream OutputStream = File.Open(ZipDosyaAdi, FileMode.Create);
    GZipStream ZipStream = new GZipStream(OutputStream, CompressionMode.Compress);

    try
    {
        byte[] Buffer = new byte[InputStream.Length];
        InputStream.Read(Buffer, 0, Buffer.Length);
        ZipStream.Write(Buffer, 0, Buffer.Length);
    }
    finally
    {
        OutputStream.Close();
        InputStream.Close();
    }
}

public static void Decompress(string ZiplenecekDosyaAdi, string ZipDosyaAdi)
{
    FileStream Input = File.Open(ZiplenecekDosyaAdi, FileMode.Open);
    FileStream Output = File.Open(ZipDosyaAdi, FileMode.Create);
    GZipStream ZipStream = new GZipStream(Input, CompressionMode.Decompress);

    try
    {
        int Data = ZipStream.ReadByte();
        while (Data > 0)
        {
            Output.WriteByte((byte)Data);
            Data = ZipStream.ReadByte();
        }
    }
    finally
    {
        Output.Close();
        Input.Close();
    }
}</pre>

Yazdığımız method'ları aşağıdaki gibi kullanıyoruz;

<pre class="brush:csharp">Compress("C:\\OnemliDosya.xls", "C:\\OnemliDosya.zip");
Decompress("C:\\OnemliDosya.zip", "C:\\OnemliDosya.Yeni.xls");


Kodumuzdan emin olmamıza rağmen, çalışmadığını farkediyoruz.

Sizce **problem nedir** ve **nasıl düzeltilebilir**?

