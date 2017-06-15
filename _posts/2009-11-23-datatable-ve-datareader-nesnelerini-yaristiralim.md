---
layout: post
title: "DataTable ve DataReader nesnelerini yarıştıralım"
date: 2009-11-23 16:30
author: engin.polat
comments: true
category: [C#]
tags: [.net, combobox, csharp, datareader, datatable, listview, SQL, thread]
---
.Net ortamında veriye erişim modeli olarak kullanabileceğimiz iki seçenek vardır; Bağlantılı (Connected) ve Bağlantısız (Disconnected) Ortam.


*   Bağlantılı veri erişim modelinde, veriye erişmek için <a title="MSDN: SqlDataReader" href="http://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqldatareader.aspx" target="_blank">DataReader</a> classını,
*   Bağlantısız veri erişim modelinde ise, genellikle <a title="MSDN: DataTable" href="http://msdn.microsoft.com/en-us/library/system.data.datatable.aspx" target="_blank">DataTable</a> classını kullanırız.
Bu yazımda, bu iki class'ı benzer şartlar altında yarıştıracağız ve hangisinin veriyi daha hızlı getirdiğine karar vereceğiz.

![DataTable_vs_DataReader](/assets/uploads/2009/11/DataTable_vs_DataReader.png "DataTable_vs_DataReader")

Projenin kaynak kodlarını <a title="DataTable vs DataReader Kaynak Kodlar" href="/assets/uploads/2009/11/DataTable_vs_DataReader.zip" target="_blank">buradan</a> download edebilirsiniz.

Kaynak kodlara baktığınızda görebileceğiniz gibi, proje tek form'dan oluşuyor. Formun Load event'inde, AdventureWorks2008R2 veritabanına bağlantı açılıyor ve PR_TABLO_LISTESI procedure'ü çalıştırılıyor.

<a title="PR_TABLO_LISTESI.sql" href="/assets/uploads/2009/11/PR_TABLO_LISTESI.sql" target="_blank">PR_TABLO_LISTESI</a> procedure'ünün kodları;


CREATE PROCEDURE PR_TABLO_LISTESI
AS
DECLARE @T TABLE (TABLO_ADI VARCHAR(100), SATIR_SAYISI INT)

INSERT INTO @T
EXEC sp_msForEachTable 'SELECT ''?'', COUNT(*) FROM ? WITH (NOLOCK)'

SELECT * FROM @T ORDER BY SATIR_SAYISI DESC

Gördüğünüz gibi, procedure'ün yaptığı çok fazla birşey yok. Pek fazla bilinmeyen ve dökümante edilmemiş **sp_msForEachTable** sistem prosedür'ünü kullanarak veritabanında bulunan her tablonun ismini ve satır sayısını döndürüyor.

Bu sistem prosedür'ünün nasıl kullanıldığını başka bir yazıda anlatmayı planlıyorum. (Eminim BilgeAdam'daki öğrencilerim bu prosedür'ü hatırlayacaklardır)

Form'un Load eventinin devamında, prosedür'den dönen liste (tablo isimleri ve satır sayıları) lvTablolar ismindeki ListView component'ine dolduruluyor.

cmbTekrarAdet isimli combobox'da yer alan (5 Adet, 10 Adet, 20 Adet) elemanlarından varsayılan olarak **10 Adet** elemanı seçili olarak geliyor. Bu combobox, testin peşpeşe kaç defa tekrar edeceğini belirliyor. Böylece bilgisayardaki anlık performans değişikliklerine karşı önlem almış oluyoruz.

Yarış Başlasın Butonunun Click event'inde, yeni bir <a title="MSDN: Thread" href="http://msdn.microsoft.com/en-us/library/system.threading.thread.aspx" target="_blank">Thread</a> nesnesini YarisBaslasin() methodunu çalıştıracak şekilde oluşturuyoruz ve başlatıyoruz.

YarisBaslasin() methodunu Arayüz'den (User Interface : UI) ayrı bir thread'den başlatarak, test süresince formda oluşacak kilitlenmeleri önlemiş olduk.

Method'un içerisinde DataTableHesapla() ve DataReaderHesapla() methodları çağırılıyor.

Bu methodlarda **TekrarAdet** defa (cmbTekrarAdet kontrolünden geliyor) <a title="MSDN: SqlConnection" href="http://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlconnection.aspx" target="_blank">SqlConnection</a> açılıyor, ListView'da seçili tabloya SELECT çekiliyor ve dönen kayıtların üzerinde tek tek geziliyor.

Son olarak, DataTable ve DataReader nesnelerinde bu işlemlerin ne kadar sürdüğü karşılaştırılıyor ve sonuç ekranın altındaki bir label'da gösteriliyor.

Süre ölçmek, ADO.NET Connected ve Disconnected Environment'ı karşılaştırmak için tek başına kullanılacak bir yöntem değil. Fakat en azından bir fikir verebilir.

