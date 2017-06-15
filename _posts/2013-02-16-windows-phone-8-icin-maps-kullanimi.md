---
layout: post
title: "Windows Phone 8 için Maps kullanımı"
date: 2013-02-16 10:00
author: engin.polat
comments: true
category: [Programlama]
tags: [aerial, cartographicmode, center, colormode, dark, grid, heading, hybrid, id_cap_map, light, mapcartographicmode, mapcolormode, maps api, pitch, road, terrain, windows phone, windows phone toolkit, windowsphone, wmappmanifest, wp8, xmlns, zoomlevel]
---
Yeni **Maps API** sayesinde *Windows Phone 8* için harita tabanlı uygulamalar geliştirebiliyoruz.

Öncelikle *WindowsPhoneMaps* isimli yeni bir **Windows Phone App** projesi oluşturalım;

![Windows Phone 8 App Project : Windows Phone Maps](/assets/uploads/2013/02/WindowsPhoneMaps-1.png)

Proje oluşturduktan sonra gelen **Windows Phone Platform** versiyon seçim penceresinde *Windows Phone OS 8.0* seçeneğinin seçili olduğundan emin olmalıyız;

![Windows Phone 8.0 SDK](/assets/uploads/2013/02/WindowsPhoneMaps-2.png)

*Windows Phone 8* projemizde <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.maps.controls.map" title="Map Class" target="_blank">Map</a> kontrolünü kullanabilmek için öncelikle *ID_CAP_MAP* <a href="http://msdn.microsoft.com/library/windowsphone/develop/ff769509" title="Windows Phone 8 : App Manifest" target="_blank">Capability</a>'sini *WMAppManifest.xml* dosyasında etkinleştirmeliyiz;

![WMAppManifest.xml : ID_CAP_MAP Capability](/assets/uploads/2013/02/WindowsPhoneMaps-3.png)

İlk olarak *MainPage.xaml* dosyasında **phone:PhoneApplicationPage** tag'ına



xmlns:maps="clr-namespace:Microsoft.Phone.Maps.Controls;assembly=Microsoft.Phone.Maps"</pre>

*xml namespace*'ini eklememiz gerekiyor.

Artık **Map** kontrolünü ekranımıza ekleyebiliriz;

<pre class="brush:xml">&lt;Grid x:Name="ContentPanel" Grid.Row="1" Margin="12,0,12,12"&gt;
    &lt;maps:Map /&gt;
&lt;/Grid&gt;</pre>

Ekrana eklediğimiz **Map** kontrolünün belli bir koordinatı göstermesi için <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.maps.controls.map.center" title="Center özelliği" target="_blank">Center</a> özelliğini ayarlamamız gerekmektedir. İstanbul için örnek;

<pre class="brush:csharp">Center="41.0205, 29.0865"</pre>

Kodumuzun son hali;

<pre class="brush:xml">&lt;Grid x:Name="ContentPanel" Grid.Row="1" Margin="12,0,12,12"&gt;
    &lt;maps:Map Center="41.0205, 29.0865" /&gt;
&lt;/Grid&gt;</pre>

Yakınlaşma miktarını ayarlamak için de <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.maps.controls.map.zoomlevel" title="ZoomLevel özelliği" target="_blank">ZoomLevel</a> özelliğini kullanmamız gerekmektedir;

<pre class="brush:csharp">ZoomLevel="14"</pre>

**ZoomLevel** özelliği *1* ile *20* arasında değer almaktadır. 1 değeri ile *en yakın zoom*, 20 ile *en uzak zoom* ayarlamış oluruz.

<pre class="brush:xml">&lt;Grid x:Name="ContentPanel" Grid.Row="1" Margin="12,0,12,12"&gt;
    &lt;maps:Map Center="41.0205, 29.0865" ZoomLevel="14" /&gt;
&lt;/Grid&gt;</pre>

Haritanın gösterim modunu <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.maps.controls.map.cartographicmode" title="Map CartographicMode property" target="_blank">CartographicMode</a> özelliğine atayacağımız değer ile belirleyebiliriz. Varsayılan değeri *Road* olan **CartographicMode** özelliğine <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.maps.controls.mapcartographicmode" title="MapCartographicMode enum" target="_blank">MapCartographicMode</a> enum'ından şu değerler atanabilir;



*   Road
*   Aerial
*   Hybrid
*   Terrain

<pre class="brush:xml">&lt;Grid x:Name="ContentPanel" Grid.Row="1" Margin="12,0,12,12"&gt;
    &lt;maps:Map Center="41.0205, 29.0865" ZoomLevel="14" CartographicMode="Terrain" /&gt;
&lt;/Grid&gt;</pre>

![MapCartographicMode.Road](/assets/uploads/2013/02/WindowsPhoneMaps-Road.png)![MapCartographicMode.Aerial](/assets/uploads/2013/02/WindowsPhoneMaps-Aerial.png)![MapCartographicMode.Hybrid](/assets/uploads/2013/02/WindowsPhoneMaps-Hybrid.png)![MapCartographicMode.Terrain](/assets/uploads/2013/02/WindowsPhoneMaps-Terrain.png)

Ayrıca <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.maps.controls.map.colormode" title="ColorMode özelliği" target="_blank">ColorMode</a> özelliğine <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.maps.controls.mapcolormode" title="MapColorMode enum" target="_blank">MapColorMode</a> enum'ından *Light* veya *Dark* değerlerinden birini atayarak harita'nın *aydınlık* veya *karanlık* gözükmesini sağlayabiliriz.

<pre class="brush:xml">&lt;Grid x:Name="ContentPanel" Grid.Row="1" Margin="12,0,12,12"&gt;
    &lt;maps:Map ColorMode="Dark" /&gt;
&lt;/Grid&gt;</pre>

![MapColorMode.Light](/assets/uploads/2013/02/WindowsPhoneMaps-Light.png)![MapColorMode.Dark](/assets/uploads/2013/02/WindowsPhoneMaps-Dark.png)

Ayrıca <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.maps.controls.map.heading" title="Heading özelliği" target="_blank">Heading</a> özelliğine *0* ile *360* arası değer atayarak haritanın *yukarısında* hangi **yönün** bulunacağını belirleyebiliriz. Örneğin, *0* değerini atayarak haritanın yukarısında **Kuzey** yönünün gözükmesini, *90* değerini atayarak **Batı** yönünün gözükmesini, *180* değerini atayarak **Güney** yönünün gözükmesini, *270* değerini atayarak **Doğu** yönünün gözükmesini sağlayabiliriz.

<pre class="brush:xml">&lt;Grid x:Name="ContentPanel" Grid.Row="1" Margin="12,0,12,12"&gt;
    &lt;maps:Map Center="41.0205, 29.0865" ZoomLevel="14" Heading="270" /&gt;
&lt;/Grid&gt;</pre>

Son olarak <a href="http://msdn.microsoft.com/library/windowsphone/develop/microsoft.phone.maps.controls.map.pitch" title="Map Pitch özelliği" target="_blank">Pitch</a> özelliğine *0* ile *75* arası değer atayarak haritaya bakış açımızı değiştirebiliriz. Örneğin haritada *60* derecelik açı ile *İstanbul* şöyle gözüküyor;

<pre class="brush:xml">&lt;Grid x:Name="ContentPanel" Grid.Row="1" Margin="12,0,12,12"&gt;
    &lt;maps:Map Center="41.0205, 29.0865" ZoomLevel="14" Pitch="60" /&gt;
&lt;/Grid&gt;


![Pitch](/assets/uploads/2013/02/WindowsPhoneMaps-Pitch.png)

*Not : Harita kontrolü üzerinde daha fazla geliştirme seçeneği elde etmek için (örneğin Pushpin) <a href="http://phone.codeplex.com/" title="Codeplex : Windows Phone Toolkit" target="_blank">Windows Phone Toolkit</a>'i indirip  projenize ekleyebilirsiniz.*

