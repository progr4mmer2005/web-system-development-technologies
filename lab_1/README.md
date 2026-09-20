# Лабораторная работа №1

Приложение Ruby on Rails с несколькими текстовыми страницами и проверкой работоспособности.

## Требования

- Ruby 4.0.7 с Devkit
- Rails 8.1.3.1
- Bundler 4.0.21

## Запуск в Windows

```powershell
gem install bundler -v 4.0.21 --no-document
ruby bin/setup --skip-server
ruby bin/dev
```

Открыть [localhost:3000](http://localhost:3000).

| Маршрут | Ответ |
| --- | --- |
| `/` | `¡Hola, mundo!` |
| `/hello-world` | `hello, world!` |
| `/hello` | `¡Hola, mundo!` |
| `/goodbye` | `goodbye, world!` |
| `/up` | Проверка работоспособности |

