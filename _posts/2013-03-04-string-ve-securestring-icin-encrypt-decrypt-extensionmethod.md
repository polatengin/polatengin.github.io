---
layout: post
title: "String ve SecureString için Encrypt, Decrypt ExtensionMethod"
date: 2013-03-04 10:00
author: engin.polat
comments: true
category: [C#]
tags: [byte, cryptography, currentuser, dataprotectionscope, decrypt, dpapi, encoding, encrypt, encryption, extensionmethod, intptr, localmachine, makereadonly, Marshal, protect, protecteddata, securestring, securestringtocotaskmemunicode, string, unprotect, zerofreecotaskmemunicode]
---
<a href="http://msdn.microsoft.com/library/system.security.cryptography.protecteddata" title="ProtectedData Class" target="_blank">Windows Data Protection API</a> (**DPAPI**) encryption key'e ihtiyaç duymadan, kullanıcının oturumuna özel şifreleme yapabilen bir yapıdır.

*DPAPI'yi kullanabilmek için <a href="http://msdn.microsoft.com/library/system.security" title="System.Security Namespace" target="_blank">System.Security</a> referans'ının proje'ye eklenmesi gerekmektedir.*

*.Net 2.0* versiyonundan beri **.Net Framework**'un bir parçası olan *DPAPI* sayesinde metin şifreleme ve şifre çözme çok kolaylaşmıştır.

*byte[]* tipinde yapıların şifrelenmesi <a href="http://msdn.microsoft.com/library/system.security.cryptography.protecteddata.protect" title="ProtectedData.Protect Method" target="_blank">Protect()</a> method'u ile, şifre çözülmesi ise <a href="http://msdn.microsoft.com/library/system.security.cryptography.protecteddata.unprotect" title="ProtectedData.Unprotect Method" target="_blank">Unprotect()</a> method'u ile yapılmaktadır;



public static byte[] Encrypt(byte[] data)
{
    return ProtectedData.Protect(data, null, DataProtectionScope.CurrentUser);
}

public static byte[] Decrypt(byte[] data)
{
    return ProtectedData.Unprotect(data, null, DataProtectionScope.CurrentUser);
}</pre>

Bu yapının *string* tipindeki değişkenler ile de kullanılabilmesi için aşağıdaki **extension method**'lar kullanılabilir;

<pre class="brush:csharp">public static class ExtensionMethods
{
    private const DataProtectionScope Scope = DataProtectionScope.CurrentUser;

    public static string Encrypt(this string plainText)
    {
        if (plainText == null) throw new ArgumentNullException("plainText");

        var data = Encoding.Unicode.GetBytes(plainText);
        byte[] encrypted = ProtectedData.Protect(data, null, Scope);

        return Convert.ToBase64String(encrypted);
    }

    public static string Decrypt(this string encryptedText)
    {
        if (encryptedText == null) throw new ArgumentNullException("encryptedText");

        byte[] data = Convert.FromBase64String(encryptedText);
        byte[] decrypted = ProtectedData.Unprotect(data, null, Scope);

        return Encoding.Unicode.GetString(decrypted);
    }
}</pre>

*ProtectedData* sınıfının *Protect()* ve *Unprotect()* method'larının üçüncü parametresi <a href="http://msdn.microsoft.com/library/system.security.cryptography.dataprotectionscope" title="DataProtectionScope Enumeration" target="_blank">DataProtectionScope</a> *enum* tipindedir ve *CurrentUser*, *LocalMachine* değerlerinden birini alabilir.

Artık <a href="http://msdn.microsoft.com/library/system.string" title="String Class" target="_blank">string</a> tipindeki değişkenleri *Encrypt()* ve *Decrypt()* method'ları ile şifreleyebilir, şifrelerini çözebiliriz. Fakat bu değişkenlerin değerleri hafızada hala okunabilir formatta tutuluyor olacak.

Eğer değişkenlerin içeriğinin hafızada *daha güvenli* tutulmasını istiyorsak <a href="http://msdn.microsoft.com/library/system.security.securestring" title="SecureString Class" target="_blank">SecureString</a> tipini kullanmalıyız.

(*MSDN'de yeralan <a href="http://blogs.msdn.com/b/shawnfa/archive/2004/05/27/143254.aspx" title="Making Strings More Secure" target="_blank">Making Strings More Secure</a> makalesini okumanızı tavsiye ederim.*)

**SecureString** tipi için de *Encrypt()* ve *Decrypt()* **extension method**'ları yazalım;

<pre class="brush:csharp">public static string Encrypt(this SecureString value)
{
    if (value == null) throw new ArgumentNullException("value");

    IntPtr ptr = Marshal.SecureStringToCoTaskMemUnicode(value);
    try
    {
        char[] buffer = new char[value.Length];
        Marshal.Copy(ptr, buffer, 0, value.Length);

        byte[] data = Encoding.Unicode.GetBytes(buffer);
        byte[] encrypted = ProtectedData.Protect(data, null, Scope);

        return Convert.ToBase64String(encrypted);
    }
    finally
    {
        Marshal.ZeroFreeCoTaskMemUnicode(ptr);
    }
}

public static SecureString DecryptSecure(this string encryptedText)
{
    if (encryptedText == null) throw new ArgumentNullException("encryptedText");

    byte[] data = Convert.FromBase64String(encryptedText);
    byte[] decrypted = ProtectedData.Unprotect(data, null, Scope);

    SecureString ss = new SecureString();

    int count = Encoding.Unicode.GetCharCount(decrypted);
    int bc = decrypted.Length / count;
    for (int i = 0; i < count; i++)
    {
        ss.AppendChar(Encoding.Unicode.GetChars(decrypted, i * bc, bc)[0]);
    }

    ss.MakeReadOnly();
    return ss;
}</pre>

Son olarak *string* tipi ile *SecureString* tipi arasındaki dönüşüm **extension method**'larını da yazalım;

</pre><pre class="brush:csharp">public static SecureString ToSecureString(this IEnumerable<char> value)
{
    if (value == null) throw new ArgumentNullException("value");

    var secured = new SecureString();

    var charArray = value.ToArray();
    for (int i = 0; i < charArray.Length; i++)
    {
        secured.AppendChar(charArray[i]);
    }

    secured.MakeReadOnly();
    return secured;
}

public static string UnWrap(this SecureString value)
{
    if (value == null) throw new ArgumentNullException("value");

    IntPtr ptr = Marshal.SecureStringToCoTaskMemUnicode(value);
    try
    {
        return Marshal.PtrToStringUni(ptr);
    }
    finally
    {
        Marshal.ZeroFreeCoTaskMemUnicode(ptr);
    }
}</pre>

Artık *string* ve *SecureString* tipleri için hazırladığımız **extension method**'ları kullanabiliriz;

<pre class="brush:csharp">bool isOk = false;

string plain = "password";

string encrypted = plain.Encrypt();

string decrypted = encrypted.Decrypt();

SecureString plainSecure = plain.ToSecureString();

string encryptedSecure = plainSecure.Encrypt();

string decryptedSecure = encryptedSecure.Decrypt();

isOk = plain == decrypted;
isOk = plain == plainSecure.UnWrap();
isOk = plain == decryptedSecure;</pre></char>


