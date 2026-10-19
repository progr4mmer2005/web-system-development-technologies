# Лабораторная работа №3

Учебное приложение из главы 3 [Ruby on Rails Tutorial](https://www.railstutorial.org/)
Майкла Хартла: статические страницы, общий ERB-макет и автоматизированное
тестирование. Выполнены также упражнения из раздела 3.6 и настройка тестирования
из раздела 3.7. Приложение работает локально, без Bitbucket и Heroku.

## Зависимости

- Ruby 4.0.7 с Devkit
- Bundler 4.0.21
- Rails 8.1.3.1 (как в предыдущих лабораторных)

Гемы и их версии задаются в `Gemfile` и `Gemfile.lock`. Используется SQLite.

## Запуск в Windows

Из корня репозитория:

```powershell
cd lab_3
gem install bundler -v 4.0.21 --no-document
ruby bin/setup --skip-server
ruby bin/dev
```

`ruby bin/dev` запускает Rails-сервер и Guard в одном терминале. Guard
автоматически запускает тесты после сохранения файлов. `Ctrl+C` останавливает
оба процесса; завершение одного из них также останавливает второй.

Открыть [localhost:3000](http://localhost:3000).
Если порт занят другой лабораторной:

```powershell
ruby bin/dev --port 3003
```

В этом случае приложение доступно на [localhost:3003](http://localhost:3003).
`bin/setup` устанавливает зависимости и подготавливает локальную базу данных.
Статическим страницам таблицы и демонстрационные данные не нужны.

## Страницы

| Маршрут | Страница | Заголовок вкладки |
| --- | --- | --- |
| `/` | Home, заголовок на странице Sample App | Home \| Ruby on Rails Tutorial Sample App |
| `/static_pages/help` | Help | Help \| Ruby on Rails Tutorial Sample App |
| `/static_pages/about` | About | About \| Ruby on Rails Tutorial Sample App |
| `/static_pages/contact` | Contact | Contact \| Ruby on Rails Tutorial Sample App |
| `/up` | Проверка работоспособности Rails | — |

В соответствии с разделом 3.4.4 маршрут `/static_pages/home` заменён корневым
маршрутом и возвращает 404. Home доступна по `/`.

## Архитектура

Используется стандартная структура Rails MVC:

- `config/routes.rb` сопоставляет GET-запросы действиям контроллера.
- `app/controllers/static_pages_controller.rb` содержит действия `home`, `help`,
  `about`, `contact`. Rails автоматически выбирает соответствующее представление.
- `app/views/static_pages/*.html.erb` содержат текст страниц и задают заголовок
  через `provide(:title, ...)`.
- `app/views/layouts/application.html.erb` содержит общий HTML-каркас,
  `<title>` с `yield(:title)` и место для содержимого страницы с `yield`.
- `test/controllers/static_pages_controller_test.rb` проверяет HTTP-ответы,
  заголовки вкладок и страниц. Общая часть заголовка вынесена в `setup`.

## Тесты

```powershell
ruby bin/rails test
```

Ожидаемый результат: 5 тестов, 13 проверок, 0 ошибок и падений.
Альтернативная команда из задания:

```powershell
bundle exec rake test
```

Проверить только контроллер:

```powershell
ruby bin/rails test test/controllers/static_pages_controller_test.rb
```

При добавлении About, заголовков и Contact сначала запускались падающие тесты,
затем реализация доводилась до зелёного состояния. Общий макет убирает
повторение HTML-каркаса; упражнение с `setup` убирает повторение базового
заголовка в тестах.

## Автоматический запуск тестов

Guard уже запускается вместе с сервером через `ruby bin/dev` и работает
без интерактивного приглашения. Для ручного запуска тестов используется
`ruby bin/rails test` в другом терминале.

Чтобы запустить только Guard отдельно, из `lab_3`:

```powershell
bundle exec guard --force-polling --no-notify
```

Guard отслеживает изменения тестов, контроллеров, представлений и хелперов.
Изменение общего макета, маршрутов, тестового хелпера или конфигурации
перезапускает весь набор. При запуске Guard тесты не выполняются автоматически.
При отдельном интерактивном запуске для ручного запуска всех тестов нажмите
Enter. Выход из отдельного Guard: `Ctrl+D`.
`--force-polling` обеспечивает наблюдение за файлами в Windows без отдельного
нативного расширения, `--no-notify` оставляет результаты в терминале.

## Адаптация главы к Rails 8 и Windows

- Тесты используют `ActionDispatch::IntegrationTest` и запросы к URL вместо
  устаревшего `get :home`.
- `minitest-reporters` подключён в `test/test_helper.rb` для цветного вывода.
  Для совместимости с ним в этом приложении закреплена ветка Minitest 5.
- Фильтрация стека вызовов использует встроенный `Rails.backtrace_cleaner`
  вместо старого `mini_backtrace`. Дополнительный фильтр RVM из задания находится
  в `config/initializers/backtrace_silencers.rb`; репортёр сохраняет фильтр Rails.
- Guard запускает тесты без Spring: Spring требует `Process.fork`, который
  [не поддерживается в Windows](https://github.com/rails/spring#compatibility).
  Кэш загрузки Bootsnap сохранён, как в предыдущих лабораторных.
- Старые CoffeeScript, Turbolinks и production-гемы из примера Rails 4.2
  не нужны для статических страниц и локального запуска этого приложения.

Изменения разделены на коммиты в стиле репозитория. Для страниц использовалась
ветка `codex/lab-3-static-pages`, для упражнений —
`codex/lab-3-static-pages-exercises`. Упражнения включены в готовую лабораторную.
