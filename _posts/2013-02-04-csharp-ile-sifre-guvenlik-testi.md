---
layout: post
title: "C# ile şifre güvenlik testi"
date: 2013-02-04 10:00
author: engin.polat
comments: true
category: [C#]
tags: [class, enum, int, length, math, min, private, public, regex, replace, string]
---
Kişiye özel bilgiler barındıran yazılımlar mutlaka **kullanıcı bilgilerini** güvenlik altına almak için kullanıcının kendi belirlediği *Kullanıcı Adı* ve *Şifresi* ile yazılımı kullanmasını sağlar.

Böylece *Kullanıcı Adı* ve *Şifresi*'ni bilmeden bir kullanıcıya özel bilgiler başkaları tarafından *görüntülenemez* / *kopyalanamaz* / *değiştirilemez*.

Başkalarının bilgilerini *görmeye* / *değiştirmeye* meraklı (*çoğu zaman kötü niyetli*) kişiler kurbanlarının *Kullanıcı Adı* ve *Şifresi* bilgilerini tahmin ederek sisteme girmeye çalışırlar.

*Tahmin metodunun* işe yaramadığı durumlarda olası ihtimallerin tamamını sırası ile deneyerek sisteme giriş yapmaya çalışan **küçük programcıklar** geliştirirler.

Kullanıcının *Kullanıcı Adı* ve *Şifresi* ne kadar kolay tahmin edilebilir ise onun adına sisteme girilebilmesi de o kadar kolay olur.

Son yıllarda yazılımlar kullanıcılarının en azından *kolay tahmin edilebilir* şifre seçememeleri için çeşitli yöntemler geliştirdiler.

Bunlardan bir tanesi **Password Strength Check** denilen *Şifre Güvenlik Testi* diye çevirebileceğimiz yöntemdir.

Bu yöntemin temelinde kullanıcının şifre olarak *küçük harf* , *BÜYÜK HARF* ve *Rakamlardan* oluşan uzun bir kelime belirlemesi yatıyor.

Yazılım genelde, kullanıcının şifresini belirlediği ekranda, *şifrenin güvenlik seviyesini*, *mesaj* veya *görsel* ile kullanıcıya geri bildirir.

Eğer biz de yazılımımıza benzer bir kontrol koymak istiyorsak öncelikle *şifre güvenlik testi* için bir *method* geliştirmeli, sonra şifreyi ilgili *güvenlik test method*'undan geçirmeliyiz.

*Güvenlik Testinin* kuralları yazılımdan yazılıma göre değişkenlik gösterebilir. Bu makale için aşağıdaki kurallar geçerli olacak;



*   Şifre Güvenlik Seviyesi *0* ile *100* arasında bir puandır
*   Şifre içerdiği her harf *6* puan değerindedir, bu özellikten en fazla *60* puan alınabilir
*   Eğer bir rakam içeriyorsa *5* puan alır, birden fazla rakam içeriyorsa *10* puan alır
*   Eğer bir küçük harf içeriyorsa *5* puan alır, birden fazla küçük harf içeriyorsa *10* puan alır
*   Eğer bir büyük harf içeriyorsa *5* puan alır, birden fazla büyük harf içeriyorsa *10* puan alır
*   Eğer harf ve rakam dışında karakter içeriyorsa *5* puan alır, birden fazla karakter içeriyorsa *10* puan alır

Kullanıcılara şifrelerinin güvenlik seviyesini *0* ile *100* arası bir rakamla göstermek yerine bu değer üzerinden hesapladığımız *daha anlaşılır* bir değer ile göstermeliyiz. Kullanıcının göreceği güvenlik seviyeleri listesi;



*   0 - 49 : *Kabul edilemez*
*   50 - 59 : *Zayıf*
*   60 - 79 : *Normal*
*   80 - 89 : *Güçlü*
*   90-100 : *Güvenli*

Bu kurallar ışığında şifre günvelik testi method'umuzu yazmaya başlayalım. Öncelikle projeye *PasswordStrengthChecker* isminde bir class ekleyelim ve içinde *GetLengthScore*, *GetLowerScore*, *GetUpperScore*, *GetDigitScore*, *GetSymbolScore* isimli methodlar tanımlayalım;



public class PasswordStrengthChecker
{
    private int GetLengthScore(string password)
    {
        return Math.Min(10, password.Length) * 6;
    }

    private int GetLowerScore(string password)
    {
        int rawScore = password.Length - Regex.Replace(password, "[a-z]", "").Length;
        return Math.Min(2, rawScore) * 5;
    }

    private int GetUpperScore(string password)
    {
        int rawScore = password.Length - Regex.Replace(password, "[A-Z]", "").Length;
        return Math.Min(2, rawScore) * 5;
    }

    private int GetDigitScore(string password)
    {
        int rawScore = password.Length - Regex.Replace(password, "[0-9]", "").Length;
        return Math.Min(2, rawScore) * 5;
    }

    private int GetSymbolScore(string password)
    {
        int rawScore = Regex.Replace(password, "[a-zA-Z0-9]", "").Length;
        return Math.Min(2, rawScore) * 5;
    }
}</pre>

Aynı class içerisine *GeneratePasswordScore* isimli method ekleyelim ve ykarıda tanımladığımız method'ları kullanarak şifrenin *güvenlik değerini* hesaplayalım;

<pre class="brush:csharp">public int GeneratePasswordScore(string password)
{
    if (password == null)
    {
        return 0;
    }

    int lengthScore = GetLengthScore(password);
    int lowerScore = GetLowerScore(password);
    int upperScore = GetUpperScore(password);
    int digitScore = GetDigitScore(password);
    int symbolScore = GetSymbolScore(password);

    return lengthScore + lowerScore + upperScore + digitScore + symbolScore;
}</pre>

Böylelikle *GeneratePasswordScore* method'una parametre ile verilen şifrenin güvenlik değerini hesaplayabiliriz. Şimdi bu değeri daha okunabilir / kolay anlaşılabilir hale çevirelim. Öncelikle yeni bir *enum* eklemeliyiz;

<pre class="brush:csharp">public enum PasswordStrength
{
    Unacceptable,
    Weak,
    Normal,
    Strong,
    Secure
}</pre>

*PasswordStrengthChecker* class'ına son bir method eklememiz gerekiyor;

<pre class="brush:csharp">public PasswordStrength GetPasswordStrength(string password)
{
    int score = GeneratePasswordScore(password);

    if (score < 50)
        return PasswordStrength.Unacceptable;
    else if (score < 60)
        return PasswordStrength.Weak;
    else if (score < 80)
        return PasswordStrength.Normal;
    else if (score < 90)
        return PasswordStrength.Strong;
    else
        return PasswordStrength.Secure;
}</pre>

Kullanımına birkaç örnek;

</pre><pre class="brush:csharp">PasswordStrengthChecker checker = new PasswordStrengthChecker();
int score;
 
score = checker.GeneratePasswordScore("pwd");           /// 28
score = checker.GeneratePasswordScore("password");      /// 58
score = checker.GeneratePasswordScore("P45Sword");      /// 78
score = checker.GeneratePasswordScore("P45Sword!");     /// 89
score = checker.GeneratePasswordScore("ASriws34#!");    /// 100

PasswordStrength strength;
 
strength = checker.GetPasswordStrength("pwd");          /// Kabul Edilemez
strength = checker.GetPasswordStrength("password");     /// Zayıf
strength = checker.GetPasswordStrength("P45Sword");     /// Normal
strength = checker.GetPasswordStrength("P45Sword!");    /// Güçlü
strength = checker.GetPasswordStrength("ASriws34#!");   /// Güvenli


*Kaynak : <a href="http://www.blackwasp.co.uk/PasswordStrength.aspx" title="blackwasp" target="_blank" rel="noopener">blackwasp</a>*

