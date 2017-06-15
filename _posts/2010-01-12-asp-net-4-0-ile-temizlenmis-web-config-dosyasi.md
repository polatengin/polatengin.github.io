---
layout: post
title: "ASP.NET 4.0 ile Temizlenmiş web.config Dosyası"
date: 2010-01-12 14:36
author: engin.polat
comments: true
category: [AspNet]
tags: [appsettings, aspnet, authentication, configuration, connectionstrings, debug, framework, visual studio 2010, web.config]
---
***ASP.NET 3.0 ve ASP.NET 3.5 ile web.config Dosyası***

**ASP.NET** yıllar içerisinde gelişti, buna bağlı olarak *web.config* dosyasında tutulan ayarlarda da gözle görülür bir artış oldu. .Net Framework 3.5 SP1 kurulu olan bilgisayarımda yeni oluşturduğum bir Web Uygulamasının *web.config* dosyası aşağıdaki gibi oluyor.



< ?xml version="1.0"?>
<configuration>
        <configsections>
            <sectiongroup name="system.web.extensions" type="System.Web.Configuration.SystemWebExtensionsSectionGroup, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35">
                </sectiongroup><sectiongroup name="scripting" type="System.Web.Configuration.ScriptingSectionGroup, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35">
                    <section name="scriptResourceHandler" type="System.Web.Configuration.ScriptingScriptResourceHandlerSection, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" requirePermission="false" allowDefinition="MachineToApplication"></section>
                    </sectiongroup><sectiongroup name="webServices" type="System.Web.Configuration.ScriptingWebServicesSectionGroup, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35">
                        <section name="jsonSerialization" type="System.Web.Configuration.ScriptingJsonSerializationSection, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" requirePermission="false" allowDefinition="Everywhere"></section>
                        <section name="profileService" type="System.Web.Configuration.ScriptingProfileServiceSection, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" requirePermission="false" allowDefinition="MachineToApplication"></section>
                        <section name="authenticationService" type="System.Web.Configuration.ScriptingAuthenticationServiceSection, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" requirePermission="false" allowDefinition="MachineToApplication"></section>
                        <section name="roleService" type="System.Web.Configuration.ScriptingRoleServiceSection, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" requirePermission="false" allowDefinition="MachineToApplication"></section>
                    </sectiongroup>
                
            
        </configsections>    
        <appsettings></appsettings>
        <connectionstrings></connectionstrings>
        <system .web>
                <compilation debug="true">
                    <assemblies>
                        <add assembly="System.Core, Version=3.5.0.0, Culture=neutral, PublicKeyToken=B77A5C561934E089"></add>
                        <add assembly="System.Data.DataSetExtensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=B77A5C561934E089"></add>
                        <add assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"></add>
                        <add assembly="System.Xml.Linq, Version=3.5.0.0, Culture=neutral, PublicKeyToken=B77A5C561934E089"></add>
                    </assemblies>
                </compilation>
                <authentication mode="Windows"></authentication>
            <pages>
                <controls>
                    <add tagPrefix="asp" namespace="System.Web.UI" assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"></add>
                    <add tagPrefix="asp" namespace="System.Web.UI.WebControls" assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"></add>
                </controls>
            </pages>
            <httphandlers>
                <remove verb="*" path="*.asmx"></remove>
                <add verb="*" path="*.asmx" validate="false" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"></add>
                <add verb="*" path="*_AppService.axd" validate="false" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"></add>
                <add verb="GET,HEAD" path="ScriptResource.axd" type="System.Web.Handlers.ScriptResourceHandler, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" validate="false"></add>
            </httphandlers>
            <httpmodules>
                <add name="ScriptModule" type="System.Web.Handlers.ScriptModule, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"></add>
            </httpmodules>
        </system>
        <system .codedom>
            <compilers>
                <compiler language="c#;cs;csharp" extension=".cs" warningLevel="4" type="Microsoft.CSharp.CSharpCodeProvider, System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
                    <provideroption name="CompilerVersion" value="v3.5"></provideroption>
                    <provideroption name="WarnAsError" value="false"></provideroption>
                </compiler>
         </compilers>
        </system>
        <system .webServer>
            <validation validateIntegratedModeConfiguration="false"></validation>
            <modules>
                <remove name="ScriptModule"></remove>
                <add name="ScriptModule" preCondition="managedHandler" type="System.Web.Handlers.ScriptModule, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"></add>
            </modules>
            <handlers>
                <remove name="WebServiceHandlerFactory-Integrated"></remove>
                <remove name="ScriptHandlerFactory"></remove>
                <remove name="ScriptHandlerFactoryAppServices"></remove>
                <remove name="ScriptResource"></remove>
                <add name="ScriptHandlerFactory" verb="*" path="*.asmx" preCondition="integratedMode" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"></add>
                <add name="ScriptHandlerFactoryAppServices" verb="*" path="*_AppService.axd" preCondition="integratedMode" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"></add>
                <add name="ScriptResource" preCondition="integratedMode" verb="GET,HEAD" path="ScriptResource.axd" type="System.Web.Handlers.ScriptResourceHandler, System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35"></add>
            </handlers>
        </system>
        <runtime>
            <assemblybinding xmlns="urn:schemas-microsoft-com:asm.v1">
                <dependentassembly>
                    <assemblyidentity name="System.Web.Extensions" publicKeyToken="31bf3856ad364e35"></assemblyidentity>
                    <bindingredirect oldVersion="1.0.0.0-1.1.0.0" newVersion="3.5.0.0"></bindingredirect>
                </dependentassembly>
                <dependentassembly>
                    <assemblyidentity name="System.Web.Extensions.Design" publicKeyToken="31bf3856ad364e35"></assemblyidentity>
                    <bindingredirect oldVersion="1.0.0.0-1.1.0.0" newVersion="3.5.0.0"></bindingredirect>
                </dependentassembly>
            </assemblybinding>
        </runtime>
</configuration></pre>

Web uygulamasına özgü ayarlar yapılmaya başlandığında (*ConnectionStrings*, *Authentication*, *AppSettings*, vs) *web.config* dosyası da büyümeye ve karmaşıklaşmaya devam ediyor. Fakat web uygulamalarının büyük oranında bu ayarların birçoğu **değiştirilmeden bırakılır**.

**ASP.NET 4.0** ile *web.config* dosyamız, ilk versiyonlarda olduğu gibi sadeleşiyor.

**Visual Studio 2010**'da **Empty ASP.NET Web Application** şablonu ile yeni bir web projesi oluşturursanız, *web.config* dosyası aşağıdaki gibi oluşturuluyor;

<pre class="brush:xml">< ?xml version="1.0"?>
<configuration>
        <system .web>
                <compilation debug="true" targetFramework="4.0" />
        </system>
        <system .webServer>
            <modules runAllManagedModulesForAllRequests="true"/>
        </system>
</configuration>


İlk konfigürasyon satırı ASP.NET uygulamasının **debug** edilebileceğini ve Framework versiyonunun **4.0** olduğunu bildiriyor.

İkinci konfigürasyon satırı ise, web uygulamasının **IIS7** üzerinde host edildiği durumlarda **URL Rewrite** yapabilmek için gerekli.

