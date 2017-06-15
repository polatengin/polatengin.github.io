---
layout: post
title: "C# Veri Tipleri"
date: 2010-07-27 15:14
author: engin.polat
comments: true
category: [C#]
tags: [bool, byte, char, csharp, datatypes, datetime, decimal, double, int, long, sbyte, short, single, string, uint, ulong, ushort, veri tipleri]
---
Uygulamalarımızın olmazsa olmaz unsurları herhalde **değişkenlerdir**. Orta ölçekli bir uygulamada, kabaca bir tahminle **yüzlerce** değişken tanımlıyoruzdur.

Kullanım yoğunluğuna bakarak, oluşturduğumuz değişkenlerin tiplerinin doğru belirlenmesinin ne kadar önemli olduğunu anlayabiliriz.

**C#** ile kullanabileceğimiz değişkenlerin en önemlilerini aşağıda listeledim;
<table>
<thead>
<tr>
<td>**Veri Tipi**</td>
<td style="text-align: right;">**Kapladığı Alan**</td>
<td>**Değer Aralığı**</td>
</tr>
<tr>
<td colspan="3">**Tam Sayı Veri Tipleri**</td>
</tr>
</thead>
<tbody>
<tr>
<td>[sbyte](http://msdn.microsoft.com/library/system.sbyte)</td>
<td style="text-align: right;">1 byte</td>
<td>-128 ve +127</td>
</tr>
<tr>
<td>[byte](http://msdn.microsoft.com/library/system.byte)</td>
<td style="text-align: right;">1 byte</td>
<td>0 ve +255</td>
</tr>
<tr>
<td>[short](http://msdn.microsoft.com/library/ybs77ex4.aspx)</td>
<td style="text-align: right;">2 byte</td>
<td>-32768 ve +32767</td>
</tr>
<tr>
<td>[ushort](http://msdn.microsoft.com/library/cbf1574z.aspx)</td>
<td style="text-align: right;">2 byte</td>
<td>0 ve 65535</td>
</tr>
<tr>
<td>[int](http://msdn.microsoft.com/library/5kzh1b5w.aspx)</td>
<td style="text-align: right;">4 byte</td>
<td>-2.147.483.648 ve +2.147.483.647</td>
</tr>
<tr>
<td>[uint](http://msdn.microsoft.com/library/x0sksh43.aspx)</td>
<td style="text-align: right;">4 byte</td>
<td>0 ve 4.294.967.295</td>
</tr>
<tr>
<td>[long](http://msdn.microsoft.com/library/ctetwysk.aspx)</td>
<td style="text-align: right;">8 byte</td>
<td>-9.223.372.036.854.775.808 ve +9.223.372.036.854.775.807</td>
</tr>
<tr>
<td>[ulong](http://msdn.microsoft.com/library/t98873t4.aspx)</td>
<td style="text-align: right;">8 byte</td>
<td>0 ve 18,446,744,073,709,551,615</td>
</tr>
<tr>
<td colspan="3">**Noktalı Sayı Veri Tipleri**</td>
</tr>
<tr>
<td>[single](http://msdn.microsoft.com/library/system.single)</td>
<td style="text-align: right;">4 byte</td>
<td>-3.402823E38 ve +3.402823E38</td>
</tr>
<tr>
<td>[double](http://msdn.microsoft.com/library/system.double)</td>
<td style="text-align: right;">8 byte</td>
<td>-1.79769313486232E308 ve +1.79769313486232E308</td>
</tr>
<tr>
<td>[decimal](http://msdn.microsoft.com/library/system.decimal)</td>
<td style="text-align: right;">16 byte</td>
<td>-7.9E1028 ve +7.9E1028</td>
</tr>
<tr>
<td colspan="3">**Diğer Veri Tipleri**</td>
</tr>
<tr>
<td>[char](http://msdn.microsoft.com/library/x9h8tsay.aspx)</td>
<td style="text-align: right;">2 byte</td>
<td>Tek Karakter</td>
</tr>
<tr>
<td>[string](http://msdn.microsoft.com/library/system.string)</td>
<td style="text-align: right;">~ (2 byte x harf adedi)</td>
<td>Karakter Dizisi</td>
</tr>
<tr>
<td>[bool](http://msdn.microsoft.com/library/c8f5xwh7.aspx)</td>
<td style="text-align: right;">4 byte</td>
<td>True veya False</td>
</tr>
<tr>
<td>[DateTime](http://msdn.microsoft.com/library/system.datetime)</td>
<td style="text-align: right;">8 byte</td>
<td>1/1/0001 12:00:00 ve 31/12/9999 23:59:59</td>
</tr>
</tbody>
</table>

