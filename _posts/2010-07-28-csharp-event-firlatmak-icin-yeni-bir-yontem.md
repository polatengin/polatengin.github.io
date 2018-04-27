---
layout: post
title: "C# Event fırlatmak için yeni bir yöntem"
date: 2010-07-28 11:41
author: engin.polat
comments: true
category: [C#]
tags: [class, delegate, empty, event, eventargs, eventhandler, null, olay, public, raise, this]
---
C# ile geliştirdiğimiz sınıflardan **event** yayınlamaya genellikle ihtiyaç duyarız.

Bir sınıftan **event** yayınlamak için, artık ezberlediğimiz üzere, aşağıdaki yöntemi kullanırız;



public class EventTest
{
    public event EventHandler MyEvent;

    public void RaiseEvent()
    {
        if(MyEvent != null)
        {
            MyEvent(this, EventArgs.Empty);
        }
    }
}</pre>

*Devlicious*'da gördüğüm makalede, <a href="http://devlicio.us/blogs/rob_eisenberg/archive/2008/03/20/net-event-techniques.aspx" target="_blank" rel="noopener">Rob Eisenberg</a> yeni bir yöntem öneriyor.

Makaleye göre, yukarıdaki **event** yayınlama kodunu aşağıdaki gibi de yazabiliriz;

<pre class="brush:csharp">public class EventTest
{
    public event EventHandler MyEvent = delegate {};

    public void RaiseEvent()
    {
        MyEvent(this, EventArgs.Empty);
    }
}


*Sizce hangisini tercih etmeliyiz?*

