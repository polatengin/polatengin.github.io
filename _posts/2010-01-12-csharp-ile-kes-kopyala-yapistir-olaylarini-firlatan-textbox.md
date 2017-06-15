---
layout: post
title: "C# ile Kes-Kopyala-Yapıştır Olaylarını Fırlatan Textbox"
date: 2010-01-12 16:35
author: engin.polat
comments: true
category: [C#]
tags: [class, clipboard, code, event, eventargs, inheritance, override, source, textbox, throw, wndproc]
---
.Net Framework'ün **Textbox**'ı bir çok kullanışlı **event**'i kullanımımıza sunmuştur. Böylece programcılar olarak kod yazmak için seçebileceğimiz geniş bir olay kütüphanesi vardır. Mesela *TextChanged* olayına ayrı, *KeyDown* olayına ayrı, *KeyUp* olayına ayrı kod yazabiliriz.

Fakat nedense, textbox'tan metin kopyalarken/keserken veya textbox'a metin yapıştırırken fırlatılan bir olay yoktur. Çeşitli sebeplerle projelerimizde Kes-Kopyala-Yapıştır olaylarını fırlatan bir textbox'a ihtiyaç duyabiliriz.

Textbox kontrolüne özel event'ler eklemek için, yeni bir *class* oluşturup, *Textbox* class'ından türemesini sağlamalıyız.



public partial class GelismisTextBox : TextBox
{
}</pre>

**Windows**'un sunduğu Kes-Kopyala-Yapıştır olaylarını *GelismisTextbox* class'ımızda yönetebilmek için *WndProc()* method'unu **override** etmemiz lazım.

<pre class="brush:csharp">private const int WM_CUT = 0x0300;
private const int WM_COPY = 0x0301;
private const int WM_PASTE = 0x0302;

protected override void WndProc(ref Message m)
{
    switch(m.Msg)
    {
        case WM_CUT:
            /// Kes komutu olayını fırlat
            break;
        case WM_COPY:
            /// Kopyala komutu olayını fırlat
            break;
        case WM_PASTE:
            /// Yapıştır komutu olayını fırlat
            break;
        default:
            base.WndProc(ref m);
            break;
    }
}</pre>

Şimdi yapmamız gereken, *GelismisTextbox* class'ımıza olayları fırlatacak kodu eklemek.

<pre class="brush:csharp">public class ClipboardEventArgs : EventArgs
{
    private string clipboardText;
    public string ClipboardText
    {
        get { return clipboardText; }
        set { clipboardText = value; }
    }

    public ClipboardEventArgs(string clipboardText)
    {
        this.clipboardText = clipboardText;
    }
}</pre>

<pre class="brush:csharp">public delegate void ClipboardEventHandler(object sender, ClipboardEventArgs e);

public event ClipboardEventHandler CutText;
public event ClipboardEventHandler CopiedText;
public event ClipboardEventHandler PastedText;</pre>

Artık *GelismisTextbox* kontrolünü projemizde kullanabiliriz. *GelismisTextbox* kontrolünde yapılacak Kes-Kopyala-Yapıştır işlemleri esnasında fırlatılacak olaylara ilişkin kodlarda yazabiliriz. Örneğin;

<pre class="brush:csharp">private void txtOrnek_CutText(object sender, ClipboardEventArgs e)
{
    MessageBox.Show("Gelişmiş Textbox'tan kesilen : " + e.ClipboardText);
}
private void txtOrnek_CopiedText(object sender, ClipboardEventArgs e)
{
    MessageBox.Show("Gelişmiş Textbox'tan kopyalanan : " + e.ClipboardText);
}
private void txtOrnek_PastedText(object sender, ClipboardEventArgs e)
{
    MessageBox.Show("Gelişmiş Textbox'a yapıştırılan : " + e.ClipboardText);
}</pre>

*GelismisTexbox* class'ının kodu;

<pre class="brush:csharp">public partial class GelismisTextBox : TextBox
{
    private const int WM_CUT = 0x0300;
    private const int WM_COPY = 0x0301;
    private const int WM_PASTE = 0x0302;

    public delegate void ClipboardEventHandler(object sender, ClipboardEventArgs e);

    public event ClipboardEventHandler CutText;
    public event ClipboardEventHandler CopiedText;
    public event ClipboardEventHandler PastedText;

    protected override void WndProc(ref Message m)
    {
        switch(m.Msg)
        {
            case WM_CUT:
                if (CutText != null)
                    CutText(this, new ClipboardEventArgs(this.SelectedText));
                break;
            case WM_COPY:
                if (CopiedText != null)
                    CopiedText(this, new ClipboardEventArgs(this.SelectedText));
                break;
            case WM_PASTE:
                if (PastedText != null)
                    PastedText(this, new ClipboardEventArgs(Clipboard.GetText()));
                break;
            default:
                base.WndProc(ref m);
                break;
        }
    }
}

public class ClipboardEventArgs : EventArgs
{
    private string clipboardText;
    public string ClipboardText
    {
        get { return clipboardText; }
        set { clipboardText = value; }
    }

    public ClipboardEventArgs(string clipboardText)
    {
        this.clipboardText = clipboardText;
    }
}


