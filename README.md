# Programcıdan Programcıya

![Engin Polat Blog Logo](/assets/logo-128.png "Engin Polat Blog Logo - http://www.enginpolat.com")

Engin Polat'ın [http://www.enginpolat.com](http://www.enginpolat.com) adresinde yayınlanan kişisel blog'unun kodları

Eğer bir makale talebiniz varsa, [Issues](https://github.com/polatengin/polatengin.github.io/issues) linkinden talebinizi ekleyin, ben de *istek* makalenizi yazayım :)

**NOT:** Lütfen isteklerinizi anlaşılır, çok genel olmayan bir şekilde yapın, ben de kısa süre içerisinde tek bir makale ile tamamlayabileyim ;)

## Projeyi Derlemek

Siteyi derlemek ve bilgisayarda çalıştırmak için aşağıdaki komutu Terminal içerisinde çalıştırmanız yeterlidir

```bash
docker build --tag polatengin:latest .
```

**NOT:** `polatengin:latest` yerine istediğiniz ismi verebilirsiniz. Komutun sonundaki **. (nokta)** karakterini unutmayın ;)

## Projeyi Çalıştırmak

Derlenmiş projeyi bilgisayarınızda çalıştırmak için aşağıdaki komutu Terminal içerisinde çalıştırmanız yeterlidir

```bash
docker run -p 3000:80 polatengin:latest
```

Docker Container çalışmaya başladıktan sonra `http://localhost:3000` adresine gidip sitemi kendi bilgisayarınızda ziyaret edebilirsiniz :)

**NOT:** `3000` yerine istediğiniz port numarasını kullanabilirsiniz

## Çalışan Container'a Bağlanmak

Çalışan container'a shell bağlantısı açmak ve içerisinde gezinmek için aşağıdaki komutu Terminal içerisinde çalıştırmanız yeterlidir

```bash
docker exec -ti polatengin:latest sh
```

## Lisans

[MIT](http://opensource.org/licenses/MIT)
