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
| 4.2–4.4: примеры Ruby | Самостоятельные файлы по подразделам в `script/console/` |
| 4.6: четыре упражнения | Файлы `4.6.1`–`4.6.4` в `script/console/` |
| Настройка консоли | Локальный `.irbrc`: простой вид приглашения, отключён автоматический отступ |
| Проверки | Пять тестов страниц из лабораторной №3; ожидание заголовка Home обновлено |

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

Каждый пример находится в отдельном файле в `script/console/`. Название начинается
с номера подраздела документа. Код без комментариев и импортов: в каждом файле
есть всё необходимое для демонстрации, определения и примеры вызовов.

Из папки `lab_4` открыть консоль:

```powershell
ruby bin/rails console
```

Короткая форма той же команды: `ruby bin/rails c`. Консоль запускается в среде
разработки и загружает приложение, поэтому доступны `helper`, `blank?`, `second`
и классы приложения.

Открыть нужный файл, скопировать **всё содержимое** и вставить в консоль.
Содержимое файла можно сразу положить в буфер обмена (PowerShell), затем вставить
в консоль правой кнопкой мыши или **Ctrl+V**:

```powershell
Get-Content script/console/4.6.1_string_shuffle.rb -Raw | Set-Clipboard
```

Другой способ — загрузить файл уже из открытой консоли одной строкой:

```ruby
load "script/console/4.6.1_string_shuffle.rb"
```

Список всех файлов для вставки:

```powershell
Get-ChildItem script/console
```

Не обязательно писать `require` или вызывать `RubyTutorial`.
`p` и `puts` показывают результаты сразу. В упражнениях дополнительные сравнения
показывают правильность результата. Выход из консоли — `exit`.

Все 19 файлов проверены вставкой в отдельные свежие Rails-консоли, а также
последовательной и повторной вставкой в одну консоль. В упражнении 4.6.4 последнее
`equal?` возвращает `false`: результат merge — другой объект, а не исходный хеш.

| Подраздел | Файл | Что показывает |
| --- | --- | --- |
| 4.1 | [4.1_full_title.rb](script/console/4.1_full_title.rb) | Хелпер заголовка и подключение стилей |
| 4.2.1 | [4.2.1_comments.rb](script/console/4.2.1_comments.rb) | Сложение из примера; комментарии убраны по требованию |
| 4.2.2 | [4.2.2_strings.rb](script/console/4.2.2_strings.rb) | Строки, соединение, интерполяция, puts и print |
| 4.2.3 | [4.2.3_objects_and_messages.rb](script/console/4.2.3_objects_and_messages.rb) | Методы объектов, условия, nil, &&, ||, ! и unless |
| 4.2.4 | [4.2.4_defining_methods.rb](script/console/4.2.4_defining_methods.rb) | Три варианта string_message, аргумент по умолчанию и return |
| 4.2.5 | [4.2.5_title_helper.rb](script/console/4.2.5_title_helper.rb) | Определение full_title и вызовы с разными аргументами |
| 4.3.1 | [4.3.1_arrays_and_ranges.rb](script/console/4.3.1_arrays_and_ranges.rb) | Индексы, сравнения, сортировка, добавление, диапазоны |
| 4.3.2 | [4.3.2_blocks.rb](script/console/4.3.2_blocks.rb) | each, times, map, блоки и случайная строка |
| 4.3.3 | [4.3.3_hashes_and_symbols.rb](script/console/4.3.3_hashes_and_symbols.rb) | Хеши, символы, вложенные значения, inspect и p |
| 4.3.4 | [4.3.4_stylesheet_helper.rb](script/console/4.3.4_stylesheet_helper.rb) | Хеш параметров stylesheet_link_tag |
| 4.4.1 | [4.4.1_constructors.rb](script/console/4.4.1_constructors.rb) | String.new, Array.new, Hash.new, значения по умолчанию |
| 4.4.2 | [4.4.2_inheritance.rb](script/console/4.4.2_inheritance.rb) | superclass, простой Word и Word с наследованием от String |
| 4.4.3 | [4.4.3_string_extensions.rb](script/console/4.4.3_string_extensions.rb) | Добавление palindrome? к String, empty? и blank? |
| 4.4.4 | [4.4.4_controller.rb](script/console/4.4.4_controller.rb) | Класс контроллера, его предки и вызов home |
| 4.4.5 | [4.4.5_user.rb](script/console/4.4.5_user.rb) | initialize, attr_accessor, переменные объекта и formatted_email |
| 4.6.1 | [4.6.1_string_shuffle.rb](script/console/4.6.1_string_shuffle.rb) | Функция string_shuffle: split, shuffle и join |
| 4.6.2 | [4.6.2_string_shuffle_method.rb](script/console/4.6.2_string_shuffle_method.rb) | Метод shuffle в классе String |
| 4.6.3 | [4.6.3_family_params.rb](script/console/4.6.3_family_params.rb) | person1, person2, person3, params и имена членов семьи |
| 4.6.4 | [4.6.4_hash_merge.rb](script/console/4.6.4_hash_merge.rb) | merge, результат объединения и сохранность исходных хешей |

В примерах из методички есть намеренные ошибки, например `nil.empty?`. Они
показываются через `begin/rescue`, чтобы вставка всего файла продолжала выполняться.
В 4.4.2 класс Word сначала создаётся обычным, затем заменяется наследником String:
удаление старой константы позволяет показать оба варианта в одной консоли.

`User` в 4.4.5 — учебный класс Ruby, который не создаёт таблицу и не сохраняется
в базу данных. Файлы примеров не загружаются приложением автоматически.
Часть примеров использует Rails (`helper`, `second`, `blank?`, контроллеры), поэтому
универсальный способ показа всех файлов — именно Rails-консоль.

Порядок букв после `shuffle` случайный и может совпасть с исходным. Проверки
сравнивают набор символов, а не конкретный порядок. `merge` создаёт новый хеш;
при совпадении ключей значение берётся из второго хеша.
Поведение сверено с [Ruby API](https://docs.ruby-lang.org/en/master/Hash.html#method-i-merge).

## Тесты и Guard

```powershell
ruby bin/rails test
```

Оставлены **5 тестов страниц** в `test/controllers/static_pages_controller_test.rb`:
ответы страниц, заголовки вкладок, заголовки `h1` и старый маршрут Home.
Проверенный результат: **5 тестов, 13 проверок, 0 ошибок и падений**.

При запуске `ruby bin/dev` Guard наблюдает за изменениями файлов. Изменения
страниц и контроллера запускают файл тестов страниц. Изменение общего хелпера
или макета запускает все оставшиеся тесты. Изменение самого тестового файла
запускает этот файл. Упражнения Ruby показываются через скрипты и консоль;
отдельных тестов для них нет. При старте Guard тесты автоматически не запускаются
(`all_on_start: false`); полный набор запускается командой выше.

## Отличия от старой версии учебника

В существующем Rails 8 используется Propshaft: в макете сохранён
`stylesheet_link_tag :app` и добавлен параметр `media: "all"`.
В современной IRB отключение отступов задаётся через `IRB.conf[:AUTO_INDENT]`,
а не старое имя `AUTO_INDENT_MODE` из документа. Настройки лежат в `.irbrc`
этой лабораторной и не требуют изменения домашней конфигурации пользователя.

Короткое объяснение для защиты: [docs/defense.md](docs/defense.md).
