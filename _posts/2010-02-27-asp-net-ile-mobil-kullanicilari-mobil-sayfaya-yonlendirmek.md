---
layout: post
title: "ASP.NET ile Mobil Kullanıcıları Mobil Sayfaya Yönlendirmek"
date: 2010-02-27 10:00
author: engin.polat
comments: true
category: [AspNet]
tags: [ASP.NET, aspnet, browser, httpcontext, ismatch, ismobile, ismobiledevice, mobile, readonly, redirectpermanent, regez, request, response, static]
---
**ASP.NET 4.0** ile aşağıdaki kod yardımıyla mobil kullanıcıları algılayabilir ve uygulamanın mobil sayfasına yönlendirebilirsiniz;



private static readonly Regex MobileRegex = new Regex(@"(nokia|sonyericsson|blackberry|IPHONE|samsung|sec-|windows ce|motorola|mot-|up.b|midp-)", RegexOptions.IgnoreCase | RegexOptions.Compiled);

public bool IsMobile
{
    get
    {
        HttpRequest r = HttpContext.Current.Request;

        if (r.Browser.IsMobileDevice)
            return true;

        if (!string.IsNullOrEmpty(r.UserAgent) &amp;&amp; MobileRegex.IsMatch(r.UserAgent))
            return true;

        return false;
    }
}

protected void Page_Load(object sender, EventArgs e)
{
    if (IsMobile)
        Response.RedirectPermanent("Mobile.aspx", true);
}


