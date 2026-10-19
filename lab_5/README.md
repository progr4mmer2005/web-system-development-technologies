# Лабораторная работа №5

Глава 5 Ruby on Rails Tutorial: заполнение макета. Приложение — продолжение
`lab_4` в отдельной папке. Деплой и хостинг не используются.

## Запуск

```powershell
cd lab_5
ruby bin/setup --skip-server
ruby bin/rails dartsass:build
ruby bin/dev --port 3005
```

Тесты: `ruby bin/rails test` (10 тестов).

## Что сделано по главе

| Раздел | Реализация |
| --- | --- |
| 5.1.1 навигация | `app/views/layouts/application.html.erb`, `_header.html.erb`, Home с `jumbotron` |
| 5.1.2 Bootstrap и CSS | `bootstrap-sass`, `app/assets/stylesheets/custom.scss` |
| 5.1.3 партиалы | `_shim`, `_header`, `_footer` в `app/views/layouts` |
| 5.2 Sass и файлопровод | вложения и переменные в `custom.scss`, шаги в `docs/scss_steps.md` |
| 5.3.1 Contact | страница и тест уже есть из lab_3 |
| 5.3.2–5.3.3 маршруты | `config/routes.rb`: `help_path`, `about_path`, `contact_path`, `signup_path` |
| 5.3.4 тест ссылок | `test/integration/site_layout_test.rb` |
| 5.4 регистрация | `UsersController#new`, `/signup`, тест |
| 5.6 упражнения | вложенный SCSS подвала; тест `/signup`; `full_title` в тестах и `test/helpers/application_helper_test.rb` |

## Отличия от методички (Rails 8)

- Вместо Sprockets используется Propshaft. SCSS компилирует `dartsass-rails`
  (`config/initializers/dartsass.rb`), результат попадает в `app/assets/builds`
  (не в git). Файл называется `custom.scss`; `@import "bootstrap-sprockets"` не нужен.
- `bootstrap-sass` подключён с `require: false`: его Sass-файлы добавлены в путь
  компилятора в `config/initializers/bootstrap.rb`.
- `assert_template` обеспечивает гем `rails-controller-testing`.
- Картинка `rails.png` заменена локальной `rails.svg` (без скачивания).
- Манифест `require_tree` заменяет Propshaft: `stylesheet_link_tag :app`
  подключает все CSS из `app/assets`.
