# Лабораторная работа №2

Мини-приложение микроблог
с пользователями и их сообщениями.

## Зависимости

- Ruby 4.0.7 с Devkit
- Bundler 4.0.21

Rails и остальные гемы ставятся из `Gemfile`.

## Запуск

```powershell
gem install bundler -v 4.0.21 --no-document
ruby bin/setup --skip-server
ruby bin/rails db:seed
ruby bin/dev
```

`bin/setup` ставит гемы и создаёт базу, `db:seed` наполняет её данными для
демонстрации, `bin/dev` поднимает сервер. Приложение открывается на
[localhost:3000](http://localhost:3000).

## Данные для демонстрации

```powershell
ruby bin/rails db:seed
```

Скрипт [db/seeds.rb](db/seeds.rb) добавляет двух пользователей и два
микросообщения у первого из них.

Очистить базу и залить данные заново (сервер перед этим лучше остановить):

```powershell
ruby bin/rails db:schema:load
ruby bin/rails db:seed
```

`db:schema:load` пересоздаёт таблицы по `db/schema.rb`, нумерация записей
начинается с единицы.

## Маршруты

| Адрес | Что там |
| --- | --- |
| `/` | список пользователей, это же корневой маршрут |
| `/users` | то же самое |
| `/users/new` | форма создания пользователя |
| `/users/{id}` | страница одного пользователя |
| `/users/{id}/edit` | форма редактирования |
| `/microposts` | список микросообщений |
| `/microposts/new` | форма создания микросообщения |
| `/microposts/{id}` | одно микросообщение |
| `/microposts/1/edit` | форма редактирования |


**Связь пользователей и микросообщений.** В консоли:

```powershell
ruby bin/rails console
```

```ruby
User.first.microposts   # два микросообщения первого пользователя
Micropost.first.user    # обратно: владелец микросообщения
```

**Тесты.**

```powershell
ruby bin/rails test
```


