---
layout: post
title: "Windows Phone 8 ile telefonun koordinatlarını bulma"
date: 2013-07-16 12:00
author: engin.polat
comments: true
category: [Windows]
tags: [api, async, await, capabilities, class, coordinate, event, geocoordinatewatcher, geolocation, geolocator, geoposition, getpositionasync, id_cap_location, latitude, longitude, positionchanged, sdk, windows phone, windowsphone, wmappmanifest, wp8]
---
*Windows Phone 8 SDK* ile birlikte *coğrafi konum API* güncellendi, yeni *API* ile birlikte <a href="http://msdn.microsoft.com/library/windows.devices.geolocation.geolocator" title="Geolocator class" target="_blank">Geolocator</a> sınıfı kullanımımıza açılmış oldu.

*Windows Phone 7.5 SDK*'da yer alan <a href="http://msdn.microsoft.com/library/system.device.location.geocoordinatewatcher" title="GeoCoordinateWatcher class" target="_blank">GeoCoordinateWatcher</a> sınıfı halen kullanımda, fakat özellikle *Windows Phone 8* destekleyecek uygulamaların yeni **Geolocator** sınıfını kullanması tavsiye ediliyor.

**Geolocator** sınıfını kullanarak cihazın yerini bulmamız ve takip edebilmemiz mümkün.

Telefonun yerini bir defa bulmamız gerekiyorsa basitçe <a href="http://msdn.microsoft.com/library/windows/apps/br225537.aspx" title="Geolocator.GetGeopositionAsync() method" target="_blank">GetGeopositionAsync()</a> methodunu çağırmamız yeterli.

**Geolocator** sınıfı ayrıca, <a href="http://msdn.microsoft.com/library/windows/apps/windows.devices.geolocation.geolocator.positionchanged" title="Geolocator.PositionChanged event" target="_blank">PositionChanged</a> *event*'i sayesinde konumu takip edebilmemize de olanak sağlıyor.

Uygulama içerisinde konum bilgisini okuyabilmek için *WMAppManifest.xml* dosyasında **Capabilities** tabında yer alan **ID_CAP_LOCATION** kutucuğunu işaretlemiş olmamız gerekiyor.

**Geolocator** sınıfı *Windows.Devices.Geolocation* namaspace'i içerisinde tanımlıdır, kullanabilmek için öncelikle ilgili sınıfın *using* alanına eklememiz gerekiyor;



using Windows.Devices.Geolocation;</pre>

Ayrıca <a href="http://msdn.microsoft.com/library/windows/apps/br225537.aspx" title="Geolocator.GetGeopositionAsync() method" target="_blank">GetGeopositionAsync()</a> method'u **asenkron** bir method olduğu için başına **await** anahtar kelimesini eklemeliyiz ve ilgili method'u **async** anahtar kelimesi ile işaretlemeliyiz;

<pre class="brush:csharp">private async void GetLocation()
{
    Geolocator locator = new Geolocator();
    Geoposition position = await locator.GetGeopositionAsync();
    Geocoordinate coordinate = position.Coordinate;
    lblLatitude.Text = "Lat : " + coordinate.Latitude;
    lblLongitude.Text = "Long: " + coordinate.Longitude;
}


Sonuçta aşağıdaki ekranı görmemiz lazım;

![](/assets/uploads/2013/07/GeoLocator.png)

