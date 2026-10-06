# Лабораторная работа №4

Продолжение приложения из лабораторной №3 по главе 4 Ruby on Rails Tutorial
Майкла Хартла: общий заголовок страниц, основы Ruby и четыре упражнения.
Приложение находится в отдельной папке `lab_4`; предыдущие лабораторные сохранены.
Все команды выполняются локально, публикация и деплой не требуются.

## Локальный запуск

```powershell
cd lab_4
ruby bin/setup --skip-server
ruby bin/dev
```

Команды выше выполняются из корня репозитория. Используются Ruby 4.0.7 и Rails
8.1.3.1, как в лабораторной №3. `bin/setup` устанавливает зависимости и готовит
локальную базу данных. Rails и Guard запускаются вместе через `bin/dev`.

Открыть приложение: <http://localhost:3000>. Остановить оба процесса: **Ctrl+C**.
Если порт занят другой лабораторной, можно выбрать другой:

```powershell
ruby bin/dev --port 3004
```

## Что сделано по документу

| Раздел | Реализация |
| --- | --- |
| 4.1: общий заголовок | `full_title` в `app/helpers/application_helper.rb`; вызов в `app/views/layouts/application.html.erb` |
| 4.1: Home без префикса | Убрали `provide(:title, "Home")` из Home и изменили ожидаемый заголовок в тесте |
| 4.2–4.4: примеры Ruby | `script/ruby_basics.rb`, классы и методы в `lib/ruby_tutorial.rb`, расширение `String` в `script/string_extensions.rb` |
| 4.6: четыре упражнения | `lib/ruby_tutorial.rb`, `script/string_extensions.rb`; показ результатов в `script/exercises.rb` |
| Настройка консоли | Локальный `.irbrc`: простой вид приглашения, отключён автоматический отступ |
| Проверки | Тесты страниц, хелпера, учебных методов и расширения `String`; правила Guard |

Обычная архитектура Rails сохранена: маршруты направляют запрос в контроллер,
контроллер выбирает представление, общий макет вызывает хелпер для заголовка.
Новые маршруты и таблицы базы данных в этой главе не нужны.

## Страницы и заголовки

Общая часть заголовка — `Ruby on Rails Tutorial Sample App`.

| Маршрут | Заголовок вкладки |
| --- | --- |
| `/` | `Ruby on Rails Tutorial Sample App` |
| `/static_pages/help` | `Help \| Ruby on Rails Tutorial Sample App` |
| `/static_pages/about` | `About \| Ruby on Rails Tutorial Sample App` |
| `/static_pages/contact` | `Contact \| Ruby on Rails Tutorial Sample App` |
| `/up` | Проверка работоспособности Rails |

Старый `/static_pages/home` возвращает 404: Home доступен через `/`.

`provide(:title, "Help")` задаёт название страницы. В макете `yield(:title)`
получает это название, а `full_title` добавляет общую часть. Если название пустое,
хелпер возвращает только общую часть без разделителя `|`.

## Примеры Ruby и упражнения

Из папки `lab_4`:

```powershell
ruby bin/rails runner script/ruby_basics.rb
ruby script/exercises.rb
```

Первый скрипт показывает строки, интерполяцию, условия, методы с аргументом по
умолчанию, массивы, диапазоны, блоки, символы, хеши, классы, наследование и
атрибуты объектов. Он запускается через Rails, потому что часть примеров
использует Rails: `blank?`, `second`, контроллеры и хелперы.

Второй скрипт показывает решения четырёх упражнений:

1. `RubyTutorial.string_shuffle("foobar")`: `split("")` разбивает строку на
   символы, `shuffle` перемешивает массив, `join` собирает строку.
2. `"foobar".shuffle`: та же операция как метод класса `String`;
   `self` обозначает строку, у которой вызвали метод.
3. `RubyTutorial.family_params`: три хеша людей внутри хеша семьи;
   `params[:father][:first]` возвращает `"Michael"`.
4. `{ "a" => 100, "b" => 200 }.merge({ "b" => 300 })` возвращает
   `{ "a" => 100, "b" => 300 }`. Для одинакового ключа берётся значение из
   второго хеша. Исходный хеш сохраняется.

Порядок символов после `shuffle` случайный; он может совпасть с исходным.
Проверяется сохранение всех символов, включая повторяющиеся.
Поведение `merge` сверено с [Ruby API](https://docs.ruby-lang.org/en/master/Hash.html#method-i-merge).

Для ручной работы в консоли:

```powershell
ruby bin/rails console
```

```ruby
helper.full_title
helper.full_title("Help")
RubyTutorial.string_shuffle("foobar")
params = RubyTutorial.family_params
params[:father][:first]
RubyTutorial.merge_example
RubyTutorial::Word.new("level").palindrome?
user = RubyTutorial::User.new(name: "Michael Hartl", email: "mhartl@example.com")
user.formatted_email
require "./script/string_extensions"
"foobar".shuffle
"deified".palindrome?
exit
```

`RubyTutorial::User` — учебный класс Ruby с `name` и `email`, без сохранения в
базу. Пример из временного `example_user.rb` учебника сохранён в модуле
`RubyTutorial`, вместе с остальными примерами. Методы `String#shuffle` и
`String#palindrome?` подключаются явно для упражнений; сервер сам этот скрипт
не загружает.

## Тесты и Guard

```powershell
ruby bin/rails test
```

Проверенный результат: **20 тестов, 49 проверок, 0 ошибок и падений**.

| Файл | Что проверяет |
| --- | --- |
| `test/controllers/static_pages_controller_test.rb` | Ответы страниц, заголовки вкладок, заголовки `h1`, старый маршрут Home |
| `test/helpers/application_helper_test.rb` | `full_title` с пустым и заданным названием, вывод апострофа через макет |
| `test/lib/ruby_tutorial_test.rb` | Методы, классы и упражнения из `RubyTutorial` |
| `test/lib/string_extensions_test.rb` | Методы, добавленные к `String` |

При запуске `ruby bin/dev` Guard наблюдает за изменениями файлов. Изменение
`lib/ruby_tutorial.rb` запускает только `test/lib/ruby_tutorial_test.rb`
(8 тестов), а изменение `script/string_extensions.rb` — только
`test/lib/string_extensions_test.rb` (3 теста). Оба правила проверены на
работающем Guard. Изменение общего хелпера или макета запускает все тесты,
поскольку эти файлы используются всеми страницами. Изменение самого тестового
файла запускает этот файл. При старте Guard тесты автоматически не запускаются
(`all_on_start: false`); полный набор запускается командой выше.

## Отличия от старой версии учебника

В существующем Rails 8 используется Propshaft: в макете сохранён
`stylesheet_link_tag :app` и добавлен параметр `media: "all"`.
В современной IRB отключение отступов задаётся через `IRB.conf[:AUTO_INDENT]`,
а не старое имя `AUTO_INDENT_MODE` из документа. Настройки лежат в `.irbrc`
этой лабораторной и не требуют изменения домашней конфигурации пользователя.

Короткое объяснение для защиты: [docs/defense.md](docs/defense.md).
