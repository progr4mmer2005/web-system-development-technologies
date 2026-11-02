# Лабораторная работа №6

Глава 6 Ruby on Rails Tutorial: моделирование пользователей. Приложение —
продолжение `lab_5` в отдельной папке. Деплой и хостинг не используются.

## Запуск

Из корня репозитория:

```powershell
cd lab_6
ruby bin/setup --skip-server
ruby bin/rails dartsass:build
ruby bin/dev --port 3006
```

`bin/setup` устанавливает гемы (в том числе `bcrypt`) и выполняет миграции.

## Что сделано по главе

| Раздел | Реализация |
| --- | --- |
| 6.1.1 миграции | `rails generate model User name:string email:string`, `db/migrate/*_create_users.rb`, проверены `db:migrate` и `db:rollback` |
| 6.1.2 файл модели | `app/models/user.rb` |
| 6.1.3–6.1.5 создание, поиск, обновление | консольные примеры `script/console/6.1.*` |
| 6.2.1 тест валидности | `test/models/user_test.rb`, `setup` и `should be valid` |
| 6.2.2 наличие | `validates :name, presence: true`, то же для `email` |
| 6.2.3 длина | `length: { maximum: 50 }` и `{ maximum: 255 }` |
| 6.2.4 формат | `VALID_EMAIL_REGEX` и `format: { with: ... }` |
| 6.2.5 уникальность | `uniqueness: { case_sensitive: false }`, индекс `add_index :users, :email, unique: true`, пустые фикстуры, `before_save` |
| 6.3.1 хешированный пароль | миграция `add_password_digest_to_users`, гем `bcrypt` |
| 6.3.2 has_secure_password | модель и `password`/`password_confirmation` в тестах |
| 6.3.3 минимальный пароль | `validates :password, presence: true, length: { minimum: 6 }` |
| 6.3.4 создание и аутентификация | `script/console/6.3.4_creating_and_authenticating.rb` |

## Упражнения 6.5

| № | Что сделано |
| --- | --- |
| 1 | Тест `email addresses should be saved as lower-case`. Проверен красным без `before_save` и зелёным с ним |
| 2 | `before_save { email.downcase! }` вместо `self.email = email.downcase` |
| 3 | `foo@bar..com` добавлен в недопустимые адреса, регулярное выражение заменено на `/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i` |

Каждый шаг главы и каждое упражнение — отдельный коммит.

## Консольные примеры

Файлы в `script/console/` названы по номеру пункта методички. Песочница
откатывает все изменения базы после выхода:

```powershell
ruby bin/rails console --sandbox
```

В открытой консоли:

```ruby
load "script/console/6.1.3_creating_users.rb"
```

| Файл | Что показывает |
| --- | --- |
| `6.1.3_creating_users.rb` | `User.new`, `valid?`, `save`, атрибуты, `create`, `destroy` |
| `6.1.4_finding_users.rb` | `find`, ошибка `RecordNotFound`, `find_by`, `first`, `all`, `count` |
| `6.1.5_updating_users.rb` | присваивание и `save`, `reload`, `created_at`/`updated_at`, `update`, `update_attribute` |
| `6.2.2_presence_validation.rb` | невалидный пользователь, `errors.full_messages`, `save` возвращает `false` |
| `6.2.3_length_validation.rb` | умножение строк `"a" * 51` и ошибки длины |
| `6.2.4_format_validation.rb` | `%w[]`, `each` и проверка адресов регулярным выражением |
| `6.2.5_uniqueness_validation.rb` | `dup`, дубликат в верхнем регистре, сохранение email в нижнем регистре, уникальный индекс |
| `6.3.4_creating_and_authenticating.rb` | `password_digest`, `authenticate` с неверным и верным паролем, `!!` |

`6.3.4` запускается в обычной консоли (`ruby bin/rails console`), как в
методичке: пользователь сохраняется в базе разработки. Повторный запуск не
создаст дубликат, а найдёт уже сохранённого пользователя.

Песочные примеры начинаются с `User.delete_all`, чтобы таблица была пустой, как
в методичке. После выхода из песочницы удалённые записи возвращаются.

## Тесты

```powershell
ruby bin/rails db:test:prepare
ruby bin/rails test
ruby bin/rails test test/models
```

Итог: 21 тест, все проходят. Из них 11 тестов модели User.

## Отличия от методички (Rails 8)

- Модель наследуется от `ApplicationRecord`, миграции — от `ActiveRecord::Migration[8.1]`.
  `timestamps` уже создаёт столбцы с `null: false`.
- `update_attributes` удалён из Rails, вместо него используется `update`.
- Вместо `rake test:models` используется `ruby bin/rails test test/models`.
- Пароль во всех консольных примерах передаётся сразу: модель уже финальная,
  с `has_secure_password` и проверкой длины пароля.
- Из `filter_parameter_logging.rb` убран `:email`, чтобы email был виден
  в консоли и в отладке, как в книге. `password_digest` по-прежнему скрыт.
- `db/schema.rb` генерируется Rails автоматически вместе со служебным комментарием.
