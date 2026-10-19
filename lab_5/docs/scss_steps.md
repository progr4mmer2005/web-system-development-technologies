# Шаги CSS → SCSS (раздел 5.1.2 и 5.2.2)

Итоговый файл — `app/assets/stylesheets/custom.scss`. Порядок из методички:

1. `@import "bootstrap";` — подключение Bootstrap (5.4).
2. Универсальные правила: `body`, `section`, `textarea`, `.center` (5.5).
3. Типографика: `h1`–`h6`, `p` (5.6).
4. Логотип `#logo` (5.7).
5. Подвал `footer` (5.13).
6. Вложения: `.center h1` → `h1` внутри `.center`; `#logo:hover` → `&:hover`.
7. Переменные: `#777` → `$gray-light` (из Bootstrap), `#eaeaea` → `$gray-medium-light`,
   ссылки подвала → `$gray`, `$gray-darker`.

Упражнение 5.6.1: подвал вручную переписан из плоского CSS (5.13) во вложенный SCSS (5.15):
`footer a`, `footer a:hover`, `footer small`, `footer ul`, `footer ul li` стали
вложенными правилами внутри `footer { ... }`.
