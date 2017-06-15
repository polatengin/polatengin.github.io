---
layout: post
title: "C# Partial Method Desteği"
date: 2010-01-20 11:07
author: engin.polat
comments: true
category: [C#]
tags: [class, code, delegate, extern, generic, generics, ildasm, method, out, partial, private, public, ref, source, static, virtual]
---
**C# 3.0** ile gelen **partial** keyword'u sayesinde **partial class** tanımlayabiliyoruz.

**partial** keyword'unun pek bilinmeyen bir kullanım alanı ise **method**'lardır.

**partial class** tanımlayabildiğimiz gibi **partial method**'da tanımlayabiliyoruz.

**partial class**'ları tanımlamamızdaki en büyük fayda, kod üreticiler olmuştur. **partial method** tanımlamanın güzelliği de işte burada. Bir kod üreticisi ile otomatik olarak kod ürettirirken, **partial method**'lar ürettirebiliriz.

Eğer üretilmiş **partial method**'u uygulamazsanız, ilgili **partial method**'u çağıran kod parçaları hata vermiyor.

Basitçe, **uygulanmamış partial method çağrıları derleme (compile) sırasında yok sayılıyor**.

Ama **partial method**'lar için bazı kısıtlamalar ve kurallar var;


*   partial method'ların geri dönüş tipi herzaman **void** olmalıdır
*   partial method'lar **out** parametreler alamazlar, ama **ref** parametreler alabilirler
*   partial method'lar **extern** olamazlar
*   partial method'lar erişim belirleyici alamazlar, çünkü herzaman **private** erişim belirleyicisine sahiptirler
*   partial method'lar **virtual** olamazlar
*   partial method'lar **static** olabilir
*   partial method'lar **generic** olabilir
*   partial method'lara **delegate** bağlanamaz, çünkü partial method'un çalışma zamanında (**runtime**) var olacağı garanti değildir
Bu bilgilerden sonra örnek bir class yazalım;


public partial class DataAccessLayer
{
    partial void ResetConnection();
}

public partial class DataAccessLayer
{
    partial void ResetConnection()
    {
        ///Connection'ı resetleyen kod
    }

    public void Reset()
    {
        ResetConnection();
    }
}

Gördüğünüz gibi, *Reset()* isminde **public** bir method yazmam gerekti. Çünkü, *ResetConnection()* **method**'u **partial** olduğu için **private** erişim belirleyicisine sahip.

Eğer yukarıdaki kodun **exe/dll** dosyasına **ILDASM** tool'u bakarsak, *DataAccessLayer.ResetConnection()* **private** method'unu ve *Reset()* **method**'u içerisinde bu method'u çağıran kod parçasını görürüz.

Eğer *ResetConnection()* method'unu uyguladığımız kod parçasını sildikten sonra, **ILDASM** ile bakarsak, *DataAccessLayer.ResetConnection()* **private** method'unun **bulunmadığını** ve *Reset()* method'unda bu method'u çağıran kod parçası **olmadığını** görürüz.

Böylece çalışma zamanı hatası almayız.

