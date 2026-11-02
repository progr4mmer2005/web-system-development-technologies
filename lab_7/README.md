# Лабораторная работа №7

Глава 7 Ruby on Rails Tutorial: регистрация. Приложение — продолжение `lab_6`
в отдельной папке. Деплой, SSL и настройки production-сервера из раздела 7.5
не выполнялись.

## Запуск

Из корня репозитория:

```powershell
cd lab_7
ruby bin/setup --skip-server
ruby bin/rails dartsass:build
ruby bin/dev --port 3007
```

Открыть <http://localhost:3007/signup> и зарегистрироваться.

Очистить базу разработки перед первой регистрацией (раздел 7.2):

```powershell
ruby bin/rails db:migrate:reset
```

## Что сделано по главе

| Раздел | Реализация |
| --- | --- |
| 7.1.1 отладка | `debug` в макете только для `Rails.env.development?`, стиль `.debug_dump` и примесь `box_sizing` |
| Блок 7.1 окружения | `script/console/7.1.1_rails_environments.rb` |
| 7.1.2 ресурс Users | `resources :users`, действие `show`, `app/views/users/show.html.erb` |
| 7.1.3 отладчик | инструкция ниже |
| 7.1.4 Gravatar и боковая панель | `gravatar_for` в `app/helpers/users_helper.rb`, `aside` с `user_info`, стили |
| 7.2.1 form_for | `@user = User.new` в `new`, форма `form_for(@user)`, стили форм |
| 7.2.2 HTML формы | поля `user[name]`, `user[email]` и т. д., `action="/users"`, `method="post"` |
| 7.3.1 рабочая форма | действие `create`, при ошибке `render "new"` |
| 7.3.2 строгие параметры | приватный `user_params` с `require(:user).permit(...)` |
| 7.3.3 сообщения об ошибках | партиал `shared/_error_messages.html.erb`, `pluralize`, `form-control`, стили `#error_explanation` и `.field_with_errors` |
| 7.3.4 тест провальной регистрации | `test/integration/users_signup_test.rb`, `assert_no_difference` |
| 7.4.1 окончательная форма | `redirect_to @user` после сохранения |
| 7.4.2 флэш | `flash[:success]` и вывод флэша в макете |
| 7.4.3 первая регистрация | проверено в браузере, `script/console/7.4.3_first_signup.rb` |
| 7.4.4 тест успешной регистрации | `assert_difference "User.count", 1` и шаблон `users/show` |

## Упражнения 7.7

| № | Что сделано |
| --- | --- |
| 1 | `gravatar_for(user, options = { size: 80 })`, размер передаётся в URL как `?s=50`; пример в `script/console/7.1.4_gravatar.rb` |
| 2 | Тест сообщений об ошибках по шаблону 7.32: `div#error_explanation` и `div.field_with_errors` |
| 3 | Тест флэша по шаблону 7.33: `assert_not flash.empty?` |
| 4 | Флэш в макете через `content_tag(:div, message, class: "alert alert-#{message_type}")` |

## Отладчик (7.1.3)

1. В `app/controllers/users_controller.rb` в действии `show` после строки
   `@user = User.find(params[:id])` добавить строку `debugger`.
2. Запустить сервер `ruby bin/rails server -p 3007` и открыть `/users/1`.
3. В окне сервера появится приглашение отладчика. Команды: `@user.name`,
   `@user.email`, `params[:id]`. Продолжить — `continue` или Ctrl+D.
4. Удалить строку `debugger`, как в листинге 7.7.

В Rails 8 вместо `byebug` встроен гем `debug`, команда `debugger` та же.

## Консольные примеры

Из папки `lab_7`:

```powershell
ruby bin/rails console --sandbox
```

```ruby
load "script/console/7.3.3_error_messages.rb"
```

| Файл | Что показывает |
| --- | --- |
| `7.1.1_rails_environments.rb` | `Rails.env`, `development?`, `test?`, `production?` |
| `7.1.2_users_resource.rb` | `User.count`, `User.first` и именованные маршруты таблицы 7.1 |
| `7.1.4_gravatar.rb` | MD5-хеш email и HTML от `gravatar_for` с размером по умолчанию и 50 |
| `7.3.2_strong_parameters.rb` | ошибка `ForbiddenAttributesError` и разрешённые параметры без `admin` |
| `7.3.3_error_messages.rb` | `errors.full_messages`, `count`, `empty?`, `any?`, `pluralize` |
| `7.4.2_flash.rb` | перебор хеша `flash` и HTML флэш-сообщений |
| `7.4.3_first_signup.rb` | поиск пользователя, зарегистрированного через браузер |

Консоль в тестовом окружении: `ruby bin/rails console -e test`.
Сервер в другом окружении: `ruby bin/rails server -e production`.
Миграции в другом окружении: `ruby bin/rails db:migrate RAILS_ENV=production`.

## Тесты

```powershell
ruby bin/rails db:test:prepare
ruby bin/rails test
```

Итог: 23 теста, все проходят.

## Отличия от методички (Rails 8)

- В тестах параметры передаются через `params:`, например
  `post users_path, params: { user: { ... } }`.
- `post_via_redirect` удалён из Rails: используется `post`, затем `follow_redirect!`.
- При ошибке форма отображается со статусом `422` (`status: :unprocessable_content`),
  как принято в современных Rails.
- `debug(params)` в Rails 8 печатает не YAML, а строку объекта. Поэтому в макете
  `debug(request.filtered_parameters)`: тот же хеш в YAML, пароль показан как `[FILTERED]`.
- `Digest::MD5.hexdigest` вместо устаревшей записи `Digest::MD5::hexdigest`.
