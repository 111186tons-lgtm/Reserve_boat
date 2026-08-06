# Boat Reserve v6.0 — no-wait tunnel

- Убран обязательный большой download Pinggy CLI при старте.
- Основной HTTPS-туннель создаётся встроенным Windows OpenSSH через Pinggy на порту 443.
- Cloudflare скачивается только как аварийный fallback, когда Pinggy не запустился.
- PowerShell progress для web request скрыт, чтобы строка `Writing request stream` не выглядела как зависание.
- Сохранены автоматический порт, Telegram-бот, администратор и публичная Mini App.
