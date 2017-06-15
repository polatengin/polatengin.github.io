---
layout: post
title: "Sql Server Identity Sutunları Belirlemek"
date: 2011-01-20 09:45
author: engin.polat
comments: true
category: [Programlama]
tags: [bilgeadam, columnproperty, column_name, function, identity, information_schema, isidentity, isusertable, join, objectproperty, object_id, object_name, select, SQL, sys.all_columns, sys.identity_columns, sys.objects, table, table_name, user table, view]
---
BilgeAdam'daki eski öğrencilerimden biri şu soruyu sordu; *"Herhangi bir veritabanındaki tüm tablolarda bulunan Identity Sütunları belirlemenin bir yolu var mıdır?"*

Aslında bir değil, tam üç yolu var;

Yöntem 1 : [COLUMNPROPERTY](http://msdn.microsoft.com/library/ms174968.aspx) fonksiyonunu kullanmak



SELECT
    TABLE_NAME,
    COLUMN_NAME
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    COLUMNPROPERTY(OBJECT_ID(TABLE_NAME), COLUMN_NAME, 'ISIDENTITY') = 1
ORDER BY
    TABLE_NAME</pre>

Yöntem 2 : [SYS.ALL_COLUMNS](http://msdn.microsoft.com/library/ms177522.aspx) View'unu kullanmak

<pre class="brush:sql">SELECT
    OBJECT_NAME(AC.OBJECT_ID),
    SO.NAME
FROM
    SYS.ALL_COLUMNS AS AC
    INNER JOIN SYS.OBJECTS AS SO ON OBJECT_NAME(AC.OBJECT_ID) = SO.NAME
WHERE
    AC.IS_IDENTITY = 1 AND
    SO.TYPE = 'U'</pre>

Aynı yöntemi biraz faklı olarak şöyle de yazabiliriz;

<pre class="brush:sql">SELECT
    OBJECT_NAME(OBJECT_ID),
    NAME
FROM
    SYS.ALL_COLUMNS
WHERE
    IS_IDENTITY = 1 AND
    OBJECTPROPERTY(OBJECT_ID, 'ISUSERTABLE') = 1</pre>

Yöntem 3 : [SYS.IDENTITY_COLUMNS](http://msdn.microsoft.com/library/ms187334.aspx) View'unu kullanmak

<pre class="brush:sql">SELECT
    OBJECT_NAME(IC.OBJECT_ID),
    SO.NAME
FROM
    sys.identity_columns AS IC
    INNER JOIN SYS.OBJECTS AS SO ON OBJECT_NAME(IC.OBJECT_ID) = SO.NAME
WHERE
    SO.TYPE = 'U'</pre>

Aynı yöntemi biraz faklı olarak şöyle de yazabiliriz;

<pre class="brush:sql">SELECT
    OBJECT_NAME(OBJECT_ID),
    NAME
FROM
    sys.identity_columns
WHERE
    OBJECTPROPERTY(OBJECT_ID, 'ISUSERTABLE') = 1


