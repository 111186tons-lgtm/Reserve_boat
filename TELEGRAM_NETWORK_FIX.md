# Если Telegram пишет ConnectError

`ConnectError` до выполнения `deleteWebhook` означает, что приложение не может установить HTTPS-соединение с `api.telegram.org`. Команды `/start` и `/id` при этом не могут прийти в процесс бота.

## Проверка

1. Запустите `DIAGNOSE_TELEGRAM_NETWORK.cmd`.
2. Убедитесь, что проходят DNS, TCP 443, HTTPS и `Bot API getMe`.
3. После строки `СЕТЬ И ТОКЕН РАБОТАЮТ` запускайте `START_BOT_ONLY.cmd`.

## VPN или прокси

Если Telegram на компьютере работает только через VPN/прокси, а диагностика не проходит, запустите `SET_TELEGRAM_PROXY.cmd` и укажите адрес локального прокси, например:

```env
TELEGRAM_PROXY_URL=http://127.0.0.1:7890
```

или:

```env
TELEGRAM_PROXY_URL=socks5://127.0.0.1:1080
```

Проект также автоматически пробует системный прокси Windows, если `TELEGRAM_USE_WINDOWS_PROXY=true`.

## Сертификаты

По умолчанию включено `TELEGRAM_USE_SYSTEM_CA=true`: Python использует системное хранилище доверенных сертификатов Windows. Это помогает при HTTPS-проверке антивирусом или корпоративной сетью. Не отключайте проверку SSL.
