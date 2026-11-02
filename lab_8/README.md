# Лабораторная работа №8

Глава 8 Ruby on Rails Tutorial: вход и выход. Приложение — продолжение `lab_7`
в отдельной папке. Деплой и Heroku не используются.

## Запуск

Из корня репозитория:

```powershell
cd lab_8
ruby bin/setup --skip-server
ruby bin/rails dartsass:build
ruby bin/dev --port 3008
```

Открыть <http://localhost:3008/signup>, зарегистрироваться, затем выйти через
меню Account → Log out и войти на <http://localhost:3008/login>.

Список маршрутов (раздел 8.1.1): `ruby bin/rails routes`.

## Что сделано по главе

| Раздел | Реализация |
| --- | --- |
| 8.1.1 контроллер Sessions | `rails generate controller Sessions new`, маршруты `GET/POST /login`, `DELETE /logout` |
| 8.1.2 форма входа | `app/views/sessions/new.html.erb`, `form_for(:session, url: login_path)` |
| 8.1.3 поиск и проверка пользователя | `User.find_by(email: ...)` и `user.authenticate(...)` в `create` |
| 8.1.4 флэш при ошибке | `flash[:danger]` и повторный показ формы |
| 8.1.5 тест флэша | `test/integration/users_login_test.rb`, исправление на `flash.now` |
| 8.2 метод log_in | `SessionsHelper` подключён в `ApplicationController`, `session[:user_id]` |
| 8.2.2 текущий пользователь | `current_user` с `||=` |
| 8.2.3 ссылки в шапке | `logged_in?`, меню Account с Profile, Settings, Log out; JavaScript jQuery и Bootstrap |
| 8.2.4 тест ссылок | фикстура `michael`, `User.digest`, тест входа с верными данными |
| 8.2.5 вход после регистрации | `log_in @user` в `UsersController#create`, `is_logged_in?` в тестах |
| 8.3 выход | `log_out`, действие `destroy`, тест выхода |
| 8.4.1 remember-токен и дайджест | миграция `remember_digest`, `User.new_token`, `remember`, `attr_accessor :remember_token` |
| 8.4.2 вход с запоминанием | `cookies.permanent.signed[:user_id]`, `cookies.permanent[:remember_token]`, `authenticated?`, новый `current_user` |
| 8.4.3 забыть пользователя | `forget` в модели и в хелпере, вызов из `log_out` |
| 8.4.4 две тонкости | `log_out if logged_in?`, `return false if remember_digest.nil?`, тесты для обоих случаев |
| 8.4.5 флажок Remember me | флажок в форме, стили, тернарный оператор в `create` |
| 8.4.6 тесты запоминания | `log_in_as`, тесты с флажком и без, `test/helpers/sessions_helper_test.rb` |

Проверка ветки remember (листинг 8.53) выполнена: с `raise` в ветке набор тестов
был зелёным, после добавления теста хелпера стал красным, после удаления `raise`
снова зелёный. Без проверки `authenticated?` второй тест хелпера падает.

## Упражнения 8.6

| № | Что сделано |
| --- | --- |
| 1 | `User.digest`/`User.new_token` переписаны через `self.` (листинг 8.59), затем через `class << self` (листинг 8.60). Тесты проходят в обоих вариантах, итоговый вариант — `class << self` |
| 2 | В `SessionsController#create` используется `@user`. Тест сравнивает `cookies["remember_token"]` с `assigns(:user).remember_token` |

## Консольные примеры

Из папки `lab_8`:

```powershell
ruby bin/rails console --sandbox
```

```ruby
load "script/console/8.4.1_remember_token.rb"
```

| Файл | Что показывает |
| --- | --- |
| `8.1.3_find_and_authenticate.rb` | поиск по email и таблица 8.2 для `user && user.authenticate(...)` |
| `8.2.2_or_equals.rb` | блок 8.1: `+=`, `*=`, `-=`, `/=` и `||=` |
| `8.4.1_remember_token.rb` | `urlsafe_base64`, `new_token`, `remember`, `authenticated?`, `forget` |
| `8.4.2_cookies_and_bcrypt.rb` | блок 8.2: `1.year.from_now`, `10.weeks.ago`, `1.kilobyte`; сравнение дайджеста с токеном |
| `8.4.5_ternary_operator.rb` | блок 8.3: тернарный оператор и почему `"0"` — истина |
| `8.6.1_class_methods.rb` | `digest` и `new_token` — методы класса, а не экземпляра |

## Тесты

```powershell
ruby bin/rails db:test:prepare
ruby bin/rails test
ruby bin/rails test test/integration/users_login_test.rb
ruby bin/rails test test/integration/users_login_test.rb -n test_login_with_valid_information_followed_by_logout
```

Итог: 31 тест, все проходят.

## Отличия от методички (Rails 8)

- В Rails 8 нет файлопровода Sprockets и `application.js` с `//= require`.
  jQuery, `jquery_ujs` и JavaScript Bootstrap берутся из гемов `jquery-rails` и
  `bootstrap-sass` (`config/initializers/javascripts.rb`) и подключаются в макете
  через `javascript_include_tag "jquery3", "jquery_ujs", "bootstrap"`.
  `jquery_ujs` нужен, чтобы ссылка Log out отправляла запрос `DELETE`.
- `post_via_redirect` удалён, поэтому `integration_test?` проверяет `defined?(follow_redirect!)`.
- В тестах параметры передаются через `params:`.
- Вместо `rake test TEST=... TESTOPTS="--name ..."` используется
  `ruby bin/rails test файл -n имя_теста`.
